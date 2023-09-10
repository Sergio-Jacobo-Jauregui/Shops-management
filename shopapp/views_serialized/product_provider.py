from shopapp.models import ProductProvider
from shopapp.serializers import ProductProviderSerializer
from django.http import JsonResponse
from rest_framework.parsers import JSONParser
from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def product_providers_serialized(request):
  if request.method == 'GET':
    product_providers = ProductProvider.objects.select_related('product', 'provider').all()
    serializer = ProductProviderSerializer(product_providers, many=True)

    return JsonResponse(serializer.data, safe=False)
  
  elif request.method == 'POST':
    data = JSONParser().parse(request)
    new_instance = ProductProvider(
      product_id = data['product_id'],
      provider_id = data['provider_id']
    )

    if new_instance.clean():
      new_instance.save()
      return JsonResponse('Creado con exito', status=200, safe=False)
    else:
      return JsonResponse('Este producto ya existe en este proveedor', status=400, safe=False)

@csrf_exempt
def get_product_provider_serialized(request, id):
  product_provider = ProductProvider.objects.select_related('product', 'provider').get(id=id)

  if request.method == 'GET':
    serializer = ProductProviderSerializer(product_provider)
    return JsonResponse(serializer.data, safe=False)
  elif request.method == 'PATCH':
    pass
  elif request.method == 'DELETE':
    product_provider.delete()
    message = {
      'message': 'Eliminado con exito'
    }
    return JsonResponse(message, safe=False)