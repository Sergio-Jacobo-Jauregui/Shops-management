from shopapp.serializers import ProductSerializer, ProviderSerializer
from shopapp.models import ProductProvider
from rest_framework import serializers

class ProductProviderSerializer(serializers.HyperlinkedModelSerializer):
  product = ProductSerializer()
  provider = ProviderSerializer()

  class Meta:
    model = ProductProvider
    fields = ['id', 'product', 'provider']
    