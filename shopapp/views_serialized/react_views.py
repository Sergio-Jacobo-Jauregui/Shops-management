from django.shortcuts import render, redirect
from shopapp.models import ShopProvider, Shop, HistorialDeVenta, HistorialDeCompra, Provider, ProductProvider, Product
from shopapp.forms import HistorialDeVentaForm
from decimal import Decimal
from django.http import JsonResponse, HttpResponse
from django.forms.models import model_to_dict
from django.views.decorators.csrf import csrf_exempt

def index(request):
  shops = list(Shop.objects.all().values('id', 'name', 'addres', 'money'))

  return JsonResponse(shops, safe=False)

def shop(request, id):
  shop = Shop.objects.get(id=id)
  shop_dic = model_to_dict(shop, fields=['name'])
  shopProducts = list(shop.products_in_stock_react())
  products_out_stock = list(shop.products_out_stock_react())
  productos_por_llegar = list(shop.upcoming_products_react())
  historialDeVenta = list(HistorialDeVenta.objects.filter(shop_id=id).select_related('product_provider__product').values('id','product_provider__product__name', 'amount', 'unit_price', 'total_price', 'sale_date'))
  historialDeCompra = list(HistorialDeCompra.objects.filter(shop_id=id).select_related('product_provider__product').values('id','product_provider__product__name', 'amount', 'unit_price', 'total_cost', 'purchase_date', 'product_provider', 'num_units_from_pack', 'package'))
  shopProviders = list(Provider.objects.filter(shopprovider__shop_id=1).values('id', 'name'))
  
  data = {
    'shop': shop_dic,
    'shopProducts': shopProducts,
    'products_out_stock': products_out_stock,
    'productos_por_llegar': productos_por_llegar,
    'historialDeVenta': historialDeVenta,
    'historialDeCompra': historialDeCompra,
    'shopProviders': shopProviders,
  }
  return JsonResponse(data, safe=False)

@csrf_exempt
def shop_historial_ventas(request, id):
  if request.method == 'GET':
    historiales = HistorialDeVenta.objects.filter(shop_id=id).order_by('-sale_date')
    shop = Shop.objects.get(id=id)
    productos_disponibles = shop.products_in_stock()

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

@csrf_exempt
def shop_historial_compras(request, id):
  if request.method == 'GET':
    historiales = HistorialDeCompra.objects.filter(shop_id=id).select_related('product_provider__product').values('id','product_provider__product__name', 'amount', 'unit_price', 'total_cost', 'purchase_date', 'product_provider', 'num_units_from_pack', 'package').order_by('-purchase_date')
    providers = ShopProvider.objects.filter(shop_id=id).values_list('provider_id', flat=True)
    productos = Product.objects.filter(productprovider__provider_id__in=providers).select_related('product').values('productprovider__id', 'name')

    data = {
      'historiales':list(historiales),
      'productos':list(productos),
    }
    return JsonResponse(data, safe=False)
  elif request.method == 'POST':
    print(11111111111111111111111111111111111111111111111111111)
    print(request.POST)
    print(11111111111111111111111111111111111111111111111111111)
    # packacke = True if request.POST['unit_price_pack'] == "on" else False
    # num_units_from_pack = int(request.POST['unit_price_pack']) if request.POST['unit_price_pack'] else 0
    # new = HistorialDeCompra(
    #   shop_id=id,
    #   product_provider_id=int(request.POST['product_provider']),
    #   amount=int(request.POST['amount']),
    #   unit_price=Decimal(request.POST['unit_price']),
    #   num_units_from_pack=num_units_from_pack,
    #   package=packacke
    # )
    # new.save()

    # if new:
    return HttpResponse(status=200)
    # else:
    #   return HttpResponse(status=400)
      

def providers(request):
  providers = Provider.objects.all()

  return render(request, 'providers.html', {
    'providers': providers,
  })
