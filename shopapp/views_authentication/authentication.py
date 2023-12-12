from django.shortcuts import render, redirect
from django.contrib.auth.forms import UserCreationForm
from shopapp.forms import UserRegistrationForm
from django.contrib.auth import login

def register(request):
  if request.method == 'POST':
    form = UserRegistrationForm(request.POST)
    if form.is_valid():
      user = form.save()
      login(request, user)
      return render(request, 'home.html')
    else:
      return render(request, 'registration/signup.html', {
        'form': form,
        'error': True,
        'message': form.errors 
      })
  elif request.method == 'GET':
    form = UserRegistrationForm()
    return render(request, 'registration/signup.html', {'form': form})

  
