from django.contrib import admin
from django.urls import path, include
from .views import ListSneakers, ListBrands

urlpatterns = [
    path('sneakers', ListSneakers.as_view()),
    path('brands', ListBrands.as_view()),
]
