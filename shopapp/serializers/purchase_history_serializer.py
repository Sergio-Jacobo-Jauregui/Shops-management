from shopapp.models import PurchaseHistory
from rest_framework import serializers

class PurchaseHistorySerializer(serializers.HyperlinkedModelSerializer):
  class Meta:
    model = PurchaseHistory
    fields = ['id', 'shop','product_provider','amount','unit_price','total_cost','purchase_date']
