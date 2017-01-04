--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.5
-- Dumped by pg_dump version 9.5.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: rozig
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO rozig;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: rozig
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO rozig;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rozig
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: rozig
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO rozig;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: rozig
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO rozig;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rozig
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: rozig
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO rozig;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: rozig
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO rozig;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rozig
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: rozig
--

CREATE TABLE django_admin_log (
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


ALTER TABLE django_admin_log OWNER TO rozig;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: rozig
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO rozig;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rozig
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: rozig
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO rozig;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: rozig
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO rozig;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rozig
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: rozig
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO rozig;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: rozig
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO rozig;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rozig
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: rozig
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO rozig;

--
-- Name: recommendation_food; Type: TABLE; Schema: public; Owner: rozig
--

CREATE TABLE recommendation_food (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    total_calories double precision,
    image character varying(100) NOT NULL,
    group_id integer NOT NULL,
    description text NOT NULL,
    loves integer NOT NULL,
    added_date date NOT NULL,
    chief_id integer NOT NULL,
    views integer NOT NULL
);


ALTER TABLE recommendation_food OWNER TO rozig;

--
-- Name: recommendation_food_and_user; Type: TABLE; Schema: public; Owner: rozig
--

CREATE TABLE recommendation_food_and_user (
    id integer NOT NULL,
    food_id integer NOT NULL,
    user_id integer NOT NULL,
    is_favourite boolean NOT NULL
);


ALTER TABLE recommendation_food_and_user OWNER TO rozig;

--
-- Name: recommendation_food_and_user_id_seq; Type: SEQUENCE; Schema: public; Owner: rozig
--

CREATE SEQUENCE recommendation_food_and_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE recommendation_food_and_user_id_seq OWNER TO rozig;

--
-- Name: recommendation_food_and_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rozig
--

ALTER SEQUENCE recommendation_food_and_user_id_seq OWNED BY recommendation_food_and_user.id;


--
-- Name: recommendation_food_group; Type: TABLE; Schema: public; Owner: rozig
--

CREATE TABLE recommendation_food_group (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE recommendation_food_group OWNER TO rozig;

--
-- Name: recommendation_food_group_id_seq; Type: SEQUENCE; Schema: public; Owner: rozig
--

CREATE SEQUENCE recommendation_food_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE recommendation_food_group_id_seq OWNER TO rozig;

--
-- Name: recommendation_food_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rozig
--

ALTER SEQUENCE recommendation_food_group_id_seq OWNED BY recommendation_food_group.id;


--
-- Name: recommendation_food_id_seq; Type: SEQUENCE; Schema: public; Owner: rozig
--

CREATE SEQUENCE recommendation_food_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE recommendation_food_id_seq OWNER TO rozig;

--
-- Name: recommendation_food_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rozig
--

ALTER SEQUENCE recommendation_food_id_seq OWNED BY recommendation_food.id;


--
-- Name: recommendation_food_nutrients; Type: TABLE; Schema: public; Owner: rozig
--

CREATE TABLE recommendation_food_nutrients (
    id integer NOT NULL,
    food_id integer NOT NULL,
    food_nutrition_id integer NOT NULL
);


ALTER TABLE recommendation_food_nutrients OWNER TO rozig;

--
-- Name: recommendation_food_nutrients_id_seq; Type: SEQUENCE; Schema: public; Owner: rozig
--

CREATE SEQUENCE recommendation_food_nutrients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE recommendation_food_nutrients_id_seq OWNER TO rozig;

--
-- Name: recommendation_food_nutrients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rozig
--

ALTER SEQUENCE recommendation_food_nutrients_id_seq OWNED BY recommendation_food_nutrients.id;


--
-- Name: recommendation_food_nutrition; Type: TABLE; Schema: public; Owner: rozig
--

CREATE TABLE recommendation_food_nutrition (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    unit character varying(20) NOT NULL,
    value double precision NOT NULL
);


ALTER TABLE recommendation_food_nutrition OWNER TO rozig;

--
-- Name: recommendation_food_nutrition_id_seq; Type: SEQUENCE; Schema: public; Owner: rozig
--

CREATE SEQUENCE recommendation_food_nutrition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE recommendation_food_nutrition_id_seq OWNER TO rozig;

--
-- Name: recommendation_food_nutrition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rozig
--

ALTER SEQUENCE recommendation_food_nutrition_id_seq OWNED BY recommendation_food_nutrition.id;


--
-- Name: recommendation_machine_data; Type: TABLE; Schema: public; Owner: rozig
--

CREATE TABLE recommendation_machine_data (
    id integer NOT NULL,
    food character varying(20) NOT NULL,
    status integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE recommendation_machine_data OWNER TO rozig;

--
-- Name: recommendation_machine_data_id_seq; Type: SEQUENCE; Schema: public; Owner: rozig
--

CREATE SEQUENCE recommendation_machine_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE recommendation_machine_data_id_seq OWNER TO rozig;

--
-- Name: recommendation_machine_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rozig
--

ALTER SEQUENCE recommendation_machine_data_id_seq OWNED BY recommendation_machine_data.id;


--
-- Name: recommendation_user; Type: TABLE; Schema: public; Owner: rozig
--

CREATE TABLE recommendation_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    birth_date date NOT NULL,
    height double precision,
    weight double precision,
    gender integer NOT NULL,
    is_fat integer NOT NULL,
    weight_diff double precision NOT NULL,
    activity_level double precision NOT NULL,
    age integer NOT NULL,
    avatar character varying(100) NOT NULL,
    daily_calory double precision NOT NULL,
    bmi double precision NOT NULL,
    bmr double precision NOT NULL
);


ALTER TABLE recommendation_user OWNER TO rozig;

--
-- Name: recommendation_user_activity; Type: TABLE; Schema: public; Owner: rozig
--

CREATE TABLE recommendation_user_activity (
    id integer NOT NULL,
    date date NOT NULL,
    food_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE recommendation_user_activity OWNER TO rozig;

--
-- Name: recommendation_user_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: rozig
--

CREATE SEQUENCE recommendation_user_activity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE recommendation_user_activity_id_seq OWNER TO rozig;

--
-- Name: recommendation_user_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rozig
--

ALTER SEQUENCE recommendation_user_activity_id_seq OWNED BY recommendation_user_activity.id;


--
-- Name: recommendation_user_favourite_food_group; Type: TABLE; Schema: public; Owner: rozig
--

CREATE TABLE recommendation_user_favourite_food_group (
    id integer NOT NULL,
    user_id integer NOT NULL,
    food_group_id integer NOT NULL
);


ALTER TABLE recommendation_user_favourite_food_group OWNER TO rozig;

--
-- Name: recommendation_user_favourite_food_group_id_seq; Type: SEQUENCE; Schema: public; Owner: rozig
--

CREATE SEQUENCE recommendation_user_favourite_food_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE recommendation_user_favourite_food_group_id_seq OWNER TO rozig;

--
-- Name: recommendation_user_favourite_food_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rozig
--

ALTER SEQUENCE recommendation_user_favourite_food_group_id_seq OWNED BY recommendation_user_favourite_food_group.id;


--
-- Name: recommendation_user_groups; Type: TABLE; Schema: public; Owner: rozig
--

CREATE TABLE recommendation_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE recommendation_user_groups OWNER TO rozig;

--
-- Name: recommendation_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: rozig
--

CREATE SEQUENCE recommendation_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE recommendation_user_groups_id_seq OWNER TO rozig;

--
-- Name: recommendation_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rozig
--

ALTER SEQUENCE recommendation_user_groups_id_seq OWNED BY recommendation_user_groups.id;


--
-- Name: recommendation_user_id_seq; Type: SEQUENCE; Schema: public; Owner: rozig
--

CREATE SEQUENCE recommendation_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE recommendation_user_id_seq OWNER TO rozig;

--
-- Name: recommendation_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rozig
--

ALTER SEQUENCE recommendation_user_id_seq OWNED BY recommendation_user.id;


--
-- Name: recommendation_user_user_permissions; Type: TABLE; Schema: public; Owner: rozig
--

CREATE TABLE recommendation_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE recommendation_user_user_permissions OWNER TO rozig;

--
-- Name: recommendation_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: rozig
--

CREATE SEQUENCE recommendation_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE recommendation_user_user_permissions_id_seq OWNER TO rozig;

--
-- Name: recommendation_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rozig
--

ALTER SEQUENCE recommendation_user_user_permissions_id_seq OWNED BY recommendation_user_user_permissions.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY recommendation_food ALTER COLUMN id SET DEFAULT nextval('recommendation_food_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY recommendation_food_and_user ALTER COLUMN id SET DEFAULT nextval('recommendation_food_and_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY recommendation_food_group ALTER COLUMN id SET DEFAULT nextval('recommendation_food_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY recommendation_food_nutrients ALTER COLUMN id SET DEFAULT nextval('recommendation_food_nutrients_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY recommendation_food_nutrition ALTER COLUMN id SET DEFAULT nextval('recommendation_food_nutrition_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY recommendation_machine_data ALTER COLUMN id SET DEFAULT nextval('recommendation_machine_data_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY recommendation_user ALTER COLUMN id SET DEFAULT nextval('recommendation_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY recommendation_user_activity ALTER COLUMN id SET DEFAULT nextval('recommendation_user_activity_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY recommendation_user_favourite_food_group ALTER COLUMN id SET DEFAULT nextval('recommendation_user_favourite_food_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY recommendation_user_groups ALTER COLUMN id SET DEFAULT nextval('recommendation_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY recommendation_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('recommendation_user_user_permissions_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: rozig
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rozig
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: rozig
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rozig
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: rozig
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add content type	4	add_contenttype
11	Can change content type	4	change_contenttype
12	Can delete content type	4	delete_contenttype
13	Can add session	5	add_session
14	Can change session	5	change_session
15	Can delete session	5	delete_session
16	Can add food_ nutrition	6	add_food_nutrition
17	Can change food_ nutrition	6	change_food_nutrition
18	Can delete food_ nutrition	6	delete_food_nutrition
19	Can add food_ group	7	add_food_group
20	Can change food_ group	7	change_food_group
21	Can delete food_ group	7	delete_food_group
22	Can add food	8	add_food
23	Can change food	8	change_food
24	Can delete food	8	delete_food
25	Can add user	9	add_user
26	Can change user	9	change_user
27	Can delete user	9	delete_user
28	Can add machine_ data	10	add_machine_data
29	Can change machine_ data	10	change_machine_data
30	Can delete machine_ data	10	delete_machine_data
31	Can add food_and_ user	11	add_food_and_user
32	Can change food_and_ user	11	change_food_and_user
33	Can delete food_and_ user	11	delete_food_and_user
34	Can add user_ activity	12	add_user_activity
35	Can change user_ activity	12	change_user_activity
36	Can delete user_ activity	12	delete_user_activity
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rozig
--

SELECT pg_catalog.setval('auth_permission_id_seq', 36, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: rozig
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2016-12-23 00:22:35.245042+08	2	Хонины махтай хоол	1		7	1
2	2016-12-23 00:22:51.622764+08	3	Үхрийн махтай хоол	1		7	1
3	2016-12-23 00:23:07.647055+08	4	Тахианы махтай хоол	1		7	1
4	2016-12-23 00:23:17.756935+08	5	Загасны махтай хоол	1		7	1
5	2016-12-23 00:23:25.787775+08	6	Гахайн махтай хоол	1		7	1
6	2016-12-23 00:23:34.341021+08	7	Түргэн хоол	1		7	1
7	2016-12-23 00:23:38.384592+08	8	Цагаан хоол	1		7	1
8	2016-12-23 00:23:50.485234+08	9	Био бүтээгдэхүүн	1		7	1
9	2016-12-23 00:23:58.029036+08	10	Салат	1		7	1
10	2016-12-23 00:24:02.0057+08	11	Зууш	1		7	1
11	2016-12-23 00:24:15.68529+08	12	Бялуу ба жигнэмэг	1		7	1
12	2016-12-23 00:24:29.554427+08	13	Талх, нарийн боов	1		7	1
13	2016-12-23 00:24:40.608832+08	14	Амттан ба дессерт	1		7	1
14	2016-12-23 00:24:52.27605+08	15	Коктейль	1		7	1
15	2016-12-23 00:24:58.835729+08	16	Кофе	1		7	1
16	2016-12-23 00:25:16.457131+08	17	Шейк ба ундаа	1		7	1
17	2016-12-23 00:25:35.095541+08	18	Хүүхдийн хоол	1		7	1
18	2016-12-23 00:25:41.152428+08	19	Сүмс болон бусад	1		7	1
19	2016-12-23 00:32:58.119296+08	1	Төмөр	1		6	1
20	2016-12-23 00:33:18.112984+08	2	Цайр	1		6	1
21	2016-12-23 00:33:38.486912+08	3	Витамин В1	1		6	1
22	2016-12-23 00:33:54.665563+08	4	Витамин В2	1		6	1
23	2016-12-23 00:34:30.749773+08	5	Фолийн хүчил	1		6	1
24	2016-12-23 00:34:47.476575+08	6	Ниацин	1		6	1
25	2016-12-23 00:35:08.821702+08	7	Уураг	1		6	1
26	2016-12-23 00:35:22.673945+08	8	Тос	1		6	1
27	2016-12-23 00:35:43.878973+08	9	Нүүрс ус	1		6	1
28	2016-12-23 00:35:52.207419+08	1	Шинэ талх	1		8	1
29	2016-12-27 23:07:22.718871+08	1	Шинэ талх	2	No fields changed.	8	1
30	2016-12-27 23:30:27.111702+08	1	Шинэ талх	2	Changed image.	8	1
31	2016-12-28 01:47:53.175064+08	1	ganzorig	2	Changed first_name, last_name, height, weight, avatar, age and favourite_food_group.	9	1
32	2016-12-28 05:35:03.470322+08	1	Food_and_User object	1		11	1
33	2016-12-28 11:08:02.275762+08	1	ganzorig	2	Changed height and weight.	9	1
34	2017-01-04 00:29:25.239715+08	2	sad	1		8	1
35	2017-01-04 09:38:06.426575+08	3	Шинэ талх	1		8	1
36	2017-01-04 09:40:36.559358+08	4	Торт	1		8	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rozig
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 36, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: rozig
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	recommendation	food_nutrition
7	recommendation	food_group
8	recommendation	food
9	recommendation	user
10	recommendation	machine_data
11	recommendation	food_and_user
12	recommendation	user_activity
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rozig
--

SELECT pg_catalog.setval('django_content_type_id_seq', 12, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: rozig
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2016-12-23 00:13:08.53804+08
2	contenttypes	0002_remove_content_type_name	2016-12-23 00:13:08.570177+08
3	auth	0001_initial	2016-12-23 00:13:09.049245+08
4	auth	0002_alter_permission_name_max_length	2016-12-23 00:13:09.093418+08
5	auth	0003_alter_user_email_max_length	2016-12-23 00:13:09.116463+08
6	auth	0004_alter_user_username_opts	2016-12-23 00:13:09.137155+08
7	auth	0005_alter_user_last_login_null	2016-12-23 00:13:09.158928+08
8	auth	0006_require_contenttypes_0002	2016-12-23 00:13:09.169987+08
9	recommendation	0001_initial	2016-12-23 00:13:10.551191+08
10	admin	0001_initial	2016-12-23 00:13:10.772231+08
11	sessions	0001_initial	2016-12-23 00:13:10.983323+08
12	recommendation	0002_food_chief	2016-12-27 23:07:01.742086+08
13	recommendation	0003_food_description	2016-12-27 23:11:30.753743+08
14	recommendation	0004_auto_20161227_2329	2016-12-27 23:29:29.809168+08
15	recommendation	0005_food_loves	2016-12-27 23:56:07.334529+08
16	recommendation	0006_food_added_date	2016-12-28 00:39:57.080831+08
17	recommendation	0007_user_avatar	2016-12-28 01:46:11.48931+08
18	recommendation	0008_auto_20161228_0217	2016-12-28 02:17:54.449487+08
19	recommendation	0009_food_and_user_is_favourite	2016-12-28 02:22:23.457378+08
20	recommendation	0010_auto_20161228_0245	2016-12-28 02:45:48.362709+08
21	recommendation	0011_user_daily_calory	2016-12-28 07:07:54.397441+08
22	recommendation	0012_auto_20161228_1149	2016-12-28 11:49:14.119042+08
23	recommendation	0013_food_views	2017-01-03 17:12:46.74172+08
24	recommendation	0014_user_activity	2017-01-04 09:52:53.928012+08
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rozig
--

SELECT pg_catalog.setval('django_migrations_id_seq', 24, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: rozig
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
w7twvkfefcav72et1d5a0xmqp03985x6	MGU5MGM5ZjQ1NWE2ZWExMWE4NjhkMmY5NTE1NTgzYzQ1NDMxNGJjMjp7Il9hdXRoX3VzZXJfaGFzaCI6ImI5NDA3ODRjM2QxYTYxNGQ1OWM2MmYzY2NkNDYyMWE2MjYxMjEyNTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-01-11 11:06:42.82708+08
yq4cemx6tannnn68ggrz6wm90juy19at	NThjM2NiZDdhNjBkNDNmZTU4NmVmZmQwYmIxNjBiMzRkNjVkNzM1ODp7fQ==	2017-01-17 15:45:28.594192+08
e4yqhj0iqfybi3drfucijhd1uwee34lv	NThjM2NiZDdhNjBkNDNmZTU4NmVmZmQwYmIxNjBiMzRkNjVkNzM1ODp7fQ==	2017-01-17 15:45:28.840883+08
fahw2xr96pi9n4jo57vjdvc8aicwtn5x	MGU5MGM5ZjQ1NWE2ZWExMWE4NjhkMmY5NTE1NTgzYzQ1NDMxNGJjMjp7Il9hdXRoX3VzZXJfaGFzaCI6ImI5NDA3ODRjM2QxYTYxNGQ1OWM2MmYzY2NkNDYyMWE2MjYxMjEyNTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-01-17 15:45:47.71172+08
\.


--
-- Data for Name: recommendation_food; Type: TABLE DATA; Schema: public; Owner: rozig
--

COPY recommendation_food (id, name, total_calories, image, group_id, description, loves, added_date, chief_id, views) FROM stdin;
3	Шинэ талх	127	foods/shine_talh_Pw19Ca2.jpg	13	Талх нь гурил буюу хөх тарианы гурил зэргийг ус, исгэгч, давс зэрэгтэй хольж зуурсан хөрөнгийг исгэж, барьсан хүнсний бүтээгдэхүүн юм. Мөн жигнэх, шарах зэрэг аргаар талх барьж болдог. Түүнчлэн үзэм, самар зэргийг хөрөнгөндөө хольж, ороож, дээр нь тавьж барих боломжтой. Хөрөнгөө нимгэн түрхэж барьдаг, хоолны сода хольж барьдаг талх нь исгэгч хэрэглэлгүйгээр хийж болдог байна. Талх нь хүн төрөлхтний гол хоолны нэг юм.	0	2017-01-04	1	2
4	Торт	250	foods/бялуу540_l.jpg	12	Баяр ёслолын үеэр хамгийн их эрэлттэй зүйл бол бялуу байдаг. Гэтэл дэлгүүрээс өөрийн санаанд таарсан өнгө үзэмж, амт чанартай бялуу олох хэцүү шүү дээ. Энэ үед хамгийн зөв сонголт бол өөрийн гараар бялуу хийж санаандаа хүртэл амтлаж, чимэглэх юм. Иймд эзэгтэй нартаа зориулж будаа агшаагчинд бялуу хийх энгийн жорыг дэлгэж байна.	0	2017-01-04	1	4
\.


--
-- Data for Name: recommendation_food_and_user; Type: TABLE DATA; Schema: public; Owner: rozig
--

COPY recommendation_food_and_user (id, food_id, user_id, is_favourite) FROM stdin;
\.


--
-- Name: recommendation_food_and_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rozig
--

SELECT pg_catalog.setval('recommendation_food_and_user_id_seq', 1, true);


--
-- Data for Name: recommendation_food_group; Type: TABLE DATA; Schema: public; Owner: rozig
--

COPY recommendation_food_group (id, name) FROM stdin;
2	Хонины махтай хоол
3	Үхрийн махтай хоол
4	Тахианы махтай хоол
5	Загасны махтай хоол
6	Гахайн махтай хоол
7	Түргэн хоол
8	Цагаан хоол
9	Био бүтээгдэхүүн
10	Салат
11	Зууш
12	Бялуу ба жигнэмэг
13	Талх, нарийн боов
14	Амттан ба дессерт
15	Коктейль
16	Кофе
17	Шейк ба ундаа
18	Хүүхдийн хоол
19	Сүмс болон бусад
\.


--
-- Name: recommendation_food_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rozig
--

SELECT pg_catalog.setval('recommendation_food_group_id_seq', 19, true);


--
-- Name: recommendation_food_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rozig
--

SELECT pg_catalog.setval('recommendation_food_id_seq', 4, true);


--
-- Data for Name: recommendation_food_nutrients; Type: TABLE DATA; Schema: public; Owner: rozig
--

COPY recommendation_food_nutrients (id, food_id, food_nutrition_id) FROM stdin;
29	3	1
30	3	2
31	3	3
32	3	4
33	3	5
34	3	6
35	3	7
36	3	8
37	3	9
38	4	1
39	4	2
40	4	3
41	4	4
42	4	5
43	4	6
44	4	7
45	4	8
46	4	9
\.


--
-- Name: recommendation_food_nutrients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rozig
--

SELECT pg_catalog.setval('recommendation_food_nutrients_id_seq', 46, true);


--
-- Data for Name: recommendation_food_nutrition; Type: TABLE DATA; Schema: public; Owner: rozig
--

COPY recommendation_food_nutrition (id, name, unit, value) FROM stdin;
1	Төмөр	мг	3.5
2	Цайр	мг	1.5
3	Витамин В1	мг	0.110000000000000001
4	Витамин В2	мг	0.190000000000000002
5	Фолийн хүчил	мг	0.0950000000000000011
6	Ниацин	мг	0.630000000000000004
7	Уураг	гр	8.30000000000000071
8	Тос	гр	2.39999999999999991
9	Нүүрс ус	гр	35.3999999999999986
\.


--
-- Name: recommendation_food_nutrition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rozig
--

SELECT pg_catalog.setval('recommendation_food_nutrition_id_seq', 9, true);


--
-- Data for Name: recommendation_machine_data; Type: TABLE DATA; Schema: public; Owner: rozig
--

COPY recommendation_machine_data (id, food, status, user_id) FROM stdin;
\.


--
-- Name: recommendation_machine_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rozig
--

SELECT pg_catalog.setval('recommendation_machine_data_id_seq', 1, false);


--
-- Data for Name: recommendation_user; Type: TABLE DATA; Schema: public; Owner: rozig
--

COPY recommendation_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, birth_date, height, weight, gender, is_fat, weight_diff, activity_level, age, avatar, daily_calory, bmi, bmr) FROM stdin;
7	pbkdf2_sha256$20000$wpkkERhyPoZv$esWgnC/YEJReCII0/lgvOZUDJtIzBMrj2tLHR6zRj1E=	2016-12-28 09:35:42.336613+08	f	admin	Ганзориг	Эрдэнэбат	ganzorig@infinite.mn	f	t	2016-12-28 09:33:05.390682+08	1996-07-25	1.69999999999999996	65	1	1	1781.5	1.19999999999999996	20	/media/profile_iCymWGI.jpg	2167.79999999999973	1	1
1	pbkdf2_sha256$20000$CFahJFxWcHRl$KeCRdJFfUKs/0PO7gqXirRtvwaU2zNfOrjaIQtm8eU8=	2017-01-03 15:45:47.64425+08	t	ganzorig	Ганзориг	Эрдэнэбат	ganzorig@infyq.co	t	t	2016-12-23 00:14:08+08	1970-01-01	179	77	1	0	0	0	20	avatars/profile.jpg	1	1	1
\.


--
-- Data for Name: recommendation_user_activity; Type: TABLE DATA; Schema: public; Owner: rozig
--

COPY recommendation_user_activity (id, date, food_id, user_id) FROM stdin;
\.


--
-- Name: recommendation_user_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rozig
--

SELECT pg_catalog.setval('recommendation_user_activity_id_seq', 1, false);


--
-- Data for Name: recommendation_user_favourite_food_group; Type: TABLE DATA; Schema: public; Owner: rozig
--

COPY recommendation_user_favourite_food_group (id, user_id, food_group_id) FROM stdin;
4	1	13
5	1	14
6	1	15
\.


--
-- Name: recommendation_user_favourite_food_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rozig
--

SELECT pg_catalog.setval('recommendation_user_favourite_food_group_id_seq', 6, true);


--
-- Data for Name: recommendation_user_groups; Type: TABLE DATA; Schema: public; Owner: rozig
--

COPY recommendation_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: recommendation_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rozig
--

SELECT pg_catalog.setval('recommendation_user_groups_id_seq', 1, false);


--
-- Name: recommendation_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rozig
--

SELECT pg_catalog.setval('recommendation_user_id_seq', 7, true);


--
-- Data for Name: recommendation_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: rozig
--

COPY recommendation_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: recommendation_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rozig
--

SELECT pg_catalog.setval('recommendation_user_user_permissions_id_seq', 1, false);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_45f3b1d93ec8c61c_uniq; Type: CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_45f3b1d93ec8c61c_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: recommendation_food_and_user_pkey; Type: CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY recommendation_food_and_user
    ADD CONSTRAINT recommendation_food_and_user_pkey PRIMARY KEY (id);


--
-- Name: recommendation_food_group_pkey; Type: CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY recommendation_food_group
    ADD CONSTRAINT recommendation_food_group_pkey PRIMARY KEY (id);


--
-- Name: recommendation_food_nutrients_food_id_food_nutrition_id_key; Type: CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY recommendation_food_nutrients
    ADD CONSTRAINT recommendation_food_nutrients_food_id_food_nutrition_id_key UNIQUE (food_id, food_nutrition_id);


--
-- Name: recommendation_food_nutrients_pkey; Type: CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY recommendation_food_nutrients
    ADD CONSTRAINT recommendation_food_nutrients_pkey PRIMARY KEY (id);


--
-- Name: recommendation_food_nutrition_pkey; Type: CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY recommendation_food_nutrition
    ADD CONSTRAINT recommendation_food_nutrition_pkey PRIMARY KEY (id);


--
-- Name: recommendation_food_pkey; Type: CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY recommendation_food
    ADD CONSTRAINT recommendation_food_pkey PRIMARY KEY (id);


--
-- Name: recommendation_machine_data_pkey; Type: CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY recommendation_machine_data
    ADD CONSTRAINT recommendation_machine_data_pkey PRIMARY KEY (id);


--
-- Name: recommendation_user_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY recommendation_user_activity
    ADD CONSTRAINT recommendation_user_activity_pkey PRIMARY KEY (id);


--
-- Name: recommendation_user_favourite_food_gr_user_id_food_group_id_key; Type: CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY recommendation_user_favourite_food_group
    ADD CONSTRAINT recommendation_user_favourite_food_gr_user_id_food_group_id_key UNIQUE (user_id, food_group_id);


--
-- Name: recommendation_user_favourite_food_group_pkey; Type: CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY recommendation_user_favourite_food_group
    ADD CONSTRAINT recommendation_user_favourite_food_group_pkey PRIMARY KEY (id);


--
-- Name: recommendation_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY recommendation_user_groups
    ADD CONSTRAINT recommendation_user_groups_pkey PRIMARY KEY (id);


--
-- Name: recommendation_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY recommendation_user_groups
    ADD CONSTRAINT recommendation_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: recommendation_user_pkey; Type: CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY recommendation_user
    ADD CONSTRAINT recommendation_user_pkey PRIMARY KEY (id);


--
-- Name: recommendation_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY recommendation_user_user_permissions
    ADD CONSTRAINT recommendation_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: recommendation_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY recommendation_user_user_permissions
    ADD CONSTRAINT recommendation_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: recommendation_user_username_key; Type: CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY recommendation_user
    ADD CONSTRAINT recommendation_user_username_key UNIQUE (username);


--
-- Name: auth_group_name_253ae2a6331666e8_like; Type: INDEX; Schema: public; Owner: rozig
--

CREATE INDEX auth_group_name_253ae2a6331666e8_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: rozig
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: rozig
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: rozig
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: rozig
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: rozig
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: rozig
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_461cfeaa630ca218_like; Type: INDEX; Schema: public; Owner: rozig
--

CREATE INDEX django_session_session_key_461cfeaa630ca218_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: recommendation_food_0e939a4f; Type: INDEX; Schema: public; Owner: rozig
--

CREATE INDEX recommendation_food_0e939a4f ON recommendation_food USING btree (group_id);


--
-- Name: recommendation_food_1a2a8589; Type: INDEX; Schema: public; Owner: rozig
--

CREATE INDEX recommendation_food_1a2a8589 ON recommendation_food USING btree (chief_id);


--
-- Name: recommendation_food_and_user_380b3cb5; Type: INDEX; Schema: public; Owner: rozig
--

CREATE INDEX recommendation_food_and_user_380b3cb5 ON recommendation_food_and_user USING btree (food_id);


--
-- Name: recommendation_food_and_user_e8701ad4; Type: INDEX; Schema: public; Owner: rozig
--

CREATE INDEX recommendation_food_and_user_e8701ad4 ON recommendation_food_and_user USING btree (user_id);


--
-- Name: recommendation_food_nutrients_380b3cb5; Type: INDEX; Schema: public; Owner: rozig
--

CREATE INDEX recommendation_food_nutrients_380b3cb5 ON recommendation_food_nutrients USING btree (food_id);


--
-- Name: recommendation_food_nutrients_751d3a80; Type: INDEX; Schema: public; Owner: rozig
--

CREATE INDEX recommendation_food_nutrients_751d3a80 ON recommendation_food_nutrients USING btree (food_nutrition_id);


--
-- Name: recommendation_machine_data_e8701ad4; Type: INDEX; Schema: public; Owner: rozig
--

CREATE INDEX recommendation_machine_data_e8701ad4 ON recommendation_machine_data USING btree (user_id);


--
-- Name: recommendation_user_activity_380b3cb5; Type: INDEX; Schema: public; Owner: rozig
--

CREATE INDEX recommendation_user_activity_380b3cb5 ON recommendation_user_activity USING btree (food_id);


--
-- Name: recommendation_user_activity_e8701ad4; Type: INDEX; Schema: public; Owner: rozig
--

CREATE INDEX recommendation_user_activity_e8701ad4 ON recommendation_user_activity USING btree (user_id);


--
-- Name: recommendation_user_favourite_food_group_bb1ef007; Type: INDEX; Schema: public; Owner: rozig
--

CREATE INDEX recommendation_user_favourite_food_group_bb1ef007 ON recommendation_user_favourite_food_group USING btree (food_group_id);


--
-- Name: recommendation_user_favourite_food_group_e8701ad4; Type: INDEX; Schema: public; Owner: rozig
--

CREATE INDEX recommendation_user_favourite_food_group_e8701ad4 ON recommendation_user_favourite_food_group USING btree (user_id);


--
-- Name: recommendation_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: rozig
--

CREATE INDEX recommendation_user_groups_0e939a4f ON recommendation_user_groups USING btree (group_id);


--
-- Name: recommendation_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: rozig
--

CREATE INDEX recommendation_user_groups_e8701ad4 ON recommendation_user_groups USING btree (user_id);


--
-- Name: recommendation_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: rozig
--

CREATE INDEX recommendation_user_user_permissions_8373b171 ON recommendation_user_user_permissions USING btree (permission_id);


--
-- Name: recommendation_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: rozig
--

CREATE INDEX recommendation_user_user_permissions_e8701ad4 ON recommendation_user_user_permissions USING btree (user_id);


--
-- Name: recommendation_user_username_8a0f23cfd1cd383_like; Type: INDEX; Schema: public; Owner: rozig
--

CREATE INDEX recommendation_user_username_8a0f23cfd1cd383_like ON recommendation_user USING btree (username varchar_pattern_ops);


--
-- Name: auth_content_type_id_508cf46651277a81_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_content_type_id_508cf46651277a81_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cb9580d7f9c31f4110bde1a7dee03722; Type: FK CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY recommendation_food_nutrients
    ADD CONSTRAINT cb9580d7f9c31f4110bde1a7dee03722 FOREIGN KEY (food_nutrition_id) REFERENCES recommendation_food_nutrition(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djan_content_type_id_697914295151027a_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT djan_content_type_id_697914295151027a_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_user_id_52fdd58701c5f563_fk_recommendation_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_user_id_52fdd58701c5f563_fk_recommendation_user_id FOREIGN KEY (user_id) REFERENCES recommendation_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: r_food_group_id_8db96d5564fb8d8_fk_recommendation_food_group_id; Type: FK CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY recommendation_user_favourite_food_group
    ADD CONSTRAINT r_food_group_id_8db96d5564fb8d8_fk_recommendation_food_group_id FOREIGN KEY (food_group_id) REFERENCES recommendation_food_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recom_group_id_68a5a19334381fcd_fk_recommendation_food_group_id; Type: FK CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY recommendation_food
    ADD CONSTRAINT recom_group_id_68a5a19334381fcd_fk_recommendation_food_group_id FOREIGN KEY (group_id) REFERENCES recommendation_food_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recommenda_permission_id_26eb36b7fab99bc9_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY recommendation_user_user_permissions
    ADD CONSTRAINT recommenda_permission_id_26eb36b7fab99bc9_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recommendat_chief_id_7bbeea3193028d2d_fk_recommendation_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY recommendation_food
    ADD CONSTRAINT recommendat_chief_id_7bbeea3193028d2d_fk_recommendation_user_id FOREIGN KEY (chief_id) REFERENCES recommendation_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recommendati_food_id_22f8221a8e54cb4a_fk_recommendation_food_id; Type: FK CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY recommendation_food_and_user
    ADD CONSTRAINT recommendati_food_id_22f8221a8e54cb4a_fk_recommendation_food_id FOREIGN KEY (food_id) REFERENCES recommendation_food(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recommendati_food_id_4681d7a3498fb8aa_fk_recommendation_food_id; Type: FK CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY recommendation_food_nutrients
    ADD CONSTRAINT recommendati_food_id_4681d7a3498fb8aa_fk_recommendation_food_id FOREIGN KEY (food_id) REFERENCES recommendation_food(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recommendati_food_id_6da453f1e0c3ec63_fk_recommendation_food_id; Type: FK CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY recommendation_user_activity
    ADD CONSTRAINT recommendati_food_id_6da453f1e0c3ec63_fk_recommendation_food_id FOREIGN KEY (food_id) REFERENCES recommendation_food(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recommendati_user_id_1751ad3959077ed3_fk_recommendation_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY recommendation_food_and_user
    ADD CONSTRAINT recommendati_user_id_1751ad3959077ed3_fk_recommendation_user_id FOREIGN KEY (user_id) REFERENCES recommendation_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recommendati_user_id_452490bf4ab9650c_fk_recommendation_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY recommendation_user_activity
    ADD CONSTRAINT recommendati_user_id_452490bf4ab9650c_fk_recommendation_user_id FOREIGN KEY (user_id) REFERENCES recommendation_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recommendati_user_id_4c4a477d830a234b_fk_recommendation_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY recommendation_user_groups
    ADD CONSTRAINT recommendati_user_id_4c4a477d830a234b_fk_recommendation_user_id FOREIGN KEY (user_id) REFERENCES recommendation_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recommendati_user_id_5a90994c0c8f3f63_fk_recommendation_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY recommendation_user_favourite_food_group
    ADD CONSTRAINT recommendati_user_id_5a90994c0c8f3f63_fk_recommendation_user_id FOREIGN KEY (user_id) REFERENCES recommendation_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recommendati_user_id_5ceb3d80b63e2822_fk_recommendation_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY recommendation_machine_data
    ADD CONSTRAINT recommendati_user_id_5ceb3d80b63e2822_fk_recommendation_user_id FOREIGN KEY (user_id) REFERENCES recommendation_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recommendati_user_id_6f9c50bf5550b6fd_fk_recommendation_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY recommendation_user_user_permissions
    ADD CONSTRAINT recommendati_user_id_6f9c50bf5550b6fd_fk_recommendation_user_id FOREIGN KEY (user_id) REFERENCES recommendation_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recommendation_user__group_id_4aa9afa97d70e87c_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: rozig
--

ALTER TABLE ONLY recommendation_user_groups
    ADD CONSTRAINT recommendation_user__group_id_4aa9afa97d70e87c_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

