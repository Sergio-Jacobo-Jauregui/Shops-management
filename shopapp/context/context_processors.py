from django.contrib.auth import get_user

def navbar_variables(request):
  # user = get_user(request)
  return {'authenticated': request.user.is_authenticated}