import django_filters
from django.db.models import Q
from .models import Sneaker

class SneakerListFilter(django_filters.rest_framework.FilterSet):
    name = django_filters.CharFilter(
        field_name='name', lookup_expr='icontains')
    title = django_filters.CharFilter(label='title', method='title_filter')
    is_popular = django_filters.BooleanFilter(
        field_name='is_popular', lookup_expr='exact')
    min_price = django_filters.NumberFilter(
        field_name='price', lookup_expr='gte')
    max_price = django_filters.NumberFilter(
        field_name='price', lookup_expr='lte')
    brand = django_filters.NumberFilter(
        field_name='brand', lookup_expr='exact')

    def title_filter(self, queryset, name, value):
        return queryset.filter(Q(name__icontains=value) | Q(description__icontains=value) | Q(brand__name__icontains=value))

    class Meta:
        model = Sneaker
        fields = ['name', 'title', 'is_popular', 'max_price']