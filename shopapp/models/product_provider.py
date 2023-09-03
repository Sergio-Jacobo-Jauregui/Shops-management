from django.db import models
from .provider import Provider
from .product import Product

class ProductProvider(models.Model):
  product = models.ForeignKey(Product, on_delete=models.CASCADE)
  provider = models.ForeignKey(Provider, on_delete=models.CASCADE)

  def __str__(self):
    return self.product.name
