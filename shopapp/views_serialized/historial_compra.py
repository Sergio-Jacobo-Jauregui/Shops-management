from shopapp.models import HistorialDeCompra
from shopapp.serializers import HistorialDeCompraSerializer
from django.http import JsonResponse
from rest_framework.parsers import JSONParser
from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def historial_de_compras_serialized(request):
  if request.method == 'GET':
    historial_de_compras = HistorialDeCompra.objects.select_related('product', 'provider').all()
    serializer = HistorialDeCompraSerializer(historial_de_compras, many=True)

    return JsonResponse(serializer.data, safe=False)
  
  elif request.method == 'POST':
    pass

@csrf_exempt
def get_historial_de_compra_serialized(request, id):
  historial_de_compra = HistorialDeCompra.objects.select_related('product', 'provider').get(id=id)

  if request.method == 'GET':
    serializer = HistorialDeCompraSerializer(historial_de_compra)
    return JsonResponse(serializer.data, safe=False)
  elif request.method == 'PATCH':
    pass
  elif request.method == 'DELETE':
    historial_de_compra.delete()
    message = {
      'message': 'Eliminado con exito'
    }
    return JsonResponse(message, safe=False)