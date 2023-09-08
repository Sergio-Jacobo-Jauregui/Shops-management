from shopapp.models import ProductProvider
from rest_framework import serializers

class ProductProviderSerializer(serializers.HyperlinkedModelSerializer):
  class Meta:
    model = ProductProvider
    fields = ['product', 'provider']
    