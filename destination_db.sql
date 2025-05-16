--
-- PostgreSQL database dump
--

-- Dumped from database version 16.9 (Debian 16.9-1.pgdg120+1)
-- Dumped by pg_dump version 16.8 (Ubuntu 16.8-0ubuntu0.24.04.1)

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

DROP TABLE public.famille_mtcs;
--
-- Name: centres; Type: TABLE; Schema: public; Owner: postgres
--
DROP TABLE IF EXISTS public.centres;
CREATE TABLE public.centres (
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    id integer NOT NULL,
    centre character varying
);


ALTER TABLE public.centres OWNER TO  postgres;

--
-- Name: centres_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.centres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.centres_id_seq OWNER TO  postgres;

--
-- Name: centres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.centres_id_seq OWNED BY public.centres.id;


--
-- Name: contacts; Type: TABLE; Schema: public; Owner: postgres
--
DROP TABLE IF EXISTS public.contacts; 
CREATE TABLE public.contacts (
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    id integer NOT NULL,
    name character varying,
    phone character varying,
    email character varying
);


ALTER TABLE public.contacts OWNER TO  postgres;

--
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contacts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contacts_id_seq OWNER TO  postgres;

--
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contacts_id_seq OWNED BY public.contacts.id;


--
-- Name: depots; Type: TABLE; Schema: public; Owner: postgres
--

DROP TABLE IF EXISTS public.depots;
CREATE TABLE public.depots (
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    id integer NOT NULL,
    depot character varying
);


ALTER TABLE public.depots OWNER TO  postgres;

--
-- Name: depots_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.depots_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.depots_id_seq OWNER TO  postgres;

--
-- Name: depots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.depots_id_seq OWNED BY public.depots.id;


--
-- Name: famille_mtcs; Type: TABLE; Schema: public; Owner: postgres
--

DROP TABLE IF EXISTS public.famille_mtcs;
CREATE TABLE public.famille_mtcs (
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    id integer NOT NULL,
    code integer NOT NULL,
    designation text,
    pix character varying,
    prix_ttc integer,
    reference character varying,
    oem character varying,
    keywords character varying,
    letype_id integer NOT NULL,
    marque_id integer NOT NULL,
    famille_id integer NOT NULL,
    depot_id integer NOT NULL,
    centre_id integer NOT NULL,
    marque_oem_id integer NOT NULL
);


ALTER TABLE public.famille_mtcs OWNER TO  postgres;

--
-- Name: famille_mtcs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.famille_mtcs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.famille_mtcs_id_seq OWNER TO  postgres;

--
-- Name: famille_mtcs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.famille_mtcs_id_seq OWNED BY public.famille_mtcs.id;


--
-- Name: familles; Type: TABLE; Schema: public; Owner: postgres
--

DROP TABLE IF EXISTS public.familles;
CREATE TABLE public.familles (
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    id integer NOT NULL,
    famille character varying
);


ALTER TABLE public.familles OWNER TO  postgres;

--
-- Name: familles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.familles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.familles_id_seq OWNER TO  postgres;

--
-- Name: familles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.familles_id_seq OWNED BY public.familles.id;


--
-- Name: letypes; Type: TABLE; Schema: public; Owner: postgres
--

DROP TABLE IF EXISTS public.letypes;
CREATE TABLE public.letypes (
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    id integer NOT NULL,
    letype character varying
);


ALTER TABLE public.letypes OWNER TO  postgres;

--
-- Name: letypes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.letypes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.letypes_id_seq OWNER TO  postgres;

--
-- Name: letypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.letypes_id_seq OWNED BY public.letypes.id;


--
-- Name: marque_oems; Type: TABLE; Schema: public; Owner: postgres
--

DROP TABLE IF EXISTS public.marque_oems;
CREATE TABLE public.marque_oems (
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    id integer NOT NULL,
    marque_oem character varying
);


ALTER TABLE public.marque_oems OWNER TO  postgres;

--
-- Name: marque_oems_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.marque_oems_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.marque_oems_id_seq OWNER TO  postgres;

--
-- Name: marque_oems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.marque_oems_id_seq OWNED BY public.marque_oems.id;


--
-- Name: marques; Type: TABLE; Schema: public; Owner: postgres
--

DROP TABLE IF EXISTS public.marques;
CREATE TABLE public.marques (
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    id integer NOT NULL,
    marque character varying
);


ALTER TABLE public.marques OWNER TO  postgres;

--
-- Name: marques_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.marques_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.marques_id_seq OWNER TO  postgres;

--
-- Name: marques_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.marques_id_seq OWNED BY public.marques.id;


--
-- Name: seaql_migrations; Type: TABLE; Schema: public; Owner: postgres
--

DROP TABLE IF EXISTS public.seaql_migrations;
CREATE TABLE public.seaql_migrations (
    version character varying NOT NULL,
    applied_at bigint NOT NULL
);


ALTER TABLE public.seaql_migrations OWNER TO  postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

DROP TABLE IF EXISTS public.users;
CREATE TABLE public.users (
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    id integer NOT NULL,
    pid uuid NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL,
    api_key character varying NOT NULL,
    name character varying NOT NULL,
    reset_token character varying,
    reset_sent_at timestamp with time zone,
    email_verification_token character varying,
    email_verification_sent_at timestamp with time zone,
    email_verified_at timestamp with time zone,
    magic_link_token character varying,
    magic_link_expiration timestamp with time zone
);


ALTER TABLE public.users OWNER TO  postgres;

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


ALTER SEQUENCE public.users_id_seq OWNER TO  postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: centres id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.centres ALTER COLUMN id SET DEFAULT nextval('public.centres_id_seq'::regclass);


--
-- Name: contacts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts ALTER COLUMN id SET DEFAULT nextval('public.contacts_id_seq'::regclass);


--
-- Name: depots id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.depots ALTER COLUMN id SET DEFAULT nextval('public.depots_id_seq'::regclass);


--
-- Name: famille_mtcs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.famille_mtcs ALTER COLUMN id SET DEFAULT nextval('public.famille_mtcs_id_seq'::regclass);


--
-- Name: familles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.familles ALTER COLUMN id SET DEFAULT nextval('public.familles_id_seq'::regclass);


--
-- Name: letypes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.letypes ALTER COLUMN id SET DEFAULT nextval('public.letypes_id_seq'::regclass);


--
-- Name: marque_oems id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marque_oems ALTER COLUMN id SET DEFAULT nextval('public.marque_oems_id_seq'::regclass);


