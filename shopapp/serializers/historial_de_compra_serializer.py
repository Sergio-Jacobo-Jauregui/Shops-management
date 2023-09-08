from shopapp.models import HistorialDeCompra
from rest_framework import serializers

class HistorialDeCompraSerializer(serializers.HyperlinkedModelSerializer):
  class Meta:
    model = HistorialDeCompra
    fields = ['shop','product_provider','amount','unit_price','total_cost','purchase_date']
