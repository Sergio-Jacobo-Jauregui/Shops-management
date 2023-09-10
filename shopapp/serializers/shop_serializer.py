from shopapp.models import Shop
from rest_framework import serializers

class ShopSerializer(serializers.HyperlinkedModelSerializer):
  class Meta:
    model = Shop
    fields = ['id', 'name', 'email', 'addres', 'money']

