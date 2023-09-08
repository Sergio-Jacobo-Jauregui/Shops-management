from shopapp.models import Product
from django.db import connection

from shopapp.serializers import ProductSerializer
from django.http import JsonResponse

def products_serialized(request):
  if request.method == 'GET':
      products = Product.objects.all()
      serializer = ProductSerializer(products, many=True)
      return JsonResponse(serializer.data, safe=False)
