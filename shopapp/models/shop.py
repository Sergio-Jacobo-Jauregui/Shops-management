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
  
  def productos_en_stock_react(self):
    return self.shopproduct_set.filter(amount__gt=0, arrival_date__lt=self.today()).select_related('product_provider__product').values('id','product_provider__product__name', 'amount', 'purchase_price', 'sale_price', 'due_date', 'arrival_date')
  
  def productos_agotados_react(self):
    return self.shopproduct_set.filter(amount__exact=0).select_related('product_provider__product').values('id','product_provider__product__name', 'amount', 'purchase_price', 'sale_price', 'due_date', 'arrival_date')
  
  def productos_en_camino_react(self):
    return self.shopproduct_set.filter(arrival_date__gt=self.today()).select_related('product_provider__product').values('id','product_provider__product__name', 'amount', 'purchase_price', 'sale_price', 'due_date', 'arrival_date') 
