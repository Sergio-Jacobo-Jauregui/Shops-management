from django.db import models

class ProductTag(models.Model):
  name = models.CharField(max_length=50, blank=True, null=True)

  def __str__(self):
    return self.name
  