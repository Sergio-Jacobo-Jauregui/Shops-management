from shopapp.models import PurchaseHistory
from shopapp.serializers import PurchaseHistorySerializer
from django.http import JsonResponse
from rest_framework.parsers import JSONParser
from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def historial_de_compras_serialized(request):
  if request.method == 'GET':
    historial_de_compras = PurchaseHistory.objects.select_related('product', 'provider').all()
    serializer = PurchaseHistorySerializer(historial_de_compras, many=True)

    return JsonResponse(serializer.data, safe=False)
  
  elif request.method == 'POST':
    pass

@csrf_exempt
def get_historial_de_compra_serialized(request, id):
  historial_de_compra = PurchaseHistory.objects.select_related('product', 'provider').get(id=id)

  if request.method == 'GET':
    serializer = PurchaseHistorySerializer(historial_de_compra)
    return JsonResponse(serializer.data, safe=False)
  elif request.method == 'PATCH':
    pass
  elif request.method == 'DELETE':
    historial_de_compra.delete()
    message = {
      'message': 'Eliminado con exito'
    }
    return JsonResponse(message, safe=False)