from shopapp.models import HistorialDeVenta
from shopapp.serializers import HistorialDeVentaSerializer
from django.http import JsonResponse
from rest_framework.parsers import JSONParser
from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def historial_de_ventas_serialized(request):
  if request.method == 'GET':
    historial_de_ventas = HistorialDeVenta.objects.select_related('product', 'provider').all()
    serializer = HistorialDeVentaSerializer(historial_de_ventas, many=True)

    return JsonResponse(serializer.data, safe=False)
  
  elif request.method == 'POST':
    pass

@csrf_exempt
def get_historial_de_venta_serialized(request, id):
  historial_de_venta = HistorialDeVenta.objects.select_related('product', 'provider').get(id=id)

  if request.method == 'GET':
    serializer = HistorialDeVentaSerializer(historial_de_venta)
    return JsonResponse(serializer.data, safe=False)
  elif request.method == 'PATCH':
    pass
  elif request.method == 'DELETE':
    historial_de_venta.delete()
    message = {
      'message': 'Eliminado con exito'
    }
    return JsonResponse(message, safe=False)