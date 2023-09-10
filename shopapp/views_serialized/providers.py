from shopapp.models import Provider

from shopapp.serializers import ProviderSerializer
from django.http import JsonResponse

def providers_serialized(request):
  if request.method == 'GET':
      providers = Provider.objects.all()
      serializer = ProviderSerializer(providers, many=True)
      return JsonResponse(serializer.data, safe=False)

def get_provider_serialized(request):
  provider = Provider.objects.get(id=id)

  if request.method == 'GET':
    serializer = ProviderSerializer(provider)
    return JsonResponse(serializer.data, safe=False)
  elif request.method == 'PATCH':
    pass
  elif request.method == 'DELETE':
    provider.delete()
    message = {
      'message': 'Eliminado con exito'
    }
    return JsonResponse(message, safe=False)