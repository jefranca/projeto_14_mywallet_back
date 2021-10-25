--
-- PostgreSQL database dump
--

-- Dumped from database version 12.8 (Ubuntu 12.8-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.8 (Ubuntu 12.8-0ubuntu0.20.04.1)

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
-- Name: balance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.balance (
    id integer NOT NULL,
    "userId" integer,
    amount integer,
    description text,
    type text NOT NULL,
    date date
);


ALTER TABLE public.balance OWNER TO postgres;

--
-- Name: balance_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.balance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.balance_id_seq OWNER TO postgres;

--
-- Name: balance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.balance_id_seq OWNED BY public.balance.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer,
    token text NOT NULL
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sessions_id_seq OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: balance id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.balance ALTER COLUMN id SET DEFAULT nextval('public.balance_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: balance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.balance (id, "userId", amount, description, type, date) FROM stdin;
1	2	23	teste	income	2021-10-24
2	2	23	teste	income	2021-10-24
3	2	23	teste	income	2021-10-24
4	2	23	teste	income	2021-10-24
5	2	23	teste	income	2021-10-24
6	2	23	teste	income	2021-10-24
7	2	23	teste	income	2021-10-24
8	2	23	teste	income	2021-10-24
9	2	23	teste	income	2021-10-24
10	2	23	teste	income	2021-10-24
11	2	23	teste	income	2021-10-24
12	2	23	teste	income	2021-10-24
13	2	23	teste	income	2021-10-24
14	2	23	teste	income	2021-10-24
18	2	23	teste	income	2021-10-24
19	2	39	Rellica	income	2021-10-25
20	2	3	erea	income	2021-10-25
21	6	998	Salario	income	2021-10-25
22	6	30	Hamburguer	income	2021-10-25
23	6	340	sushi	outcome	2021-10-25
24	6	45	gf	outcome	2021-10-25
25	6	150	bolsa para mamãe	outcome	2021-10-25
26	6	80	Mesada da Mamãe	income	2021-10-25
27	2	500	500	outcome	2021-10-25
28	2	113	113	income	2021-10-25
29	2	0	fwdsf	income	2021-10-25
30	2	0	fe	income	2021-10-25
31	2	3	34	income	2021-10-25
32	2	3	burguer	outcome	2021-10-25
33	2	28	fritas	outcome	2021-10-25
34	2	998	salario	income	2021-10-25
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, "userId", token) FROM stdin;
1	2	6ee099dd-4f30-4162-a9c4-d51e05fe12fd
2	2	5415e382-0880-42c0-b9ff-fa21e41a3661
3	2	696044c8-4a8d-4734-9b82-eb2678f723e9
4	2	3c4e73c6-748d-4651-9580-089346251751
5	2	23153617-43a1-4ad2-9991-351c11afa2ba
8	2	3290bdc4-f3b4-43cd-9a12-10346f873a8a
9	2	a0043133-560b-4270-8e2c-c74c92f3dad9
10	2	d252ab86-fa37-41a2-b7d8-6084b25916b7
11	2	c4bd9296-1d8b-4d61-b40b-a781cbf29113
12	2	8a6230e3-6aa2-4972-9858-dc3937a948e3
13	2	eb7af968-2fdd-4dff-bdcd-e3fc15bef821
14	2	57897c18-c489-4f94-a493-b96767a4bb5b
15	2	8571b9db-4bc9-42cd-9ef0-1b2957ed3add
16	2	d4150240-71bf-408f-bdc7-c4dea8bdf603
17	2	689da1fb-1096-4871-a29a-d4f9ca2f4186
18	2	cf6d879e-8586-44e2-af28-c1ce49dbf987
19	2	01190423-f315-4859-9ddb-5a251ff6b53a
20	2	c0bedc6a-bce9-47f6-ab02-5060fdab8044
21	2	eed86363-adc1-42cb-b237-bbaca1750297
22	2	dc707f53-07e2-47cf-8636-5f5c04d8c444
23	2	de419dd1-278b-4dcf-833d-cb7c552f5085
24	2	f9a21fcb-72eb-4c33-9267-7d45fe038554
25	2	267ae1d6-dd26-40c3-b6d1-7b36619f41fb
26	2	becab26c-f6b2-4fd3-9334-5ef2b0047e2f
27	2	cb04e41e-ab47-4c9d-9382-cfb81b6c1f7a
28	2	66cb6274-a0c4-41d8-800f-b0f96130d87f
29	2	e9b8ba87-9e8c-42fe-8482-f7f13f404a32
30	2	efe946eb-f289-42c8-a763-30f06ade6143
31	2	9fd86671-97bd-4dbb-b057-7f1fa294daca
32	2	b0bc1230-d17a-4526-a21f-9b233e6b49ee
33	2	283d7ef0-81c3-4430-984d-e6b4233efddd
34	2	34b10061-3a5e-4c59-9e1d-a9e4b220a464
35	2	f8ef6c5c-9294-4c03-a88c-e636aa11a5e4
36	2	a14c5430-3a8a-4558-96da-c4cc0ab7c5e1
38	2	66e851b5-3611-46eb-91b4-ec79f4cd8e4d
39	2	2c5602cc-7d02-48f4-adc0-a9546d6973e0
40	2	c7037c23-2665-477b-8439-fa7a4279fdc6
41	2	3d8ff3b4-1592-4256-a27e-d68ecab2c340
42	2	21328e99-b230-423e-a06f-a986302644fd
43	2	779eaa83-6502-4b64-853a-e790641fbdc7
44	2	6e0796eb-757f-422c-9ba4-5a9efc06b521
48	2	19de26b3-22bd-4c38-b9b2-e652697c6c50
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password) FROM stdin;
2	teste	teste@gmail.com	$2b$10$8w6kWH0okwSrVVPZbaoUJe2VFFK74zrZMNSbVZwvLMsm7ZKXCBcxq
5	teste	teste@gmail.com	$2b$10$SDJoa1W73gcYFAEh3tiCMub5nkJOvI90L3rjFDmPmvdIOsTB7w9Mi
6	Lucas	lucas@gmail.com	$2b$10$yDiXFz7QIM/q2cOgEnJX0OWstioZVr2tFjU99GBKrWz3I.yMSxXBu
\.


--
-- Name: balance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.balance_id_seq', 34, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sessions_id_seq', 48, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 6, true);


--
-- PostgreSQL database dump complete
--

