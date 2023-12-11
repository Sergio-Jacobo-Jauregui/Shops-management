from django.db import models
from .product_provider import ProductProvider
from .shop import Shop
from .shop_product import ShopProduct
from django.dispatch import receiver
from django.db.models.signals import pre_save
from django.core.exceptions import ValidationError
from datetime import datetime
from shopapp.errors import CommonError

class SalesHistory(models.Model):
  shop = models.ForeignKey(Shop, on_delete=models.CASCADE)
  product_provider = models.ForeignKey(ProductProvider, on_delete=models.CASCADE)
  amount = models.IntegerField() 
  unit_price = models.DecimalField(max_digits=6, decimal_places=3)
  total_price = models.DecimalField(max_digits=6, decimal_places=3)
  sale_date = models.DateTimeField(auto_now_add=True)

  def today(self):
    return datetime.now()

@receiver(pre_save, sender=SalesHistory)
def set_total_price(sender, instance, **kwargs):
  if not instance.total_price:
    print(instance.amount * instance.unit_price)
    instance.total_price = instance.amount * instance.unit_price
 
@receiver(pre_save, sender=SalesHistory)
def delete_ShopProduct(sender, instance, **kwargs):
  shop_product = ShopProduct.objects.filter(
    shop=instance.shop,
    product_provider=instance.product_provider,
    arrival_date__lt=instance.today())
  try:
    shop_product = shop_product[0]
    instance.full_clean()
    available_amount = shop_product.amount - instance.amount
    
    if available_amount < 0:
      raise CommonError('They tried to sell more than there is')
    else:
      shop_product.amount = shop_product.amount - instance.amount
      shop_product.out_stock = True if available_amount == 0 else False
      shop_product.save()

  except ValidationError as e:
    raise e
  except CommonError as e:
    raise e
