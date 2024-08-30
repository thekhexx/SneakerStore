from rest_framework.views import APIView
from rest_framework.generics import ListAPIView
from rest_framework.response import Response
from rest_framework import authentication, permissions
from rest_framework import filters

import django_filters
from .models import Sneaker, Brand, Image
from .serializers import SneakerListSerializer, BrandSerializer
from .filters import SneakerListFilter


class ListSneakers(ListAPIView):
    queryset = Sneaker.objects.filter(is_published=True)
    serializer_class = SneakerListSerializer
    permission_classes = [permissions.AllowAny]
    filter_backends = [filters.OrderingFilter,
                        django_filters.rest_framework.DjangoFilterBackend]
    filterset_class = SneakerListFilter
    ordering_fields  = ["name", "price", "release_date"]

    def get_serializer_context(self):
        context = super().get_serializer_context()
        context['request'] = self.request
        return context

class ListBrands(ListAPIView):
    permission_classes = [permissions.AllowAny]
    def get(self, request, format=None):    
        queruset = Brand.objects.all()
        serializer = BrandSerializer(queruset, many=True)
        return Response(serializer.data)