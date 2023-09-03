from django.db import models
from .product_provider import ProductProvider
from .shop import Shop
from django.dispatch import receiver
from django.db.models.signals import pre_save
from datetime import datetime, timedelta
from decimal import Decimal

class ShopProduct(models.Model):
  shop = models.ForeignKey(Shop, on_delete=models.CASCADE)
  product_provider = models.ForeignKey(ProductProvider, on_delete=models.CASCADE)
  due_date = models.DateTimeField(auto_now_add=False, blank=True, null=True)
  purchase_price = models.DecimalField(max_digits=6, decimal_places=3)
  sale_price = models.DecimalField(max_digits=6, decimal_places=3)
  amount = models.IntegerField()
  out_stock = models.BooleanField(default=False)
  arrival_date = models.DateField()

  def __str__(self):
    return self.product_provider
  
@receiver(pre_save, sender=ShopProduct)
def set_arrival_date(sender, instance, **kwargs):
  today_more_week = datetime.now() + timedelta(days=7)
  if not instance.arrival_date:
    instance.arrival_date = today_more_week
  
@receiver(pre_save, sender=ShopProduct)
def set_sale_price(sender, instance, **kwargs):
  if not instance.sale_price:
    instance.sale_price = instance.purchase_price * Decimal(str(1.25))
  
