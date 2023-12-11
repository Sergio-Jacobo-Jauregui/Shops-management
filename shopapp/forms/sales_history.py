from django.forms import ModelForm
from shopapp.models import SalesHistory

class SalesHistoryForm(ModelForm):
  class Meta:
    model = SalesHistory
    fields = ['product_provider', 'amount', 'unit_price']