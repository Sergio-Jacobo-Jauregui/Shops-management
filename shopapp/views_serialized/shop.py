from shopapp.models import Shop
from django.db import connection

from shopapp.serializers import ShopSerializer
from django.http import JsonResponse

def shops_serialized(request):
  if request.method == 'GET':
      shops = Shop.objects.all()
      serializer = ShopSerializer(shops, many=True)
      return JsonResponse(serializer.data, safe=False)
