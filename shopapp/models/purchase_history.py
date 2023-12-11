from django.db import models
from .shop import Shop
from .product_provider import ProductProvider
from django.dispatch import receiver
from django.db.models.signals import pre_save, post_save
from .shop_product import ShopProduct
from datetime import datetime
from django.core.exceptions import ValidationError
from decimal import Decimal
from django.forms.models import model_to_dict

class PurchaseHistory(models.Model):
  shop = models.ForeignKey(Shop, on_delete=models.CASCADE)
  product_provider = models.ForeignKey(ProductProvider, on_delete=models.CASCADE)
  amount = models.IntegerField()
  unit_price = models.DecimalField(max_digits=6, decimal_places=3)
  total_cost = models.DecimalField(max_digits=6, decimal_places=3)
  num_units_from_pack = models.IntegerField(default=0)
  package = models.BooleanField(default=False)
  purchase_date = models.DateTimeField(auto_now_add=True)

@receiver(pre_save, sender=PurchaseHistory)
def set_total_cost(sender, instance, **kwargs):
  if not instance.total_cost:
    amount_decimal = Decimal(str(instance.amount))
    instance.total_cost = amount_decimal * instance.unit_price
 
@receiver(pre_save, sender=PurchaseHistory)
def create_ShopProduct(sender, instance, **kwargs):
  today = datetime.now()
  if instance.package == True:
    real_amount = instance.num_units_from_pack * instance.amount
    purchase_price = instance.unit_price / instance.num_units_from_pack
  else:
    real_amount = instance.amount
    purchase_price = instance.unit_price

  shop_product = ShopProduct.objects.filter(shop=instance.shop, product_provider=instance.product_provider, arrival_date__gt=today, purchase_price=purchase_price)

  try:
    instance.full_clean()
    if shop_product:
      shop_product = shop_product[0]
      shop_product.amount = shop_product.amount + real_amount
    else:
      ShopProduct.objects.create(
        shop=instance.shop,
        product_provider=instance.product_provider,
        purchase_price=purchase_price,
        amount=real_amount,
      )
  except ValidationError as e:
    errors = e.message_dict
    print('Errors Errors Errors Errors Errors Errors Errors Errors Errors!!!!!!!!!!!!')
    for field, error_list in errors.items():
        print(f"Campo '{field}': {', '.join(error_list)}")
    raise ValidationError('No se pudo guardar PurchaseHistoryaaa') from e 
