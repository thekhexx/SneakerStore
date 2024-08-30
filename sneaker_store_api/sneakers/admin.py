from django.contrib import admin
from .models import Sneaker, Brand, Image

class ImageInline(admin.TabularInline):
    model = Image
    extra = 1


@admin.register(Image)
class ImageAdmin(admin.ModelAdmin):
    list_display = ('sneaker', 'image')

@admin.register(Brand)
class BrandAdmin(admin.ModelAdmin):
    list_display = ('name',)

@admin.register(Sneaker)
class SneakerAdmin(admin.ModelAdmin):
    list_display = ('name', 'brand', 'price', 'is_published')
    list_editable = ('is_published',)
    list_per_page = 10
    inlines = [
        ImageInline
    ]
