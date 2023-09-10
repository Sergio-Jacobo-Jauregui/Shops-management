from shopapp.models import ShopProduct
from rest_framework import serializers

class ShopProductSerializer(serializers.HyperlinkedModelSerializer):
  class Meta:
    model = ShopProduct
    fields = ['id', 'shop', 'product_provider', 'due_date', 'purchase_price', 
              'sale_price', 'amount', 'out_stock', 'arrival_date']
    
