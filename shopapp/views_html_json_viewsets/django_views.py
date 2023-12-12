from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from shopapp.models import ShopProvider, Shop, SalesHistory, PurchaseHistory, Provider, ProductProvider
from shopapp.forms import PurchaseHistoryForm, SalesHistoryForm
from decimal import Decimal

def index(request):
  return render(request, 'index.html')

@login_required
def home(request):
  # todo: only one
  shops = Shop.objects.all()

  return render(request, 'home.html', {
    'shops': shops,
  })

@login_required
def shop(request, id):
  shop = Shop.objects.get(id=id)
  products_in_stock = shop.products_in_stock()
  products_out_stock = shop.products_out_stock()
  upcoming_products = shop.upcoming_products()
  sales_histories = SalesHistory.objects.filter(shop_id=id)
  purchase_histories = PurchaseHistory.objects.filter(shop_id=id)
  shopProviders = ShopProvider.objects.select_related('provider').filter(shop_id=id)

  return render(request, 'shop.html', {
    'shop': shop,
    'products_in_stock': products_in_stock,
    'products_out_stock': products_out_stock,
    'upcoming_products': upcoming_products,
    'sales_histories': sales_histories,
    'purchase_histories': purchase_histories,
    'shopProviders': shopProviders,
  })

@login_required
def shop_historial_ventas(request, id):
  if request.method == 'GET':
    historiales = SalesHistory.objects.filter(shop_id=id).order_by('-sale_date')
    shop = Shop.objects.get(id=id)
    productos_disponibles = shop.products_in_stock()

    return render(request, 'historial_de_ventas.html', {
      'historiales': historiales,
      'form': SalesHistoryForm,
      'shop_id': id,
      'productos_disponibles': productos_disponibles
    })   
  elif request.method == 'POST':  
    SalesHistory.objects.create(
      product_provider_id=request.POST['product_provider'],
      amount=int(request.POST['amount']),
      unit_price=Decimal(request.POST['unit_price']),
      shop_id=id,
    )
    return redirect('shop_historial_ventas', id=id)

@login_required
def shop_historial_compras(request, id):
  if request.method == 'GET':
    historiales = PurchaseHistory.objects.filter(shop_id=id).order_by('-purchase_date')
    providers = ShopProvider.objects.filter(shop_id=id).values_list('provider_id', flat=True)
    productos = ProductProvider.objects.select_related('product').filter(provider_id__in=providers)

    return render(request, 'historial_de_compras.html', {
      'historiales': historiales,
      'form': PurchaseHistoryForm,
      'shop_id': id,
      'productos': productos,
    })   
  elif request.method == 'POST':
    packacke = False if request.POST['unit_price_pack'] == "f" else True
    PurchaseHistory.objects.create(
      shop_id=id,
      product_provider_id=request.POST['product_provider'],
      amount=int(request.POST['amount']),
      unit_price=Decimal(request.POST['unit_price']),
      num_units_from_pack=request.POST['unit_price_pack'],
      package=packacke
    )
    return redirect('shop_historial_compras', id=id)

@login_required
def providers(request):
  providers = Provider.objects.all()

  return render(request, 'providers.html', {
    'providers': providers,
  })