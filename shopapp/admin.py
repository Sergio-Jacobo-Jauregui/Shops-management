from django.contrib import admin
from .models import  Shop, Provider, ShopProvider, ProductProvider, Product, ShopProduct, PurchaseHistory, SalesHistory

class PurchaseHistoryAdmin(admin.ModelAdmin):
  readonly_fields = ('total_cost',)

class SalesHistoryAdmin(admin.ModelAdmin):
  readonly_fields = ('total_price',)

# class ShopProductAdmin(admin.ModelAdmin):
#   readonly_fields = ('sale_price',)

# Register your models here.
admin.site.register(Shop)
admin.site.register(Provider)
admin.site.register(ShopProvider)
admin.site.register(Product)
admin.site.register(ShopProduct)
admin.site.register(ProductProvider)
admin.site.register(PurchaseHistory, PurchaseHistoryAdmin)
admin.site.register(SalesHistory, SalesHistoryAdmin)