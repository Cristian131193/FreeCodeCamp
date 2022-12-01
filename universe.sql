--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_years integer,
    size_in_light_years integer,
    type character varying(30) NOT NULL,
    there_is_life boolean,
    velocity_in_kmxh numeric,
    color text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: life; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.life (
    life_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size_in_cm integer,
    planet_id integer NOT NULL,
    type character varying(30) NOT NULL,
    velocity_in_kmxh numeric,
    color text
);


ALTER TABLE public.life OWNER TO freecodecamp;

--
-- Name: life_life_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.life_life_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.life_life_id_seq OWNER TO freecodecamp;

--
-- Name: life_life_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.life_life_id_seq OWNED BY public.life.life_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_years integer,
    size_in_km integer,
    planet_id integer NOT NULL,
    type character varying(30) NOT NULL,
    there_is_life boolean,
    velocity_in_kmxh numeric,
    color text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_years integer,
    size_in_km integer,
    star_id integer NOT NULL,
    type character varying(30) NOT NULL,
    there_is_life boolean,
    velocity_in_kmxh numeric,
    color text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_years integer,
    size_in_km integer,
    galaxy_id integer NOT NULL,
    type character varying(30) NOT NULL,
    there_is_life boolean,
    velocity_in_kmxh numeric,
    color text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: start_start_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.start_start_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.start_start_id_seq OWNER TO freecodecamp;

--
-- Name: start_start_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.start_start_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: life life_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life ALTER COLUMN life_id SET DEFAULT nextval('public.life_life_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.start_start_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Whirlpool', 31000, 23, ' First Spiral', false, 2500000.23, NULL);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 31000, 23, ' Notion Spiral', true, 2500000.23, NULL);
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 31000, 23, ' Notion ', true, 2500000.23, NULL);
INSERT INTO public.galaxy VALUES (4, 'NGC', 31000, 23, ' Seyfert', false, 2500000.23, NULL);
INSERT INTO public.galaxy VALUES (5, 'Cygnus', 31000, 23, 'Radio', false, 2500000.23, NULL);
INSERT INTO public.galaxy VALUES (6, 'Malin', 31000, 23, 'Low Superfase', false, 2500000.23, NULL);


