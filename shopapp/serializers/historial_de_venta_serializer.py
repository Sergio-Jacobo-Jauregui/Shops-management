from shopapp.models import HistorialDeVenta
from rest_framework import serializers

class HistorialDeVentaSerializer(serializers.HyperlinkedModelSerializer):
  class Meta:
    model = HistorialDeVenta
    fields = ['shop', 'product_provider', 'amount', 'unit_price', 'total_price', 'sale_date']

