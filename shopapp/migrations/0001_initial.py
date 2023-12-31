# Generated by Django 4.2 on 2023-09-04 15:16

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='ProductProvider',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shopapp.product')),
            ],
        ),
        migrations.CreateModel(
            name='Provider',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='Shop',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('email', models.CharField(max_length=50, unique=True)),
                ('addres', models.CharField(blank=True, max_length=50, null=True)),
                ('money', models.IntegerField(default=1000)),
            ],
        ),
        migrations.CreateModel(
            name='ShopProvider',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('provider', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shopapp.provider')),
                ('shop', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shopapp.shop')),
            ],
        ),
        migrations.CreateModel(
            name='ShopProduct',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('due_date', models.DateTimeField(blank=True, null=True)),
                ('purchase_price', models.DecimalField(decimal_places=3, max_digits=6)),
                ('sale_price', models.DecimalField(decimal_places=3, max_digits=6)),
                ('amount', models.IntegerField()),
                ('out_stock', models.BooleanField(default=False)),
                ('arrival_date', models.DateField()),
                ('product_provider', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shopapp.productprovider')),
                ('shop', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shopapp.shop')),
            ],
        ),
        migrations.AddField(
            model_name='productprovider',
            name='provider',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shopapp.provider'),
        ),
        migrations.CreateModel(
            name='SalesHistory',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('amount', models.IntegerField()),
                ('unit_price', models.DecimalField(decimal_places=3, max_digits=6)),
                ('total_price', models.DecimalField(decimal_places=3, max_digits=6)),
                ('sale_date', models.DateTimeField(auto_now_add=True)),
                ('product_provider', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shopapp.productprovider')),
                ('shop', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shopapp.shop')),
            ],
        ),
        migrations.CreateModel(
            name='PurchaseHistory',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('amount', models.IntegerField()),
                ('unit_price', models.DecimalField(decimal_places=3, max_digits=6)),
                ('total_cost', models.DecimalField(decimal_places=3, max_digits=6)),
                ('purchase_date', models.DateTimeField(auto_now_add=True)),
                ('product_provider', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shopapp.productprovider')),
                ('shop', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shopapp.shop')),
            ],
        ),
    ]
