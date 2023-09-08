from shopapp.models import ShopProvider
from rest_framework import serializers

class ShopProviderSerializer(serializers.HyperlinkedModelSerializer):
  class Meta:
    model = ShopProvider
    fields = ['shop', 'provider']
