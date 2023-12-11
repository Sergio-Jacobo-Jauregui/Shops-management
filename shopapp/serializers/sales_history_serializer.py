from shopapp.models import SalesHistory
from rest_framework import serializers

class SalesHistorySerializer(serializers.HyperlinkedModelSerializer):
  class Meta:
    model = SalesHistory
    fields = ['id', 'shop', 'product_provider', 'amount', 'unit_price', 'total_price', 'sale_date']

