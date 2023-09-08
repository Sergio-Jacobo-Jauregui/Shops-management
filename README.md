# Shops-management
This is a backend personal project.
How many times is it cumbersome or a headache to manage a store?, well, this project helps you make an inventory of in-stock or out-of-stock products and handle product order

## How to start
First we need to create a DB called 'django_shop' to PostgreSQL and use:
```bash
psql -U YOUR_USER -d  django_shop -a -f sql/all.sql
```
then we can simply start a Django project and run a server, for a easy start just run init_shop_management.sh with execute permissions
```bash
chmod +x init_shop_management.sh
./init_shop_management.sh
```
this create a python environment, install dependences and start the server 

or start a Docker Compose
```bash
docker-compose up --build
```

and then visit your [localhost:8000](http://127.0.0.1:8000/)
