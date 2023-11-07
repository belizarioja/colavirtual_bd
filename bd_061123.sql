--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-11-06 21:29:35

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
-- TOC entry 216 (class 1259 OID 49189)
-- Name: t_empresas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t_empresas (
    id bigint NOT NULL,
    empresa character varying(200) NOT NULL,
    correo character varying(200),
    telefono character varying(200)
);


--
-- TOC entry 217 (class 1259 OID 49201)
-- Name: s_t_empresas_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.s_t_empresas_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3373 (class 0 OID 0)
-- Dependencies: 217
-- Name: s_t_empresas_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.s_t_empresas_id OWNED BY public.t_empresas.id;


--
-- TOC entry 223 (class 1259 OID 49259)
-- Name: t_evento_usuario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t_evento_usuario (
    id bigint NOT NULL,
    idevento bigint NOT NULL,
    idusuario bigint NOT NULL,
    numero numeric(9,0),
    fecha timestamp without time zone,
    estatus numeric(2,0) DEFAULT 0 NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 49233)
-- Name: s_t_evento_usuario_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.s_t_evento_usuario_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999999
    CACHE 1;


--
-- TOC entry 3374 (class 0 OID 0)
-- Dependencies: 220
-- Name: s_t_evento_usuario_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.s_t_evento_usuario_id OWNED BY public.t_evento_usuario.id;


--
-- TOC entry 218 (class 1259 OID 49214)
-- Name: t_eventos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t_eventos (
    id bigint NOT NULL,
    evento character varying(500) NOT NULL,
    descripcion character varying(2000) NOT NULL,
    idempresa bigint NOT NULL,
    estatus numeric(2,0) DEFAULT 0 NOT NULL,
    activo numeric(2,0) DEFAULT 0 NOT NULL,
    numeroactual numeric(9,0) DEFAULT 0 NOT NULL,
    fecha timestamp without time zone,
    fechainicio timestamp without time zone,
    fechafin timestamp without time zone
);


--
-- TOC entry 219 (class 1259 OID 49221)
-- Name: s_t_eventos_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.s_t_eventos_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999
    CACHE 1;


--
-- TOC entry 3375 (class 0 OID 0)
-- Dependencies: 219
-- Name: s_t_eventos_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.s_t_eventos_id OWNED BY public.t_eventos.id;


--
-- TOC entry 221 (class 1259 OID 49250)
-- Name: s_t_usuarios_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.s_t_usuarios_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999
    CACHE 1
    CYCLE;


--
-- TOC entry 214 (class 1259 OID 49177)
-- Name: t_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t_roles (
    id numeric(2,0) NOT NULL,
    rol character varying(50) NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 49182)
-- Name: t_tipodocumentos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t_tipodocumentos (
    id numeric(2,0) NOT NULL,
    tipodocumento character varying(100) NOT NULL,
    abrev character varying(50) NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 49251)
-- Name: t_usuarios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t_usuarios (
    id bigint DEFAULT nextval('public.s_t_usuarios_id'::regclass) NOT NULL,
    usuario character varying(100) NOT NULL,
    clave character varying(100) NOT NULL,
    nombre character varying(200),
    iddocumento numeric(2,0) NOT NULL,
    documento character varying(100),
    correo character varying(200),
    telefono character varying(200),
    direccion character varying(500),
    idrol numeric(2,0)
);


--
-- TOC entry 3196 (class 2604 OID 49232)
-- Name: t_empresas id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_empresas ALTER COLUMN id SET DEFAULT nextval('public.s_t_empresas_id'::regclass);


--
-- TOC entry 3202 (class 2604 OID 49264)
-- Name: t_evento_usuario id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_evento_usuario ALTER COLUMN id SET DEFAULT nextval('public.s_t_evento_usuario_id'::regclass);


--
-- TOC entry 3197 (class 2604 OID 49231)
-- Name: t_eventos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_eventos ALTER COLUMN id SET DEFAULT nextval('public.s_t_eventos_id'::regclass);


--
-- TOC entry 3360 (class 0 OID 49189)
-- Dependencies: 216
-- Data for Name: t_empresas; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_empresas VALUES (1, 'Alcaldia', 'correo@mail.com', '12345678');
INSERT INTO public.t_empresas VALUES (2, 'Gobernación', 'gob@mail.com', '2233334444');


--
-- TOC entry 3367 (class 0 OID 49259)
-- Dependencies: 223
-- Data for Name: t_evento_usuario; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_evento_usuario VALUES (2, 2, 1, 1, '2023-09-21 19:01:21', 1);
INSERT INTO public.t_evento_usuario VALUES (3, 2, 2, 2, '2023-09-21 20:32:16', 1);


