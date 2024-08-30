from django.db import models

class TimeStampedModel(models.Model):
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    class Meta:
        abstract = True

class Brand(TimeStampedModel):
    name = models.CharField(max_length=100, unique=True)
    image = models.ImageField(upload_to='sneakers/images', blank=True, null=True)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'Brand'
        verbose_name_plural = 'Brands'

class Sneaker(TimeStampedModel):
    name = models.CharField(max_length=100, unique=True)
    brand = models.ForeignKey(Brand, verbose_name='Sneaker brand', on_delete=models.CASCADE)
    price = models.DecimalField(verbose_name='Sneaker price in $' ,max_digits=10, decimal_places=2)
    release_date = models.DateField()
    description = models.TextField(verbose_name='Sneaker description', blank=True)
    is_popular = models.BooleanField(default=True, verbose_name='Sneaker is popular')
    is_published = models.BooleanField(default=False, verbose_name='Sneaker is published to the store')

    def get_main_image(self):
        try:
            main_image = self.images.filter(is_main=True).first()
            return main_image
        except:
            return None

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'Sneaker'
        verbose_name_plural = 'Sneakers'

class Image(models.Model):
    sneaker = models.ForeignKey(Sneaker, on_delete=models.CASCADE, related_name='images')
    image = models.ImageField(upload_to='sneakers/images')
    is_main = models.BooleanField(default=False)

    class Meta:
        verbose_name = 'Image'
        verbose_name_plural = 'Images'

    def __str__(self):
        return self.sneaker.name