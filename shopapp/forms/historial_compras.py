from django.forms import ModelForm
from shopapp.models import HistorialDeCompra

class HistorialDeCompraForm(ModelForm):
  class Meta:
    model = HistorialDeCompra
    fields = ['product_provider', 'amount', 'unit_price']