--
-- Data for Name: life; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.life VALUES (1, 'human', 230, 3, 'animal', 25.5, NULL);
INSERT INTO public.life VALUES (2, 'plant', 230, 3, 'vegetal', 25.5, NULL);
INSERT INTO public.life VALUES (3, 'spider', 230, 3, 'insect', 25.5, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 14000, 23000, 3, '1', false, 2544.25, NULL);
INSERT INTO public.moon VALUES (2, 'europa', 14000, 23000, 6, '2', false, 2544.25, NULL);
INSERT INTO public.moon VALUES (3, 'io', 14000, 23000, 6, '3', false, 2544.25, NULL);
INSERT INTO public.moon VALUES (4, 'ganimedes', 14000, 23000, 6, '4', false, 2544.25, NULL);
INSERT INTO public.moon VALUES (5, 'calisto', 14000, 23000, 6, '5', false, 2544.25, NULL);
INSERT INTO public.moon VALUES (6, 'amaltea', 14000, 23000, 6, '6', false, 2544.25, NULL);
INSERT INTO public.moon VALUES (7, 'adrastea', 14000, 23000, 6, '7', false, 2544.25, NULL);
INSERT INTO public.moon VALUES (8, 's2003', 14000, 23000, 6, '8', false, 2544.25, NULL);
INSERT INTO public.moon VALUES (9, 'himalia', 14000, 23000, 6, '9', false, 2544.25, NULL);
INSERT INTO public.moon VALUES (10, 'Tebe', 14000, 23000, 6, '10', false, 2544.25, NULL);
INSERT INTO public.moon VALUES (11, 'valetudo', 14000, 23000, 6, '11', false, 2544.25, NULL);
INSERT INTO public.moon VALUES (12, 'ciarme', 14000, 23000, 6, '12', false, 2544.25, NULL);
INSERT INTO public.moon VALUES (13, 'kalichore', 14000, 23000, 6, '13', false, 2544.25, NULL);
INSERT INTO public.moon VALUES (14, 'elara', 14000, 23000, 6, '14', false, 2544.25, NULL);
INSERT INTO public.moon VALUES (15, 'harpice', 14000, 23000, 6, '15', false, 2544.25, NULL);
INSERT INTO public.moon VALUES (16, 'hegemone', 14000, 23000, 6, '16', false, 2544.25, NULL);
INSERT INTO public.moon VALUES (17, 'cliene', 14000, 23000, 6, '17', false, 2544.25, NULL);
INSERT INTO public.moon VALUES (18, 'tione', 14000, 23000, 6, '18', false, 2544.25, NULL);
INSERT INTO public.moon VALUES (19, 'aline', 14000, 23000, 6, '19', false, 2544.25, NULL);
INSERT INTO public.moon VALUES (20, 'pasitea', 14000, 23000, 6, '20', false, 2544.25, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercurio', 14000, 23000, 3, 'one', false, 2544.25, NULL);
INSERT INTO public.planet VALUES (2, 'Venus', 14000, 23000, 3, 'two', false, 2544.25, NULL);
INSERT INTO public.planet VALUES (3, 'Earth', 14000, 23000, 3, 'three', true, 2544.25, NULL);
INSERT INTO public.planet VALUES (5, 'Marth', 14000, 23000, 3, 'forth', false, 2544.25, NULL);
INSERT INTO public.planet VALUES (6, 'Ceres', 14000, 23000, 3, 'five', false, 2544.25, NULL);
INSERT INTO public.planet VALUES (7, 'Jupiter', 14000, 23000, 3, 'six', false, 2544.25, NULL);
INSERT INTO public.planet VALUES (8, 'Saturno', 14000, 23000, 3, 'seven', false, 2544.25, NULL);
INSERT INTO public.planet VALUES (9, 'Urano', 14000, 23000, 3, 'eigth', false, 2544.25, NULL);
INSERT INTO public.planet VALUES (10, 'Neptuno', 14000, 23000, 3, 'nine', false, 2544.25, NULL);
INSERT INTO public.planet VALUES (11, 'Pluton', 14000, 23000, 3, 'ten', false, 2544.25, NULL);
INSERT INTO public.planet VALUES (12, 'Haumea', 14000, 23000, 3, 'eleven', false, 2544.25, NULL);
INSERT INTO public.planet VALUES (13, 'Makemake', 14000, 23000, 3, 'twelve', false, 2544.25, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Alpha Andromedae', 14000, 23000, 3, 'Yellow', false, 25000.23, NULL);
INSERT INTO public.star VALUES (3, 'Gamma', 14000, 23000, 3, 'Blue', false, 2544.25, NULL);
INSERT INTO public.star VALUES (4, 'SUN', 14000, 23000, 2, 'Red', false, 2544.25, NULL);
INSERT INTO public.star VALUES (5, 'Cassiopeiae', 14000, 23000, 2, 'SuperRed', false, 2544.25, NULL);
INSERT INTO public.star VALUES (6, 'SMC', 14000, 23000, 2, 'SuperBlue', false, 2544.25, NULL);
INSERT INTO public.star VALUES (7, 'Cygni', 14000, 23000, 2, 'White', false, 2544.25, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: life_life_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.life_life_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: start_start_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.start_start_id_seq', 7, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_type_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_type_key UNIQUE (type);


--
-- Name: life life_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life
    ADD CONSTRAINT life_pkey PRIMARY KEY (life_id);


--
-- Name: life life_type_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life
    ADD CONSTRAINT life_type_key UNIQUE (type);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_type_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_type_key UNIQUE (type);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_type_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_type_key UNIQUE (type);


--
-- Name: star start_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT start_pkey PRIMARY KEY (star_id);


--
-- Name: star start_type_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT start_type_key UNIQUE (type);


--
-- Name: life life_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life
    ADD CONSTRAINT life_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_start_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_start_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star start_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT start_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

