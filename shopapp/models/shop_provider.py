from django.db import models
from .shop import Shop
from .provider import Provider

class ShopProvider(models.Model):
  shop = models.ForeignKey(Shop, on_delete=models.CASCADE)
  provider = models.ForeignKey(Provider, on_delete=models.CASCADE)

  def __str__(self):
    return self.provider.name
