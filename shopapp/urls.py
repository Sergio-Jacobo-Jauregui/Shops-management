from django.urls import path, include
from .models import *
from . import views_html_json_viewsets as view_not_serialized
from . import views_serialized
from django.views.decorators.csrf import get_token
from django.http import JsonResponse

from rest_framework import routers
router = routers.DefaultRouter()
router.register(r'product', view_not_serialized.ProductViewSet)
router.register(r'shopProduct', view_not_serialized.ShopProductViewSet)

def get_csrf(request):
  return JsonResponse({"token":get_token(request)})

urlpatterns = [
  # CSRF
  path('token/', get_csrf, name='token'),
  # HTML VIEWS
  path('', view_not_serialized.index, name='index'),
  path('shop/<int:id>', view_not_serialized.shop, name='shop'),
  path('shop/<int:id>/historial_de_ventas/', view_not_serialized.shop_historial_ventas, name='shop_historial_ventas'),
  path('shop/<int:id>/historial_de_compras/', view_not_serialized.shop_historial_compras, name='shop_historial_compras'),
  path('providers/', view_not_serialized.providers, name='providers'),
  # DRF VIEWSETS
  path('DRF/', include(router.urls)),
  path('api-auth/', include('rest_framework.urls', namespace='rest_framework')),
  # DRF SERIALIZED
  path('products_serial/', views_serialized.products_serialized, name='products_serial'),
  path('products_serial/<int:id>', views_serialized.get_product_serialized, name='get_products_serial'),

  path('providers_serial/', views_serialized.providers_serialized, name='provider_serialized'),
  path('providers_serial/<int:id>', views_serialized.get_provider_serialized, name='get_provider_serialized'),

  path('product_provider_serial/', views_serialized.product_providers_serialized, name='product_provider_serial'),
  path('product_provider_serial/<int:id>', views_serialized.get_product_provider_serialized, name='get_product_provider_serialized'),
  
  path('shop_serial/', views_serialized.shops_serialized, name='shop_serial'),
  path('shop_serial/<int:id>', views_serialized.get_shop_serialized, name='shop_serial'),
  # JSON RESPONSES
  path('json_alone/', view_not_serialized.json_alone, name='json_alone'),
  path('ok/', view_not_serialized.ok, name='ok'),
]