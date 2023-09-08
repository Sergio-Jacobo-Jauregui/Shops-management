from shopapp.models import Product, ShopProduct
from rest_framework import viewsets, permissions
from shopapp.serializers import ProductSerializer, ShopProductSerializer

class ProductViewSet(viewsets.ModelViewSet):
  queryset = Product.objects.all()
  serializer_class = ProductSerializer
  permission_classes = [permissions.IsAuthenticated]

class ShopProductViewSet(viewsets.ModelViewSet):
  queryset = ShopProduct.objects.all()
  serializer_class = ShopProductSerializer
  permission_classes = [permissions.IsAuthenticated]
