from rest_framework import serializers
from .models import Sneaker, Brand, Image

class BrandSerializer(serializers.ModelSerializer):
    class Meta:
        model = Brand
        fields = ['id', 'name', 'image']

class SneakerListSerializer(serializers.ModelSerializer):
    main_image = serializers.SerializerMethodField('get_main_image_url')
    images_count = serializers.SerializerMethodField('get_images_count')
    brand = BrandSerializer()
    class Meta:
        model = Sneaker
        fields = ['id', 'name', 'brand', 'price', 'main_image', 'images_count', 'is_popular']

    def get_main_image_url(self, sneaker):
        request = self.context.get('request')
        main_image = sneaker.get_main_image()
        if main_image:
            main_image_url = main_image.image.url
            return request.build_absolute_uri(main_image_url)
        else:
            return None

    def get_images_count(self, sneaker):    
        return sneaker.images.count()
