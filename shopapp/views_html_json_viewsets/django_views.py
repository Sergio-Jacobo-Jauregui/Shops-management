from django.shortcuts import render, redirect
from shopapp.models import ShopProvider, Shop, HistorialDeVenta, HistorialDeCompra, Provider
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
  shopProviders = ShopProvider.objects.filter(shop_id=id)

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
    print(request.POST['product_provider'])
    print(request.POST['amount'])
    print(request.POST['unit_price'])


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

    return render(request, 'historial_de_compras.html', {
      'historiales': historiales,
      'form': HistorialDeCompraForm,
      'shop_id': id,
    })   
  elif request.method == 'POST':
    form = HistorialDeCompraForm(request.POST)   
    new_historial_compras = form.save(commit=False)
    new_historial_compras.shop_id = id
    new_historial_compras.save()
    return redirect('shop_historial_compras', id=id)

def providers(request):
  providers = Provider.objects.all()

  return render(request, 'providers.html', {
    'providers': providers,
  })