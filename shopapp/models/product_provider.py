from django.db import models
from .provider import Provider
from .product import Product

class ProductProvider(models.Model):
  product = models.ForeignKey(Product, on_delete=models.CASCADE)
  provider = models.ForeignKey(Provider, on_delete=models.CASCADE)

  def __str__(self):
    return self.product.name
  
  def clean(self):
    existing_instance = ProductProvider.objects.filter(
      product_id=self.product_id,
      provider_id=self.provider_id
    )

    result = False if existing_instance else True
    return result
