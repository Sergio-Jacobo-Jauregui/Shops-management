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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: giorgioj
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO giorgioj;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: giorgioj
--

ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: giorgioj
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO giorgioj;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: giorgioj
--

ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: giorgioj
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO giorgioj;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: giorgioj
--

ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: giorgioj
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO giorgioj;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: giorgioj
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO giorgioj;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: giorgioj
--

ALTER TABLE public.auth_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: giorgioj
--

ALTER TABLE public.auth_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: giorgioj
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO giorgioj;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: giorgioj
--

ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: giorgioj
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO giorgioj;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: giorgioj
--

ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: giorgioj
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO giorgioj;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: giorgioj
--

ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: giorgioj
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO giorgioj;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: giorgioj
--

ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: giorgioj
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO giorgioj;

--
-- Name: shopapp_historialdecompra; Type: TABLE; Schema: public; Owner: giorgioj
--

CREATE TABLE public.shopapp_historialdecompra (
    id bigint NOT NULL,
    amount integer NOT NULL,
    unit_price numeric(6,3) NOT NULL,
    total_cost numeric(6,3) NOT NULL,
    purchase_date timestamp with time zone NOT NULL,
    product_provider_id bigint NOT NULL,
    shop_id bigint NOT NULL
);


ALTER TABLE public.shopapp_historialdecompra OWNER TO giorgioj;

--
-- Name: shopapp_historialdecompra_id_seq; Type: SEQUENCE; Schema: public; Owner: giorgioj
--

ALTER TABLE public.shopapp_historialdecompra ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.shopapp_historialdecompra_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: shopapp_historialdeventa; Type: TABLE; Schema: public; Owner: giorgioj
--

CREATE TABLE public.shopapp_historialdeventa (
    id bigint NOT NULL,
    amount integer NOT NULL,
    unit_price numeric(6,3) NOT NULL,
    total_price numeric(6,3) NOT NULL,
    sale_date timestamp with time zone NOT NULL,
    product_provider_id bigint NOT NULL,
    shop_id bigint NOT NULL
);


ALTER TABLE public.shopapp_historialdeventa OWNER TO giorgioj;

--
-- Name: shopapp_historialdeventa_id_seq; Type: SEQUENCE; Schema: public; Owner: giorgioj
--

ALTER TABLE public.shopapp_historialdeventa ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.shopapp_historialdeventa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: shopapp_product; Type: TABLE; Schema: public; Owner: giorgioj
--

