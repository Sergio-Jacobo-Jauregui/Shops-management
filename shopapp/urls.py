from django.urls import path
from .models import *
from . import views

urlpatterns = [
  path('index/', views.index, name='index'),
  path('shop/<int:id>', views.shop, name='shop'),
  path('shop/<int:id>/historial_de_ventas/', views.shop_historial_ventas, name='shop_historial_ventas'),
  path('shop/<int:id>/historial_de_compras/', views.shop_historial_compras, name='shop_historial_compras'),
  path('providers/', views.providers, name='providers'),
]