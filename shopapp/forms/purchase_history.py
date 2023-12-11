from django.forms import ModelForm
from shopapp.models import PurchaseHistory

class PurchaseHistoryForm(ModelForm):
  class Meta:
    model = PurchaseHistory
    fields = ['product_provider', 'amount', 'unit_price']