from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static

admin.site.site_header = 'Sneaker Shop Administration'
admin.site.index_title = 'Sneaker Shop'
admin.site.site_title = 'Sneaker Shop Administration'

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/v1/', include('sneakers.urls')),
    path('api-auth/', include('rest_framework.urls', namespace='rest_framework')),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
