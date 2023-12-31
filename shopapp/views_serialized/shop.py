from shopapp.models import Shop

from shopapp.serializers import ShopSerializer
from django.http import JsonResponse

def shops_serialized(request):
  if request.method == 'GET':
      shops = Shop.objects.all()
      serializer = ShopSerializer(shops, many=True)
      return JsonResponse(serializer.data, safe=False)

def get_shop_serialized(request):
  shop = Shop.objects.get(id=id)

  if request.method == 'GET':
    serializer = ShopSerializer(shop)
    return JsonResponse(serializer.data, safe=False)
  elif request.method == 'PATCH':
    pass
  elif request.method == 'DELETE':
    shop.delete()
    message = {
      'message': 'Eliminado con exito'
    }
    return JsonResponse(message, safe=False)