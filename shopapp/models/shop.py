from django.db import models
from datetime import datetime
from django.contrib.auth.models import User

class Shop(models.Model):
  name = models.CharField(max_length=50)
  addres = models.CharField(max_length=50, blank=True, null=True)
  money = models.IntegerField(default=1000)
  administrator = models.ForeignKey(User, on_delete=models.CASCADE, default=None) 
  
  def today(self):
    return datetime.now()

  def __str__(self):
    return self.name  
  
  def products_in_stock(self):
    return self.shopproduct_set.filter(amount__gt=0, arrival_date__lt=self.today())
  
  def products_out_stock(self):
    return self.shopproduct_set.filter(amount__exact=0)
  
  def upcoming_products(self):
    return self.shopproduct_set.filter(arrival_date__gt=self.today()) 
  
  def products_in_stock_react(self):
    return self.products_in_stock().select_related('product_provider__product').values(
      'id','product_provider__product__name', 'amount', 'purchase_price', 'sale_price',
      'due_date', 'arrival_date'
    )
  
  def products_out_stock_react(self):
    return self.products_out_stock().select_related('product_provider__product').values(
      'id','product_provider__product__name', 'amount', 'purchase_price', 'sale_price',
      'due_date', 'arrival_date'
    )
  
  def upcoming_products_react(self):
    return self.upcoming_products().select_related('product_provider__product').values(
      'id','product_provider__product__name', 'amount', 'purchase_price', 'sale_price',
      'due_date', 'arrival_date'
    )