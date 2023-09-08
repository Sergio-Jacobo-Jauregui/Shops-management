from django.http import JsonResponse

def ok(request):
   return JsonResponse('ok', safe=False)

def json_alone(request):
  if request.method == 'GET':
      data = {
        "name": "Gato",
        "age": 3,
        "mischievous": True,
      }
      
      return JsonResponse(data)
