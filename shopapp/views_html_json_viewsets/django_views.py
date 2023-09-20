from django.shortcuts import render, redirect
from shopapp.models import ShopProvider, Shop, HistorialDeVenta, HistorialDeCompra, Provider, ProductProvider
from shopapp.forms import HistorialDeCompraForm, HistorialDeVentaForm
from decimal import Decimal

# Create your views here.
def index(request):
  shops = Shop.objects.all()

  return render(request, 'index.html', {
    'shops': shops,
  })

def shop(request, id):
  shop = Shop.objects.get(id=id)
  shopProducts = shop.productos_en_stock()
  products_out_stock = shop.productos_agotados()
  productos_por_llegar = shop.productos_en_camino()
  historialDeVenta = HistorialDeVenta.objects.filter(shop_id=id)
  historialDeCompra = HistorialDeCompra.objects.filter(shop_id=id)
  shopProviders = ShopProvider.objects.select_related('provider').filter(shop_id=id)

  return render(request, 'shop.html', {
    'shop': shop,
    'shopProducts': shopProducts,
    'products_out_stock': products_out_stock,
    'productos_por_llegar': productos_por_llegar,
    'historialDeVentas': historialDeVenta,
    'historialDeCompras': historialDeCompra,
    'shopProviders': shopProviders,
  })

def shop_historial_ventas(request, id):
  if request.method == 'GET':
    historiales = HistorialDeVenta.objects.filter(shop_id=id).order_by('-sale_date')
    shop = Shop.objects.get(id=id)
    productos_disponibles = shop.productos_en_stock()

    return render(request, 'historial_de_ventas.html', {
      'historiales': historiales,
      'form': HistorialDeVentaForm,
      'shop_id': id,
      'productos_disponibles': productos_disponibles
    })   
  elif request.method == 'POST':  
    HistorialDeVenta.objects.create(
      product_provider_id=request.POST['product_provider'],
      amount=int(request.POST['amount']),
      unit_price=Decimal(request.POST['unit_price']),
      shop_id=id,
    )
    return redirect('shop_historial_ventas', id=id)

def shop_historial_compras(request, id):
  if request.method == 'GET':
    historiales = HistorialDeCompra.objects.filter(shop_id=id).order_by('-purchase_date')
    providers = ShopProvider.objects.filter(shop_id=id).values_list('provider_id', flat=True)
    productos = ProductProvider.objects.select_related('product').filter(provider_id__in=providers)

    return render(request, 'historial_de_compras.html', {
      'historiales': historiales,
      'form': HistorialDeCompraForm,
      'shop_id': id,
      'productos': productos,
    })   
  elif request.method == 'POST':
    packacke = False if request.POST['unit_price_pack'] == "f" else True
    HistorialDeCompra.objects.create(
      shop_id=id,
      product_provider_id=request.POST['product_provider'],
      amount=int(request.POST['amount']),
      unit_price=Decimal(request.POST['unit_price']),
      num_units_from_pack=request.POST['unit_price_pack'],
      package=packacke
    )
    return redirect('shop_historial_compras', id=id)

def providers(request):
  providers = Provider.objects.all()

  return render(request, 'providers.html', {
    'providers': providers,
  })