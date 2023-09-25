# Shops-management
This is a backend personal project.
How many times is it cumbersome or a headache to manage a store?, well, this project helps you make an inventory of in-stock or out-of-stock products and handle product order

## How to start
Using Docker-compose:
```bash
mv envs_docker_example.env envs_docker.env
cd docker && docker-compose up --build
```

Or in your own machine:
First you need to change your env vars in envs_local_example.env whit your credentials and rename it to envs_local.env
```bash
mv envs_local_example.env envs_local.env
```
Then you need to create a DB called 'django_shop' to PostgreSQL and then use:
```bash
psql -U YOUR_USER -d  django_shop -a -f sql/all.sql
```
this will insert some data to see the correct functioning of the api

now you can simply start this Django project and run a server, for a easy start just run init_shop_management.sh with execute permissions inside the API root
```bash
chmod +x init_shop_management.sh
./init_shop_management.sh
```
this create a python environment, install dependences and start the server 

and then visit your [localhost:8000](http://127.0.0.1:8000/)
