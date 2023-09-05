from django.urls import path, include
from .models import *
from . import views

from rest_framework import routers
router = routers.DefaultRouter()
router.register(r'product', views.ProductViewSet)
router.register(r'shopProduct', views.ShopProductViewSet)


urlpatterns = [
  path('', views.index, name='index'),
  path('shop/<int:id>', views.shop, name='shop'),
  path('shop/<int:id>/historial_de_ventas/', views.shop_historial_ventas, name='shop_historial_ventas'),
  path('shop/<int:id>/historial_de_compras/', views.shop_historial_compras, name='shop_historial_compras'),
  path('providers/', views.providers, name='providers'),
  # DRF
  path('DRF/', include(router.urls)),
  path('api-auth/', include('rest_framework.urls', namespace='rest_framework')),
  # JSON
  path('json_products/', views.json_products, name='json_products'),
  path('json_alone/', views.json_alone, name='json_alone'),
]