--
-- TOC entry 3362 (class 0 OID 49214)
-- Dependencies: 218
-- Data for Name: t_eventos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_eventos VALUES (1, 'Entrega casa equipada', 'Jornada especial para Entregar equipos de  casa equipada', 1, 0, 0, 0, '2023-09-22 18:30:00', '2023-09-21 10:30:00', '2023-09-21 14:30:00');
INSERT INTO public.t_eventos VALUES (2, 'Misión Milagro', 'Jornada de operacion de cataratas', 2, 1, 0, 6, '2023-09-23 15:00:00', '2023-09-21 18:30:00', '2023-09-22 18:30:00');
INSERT INTO public.t_eventos VALUES (3, 'Creditod micro', 'Jornadas de microcreditos', 2, 1, 1, 1, '2023-11-07 11:45:00', NULL, NULL);


--
-- TOC entry 3358 (class 0 OID 49177)
-- Dependencies: 214
-- Data for Name: t_roles; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_roles VALUES (1, 'Administrador');
INSERT INTO public.t_roles VALUES (2, 'Empresa');
INSERT INTO public.t_roles VALUES (3, 'Usuario');


--
-- TOC entry 3359 (class 0 OID 49182)
-- Dependencies: 215
-- Data for Name: t_tipodocumentos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_tipodocumentos VALUES (1, 'Venezolano', 'V');
INSERT INTO public.t_tipodocumentos VALUES (2, 'Extranjero', 'E');
INSERT INTO public.t_tipodocumentos VALUES (3, 'Pasaporte', 'PasP');
INSERT INTO public.t_tipodocumentos VALUES (4, 'Jurídico', 'J');


--
-- TOC entry 3366 (class 0 OID 49251)
-- Dependencies: 222
-- Data for Name: t_usuarios; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_usuarios VALUES (1, 'belizario', '123456', 'Jesús Belizario', 1, '11222333', 'belizarioja@gmail.com', '04128342274', 'Caracas', 1);
INSERT INTO public.t_usuarios VALUES (2, 'admin', '123456', 'Administrador system', 2, '11444555', 'correo@mail.com', '04125558866', 'Cumaná', 1);
INSERT INTO public.t_usuarios VALUES (4, 'rosa', '123456', 'Rosa Rojas', 1, '10000000', 'fff@jjj.com', '04125556633', 'Caracas', 3);
INSERT INTO public.t_usuarios VALUES (5, 'luis', '123456', 'Luis Diaz', 1, '11000222', 'sss@hhh.com', '04147778855', 'Caracas', 3);


--
-- TOC entry 3376 (class 0 OID 0)
-- Dependencies: 217
-- Name: s_t_empresas_id; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.s_t_empresas_id', 2, true);


--
-- TOC entry 3377 (class 0 OID 0)
-- Dependencies: 220
-- Name: s_t_evento_usuario_id; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.s_t_evento_usuario_id', 8, true);


--
-- TOC entry 3378 (class 0 OID 0)
-- Dependencies: 219
-- Name: s_t_eventos_id; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.s_t_eventos_id', 3, true);


--
-- TOC entry 3379 (class 0 OID 0)
-- Dependencies: 221
-- Name: s_t_usuarios_id; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.s_t_usuarios_id', 5, true);


--
-- TOC entry 3209 (class 2606 OID 49193)
-- Name: t_empresas t_empresas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_empresas
    ADD CONSTRAINT t_empresas_pkey PRIMARY KEY (id);


--
-- TOC entry 3215 (class 2606 OID 49263)
-- Name: t_evento_usuario t_evento_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_evento_usuario
    ADD CONSTRAINT t_evento_usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 3211 (class 2606 OID 49220)
-- Name: t_eventos t_eventos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_eventos
    ADD CONSTRAINT t_eventos_pkey PRIMARY KEY (id);


--
-- TOC entry 3205 (class 2606 OID 49181)
-- Name: t_roles t_rol_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_roles
    ADD CONSTRAINT t_rol_pkey PRIMARY KEY (id);


--
-- TOC entry 3207 (class 2606 OID 49186)
-- Name: t_tipodocumentos t_tipodocumento_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_tipodocumentos
    ADD CONSTRAINT t_tipodocumento_pkey PRIMARY KEY (id);


--
-- TOC entry 3213 (class 2606 OID 49258)
-- Name: t_usuarios t_usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_usuarios
    ADD CONSTRAINT t_usuarios_pkey PRIMARY KEY (id);


-- Completed on 2023-11-06 21:29:36

--
-- PostgreSQL database dump complete
--

