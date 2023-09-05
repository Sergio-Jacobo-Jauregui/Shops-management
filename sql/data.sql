--
-- PostgreSQL database dump
--

-- Dumped from database version 14.9 (Ubuntu 14.9-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.9 (Ubuntu 14.9-0ubuntu0.22.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: giorgioj
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: giorgioj
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	shopapp	product
8	shopapp	productprovider
9	shopapp	provider
10	shopapp	shop
11	shopapp	shopprovider
12	shopapp	shopproduct
13	shopapp	historialdeventa
14	shopapp	historialdecompra
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: giorgioj
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add product	7	add_product
26	Can change product	7	change_product
27	Can delete product	7	delete_product
28	Can view product	7	view_product
29	Can add product provider	8	add_productprovider
30	Can change product provider	8	change_productprovider
31	Can delete product provider	8	delete_productprovider
32	Can view product provider	8	view_productprovider
33	Can add provider	9	add_provider
34	Can change provider	9	change_provider
35	Can delete provider	9	delete_provider
36	Can view provider	9	view_provider
37	Can add shop	10	add_shop
38	Can change shop	10	change_shop
39	Can delete shop	10	delete_shop
40	Can view shop	10	view_shop
41	Can add shop provider	11	add_shopprovider
42	Can change shop provider	11	change_shopprovider
43	Can delete shop provider	11	delete_shopprovider
44	Can view shop provider	11	view_shopprovider
45	Can add shop product	12	add_shopproduct
46	Can change shop product	12	change_shopproduct
47	Can delete shop product	12	delete_shopproduct
48	Can view shop product	12	view_shopproduct
49	Can add historial de venta	13	add_historialdeventa
50	Can change historial de venta	13	change_historialdeventa
51	Can delete historial de venta	13	delete_historialdeventa
52	Can view historial de venta	13	view_historialdeventa
53	Can add historial de compra	14	add_historialdecompra
54	Can change historial de compra	14	change_historialdecompra
55	Can delete historial de compra	14	delete_historialdecompra
56	Can view historial de compra	14	view_historialdecompra
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: giorgioj
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: giorgioj
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$600000$xIyIPG0EzAkBnbF2ke3nPG$kGENgT8L3Mp/PbaxZJ/LL7udJQcaWKvwQZpM24ilVjM=	2023-09-04 11:22:00.021458-05	t	giorgioj			serggiovanni@gmail.com	t	t	2023-09-04 11:21:53.521673-05
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: giorgioj
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: giorgioj
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: giorgioj
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: giorgioj
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2023-09-04 10:36:45.107097-05
2	auth	0001_initial	2023-09-04 10:36:45.160692-05
3	admin	0001_initial	2023-09-04 10:36:45.176871-05
4	admin	0002_logentry_remove_auto_add	2023-09-04 10:36:45.183805-05
5	admin	0003_logentry_add_action_flag_choices	2023-09-04 10:36:45.191663-05
6	contenttypes	0002_remove_content_type_name	2023-09-04 10:36:45.205044-05
7	auth	0002_alter_permission_name_max_length	2023-09-04 10:36:45.212403-05
8	auth	0003_alter_user_email_max_length	2023-09-04 10:36:45.221168-05
9	auth	0004_alter_user_username_opts	2023-09-04 10:36:45.228005-05
10	auth	0005_alter_user_last_login_null	2023-09-04 10:36:45.235383-05
11	auth	0006_require_contenttypes_0002	2023-09-04 10:36:45.237666-05
12	auth	0007_alter_validators_add_error_messages	2023-09-04 10:36:45.243937-05
13	auth	0008_alter_user_username_max_length	2023-09-04 10:36:45.253322-05
14	auth	0009_alter_user_last_name_max_length	2023-09-04 10:36:45.260383-05
15	auth	0010_alter_group_name_max_length	2023-09-04 10:36:45.268633-05
16	auth	0011_update_proxy_permissions	2023-09-04 10:36:45.275301-05
17	auth	0012_alter_user_first_name_max_length	2023-09-04 10:36:45.282238-05
18	sessions	0001_initial	2023-09-04 10:36:45.291772-05
19	shopapp	0001_initial	2023-09-04 10:36:45.364356-05
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: giorgioj
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
clbh3hobcml6dlgvlxk584uf0e6flzur	.eJxVjDsOwjAQBe_iGln-xJ-lpM8ZLNu7wQFkS3FSIe5OIqWAdmbee7MQt7WErdMSZmRXJtnll6WYn1QPgY9Y743nVtdlTvxI-Gk7HxvS63a2fwcl9rKvjfWYhDEaNGaQ4FPWAoRH0KDytAP0jhzQYBDFkBxJpVAhWQtCTYZ9vsYVNzY:1qdCKu:IHj4mT80hrM1FOEFWVQpBXskRfXhZY8KpHUqWlU05d0	2023-09-18 11:22:00.023257-05
\.


--
-- Data for Name: shopapp_product; Type: TABLE DATA; Schema: public; Owner: giorgioj
--

COPY public.shopapp_product (id, name) FROM stdin;
1	Helado Sublime
2	Trika
4	Helado Bom Bom
5	Inka Cola 600ml
6	Coca Cola 600ml
7	Clorox 680ml
8	Poett 550ml
9	Leche Gloria Azul 395ml
10	Leche Gloria Azul 170ml
11	Leche Gloria Roja 395ml
12	Leche Gloria Roja 170ml
13	Sello de Oro 90gr
14	Cielo 500ml
3	Helado Big Bang
\.


--
-- Data for Name: shopapp_provider; Type: TABLE DATA; Schema: public; Owner: giorgioj
--

COPY public.shopapp_provider (id, name) FROM stdin;
1	Coca Cola Company
2	Dijisa
3	Roma
4	D&G
5	J.E.
6	Fonpell
7	Empresa San Martin
8	Donofrio
\.


--
-- Data for Name: shopapp_productprovider; Type: TABLE DATA; Schema: public; Owner: giorgioj
--

COPY public.shopapp_productprovider (id, product_id, provider_id) FROM stdin;
1	1	8
2	2	8
3	4	8
4	5	1
5	6	1
6	7	2
7	8	2
8	9	3
9	10	3
10	11	3
11	12	3
12	13	3
13	14	1
14	3	8
\.


--
-- Data for Name: shopapp_shop; Type: TABLE DATA; Schema: public; Owner: giorgioj
--

COPY public.shopapp_shop (id, name, email, addres, money) FROM stdin;
1	Ivisol	Ivisol@gmail.com	Chonavi	1000
2	Competencia1	emailfeo@gmial,com	Quien sabe cuando	1000
\.


--
-- Data for Name: shopapp_historialdecompra; Type: TABLE DATA; Schema: public; Owner: giorgioj
--

COPY public.shopapp_historialdecompra (id, amount, unit_price, total_cost, purchase_date, product_provider_id, shop_id) FROM stdin;
\.


--
-- Data for Name: shopapp_historialdeventa; Type: TABLE DATA; Schema: public; Owner: giorgioj
--

COPY public.shopapp_historialdeventa (id, amount, unit_price, total_price, sale_date, product_provider_id, shop_id) FROM stdin;
\.


--
-- Data for Name: shopapp_shopproduct; Type: TABLE DATA; Schema: public; Owner: giorgioj
--

COPY public.shopapp_shopproduct (id, due_date, purchase_price, sale_price, amount, out_stock, arrival_date, product_provider_id, shop_id) FROM stdin;
\.


--
-- Data for Name: shopapp_shopprovider; Type: TABLE DATA; Schema: public; Owner: giorgioj
--

COPY public.shopapp_shopprovider (id, provider_id, shop_id) FROM stdin;
1	1	1
19	2	1
20	3	1
21	4	1
22	5	1
23	6	1
24	7	1
25	8	1
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: giorgioj
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: giorgioj
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: giorgioj
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 56, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: giorgioj
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: giorgioj
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: giorgioj
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: giorgioj
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: giorgioj
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 14, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: giorgioj
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 19, true);


--
-- Name: shopapp_historialdecompra_id_seq; Type: SEQUENCE SET; Schema: public; Owner: giorgioj
--

SELECT pg_catalog.setval('public.shopapp_historialdecompra_id_seq', 4, true);


--
-- Name: shopapp_historialdeventa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: giorgioj
--

SELECT pg_catalog.setval('public.shopapp_historialdeventa_id_seq', 16, true);


--
-- Name: shopapp_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: giorgioj
--

SELECT pg_catalog.setval('public.shopapp_product_id_seq', 14, true);


--
-- Name: shopapp_productprovider_id_seq; Type: SEQUENCE SET; Schema: public; Owner: giorgioj
--

SELECT pg_catalog.setval('public.shopapp_productprovider_id_seq', 14, true);


--
-- Name: shopapp_provider_id_seq; Type: SEQUENCE SET; Schema: public; Owner: giorgioj
--

SELECT pg_catalog.setval('public.shopapp_provider_id_seq', 8, true);


--
-- Name: shopapp_shop_id_seq; Type: SEQUENCE SET; Schema: public; Owner: giorgioj
--

SELECT pg_catalog.setval('public.shopapp_shop_id_seq', 2, true);


--
-- Name: shopapp_shopproduct_id_seq; Type: SEQUENCE SET; Schema: public; Owner: giorgioj
--

SELECT pg_catalog.setval('public.shopapp_shopproduct_id_seq', 4, true);


--
-- Name: shopapp_shopprovider_id_seq; Type: SEQUENCE SET; Schema: public; Owner: giorgioj
--

SELECT pg_catalog.setval('public.shopapp_shopprovider_id_seq', 25, true);


--
-- PostgreSQL database dump complete
--

