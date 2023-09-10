from shopapp.models import Product

from shopapp.serializers import ProductSerializer
from django.http import JsonResponse

def products_serialized(request):
  if request.method == 'GET':
    products = Product.objects.all()
    serializer = ProductSerializer(products, many=True)
    return JsonResponse(serializer.data, safe=False)

def get_product_serialized(request):
  products = Product.objects.get(id=id)

  if request.method == 'GET':
    serializer = ProductSerializer(products)
    return JsonResponse(serializer.data, safe=False)
  elif request.method == 'PATCH':
    pass
  elif request.method == 'DELETE':
    products.delete()
    message = {
      'message': 'Eliminado con exito'
    }
    return JsonResponse(message, safe=False)