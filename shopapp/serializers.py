from .models import Product, ShopProduct
from rest_framework import serializers

class ProductSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Product
        fields = ['name']

class ShopProductSerializer(serializers.HyperlinkedModelSerializer):
    
    class Meta:
        model = ShopProduct
        fields = ['shop', 'product_provider', 'due_date', 'purchase_price', 'sale_price', 'amount', 'out_stock', 'arrival_date']