--
-- Name: marques id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marques ALTER COLUMN id SET DEFAULT nextval('public.marques_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: centres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.centres (created_at, updated_at, id, centre) FROM stdin;
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	1	CPL
\.


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contacts (created_at, updated_at, id, name, phone, email) FROM stdin;
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	1	MTC	+01234567890	example@gmail.com
\.


--
-- Data for Name: depots; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.depots (created_at, updated_at, id, depot) FROM stdin;
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	1	CPLA
\.


--
-- Data for Name: famille_mtcs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.famille_mtcs (created_at, updated_at, id, code, designation, pix, prix_ttc, reference, oem, keywords, letype_id, marque_id, famille_id, depot_id, centre_id, marque_oem_id) FROM stdin;
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	1	37104	Coussin d'air suspension Ar complet 43 ( Sabo )	/static/mtc/mypix.png	567000	SA 520093C	Contitech 4390 NP 01 - Mercedes A 9517950500 - Mercedes A 9518950500 - Mercedes A 9423200121	\N	43	1	1	1	1	14
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	2	27779	Coussin d'air suspension Ar essieu relevable semi assemblé MB.Actros 1840  ( Sabo )	/static/mtc/mypix.png	501600	SA 520 126	Contitech 4838 N - Mercedes A 9463280011	\N	45	1	1	1	1	14
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	3	34233	Coussin d'air suspension Ar essieu relevable 42  ( Sabo )	/static/mtc/mypix.png	793200	SA 520221 C	Mercedes A 9463200321 - Sampa  SP 554737-K21 - Contitech  4737NP01	\N	42	1	1	1	1	14
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	4	34237	Coussin d'air suspension Ar complet MB.Axor MP 2 01 Trous avec écroue ( Sabo )	/static/mtc/mypix.png	859200	SA 520282C	Sampa SP 554187-K - Airtech 34187 21 K - Contitech 4187NP21 - Mercedes A 9423202621	\N	64	1	1	1	1	14
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	5	35711	Coussin d'air suspension Ar complet 01 Trous MB.Axor ( Sabo )	/static/mtc/mypix.png	760800	SA 520341C	Mercedes A 9423202221 - Sampa SP554183-K	\N	57	1	1	1	1	14
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	6	35712	Coussin d'air suspension Av complet MB.Actros MP 4 ( Sabo )	/static/mtc/mypix.png	943200	SA 520399CP	Mercedes A 9603200057 - Contitech 6122N - Sampa SP 556122-KP12	\N	51	1	1	1	1	14
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	7	35713	Coussin d'air suspension Ar MB.Actros MP 4 ( Sabo )	/static/mtc/mypix.png	1026000	SA 520484C	Mercedes A 9603203457  - Contitech 6131N - Sampa SP 556131-K 	\N	51	1	1	1	1	14
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	8	100481	Amortisseur suspension Av Nissan UD CWB 450	/static/mtc/mypix.png	409200			\N	69	5	1	1	1	4
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	9	17548	Coussinet bielle Std RVI M 230 Ti / S 180 / G 230 Ti ( Mahle ) Aelite 6-4240 CP	/static/mtc/mypix.png	93600	209 PL 20204 000	Perfect Circle VPR 92589 STD -  Renault 5001847497 - Renault 5000676471	\N	82	2	2	1	1	10
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	10	17504	Coussinet bielle Std RVI G 260 / G 230 Manager ( Mahle ) ø 72 ergot GM 	/static/mtc/mypix.png	52800	209 PL 20642 000	Vandervell VPR92593 STD - Renault 5001847466 - Renault 5001847973	\N	77	2	2	1	1	10
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	11	21317	Coussinet bielle Std GM RVI R 340-385 / Magnum AE 385 ( Mahle )	/static/mtc/mypix.png	128400	209PL 20644 000	Vandervell VPR 92594 STD - Renault 5001847956 - Renault  5000578592 - Federal Mogul FM 530305	\N	96	2	2	1	1	10
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	12	22583	Coussinet bielle Std OM 501 LA / MB.Actros 1835( Glyco )	/static/mtc/mypix.png	374400	71-3835 STD	Aelite AEB 110266 	\N	72	1	2	1	1	8
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	13	12942	Coussinet bielle Std OM 421 / 422 / 442 / MB.2544 ( Glyco )	/static/mtc/mypix.png	52800	71-3009		\N	71	1	2	1	1	8
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	14	17666	Coussinet bielle Std alésage 130.17 * 150.3 Volvo F 12 ( Mahle )	/static/mtc/mypix.png	414000	037 PS 10588 000	Vandervell VPR 91902 STD	\N	101	3	2	1	1	18
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	15	17622	Coussinet bielle Std OM 421 / 422 / 442 ( Mahle )	/static/mtc/mypix.png	81000	001 PL 10264 000	Vandervell VPR 92181 STD 	\N	70	1	2	1	1	10
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	16	38469	Pompe à eau simple trou MB.Axor 1828 ( Febi )	/static/mtc/mypix.png	687600	28329	Mercedes A 9042004301 - Sampa 0110.0012 - Sampa 202.499 - Merceds A 9042002601 - Mercedes A 9042004901 - Mercedes A 9042000401	\N	55	1	2	1	1	6
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	17	43721	Pompe à eau Volvo FH 16 500 Euro 5 ( Febi )	/static/mtc/mypix.png	30451	30451	Volvo 20744939 - Renault 7485000763 - Febi 30451 - KTK 16344	\N	102	3	2	1	1	6
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	18	22560	Pompe à eau RVI Premium 420 DCI ( Febi )	/static/mtc/mypix.png	1142400	31568	Sampa 078.121-01 - Renault 5001857427 - Mahle CP 481000S - Renault 5001858484 - Behr 8MP376 808-454  ­376808454  ­70821808	\N	91	2	2	1	1	6
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	19	37608	Pompe à eau DAF XF 105 480 / CF 85 Euro 4 ( Febi )	/static/mtc/mypix.png	1346400	31737	Sampa 051.264-01 - DAF 1828162	\N	20	6	2	1	1	6
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	20	37895	Pompe à eau MB.Atego Phase 2 ( Febi )	/static/mtc/mypix.png	1186800	31781	Sampa  204.377 - Mercedes A 9062006401 - Mercedes A 9062004801 - Mercedes A 9062004201 -Mercedes A 9062003201 - Mercedes A 9062006501	\N	56	1	2	1	1	6
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	21	11580	Pompe à eau DAF F 95  / F 95 XF Euro 2 / XF 95 430 Phase 1  ( Febi )	/static/mtc/mypix.png	1150800	33172	DAF 0 683225 - Sampa 051.260-01	\N	15	6	2	1	1	6
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	22	11906	Pompe à eau DAF CF 85 / XF 95 Euro 3 Phase 2 ( Febi )	/static/mtc/mypix.png	1212000	34116	DAF 0683579 - Sampa 051.261-01	\N	11	6	2	1	1	6
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	23	37047	Pompe à eau MB.917 ( Febi  )	/static/mtc/mypix.png	1117200	35444	Sampa 208.272  Mercedes A 3662006801 - Mercedes A3662006701	\N	39	1	2	1	1	6
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	24	38111	Pompe à eau DAF F 45 / 55 ( Febi )	/static/mtc/mypix.png	996000	38752	Sampa 051.262 - DAF CBU2396 - DAF CBU2148 - DAF 1399689	\N	13	6	2	1	1	6
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	25	36298	Pompe à eau MB.Axor 1844 Euro 5 ( Mahle )	/static/mtc/mypix.png	680400	70821844 / CP 517000S	Hella  8MP376809014 - Sampa 203.058-01 - Mercedes A 4572002301 - Mercedes A 4572000801 - Mercedes A 4572001901 replace Mercedes A 4572002901 	\N	66	1	2	1	1	1
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	26	36654	Pompe à eau avec ralentisseur MB.Axor Euro 4 ( Mahle )	/static/mtc/mypix.png	1088400	70821845 / CP518000S	DT 4.62589 - Behr 8MP376809024 - Sampa 203.007-01 - Mercedes A 4572002401	\N	63	1	2	1	1	1
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	27	38459	Pompe à eau RVI Midlium DXI 5 ( Mahle )	/static/mtc/mypix.png	1762800	70821865 / CP 538 000S	Hella 8MP 376 809-224  - Sampa 078.378 - Renault 7420834409	\N	84	2	2	1	1	1
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	28	28675	Radiateur d'eau RVI Premim 440 DXI ( 1110 * 750 * 80 ) Valeo	/static/mtc/mypix.png	3986400	733543	Renault 5010514415 - Renault 5010514416 - Renault 7420775792 - Renault 5001867210 - Renault 7484201975	\N	86	2	2	1	1	17
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	29	30941	Radiateur d'eau DAF XF 105 460 / CF 85 / XF 95 ( 1008 * 805 * 70 ) Valeo / PM 	/static/mtc/mypix.png	3927600	733544	Hella 8MK376733711 - DA 1674136 - DAF 1692332 - DAF 1861737 - DAF 1739550 - DAF 1856628	\N	19	6	2	1	1	17
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	30	11598	Radiateur d'eau MB.Axor 1840 ( 990 * 705 * 900 ) Valeo	/static/mtc/mypix.png	3267600	733545	Mercedes A 9405000703 - Behr 8MK376722021	\N	60	1	2	1	1	17
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	31	100581	Elément pompe gasoil Nissan UD CWB 450	/static/mtc/mypix.png	708000			\N	69	5	2	1	1	12
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	32	100582	Soupape de refoulement Nissan UD CWB 450	/static/mtc/mypix.png	303600			\N	69	5	2	1	1	12
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	33	100583	Pochette pompe injection Avant Nissan UD CWB 450	/static/mtc/mypix.png	100800			\N	69	5	2	1	1	7
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	34	100584	Pochette pompe régulateur Nissan UD CWB 450	/static/mtc/mypix.png	222000			\N	69	5	2	1	1	15
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	35	100042	Pochette moteur complet CAT Pelle 320 BL 	/static/mtc/mypix.png	0	3009500		\N	3	4	2	1	1	2
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	36	100043	Coussinet palier central Standart par piéce CAT Pelle 320 BL 	/static/mtc/mypix.png	0	2124893		\N	3	4	2	1	1	2
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	37	100044	Coussinet bielle latéral standart par piéce CAT Pelle 320 BL 	/static/mtc/mypix.png	0	1011530		\N	3	4	2	1	1	2
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	38	100045	Coussinet bielle latéral standart par piéce CAT Pelle 320 BL 	/static/mtc/mypix.png	0	1077708		\N	3	4	2	1	1	2
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	39	100046	Coussinet bielle Standart par piéce CAT Pelle 320 BL 	/static/mtc/mypix.png	0	2246638		\N	3	4	2	1	1	2
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	40	29602	Plaquette de frein ressorts demi complet MB.Axor Euro 3 ( Valeo )	/static/mtc/mypix.png	429600	882200	WVA 29 087 - Mercedes A 0024204920 - Febi 16665 - Febi 174312 - Mercedes A 0044202220 - DT 4.90930	\N	99	13	4	1	1	17
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	41	28678	Plaquette de frein ressorts complet MB.Actros 1857 / Man F 2000 / DAF CF 430 / SMB / SAF / TGA / ROR ( Provia )	/static/mtc/mypix.png	360000	29 108.30 / 340910702	DAF 1878030	\N	50	1	4	1	1	13
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	42	22678	Plaquette de frein ressorts complet SN7 Old MB.Actros 1857 / Man F 2000 / DAF CF 430 / SMB / SAF / TGA / ROR ( Textar ) T3050	/static/mtc/mypix.png	674400	2927801	WMA 29 108.30  - DAF 1797053 - Mercedes A 0064201020 - Kawe 88081 -  29202300 - Valeo 882200	\N	50	1	4	1	1	16
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	43	12927	Robinet à main RVI CBH 280 ( Wabco )	/static/mtc/mypix.png	1858800	723 539 000 8	Renault 5000439709 	\N	74	2	4	1	1	19
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	44	17458	Robinet à main MB.Actros 1843 ( Knoor  )	/static/mtc/mypix.png	1159200	K 038802N00	Mercedes  A 0034306661 - Knoor DF M21A replace Knoor DPM 21AK	\N	47	1	4	1	1	9
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	45	18561	Robinet à main MB.Actros 1848 ( Knoor )	/static/mtc/mypix.png	1131600	K 038803N00	Knoor DPM 22AK -Mercedes A 0034307381 - Knoor K038803N50	\N	49	1	4	1	1	9
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	46	27611	Robinet à main RVI Premium / Kerax 370 DCI ( Knoor )	/static/mtc/mypix.png	841200	DPM 28 A	Renault 5010422400 	\N	87	2	4	1	1	9
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	47	24140	Robinet à main RVI Kerax 350 ( knoor )	/static/mtc/mypix.png	1014000	K219307N00	Knoor DPM 29 A - Renault 5010422401 	\N	80	2	4	1	1	9
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	48	16122	Robinet à main RVI G 340 / R 385 ( Knoor )	/static/mtc/mypix.png	1496400	DPM 60AA	Wabco 9617231110 - Renault 5010422399 	\N	78	1	4	1	1	9
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	49	33478	Robinet à main MB.Axor 1843 Euro 4-5 / Actros 1857 ( Knoor )	/static/mtc/mypix.png	793200	K038808N50	Knoor DPM 66AK - Mercerdes A 0004200284 - Knoor K038808N50 - Knoor DPM 70A replace DPM 66AK	\N	62	1	4	1	1	9
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	50	37095	Robinet à main MB.Atego ( Knoor )	/static/mtc/mypix.png	766800	K038809N50	Knoor DPM 67 A - Knoor A 0004200184  - Knoor K038809N50	\N	52	1	4	1	1	9
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	51	15515	Filtre huile 43 ( Bosch )	/static/mtc/mypix.png	103200	1457429128	Mecafilter ELH 4736	\N	43	1	3	1	1	3
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	52	40511	Filtre huile Compresseur ( Bosch )	/static/mtc/mypix.png	25200	0 451 103 316	Knecht OC230 - Mannfilter W 811/80 	\N	9	1	3	1	1	3
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	53	29859	Filtre huile moteur ( ELH 4756 )	/static/mtc/mypix.png	189600	0 451 104 013		\N	17	1	3	1	1	3
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	54	10579	Filtre huile GM Pelle CAT 320 B / RVI Kerax / Magnum ( Bosch )	/static/mtc/mypix.png	76800	0 451 403 077 	Caterpillar 1R-0739 - 466 634- 3 - Renault 7421700201 - Baldwin B 76 - Mecafilter ELH 4707 - Renault 5000670700 - Fleetguard LF 3379 - Hifi FilterSO 667	\N	73	1	3	1	1	3
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	55	20950	Filtre huile	/static/mtc/mypix.png	79200	0 451 403 208		\N	14	1	3	1	1	3
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	56	34023	Filtre huile MB.Atego 1 ( 712-1533 ) Bosch	/static/mtc/mypix.png	91800	F026407040	Mercedes A 0001801609 - Knecht OX161D - Mannfilter HU 931/5X - KS 50013629 - Mecafilter ELH 4751 - Fleetguard LF 3827	\N	53	1	3	1	1	3
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	57	40486	Filtre huile MB.Axor 1840 / OM 457 LA ( Bosch )	/static/mtc/mypix.png	92400	F026407042	Mannfilter HU 12110X - Bosch 09864B7051 replace F026407042 - Mercedes A 0001802109 - Hengst E175HD129 - LF16046 - ELH4771 - SO7139 - CE1124E - 0021888001 - 0021887901 - CE1124E	\N	59	1	3	1	1	3
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	58	38269	Filtre hydraulique JCB / Caterpillar 3054 / Case ( Mannfilter )	/static/mtc/mypix.png	134400	HD 12114X	Hifi Filter HF 35005 - Caterpillar 200-3549 - Caterpillar 93-5369 	\N	100	11	3	1	1	11
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	59	43748	Filtre huile hydraulique Caterpillar M 318 D - CAT M 320 - Liehberr  ( Mannfilter )	/static/mtc/mypix.png	1680000	HD 14003	Caterpillar 137-7249- Hififilter SH52155 - Liebherr 11340502 - Caterpillar 361-7478	\N	6	1	3	1	1	11
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	60	33776	Filtre hydraulique ( 207-60-71182 )	/static/mtc/mypix.png	566400	HD 15001		\N	27	1	3	1	1	11
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	61	43151	Filtre huile hydraulique Caterpillar 311 D ( Mannfilter )	/static/mtc/mypix.png	792000	HD 15006	Hifi Filter SH 66186 - Caterpillar 179-9806 - Caterpillar 216-6676	\N	5	1	3	1	1	11
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	62	36087	Filtre huile hydraulique ( 903 247 )	/static/mtc/mypix.png	210000	HD 7002		\N	8	1	3	1	1	11
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	63	37488	Filtre huile convertisseur  hydraulique ( 07063-01142)	/static/mtc/mypix.png	214800	HD 15117		\N	28	1	3	1	1	11
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	64	31281	Filtre hydraulique ( Flueguard LF 519 )	/static/mtc/mypix.png	55200	HU 719/5X		\N	7	1	3	1	1	11
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	65	37230	Filtre huile hydraulique RVI Magnum 440-480 DXI 12 ( Mannfilter )	/static/mtc/mypix.png	58800	HU 721 Z KIT	Hengst E28HD174 - Hengst E28HD175 - Renault 7401521527 - Renault 7422051238 - Mannfilter HU 721Y - Mahle 70341771 - Knecht HX 77ECO 	\N	83	12	3	1	1	11
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	66	36088	Filtre huile Nissan Atleon 56.15 ( Mannfilter )	/static/mtc/mypix.png	50400	HU 825X	Fleetguard LF 16249	\N	68	5	3	1	1	11
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	67	36089	Filtre huile MB.Atego 1 ( 712-1533 ) Mannfilter	/static/mtc/mypix.png	49200	HU 931/5X	Mercedes A 0001801609 - Knecht OX161D - Bosch F026407040 - KS50013629 - Fleetguard LF 3827 - Mecafilter ELH 4751 - Bosch F026407040 - Hengst E60H01D28 -  Knecht OX161DECO - Sampiynon CE 1136E - Hifi Filter SO 7035	\N	54	1	3	1	1	11
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	68	35169	Filtre huile moteur GM Iveco Stralis Euro 5 ( Mannfilter )	/static/mtc/mypix.png	310800	HU 11002x	Iveco 5801592277 - Flueguard LF17546 	\N	24	7	3	1	1	11
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	97	43246	Synchro gamme rapide 73 dents Bv 155-221 ou porte bonhomme ( Euroricambi )	/static/mtc/mypix.png	436800	60530730	Cei 155204 - Mercedes A 3892624935 - Mercedes A 3892622035	\N	35	1	5	1	1	5
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	69	32376	Filtre huile MB.Actros 1842 Euro 6 ( Mannfilter ) Jeu de 02 pieces /	/static/mtc/mypix.png	152400	HU 12001Z	Meredes A 4721841225 - Mercedes A 4721800309 - Mercedes A 4721800409 - Mercedes A 4731800009 - Hengst E50H07D129 - Mercedes A 4721841225 - Mercedes A 4721800109 - Mercedes A 4721843025 - Mercedes A 4721800309 - Mercedes A 4731800209 - Mercedes A 4731800309 - Mercedes A 4731800709 - Mercedes A 4721843225 - Mercedes A 4721841125 	\N	46	1	3	1	1	11
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	70	33073	Filtre huile ( 51.05504.0118 / 51.05501.0011 )	/static/mtc/mypix.png	187200	HU 12003X		\N	29	1	3	1	1	11
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	71	35171	Filtre huile moteur MB.Actros MP 2 OM 470 1833-36-40-1843 année 2011 ( Mannfilter )	/static/mtc/mypix.png	195600	HU 12006Z	Mercedes A 4701840625 - Mercedes A 4701800009 - Mercedes A 4701800109 - Knecht OX423/9D - Hengst E824HD 264 - Fleetguard LF17548 -  Mercedes A 4701840725 - Mercedes A 4701800309 - Mercedes A 4701840825	\N	1	1	3	1	1	11
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	72	36077	Filtre huile ( 2 510 200 / WL10179  / S 5102 PE / 5801415504 )	/static/mtc/mypix.png	324000	HU 12008X		\N	25	1	3	1	1	11
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	73	28946	Filtre huile moteur Euro 4 et 5 DAF CF 85 360-510 / XF 105 410-560 ( Mannfilter ) 110.5 * 56.5 * 220 	/static/mtc/mypix.png	128400	HU 12103X	Fleetguard LF 16233 - Renault 7424993649 - Hengst E89HD97 - DAF 1629393 - DAF 1643070 - DAF 1948921 - DAF 1532479	\N	12	6	3	1	1	11
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	74	30091	Filtre huile MB.Axor 1840 / OM 457 LA ( Mannfilter )	/static/mtc/mypix.png	76800	HU 12110X	Febi 47863 - Bosch 09864B7051 replace F026407042 - Mercedes A 0001802109 - Mercedes A 0001802909 - Hengst E175HD129 - Fleetguard LF16046 - Mecafilter ELH4771 - SO7139 - Mercedes A 0021888001 - Mercedes A 0021887901 - Sampiyon CE1124E	\N	59	1	3	1	1	11
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	75	30111	Filtre huile moteur MB.Actros 1831 à 1943 / MB.Actros II ( Mannfilter )	/static/mtc/mypix.png	88800	HU 12140X	Knecht OX 168D - Bosch 09864B7010 replace Bosch 1457429128 - Mecafilter ELH 4736 - Fleetguard LF 3829 - Bosch 1457429128 -Sampiyon CE1130E - Mercedes A 4571800009 - Mercedes A 4571840025	\N	41	1	3	1	1	11
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	76	35165	Filtre gasoil Komatsu ( Mannfilter )	/static/mtc/mypix.png	163200	WK 940/36		\N	1	1	3	1	1	11
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	77	33746	Filtre gasoil Hino / Grader ( Mannfilter )	/static/mtc/mypix.png	58800	WK 950/3	Fleuguard FF 185 - Mecafilter ELG 5508	\N	21	9	3	1	1	11
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	78	32372	Filtre gasoil Komatsu PC 200-6 ( Mannfilter  )	/static/mtc/mypix.png	291600	WK 950/16X	Fleetguard FF 194 - Fleetguard FS 1212 - Hifi Filter SN 1212 - Mecafilter ELG 5508 - Hengst H 169WK	\N	26	8	3	1	1	11
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	79	36735	Filtre gasoil décanteur Iveco Stralis 480 moteur cursor 13 ( Mannfilter )	/static/mtc/mypix.png	80400	WK 950/19	Iveco 2992662 - Fleetguard FS 19821 - Mecafilter ELG 5535 - Hengst H215WK	\N	23	7	3	1	1	11
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	80	31285	Filtre gasoil New Holland ( Mannfilter )	/static/mtc/mypix.png	73200	WK 950/21	Iveco 2992241 - Iveco 500039730 - Komatsu 6754-79-6130 - komatsu 6754-79-6140 - Komatsu 6754-71-6140 - Fleetguard  FF5485 - Hengst  H18WK05 replace Hengst H191WK - Ks KC188 - DAF 1399760 - FF5485 - Mecafilter  ELG5537	\N	97	7	3	1	1	11
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	81	28962	Filtre gasoil GM XF 95 Euro 2 ( Mannfilter )	/static/mtc/mypix.png	50400	WK 962/4	Bosch 1457429676 - Knecht KC7 - Renault 5010477856 - Mecafilter ELG 5502 - Baldwin BF 980 - Fleetguard FF 4070 - Sampiynon CS1453-M - Hengst H 18WK04 - Knecht KC 7	\N	76	6	3	1	1	11
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	82	33068	Filtre gasoil Sinotruck ( Mannfilter )	/static/mtc/mypix.png	50400	WK 962/7	Mecafilter ELG 5522 - Wiwfilter WF 10333 - Howo VG1560080011 - Volvo 8 193 841 - Howo VG1560080012 	\N	98	10	3	1	1	11
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	83	30896	Filtre gasoil CAT Trax 962 ( Mannfilter )	/static/mtc/mypix.png	105600	WK 970/2	Caterpillar 1R-0753  -  Fleetguard FF 5322 -  1R-0753 / FF 5322-5323 / FF 5818 / BF 7631 / FF 5322	\N	4	1	3	1	1	11
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	84	33764	Filtre gasoil DAF LF 45 220 ( Mannfilter )	/static/mtc/mypix.png	164400	WK 965X	Mecafilter ELG 5563 - Fleetguard FF 5038 - Donfeng 1125N-010	\N	18	6	3	1	1	11
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	85	43760	Filtre gasoil CAT ( Mannfilter )	/static/mtc/mypix.png	0	WK 980/1	Caterpillar 1R-0749 - Hifi Filter SN 55418 - Fleetguard FF 5319 - Caterpillar 1R-1712 - Caterpillar 3I-0752 - Caterpillar 3I-1333	\N	2	4	3	1	1	11
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	86	33065	Filtre gasoil RVI Midlium NM ( Mannfilter )	/static/mtc/mypix.png	158400	WK 1040/1X	Renault  7421380403 - Rennault 7420591526 - Renault  7420851191 - Fleetguard FS19895  - Fleetguard FS19810 - Knecht KC 384D - Hengst H 7062WK30 - Mecafilter ELG 5559	\N	85	2	3	1	1	11
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	87	28967	Filtre gasoil décanteur DAF XF 95-105 / Scania P 260-300 ( Mannfilter )	/static/mtc/mypix.png	165600	WK 1060/3X	Knecht  KC 249D - Fleetguard FS 19532 - PS 8486 - Mannfilter WK 1060/3X - Mecafilter ELG 5538 - Hifi Filter SN909030	\N	10	6	3	1	1	11
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	88	100477	Globe de phare gauche Nissan UD CWB 450	/static/mtc/mypix.png	453600			\N	69	5	6	1	1	4
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	89	100478	Globe de phare droite Nissan UD CWB 450	/static/mtc/mypix.png	453600			\N	69	5	6	1	1	4
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	90	43954	Synchro 2-3 éme RVI Premium 250 Bv Eaton 8209 ( Euroricambi )	/static/mtc/mypix.png	216000	35510035	Cei 109373 - Eaton 8871639 - Eaton 8777321 - Eaton 8871639 - Renault 5001836001 - Mercedes A 0002623337 - Man 81.032420.0221	\N	90	2	5	1	1	5
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	91	43953	Synchro 5 éme porte bonhomme RVI Premium 210 Bv Eaton 4106 ( Euroricambi )	/static/mtc/mypix.png	369600	35510201	Cei 157994 - Eaton 8875127 - Renault 5001821505 - Man 81.32403.0099 - Volvo 3126204 - Iveco 42538315	\N	89	2	5	1	1	5
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	92	43934	Synchro gamme rapide 86 dents Bv Eaton 6309 ( Euroricambi )	/static/mtc/mypix.png	927600	35510287	Cei 123275 - Renault 5001862928 - DAF 1456371 - Eaton 8880231 - Iveco 42558267 - Man 81.32319.0004	\N	79	2	5	1	1	5
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	93	43950	Synchro G3 65 MB.1617 ( Euroricambi )	/static/mtc/mypix.png	403200	60530293	Cei 109125 - Mercedes A 3852620434	\N	30	1	5	1	1	5
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	94	43932	Synchro lente B 90 MB.1922 ( Euroricambi )	/static/mtc/mypix.png	583200	60530303	Cei 198392 - Mercedes A 3852603245 - Mercedes A 3852601345	\N	32	1	5	1	1	5
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	95	43946	Synchro Bv G 4 65 07 speeds MB.1722  ( Euroricambi )	/static/mtc/mypix.png	540000	60530505	Cei 109346 - Mercedes A 3872621034 - Mercedes A 3872624934	\N	31	1	5	1	1	5
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	96	43949	Synchro 1 ére / 2 ème B 155 - 180 - 200 ( Euroricambi ) GM	/static/mtc/mypix.png	548400	60530521	Cei 109187 - Mercedes A 3892620034 - Mercedes A 9452620434 - ZF 0073301200	\N	36	1	5	1	1	5
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	98	43939	Synchro gamme rapide Bv 155 - 180 MB.1948 ( Euroricambi )	/static/mtc/mypix.png	841200	60530680	Cei 109188 - Mercedes A 3892624034	\N	38	1	5	1	1	5
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	99	44388	Synchro gamme rapide Bv 125 - 135 MB.1929 ( Euroricambi )	/static/mtc/mypix.png	1044000	60530910	Cei 109338 - Mercedes A 3892622334 - Mercedes A 3892621934 - Mercedes A 3892620934 - Iveco 60002655	\N	34	1	5	1	1	5
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	100	44389	Synchro gamme rapide Bv 210 MB.Axor ( Euroricambi )	/static/mtc/mypix.png	819600	60531052	Cei 109337 - Mercedes A 3892629234 - Mercedes A 9452621234 - ZF Transmissions 0073301205 - Iveco 60003036	\N	40	1	5	1	1	5
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	101	44391	Synchro gamme rapide ou réducteur Bv 210 ( Euroricambi )	/static/mtc/mypix.png	1594800	60531091	Cei 123230 - Mercedes A 9452601461 - Mercedes A 9452620108 - Mercedes A 3892620808	\N	44	1	5	1	1	5
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	102	43602	Synchro gamme rapide 59 dents avec ralentisseur Bv G 221 ( Euroricambi )	/static/mtc/mypix.png	1634400	60531709	Cei 109341 - Euroricambi 60531709 - Mercedes A 9452640420 - Mercedes A 9452640220 - ZF 0073301541	\N	67	1	5	1	1	5
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	103	43262	Synchro gamme rapide MB.Axor Bv G 221 ( Euroricambi )	/static/mtc/mypix.png	763200	60531736	Cei 109408 - Euroricambi 60531736 - Mercedes A 9452623834	\N	57	1	5	1	1	5
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	104	43935	Synchro gamme rapide ou réducteur Bv G 221 MB.Axor ( Euroricambi )	/static/mtc/mypix.png	967200	60531748	Mercedes A 9452620208 - Cei 123232 - ZF 0073301172	\N	57	1	5	1	1	5
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	105	43244	Synchro gamme rapide ou réducteur Bv G 221 MB.Axor ( Euroricambi )	/static/mtc/mypix.png	876000	60531886	Cei 123313 - Mercedes A 9452620808  - Mercedes A 9452621208	\N	65	1	5	1	1	5
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	106	43948	Synchro 2 éme Bv 210 MB.Axor ( Euroricambi )	/static/mtc/mypix.png	571200	60531889	Cei 109415 - Mercedes A 9452625534 - ZF 0073301183	\N	61	1	5	1	1	5
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	107	43947	Synchro 3 ème / 4 ème BV 211 MB.Axor 1843 ( Euroricambi ) New Model	/static/mtc/mypix.png	590400	60531895	Cei 109742 - Mercedes A 9452623634 - ZF 1290304478 - Mercedes A 9452627834 - Mercedes 9452627734	\N	61	1	5	1	1	5
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	108	43936	Synchro gamme rapide 63 dents ralentisseur Bv G 221 ( Euroricambi )	/static/mtc/mypix.png	2472000	60531923	Cei 109793 - Mercedes A 9452640520	\N	57	1	5	1	1	5
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	109	43601	Synchro gamme rapide 59 dents ralentisseur Bv G 240-11 MB.Actros 1846 MP 2 ( Euroricambi )	/static/mtc/mypix.png	1570800	60532029	Cei 196370 - Mercedes A 9302640420	\N	48	1	5	1	1	5
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	110	43945	Synchro 3éme G 131-9 / G 141-9 MB.Axor / Atego  ( Euroricambi )	/static/mtc/mypix.png	506400	60532034	Cei 109423 - Mercedes A 9452625734 - Mercedes A 4002620934	\N	58	1	5	1	1	5
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	111	43933	Synchro gamme rapide Bv G 221 MB.Axor ( Euroricambi )	/static/mtc/mypix.png	1122000	60532319	Cei 150144 - Mercedes A 3892621425 - Mercedes A 9302620125 - ZF 0073301171	\N	57	1	5	1	1	5
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	112	43600	Synchro 4 éme Bv 240 MB.Actros ( Euroricambi )	/static/mtc/mypix.png	502800	60532444	Cei 109414 -Mercedes A 9452628234 - Mercedes A 9452625434 - ZF 0073301188	\N	40	1	5	1	1	5
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	113	43943	Synchro arbre secondaire 28 dents 3 ème / 4 ème B 9 - B 18 ( Euroricambi ) PM	/static/mtc/mypix.png	1804800	70530141	Renault  5000673430 - Renault 5000673109 - Cei 196220	\N	75	2	5	1	1	5
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	114	43944	Synchro arbre secondaire 1 ére / 2 ème B 9 - B 18 ( Euroricambi )	/static/mtc/mypix.png	1767600	70530142	Cei 196219 - Renault 5000673429 - Renault 5000673108	\N	75	2	5	1	1	5
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	115	43942	Synchro delta 2 B 9 RVI CBH 320 ( Euroricambi )	/static/mtc/mypix.png	1162800	70530254	Cei 196226 - Renault 5000673397 - Renault 5000690174	\N	75	2	5	1	1	5
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	116	43599	Synchro gamme rapide Bv Auto AT 2412C RVI Premium DXI 460 ( Euroricambi )	/static/mtc/mypix.png	339300	88530660	Cei 109833 - Renault 7420760515 - Volvo 20760515 - Volvo 21994372 - ZF 0073301021 	\N	95	2	5	1	1	5
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	117	43938	Synchro arbre de sortie Bv 2412B RVI Premium 440 DXI ( Euroricambi )	/static/mtc/mypix.png	1154400	88530721	Cei 109251 - Renault 7421235526 - Volvo 21235526	\N	93	2	5	1	1	5
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	118	43598	Synchro gamme rapide Bv Volvo AT 2412C W/O intarder (  Euroricambi )	/static/mtc/mypix.png	2446800	88530732	Cei 109764 - Volvo 21009061 - Volvo 21751233 - Volvo 21480996 - Renault 7421751233 - Renault 7421480996	\N	94	2	5	1	1	5
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	119	43597	Synchro 1 ére - 2 éme / 3 éme / 4 éme 16 S 112-130-160-190 MB. 1928 PM ( Euroricambi )	/static/mtc/mypix.png	252000	95530644	Cei 109072 - Mercedes A 0002621945 - Mercedes A 0002621940 - Mercedes A 0002621340 - ZF1295304294 - ZF 1297304041 - ZF 1295304278 -  Renault 5000289689 - Renault  5000289718 - Man 81.32425.0071 - Volvo 1527438 - Volvo 1526695 - DAF 692073 - DAF 692086 - Iveco 7982177 - Iveco 7982260 - Iveco 42492273 - Iveco 42492293	\N	33	1	5	1	1	5
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	120	43951	Synchro Bv 112 MB.1928 ( Euroricambi )	/static/mtc/mypix.png	277200	95530645	Cei 109083 - ZF 1295304165 - Mercedes A 0002621440 - A 0002621440	\N	33	1	5	1	1	5
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	121	43596	Synchro lente DAF F 95 Bv 130 - 160 - 190 ( Euroricambi )	/static/mtc/mypix.png	633600	95530682	Cei 198358 - Mercedes A 0002631720 - Mercedes A 0002630920 - ZF 0769186283 -ZF 1295233029 - ZF 1296333007 - ZF 1296233006 - ZF 1296233005 - Volvo 1527360 - Volvo 1526850 - DAF 689812 - DAF 0689812 - Iveco 7982213 - Iveco 42492418 - Man 81.32425.0073 - 81.32425.0064 - Renault 5000289822	\N	14	14	5	1	1	5
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	122	43941	Synchro gamme rapide ou réducteur 16 S 181 / 221 RVI Premium / Man TGA ( Euroricambi )	/static/mtc/mypix.png	376800	95531282	Cei 109174 - Renault 5001848259 - ZF 1296333050 - ZF 1316333009 - Iveco 42535041 - DAF 1377131 - Man 81.32425.0141 - 81.32425.0134	\N	88	12	5	1	1	5
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	123	44392	Synchro gamme rapide Bv 191 DAF F 95 XF / RVI Premium 400 ( Euroricambi )	/static/mtc/mypix.png	684000	95531284	Cei 109175 - ZF  1316233015 - ZF 1315233025 - Renault 7485115539 - Astra 131804 - Astra AST131804 - DAF 1330419 - Iveco 42535042 - Iveco 503557218 - Renault 5001843132 - Man 81.32425.0132 - Man 81.32425.0133	\N	16	14	5	1	1	5
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	124	43239	Synchro gamme rapide ou réducteur 16 S 181 / 221 RVI Premium 420 DCI / Man  / DAF XF ( Euroricambi )	/static/mtc/mypix.png	882000	95534637	Cei 150136 - ZF  1316332103 - Renault 5001851633 -Renault 5001851633 - Man  81.32403.0108	\N	92	12	5	1	1	5
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	125	43952	Synchro RVI Kerax DXI 460 ( Euroricambi )	/static/mtc/mypix.png	369600	95534936	Cei 109208 - ZF 1356304025 - Renault 7421388226 - DAF 1833892 - Iveco 42562890 - Man 81.32425.0186 - ZF 1316304218	\N	81	2	5	1	1	5
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	126	44390	Synchro 3 éme 16 S 150 Iveco / DAF / Man ( Euroricambi )	/static/mtc/mypix.png	342000	95534979	Cei 109839 - ZF 1316304190 - DAF 1831990 - Man 81.32425.0184  - ZF 1316304201 - Renault 7421388226 - Iveco 500054122 - Iveco 42562882 - Hino 33389-EV010 - DAF 1832005 - Iveco 95005788	\N	22	15	5	1	1	5
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	127	43595	Synchro lente ZF 16 S 151-181-221 MB.1935 / DAF XF 95 ( Euroricambi )	/static/mtc/mypix.png	714000	95570582	Cei 198789 - Cei 298017 - Euroricambi 95570582 -Euroricambi 95530685 - ZF 1296333024  - DAF 1307482 - Iveco 93191215 - ZF 1315233006 - Renault 5001843126 - Man 81.32425.0121	\N	37	16	5	1	1	5
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	128	100479	Cylindre émetteur embrayage Nissan UD CWB 450	/static/mtc/mypix.png	427200			\N	69	5	5	1	1	4
\.


--
-- Data for Name: familles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.familles (created_at, updated_at, id, famille) FROM stdin;
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	1	Pont
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	2	Moteur
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	3	Filtration
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	4	Freinage
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	5	Boîte de vitesse
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	6	Eclairage
\.


--
-- Data for Name: letypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.letypes (created_at, updated_at, id, letype) FROM stdin;
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	1	Antan / MB.Actros MP 2 OM 470 1833-36-40-1843 année 2011 / 2033-36-40-43 / MB.Actros MP 4 STTA / Arocs / Antos
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	2	CAT
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	3	CAT Pelle 320 BL
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	4	CAT Trax 962 / Grader 120H-135H / CAT D6M moteur 3116 / CAT 320 / Komatsu
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	5	Caterpillar M 300
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	6	Caterpillar M 318 D - CAT M 320 - Liehberr / Terex 3800
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	7	Chariot Hyster H 300B / Porsche Cayen 918
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	8	Compacteur Dynapac
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	9	Compresseur
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	10	DAF CF 65-75-85 220 / XF 95-105 / Scania P 260-300 / Volvo Chargeuse L 150E
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	11	DAF CF 85 / XF 95 Euro 3 Phase 2
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	12	DAF CF 85 360-510 / XF 105 410-560 / XF 106 510 Euro 6
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	13	DAF F 45 / 55
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	14	DAF F 95
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	15	DAF F 95  / F 95 XF Euro 2 / XF 95 430 Phase 1 / XF 95 Euro 3 Phase 1
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	16	DAF F 95 XF / RVI Premium 400
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	17	DAF F 95 XF 380-530 ( Janvier 97 à 2002 ) / CF 85
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	18	DAF LF 45 220 - Donfeng
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	19	DAF XF 105 460 / CF 85 / XF 95
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	20	DAF XF 105 480 / CF 85 Euro 4
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	21	Hino / Grader
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	22	Iveco / DAF / Man
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	23	Iveco Stralis 480 moteur cursor 13 / Astra / Iveco Stralis 430 Double essieu
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	24	Iveco Stralis Euro 5
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	25	Iveco Stralis Euro 6 / HONGYAN GENLYON SFH moteur F2CE/C9 286-394 / HONGYAN GENLYON SFH moteur C13 / Cursor13 HP 346-556
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	26	Komatsu PC 200-6 / Groupe electrogéne TEKSAN 350 KVA / T King
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	27	Komatsu PC 210 LC-8
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	28	Komatsu WA 500-1
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	29	Man TGA 18.520-540-640 D38 moteur D 3876
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	30	MB.1617
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	31	MB.1722
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	32	MB.1922
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	33	MB.1928
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	34	MB.1929
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	35	MB.1929 / MB.Axor / Actros 1840
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	36	MB.1935
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	37	MB.1935 / DAF XF 95
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	38	MB.1948
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	39	MB.917
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	40	MB.Actros
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	41	MB.Actros 1831 à 1943 / MB.Actros II
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	42	MB.Actros 1831 double essieu
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	43	MB.Actros 1835
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	44	MB.Actros 1835-1840 / MB.Axor
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	45	MB.Actros 1840 / Axor Plateau 2635
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	46	MB.Actros 1842 Euro 6 / Actros 1845 MP 4 OM 471
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	47	MB.Actros 1843
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	48	MB.Actros 1846 MP 2
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	49	MB.Actros 1848
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	50	MB.Actros 1857 / Man F 2000 / DAF CF 430 / SMB / SAF / TGA / ROR
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	51	MB.Actros MP 4
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	52	MB.Atego
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	53	MB.Atego 1 ( 712-1533 )
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	54	MB.Atego 1 ( 712-1533 ) / MB.Vario 816
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	55	MB.Atego 712-1533 OM 904 LA année 98  / MB.Axor 1828
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	56	MB.Atego Phase 2
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	57	MB.Axor
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	58	MB.Axor / Atego
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	59	MB.Axor 1840 / OM 457 LA
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	60	MB.Axor 1840 / Scania P 4
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	61	MB.Axor 1843
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	62	MB.Axor 1843 Euro 4-5 / Actros 1857
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	63	MB.Axor Euro 4
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	64	MB.Axor MP 2
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	65	MB.Axor OM 457 / MB.Actros
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	66	MB.Axor Phase 2 / MB.Axor 1844 Euro 5
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	67	Mercedes
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	68	Nissan Atleon 56.15 moteur ZD 30
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	69	Nissan UD CWB 450
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	70	OM 421 / 422 / 442
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	71	OM 421 / 422 / 442 / MB.2544
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	72	OM 501 LA / MB.Actros 1835
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	73	Pelle CAT 320 B / RVI Kerax / Magnum / M 230 Ti / Volvo FL6 / Premium 370 DCI
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	74	RVI CBH 280
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	75	RVI CBH 320
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	76	RVI G / DAF F 95-85 / XF 95 Euro 2
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	77	RVI G 260 / G 230 Manager
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	78	RVI G 340 / R 385
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	79	RVI Kerax 270
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	80	RVI Kerax 350
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	81	RVI Kerax DXI 460
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	82	RVI M 230 Ti / S 180 / G 230 Ti / Midlium 180 DCI / Premium 270
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	83	RVI Magnum 440-480 DXI 12 / Kerax 370 DXI-450 DXI / Volvo FH 12 380-500 / FH 16 540-660
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	84	RVI Midlium DXI 5 / Premium DXI 7
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	85	RVI Midlium NM
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	86	RVI Premim 440 DXI
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	87	RVI Premium / Kerax 370 DCI
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	88	RVI Premium / Man TGA
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	89	RVI Premium 210
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	90	RVI Premium 250
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	91	RVI Premium 420 DCI
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	92	RVI Premium 420 DCI / Man  / DAF XF
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	93	RVI Premium 440 DXI
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	94	RVI Premium DXI
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	95	RVI Premium DXI 460
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	96	RVI R 340-385 / Magnum AE 385
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	97	Sakman F 3000 / JAC Mac / DAF F 1700 / DAF CF 65 180-290 / LF 45 130-300 / DAF LF 55 160-300 / Iveco Eurocargo / Iveco Stralis Gico / Iveco Cargo 1-2-3 / DAF CF 65 / LF 45-55 / CAT Bobcat E 60-80 / Komatsu PC 160-8 / PC 190-8 / PC 210-240 LC8K
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	98	SINOTRUCK /CNHTC HOWO moteur WD615 HP 217-405
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	99	STRALIS, TRAKKER, EUROCARGO / TGA, TGS, TGX / ACTROS (MP4), ATEGO, AXOR / P,G,R,T , SERIES-4
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	100	Tadano Salone / JCB / Caterpillar 3054 / Case / Pelle 307
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	101	Volvo F 12
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	102	Volvo FH 13 440 moteur D13A 440 / Magnum DXI 13 / Kerax DXI 11-13 / Volvo FH 16 / FM 9 / Premium DXI / Volvo FH 16 500 Euro 5
\.


--
-- Data for Name: marque_oems; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.marque_oems (created_at, updated_at, id, marque_oem) FROM stdin;
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	1	Behr / Mahle
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	2	Blumaq
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	3	Bosch
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	4	Chine
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	5	Euroricambi
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	6	Febi
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	7	Flag
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	8	Glyco
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	9	Knoor
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	10	Mahle
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	11	Mannfilter
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	12	Origine
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	13	Provia
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	14	Sabo
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	15	Spaco
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	16	Textar
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	17	Valeo
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	18	Vandervell
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	19	Wabco
\.


--
-- Data for Name: marques; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.marques (created_at, updated_at, id, marque) FROM stdin;
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	1	Mercedes
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	2	Renault
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	3	Volvo
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	4	Caterpillar
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	5	Nissan
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	6	DAF
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	7	Iveco
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	8	Komatsu
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	9	Hino
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	10	Howo
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	11	Caterpillar - JCB - Case
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	12	Renault - Volvo
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	13	Iveco - Man - Mercedes - SMB
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	14	DAF - Iveco - Renault - Man
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	15	Iveco - DAF - Renault
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	16	DAF - Mercedes
\.


--
-- Data for Name: seaql_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.seaql_migrations (version, applied_at) FROM stdin;
m20220101_000001_users	1747274857
m20250510_115228_letypes	1747274857
m20250510_120310_marques	1747274857
m20250510_121530_familles	1747274857
m20250510_122457_depots	1747274857
m20250510_123759_centres	1747274857
m20250510_125134_marque_oems	1747274857
m20250510_130923_contacts	1747274857
m20250510_132138_famille_mtcs	1747274857
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (created_at, updated_at, id, pid, email, password, api_key, name, reset_token, reset_sent_at, email_verification_token, email_verification_sent_at, email_verified_at, magic_link_token, magic_link_expiration) FROM stdin;
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	1	11111111-1111-1111-1111-111111111111	user1@example.com	$argon2id$v=19$m=19456,t=2,p=1$ETQBx4rTgNAZhSaeYZKOZg$eYTdH26CRT6nUJtacLDEboP0li6xUwUF/q5nSlQ8uuc	lo-95ec80d7-cb60-4b70-9b4b-9ef74cb88758	user1	\N	\N	\N	\N	\N	\N	\N
2023-11-12 12:34:56.789+00	2023-11-12 12:34:56.789+00	2	22222222-2222-2222-2222-222222222222	user2@example.com	$argon2id$v=19$m=19456,t=2,p=1$ETQBx4rTgNAZhSaeYZKOZg$eYTdH26CRT6nUJtacLDEboP0li6xUwUF/q5nSlQ8uuc	lo-153561ca-fa84-4e1b-813a-c62526d0a77e	user2	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Name: centres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.centres_id_seq', 2, false);


--
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contacts_id_seq', 2, false);


--
-- Name: depots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.depots_id_seq', 2, false);


--
-- Name: famille_mtcs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.famille_mtcs_id_seq', 129, false);


--
-- Name: familles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.familles_id_seq', 7, false);


--
-- Name: letypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.letypes_id_seq', 103, false);


--
-- Name: marque_oems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.marque_oems_id_seq', 20, false);


--
-- Name: marques_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.marques_id_seq', 17, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 3, false);


--
-- Name: centres centres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.centres
    ADD CONSTRAINT centres_pkey PRIMARY KEY (id);


--
-- Name: contacts contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- Name: depots depots_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.depots
    ADD CONSTRAINT depots_pkey PRIMARY KEY (id);


--
-- Name: famille_mtcs famille_mtcs_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.famille_mtcs
    ADD CONSTRAINT famille_mtcs_code_key UNIQUE (code);


--
-- Name: famille_mtcs famille_mtcs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.famille_mtcs
    ADD CONSTRAINT famille_mtcs_pkey PRIMARY KEY (id);


--
-- Name: familles familles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.familles
    ADD CONSTRAINT familles_pkey PRIMARY KEY (id);


--
-- Name: letypes letypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.letypes
    ADD CONSTRAINT letypes_pkey PRIMARY KEY (id);


--
-- Name: marque_oems marque_oems_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marque_oems
    ADD CONSTRAINT marque_oems_pkey PRIMARY KEY (id);


--
-- Name: marques marques_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marques
    ADD CONSTRAINT marques_pkey PRIMARY KEY (id);


--
-- Name: seaql_migrations seaql_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seaql_migrations
    ADD CONSTRAINT seaql_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_api_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_api_key_key UNIQUE (api_key);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: famille_mtcs fk-centres-centre_id-to-famille_mtcs; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.famille_mtcs
    ADD CONSTRAINT "fk-centres-centre_id-to-famille_mtcs" FOREIGN KEY (centre_id) REFERENCES public.centres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: famille_mtcs fk-depots-depot_id-to-famille_mtcs; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.famille_mtcs
    ADD CONSTRAINT "fk-depots-depot_id-to-famille_mtcs" FOREIGN KEY (depot_id) REFERENCES public.depots(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: famille_mtcs fk-familles-famille_id-to-famille_mtcs; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.famille_mtcs
    ADD CONSTRAINT "fk-familles-famille_id-to-famille_mtcs" FOREIGN KEY (famille_id) REFERENCES public.familles(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: famille_mtcs fk-letypes-letype_id-to-famille_mtcs; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.famille_mtcs
    ADD CONSTRAINT "fk-letypes-letype_id-to-famille_mtcs" FOREIGN KEY (letype_id) REFERENCES public.letypes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: famille_mtcs fk-marque_oems-marque_oem_id-to-famille_mtcs; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.famille_mtcs
    ADD CONSTRAINT "fk-marque_oems-marque_oem_id-to-famille_mtcs" FOREIGN KEY (marque_oem_id) REFERENCES public.marque_oems(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: famille_mtcs fk-marques-marque_id-to-famille_mtcs; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.famille_mtcs
    ADD CONSTRAINT "fk-marques-marque_id-to-famille_mtcs" FOREIGN KEY (marque_id) REFERENCES public.marques(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

