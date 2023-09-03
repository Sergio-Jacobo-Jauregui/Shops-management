from django.db import models
from .shop import Shop
from .product_provider import ProductProvider
from django.dispatch import receiver
from django.db.models.signals import pre_save, post_save
from .shop_product import ShopProduct
from datetime import datetime
from django.core.exceptions import ValidationError
from decimal import Decimal

class HistorialDeCompra(models.Model):
  shop = models.ForeignKey(Shop, on_delete=models.CASCADE)
  product_provider = models.ForeignKey(ProductProvider, on_delete=models.CASCADE)
  amount = models.IntegerField()
  unit_price = models.DecimalField(max_digits=6, decimal_places=3)
  total_cost = models.DecimalField(max_digits=6, decimal_places=3)
  purchase_date = models.DateTimeField(auto_now_add=True)

@receiver(pre_save, sender=HistorialDeCompra)
def set_total_cost(sender, instance, **kwargs):
  if not instance.total_cost:
    amount_decimal = Decimal(str(instance.amount))
    instance.total_cost = amount_decimal * instance.unit_price
 
@receiver(pre_save, sender=HistorialDeCompra)
def create_ShopProduct(sender, instance, **kwargs):
  today = datetime.now()
  shop_product = ShopProduct.objects.filter(shop=instance.shop, product_provider=instance.product_provider, arrival_date__gt=today)
  try:
    instance.full_clean()
    if shop_product:
      shop_product.amount = shop_product.amount + instance.amount
    else:
      ShopProduct.objects.create(
        purchase_price=instance.unit_price,
        amount=instance.amount,
        shop=instance.shop,
        product_provider=instance.product_provider
      )
  except ValidationError as e:
    raise ValidationError('No se pudo guardar historialDeCompraaaa') from e 
