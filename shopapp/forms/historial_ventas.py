from django.forms import ModelForm
from shopapp.models import HistorialDeVenta

class HistorialDeVentaForm(ModelForm):
  class Meta:
    model = HistorialDeVenta
    fields = ['product_provider', 'amount', 'unit_price']