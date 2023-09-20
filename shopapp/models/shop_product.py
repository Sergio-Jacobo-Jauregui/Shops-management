from django.db import models
from .product_provider import ProductProvider
from .product_tag import ProductTag
from .shop import Shop
from django.dispatch import receiver
from django.db.models.signals import pre_save
from datetime import datetime, timedelta
from decimal import Decimal

class ShopProduct(models.Model):
  shop = models.ForeignKey(Shop, on_delete=models.CASCADE)
  product_provider = models.ForeignKey(ProductProvider, on_delete=models.CASCADE)
  tag = models.ForeignKey(ProductTag, on_delete=models.SET_NULL, null=True, blank=True)
  due_date = models.DateTimeField(auto_now_add=False, blank=True, null=True)
  arrival_date = models.DateField()
  purchase_price = models.DecimalField(max_digits=6, decimal_places=3)
  sale_price = models.DecimalField(max_digits=6, decimal_places=3)
  minimum_allowed = models.IntegerField(default=4)
  amount = models.IntegerField()
  out_stock = models.BooleanField(default=False)

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
  
