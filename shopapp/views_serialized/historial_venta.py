from shopapp.models import SalesHistory
from shopapp.serializers import SalesHistorySerializer
from django.http import JsonResponse
from rest_framework.parsers import JSONParser
from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def historial_de_ventas_serialized(request):
  if request.method == 'GET':
    historial_de_ventas = SalesHistory.objects.select_related('product', 'provider').all()
    serializer = SalesHistorySerializer(historial_de_ventas, many=True)

    return JsonResponse(serializer.data, safe=False)
  
  elif request.method == 'POST':
    pass

@csrf_exempt
def get_historial_de_venta_serialized(request, id):
  historial_de_venta = SalesHistory.objects.select_related('product', 'provider').get(id=id)

  if request.method == 'GET':
    serializer = SalesHistorySerializer(historial_de_venta)
    return JsonResponse(serializer.data, safe=False)
  elif request.method == 'PATCH':
    pass
  elif request.method == 'DELETE':
    historial_de_venta.delete()
    message = {
      'message': 'Eliminado con exito'
    }
    return JsonResponse(message, safe=False)