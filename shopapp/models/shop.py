from django.db import models
from datetime import datetime

class Shop(models.Model):
  name = models.CharField(max_length=50)
  email = models.CharField(unique=True, max_length=50)
  addres = models.CharField(max_length=50, blank=True, null=True)
  money = models.IntegerField(default=1000)
  
  def today(self):
    return datetime.now()

  def __str__(self):
    return self.name  
  
  def productos_en_stock(self):
    return self.shopproduct_set.filter(amount__gt=0, arrival_date__lt=self.today())
  
  def productos_agotados(self):
    return self.shopproduct_set.filter(amount__exact=0)
  
  def productos_en_camino(self):
    return self.shopproduct_set.filter(arrival_date__gt=self.today()) 