CREATE TABLE public.shopapp_product (
    id bigint NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.shopapp_product OWNER TO giorgioj;

--
-- Name: shopapp_product_id_seq; Type: SEQUENCE; Schema: public; Owner: giorgioj
--

ALTER TABLE public.shopapp_product ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.shopapp_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: shopapp_productprovider; Type: TABLE; Schema: public; Owner: giorgioj
--

CREATE TABLE public.shopapp_productprovider (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    provider_id bigint NOT NULL
);


ALTER TABLE public.shopapp_productprovider OWNER TO giorgioj;

--
-- Name: shopapp_productprovider_id_seq; Type: SEQUENCE; Schema: public; Owner: giorgioj
--

ALTER TABLE public.shopapp_productprovider ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.shopapp_productprovider_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: shopapp_provider; Type: TABLE; Schema: public; Owner: giorgioj
--

CREATE TABLE public.shopapp_provider (
    id bigint NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.shopapp_provider OWNER TO giorgioj;

--
-- Name: shopapp_provider_id_seq; Type: SEQUENCE; Schema: public; Owner: giorgioj
--

ALTER TABLE public.shopapp_provider ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.shopapp_provider_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: shopapp_shop; Type: TABLE; Schema: public; Owner: giorgioj
--

CREATE TABLE public.shopapp_shop (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    addres character varying(50),
    money integer NOT NULL
);


ALTER TABLE public.shopapp_shop OWNER TO giorgioj;

--
-- Name: shopapp_shop_id_seq; Type: SEQUENCE; Schema: public; Owner: giorgioj
--

ALTER TABLE public.shopapp_shop ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.shopapp_shop_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: shopapp_shopproduct; Type: TABLE; Schema: public; Owner: giorgioj
--

CREATE TABLE public.shopapp_shopproduct (
    id bigint NOT NULL,
    due_date timestamp with time zone,
    purchase_price numeric(6,3) NOT NULL,
    sale_price numeric(6,3) NOT NULL,
    amount integer NOT NULL,
    out_stock boolean NOT NULL,
    arrival_date date NOT NULL,
    product_provider_id bigint NOT NULL,
    shop_id bigint NOT NULL
);


ALTER TABLE public.shopapp_shopproduct OWNER TO giorgioj;

--
-- Name: shopapp_shopproduct_id_seq; Type: SEQUENCE; Schema: public; Owner: giorgioj
--

ALTER TABLE public.shopapp_shopproduct ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.shopapp_shopproduct_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: shopapp_shopprovider; Type: TABLE; Schema: public; Owner: giorgioj
--

CREATE TABLE public.shopapp_shopprovider (
    id bigint NOT NULL,
    provider_id bigint NOT NULL,
    shop_id bigint NOT NULL
);


ALTER TABLE public.shopapp_shopprovider OWNER TO giorgioj;

--
-- Name: shopapp_shopprovider_id_seq; Type: SEQUENCE; Schema: public; Owner: giorgioj
--

ALTER TABLE public.shopapp_shopprovider ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.shopapp_shopprovider_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: shopapp_historialdecompra shopapp_historialdecompra_pkey; Type: CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.shopapp_historialdecompra
    ADD CONSTRAINT shopapp_historialdecompra_pkey PRIMARY KEY (id);


--
-- Name: shopapp_historialdeventa shopapp_historialdeventa_pkey; Type: CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.shopapp_historialdeventa
    ADD CONSTRAINT shopapp_historialdeventa_pkey PRIMARY KEY (id);


--
-- Name: shopapp_product shopapp_product_pkey; Type: CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.shopapp_product
    ADD CONSTRAINT shopapp_product_pkey PRIMARY KEY (id);


--
-- Name: shopapp_productprovider shopapp_productprovider_pkey; Type: CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.shopapp_productprovider
    ADD CONSTRAINT shopapp_productprovider_pkey PRIMARY KEY (id);


--
-- Name: shopapp_provider shopapp_provider_pkey; Type: CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.shopapp_provider
    ADD CONSTRAINT shopapp_provider_pkey PRIMARY KEY (id);


--
-- Name: shopapp_shop shopapp_shop_email_key; Type: CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.shopapp_shop
    ADD CONSTRAINT shopapp_shop_email_key UNIQUE (email);


--
-- Name: shopapp_shop shopapp_shop_pkey; Type: CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.shopapp_shop
    ADD CONSTRAINT shopapp_shop_pkey PRIMARY KEY (id);


--
-- Name: shopapp_shopproduct shopapp_shopproduct_pkey; Type: CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.shopapp_shopproduct
    ADD CONSTRAINT shopapp_shopproduct_pkey PRIMARY KEY (id);


--
-- Name: shopapp_shopprovider shopapp_shopprovider_pkey; Type: CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.shopapp_shopprovider
    ADD CONSTRAINT shopapp_shopprovider_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: giorgioj
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: giorgioj
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: giorgioj
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: giorgioj
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: giorgioj
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: giorgioj
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: giorgioj
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: giorgioj
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: giorgioj
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: giorgioj
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: giorgioj
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: giorgioj
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: giorgioj
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: shopapp_historialdecompra_product_provider_id_ebfcecb1; Type: INDEX; Schema: public; Owner: giorgioj
--

CREATE INDEX shopapp_historialdecompra_product_provider_id_ebfcecb1 ON public.shopapp_historialdecompra USING btree (product_provider_id);


--
-- Name: shopapp_historialdecompra_shop_id_02f91264; Type: INDEX; Schema: public; Owner: giorgioj
--

CREATE INDEX shopapp_historialdecompra_shop_id_02f91264 ON public.shopapp_historialdecompra USING btree (shop_id);


--
-- Name: shopapp_historialdeventa_product_provider_id_fe8dba6e; Type: INDEX; Schema: public; Owner: giorgioj
--

CREATE INDEX shopapp_historialdeventa_product_provider_id_fe8dba6e ON public.shopapp_historialdeventa USING btree (product_provider_id);


--
-- Name: shopapp_historialdeventa_shop_id_84f703be; Type: INDEX; Schema: public; Owner: giorgioj
--

CREATE INDEX shopapp_historialdeventa_shop_id_84f703be ON public.shopapp_historialdeventa USING btree (shop_id);


--
-- Name: shopapp_productprovider_product_id_1c6d156c; Type: INDEX; Schema: public; Owner: giorgioj
--

CREATE INDEX shopapp_productprovider_product_id_1c6d156c ON public.shopapp_productprovider USING btree (product_id);


--
-- Name: shopapp_productprovider_provider_id_cf8d09cd; Type: INDEX; Schema: public; Owner: giorgioj
--

CREATE INDEX shopapp_productprovider_provider_id_cf8d09cd ON public.shopapp_productprovider USING btree (provider_id);


--
-- Name: shopapp_shop_email_45703b51_like; Type: INDEX; Schema: public; Owner: giorgioj
--

CREATE INDEX shopapp_shop_email_45703b51_like ON public.shopapp_shop USING btree (email varchar_pattern_ops);


--
-- Name: shopapp_shopproduct_product_provider_id_b5e5200a; Type: INDEX; Schema: public; Owner: giorgioj
--

CREATE INDEX shopapp_shopproduct_product_provider_id_b5e5200a ON public.shopapp_shopproduct USING btree (product_provider_id);


--
-- Name: shopapp_shopproduct_shop_id_34aea01c; Type: INDEX; Schema: public; Owner: giorgioj
--

CREATE INDEX shopapp_shopproduct_shop_id_34aea01c ON public.shopapp_shopproduct USING btree (shop_id);


--
-- Name: shopapp_shopprovider_provider_id_9e21ef69; Type: INDEX; Schema: public; Owner: giorgioj
--

CREATE INDEX shopapp_shopprovider_provider_id_9e21ef69 ON public.shopapp_shopprovider USING btree (provider_id);


--
-- Name: shopapp_shopprovider_shop_id_fa30a522; Type: INDEX; Schema: public; Owner: giorgioj
--

CREATE INDEX shopapp_shopprovider_shop_id_fa30a522 ON public.shopapp_shopprovider USING btree (shop_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shopapp_historialdecompra shopapp_historialdec_product_provider_id_ebfcecb1_fk_shopapp_p; Type: FK CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.shopapp_historialdecompra
    ADD CONSTRAINT shopapp_historialdec_product_provider_id_ebfcecb1_fk_shopapp_p FOREIGN KEY (product_provider_id) REFERENCES public.shopapp_productprovider(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shopapp_historialdecompra shopapp_historialdecompra_shop_id_02f91264_fk_shopapp_shop_id; Type: FK CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.shopapp_historialdecompra
    ADD CONSTRAINT shopapp_historialdecompra_shop_id_02f91264_fk_shopapp_shop_id FOREIGN KEY (shop_id) REFERENCES public.shopapp_shop(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shopapp_historialdeventa shopapp_historialdev_product_provider_id_fe8dba6e_fk_shopapp_p; Type: FK CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.shopapp_historialdeventa
    ADD CONSTRAINT shopapp_historialdev_product_provider_id_fe8dba6e_fk_shopapp_p FOREIGN KEY (product_provider_id) REFERENCES public.shopapp_productprovider(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shopapp_historialdeventa shopapp_historialdeventa_shop_id_84f703be_fk_shopapp_shop_id; Type: FK CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.shopapp_historialdeventa
    ADD CONSTRAINT shopapp_historialdeventa_shop_id_84f703be_fk_shopapp_shop_id FOREIGN KEY (shop_id) REFERENCES public.shopapp_shop(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shopapp_productprovider shopapp_productprovi_product_id_1c6d156c_fk_shopapp_p; Type: FK CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.shopapp_productprovider
    ADD CONSTRAINT shopapp_productprovi_product_id_1c6d156c_fk_shopapp_p FOREIGN KEY (product_id) REFERENCES public.shopapp_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shopapp_productprovider shopapp_productprovi_provider_id_cf8d09cd_fk_shopapp_p; Type: FK CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.shopapp_productprovider
    ADD CONSTRAINT shopapp_productprovi_provider_id_cf8d09cd_fk_shopapp_p FOREIGN KEY (provider_id) REFERENCES public.shopapp_provider(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shopapp_shopproduct shopapp_shopproduct_product_provider_id_b5e5200a_fk_shopapp_p; Type: FK CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.shopapp_shopproduct
    ADD CONSTRAINT shopapp_shopproduct_product_provider_id_b5e5200a_fk_shopapp_p FOREIGN KEY (product_provider_id) REFERENCES public.shopapp_productprovider(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shopapp_shopproduct shopapp_shopproduct_shop_id_34aea01c_fk_shopapp_shop_id; Type: FK CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.shopapp_shopproduct
    ADD CONSTRAINT shopapp_shopproduct_shop_id_34aea01c_fk_shopapp_shop_id FOREIGN KEY (shop_id) REFERENCES public.shopapp_shop(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shopapp_shopprovider shopapp_shopprovider_provider_id_9e21ef69_fk_shopapp_p; Type: FK CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.shopapp_shopprovider
    ADD CONSTRAINT shopapp_shopprovider_provider_id_9e21ef69_fk_shopapp_p FOREIGN KEY (provider_id) REFERENCES public.shopapp_provider(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shopapp_shopprovider shopapp_shopprovider_shop_id_fa30a522_fk_shopapp_shop_id; Type: FK CONSTRAINT; Schema: public; Owner: giorgioj
--

ALTER TABLE ONLY public.shopapp_shopprovider
    ADD CONSTRAINT shopapp_shopprovider_shop_id_fa30a522_fk_shopapp_shop_id FOREIGN KEY (shop_id) REFERENCES public.shopapp_shop(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--
