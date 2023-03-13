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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    year_discovered integer,
    meaning character varying(50) NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    meaning text NOT NULL,
    is_visible_to_naked_eyes boolean NOT NULL,
    constellation_id integer NOT NULL
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    year_discovered integer,
    diameter_in_km integer,
    planet_id integer NOT NULL
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
    orbital_period_in_year numeric(7,2) NOT NULL,
    rotation_period_in_days numeric(5,2) NOT NULL,
    has_moon boolean NOT NULL,
    star_id integer NOT NULL
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
    distance_lightyears numeric(5,2) NOT NULL,
    brightness numeric(3,2) NOT NULL,
    approval_date date,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Aquarius', NULL, 'Water-bearer', 1);
INSERT INTO public.constellation VALUES (2, 'Aries', NULL, 'Ram', 2);
INSERT INTO public.constellation VALUES (3, 'Bootes', NULL, 'Herdsman', 3);
INSERT INTO public.constellation VALUES (4, 'Capricornus', NULL, 'Sea goat', 4);
INSERT INTO public.constellation VALUES (5, 'Centaurus', NULL, 'Centaur', 5);
INSERT INTO public.constellation VALUES (6, 'Cetus', NULL, 'Sea monster (later interpreted as a whale)', 9);
INSERT INTO public.constellation VALUES (7, 'Coma Berenices', 1536, 'Berenice''s hair', 6);
INSERT INTO public.constellation VALUES (8, 'Leo', NULL, 'Lion', 7);
INSERT INTO public.constellation VALUES (9, 'Ophiuchus', NULL, 'Serpent-bearer', 12);
INSERT INTO public.constellation VALUES (10, 'Pegasus', NULL, 'Pegasus (mythological winged horse)', 10);
INSERT INTO public.constellation VALUES (11, 'Sagittaurus', NULL, 'Archer', 11);
INSERT INTO public.constellation VALUES (12, 'Taurus', NULL, 'Bull', 8);
INSERT INTO public.constellation VALUES (13, 'Virgo', NULL, 'Virgin or maiden', 13);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Backward Galaxy', 'It seems to rotate in the opposite direction to what it should according to its shape.', false, 5);
INSERT INTO public.galaxy VALUES (2, 'Centaurus A', 'Named because its located in the Centaurus constellation', true, 5);
INSERT INTO public.galaxy VALUES (3, 'Black Eye Galaxy', 'It looks like an eye with dark stripe underneath', false, 7);
INSERT INTO public.galaxy VALUES (4, 'Coma Pinwheel Galaxy', 'It looks like a paper pinwheel', false, 7);
INSERT INTO public.galaxy VALUES (5, 'Malin 1', 'Named after its discoverer, David Malin', false, 7);
INSERT INTO public.galaxy VALUES (6, 'Mice Galaxies', 'Two galaxies with long tails that look like a mouse', false, 7);
INSERT INTO public.galaxy VALUES (7, 'Needle Galaxy', 'Named because of its thin appearance', false, 7);
INSERT INTO public.galaxy VALUES (8, 'Butterfly Galaxies', 'Binary galaxies. It looks like a pair of butterfly wings', false, 13);
INSERT INTO public.galaxy VALUES (9, 'Sombrero Galaxy', 'Looks like a sombrero', false, 13);
INSERT INTO public.galaxy VALUES (10, 'Little Sombrero Galaxy', 'It look like sombrero, but smaller than the original', false, 10);
INSERT INTO public.galaxy VALUES (11, 'Milky way', 'Our own galaxy. it is said look like a band of light', true, 11);
INSERT INTO public.galaxy VALUES (12, 'Wolf-Lundmark-Melotte', 'Named after the astronomers that co-discovered it', false, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', NULL, 34766, 39);
INSERT INTO public.moon VALUES (7, 'Phobos', 1877, 23, 40);
INSERT INTO public.moon VALUES (8, 'Deimos', 1877, 13, 40);
INSERT INTO public.moon VALUES (9, 'Io', 1610, 3630, 41);
INSERT INTO public.moon VALUES (10, 'Europa', 1610, 3138, 41);
INSERT INTO public.moon VALUES (11, 'Ganymede', 1610, 5262, 41);
INSERT INTO public.moon VALUES (12, 'Callisto', 1610, 4800, 41);
INSERT INTO public.moon VALUES (13, 'Amalthea', 1892, 200, 41);
INSERT INTO public.moon VALUES (14, 'Himalia', 1904, 170, 41);
INSERT INTO public.moon VALUES (15, 'Mimas', 1789, 394, 42);
INSERT INTO public.moon VALUES (16, 'Encedalus', 1789, 502, 42);
INSERT INTO public.moon VALUES (17, 'Tethys', 1684, 1048, 42);
INSERT INTO public.moon VALUES (18, 'Dione', 1684, 1120, 42);
INSERT INTO public.moon VALUES (19, 'Rhea', 1672, 1530, 42);
INSERT INTO public.moon VALUES (20, 'Titan', 1655, 5150, 42);
INSERT INTO public.moon VALUES (21, 'Hyperion', 1848, 270, 42);
INSERT INTO public.moon VALUES (22, 'Iapetus', 1671, 1435, 42);
INSERT INTO public.moon VALUES (23, 'Phoebe', 1899, 220, 42);
INSERT INTO public.moon VALUES (24, 'Janus', 1966, 190, 42);
INSERT INTO public.moon VALUES (25, 'Epimetheus', 1966, 120, 42);
INSERT INTO public.moon VALUES (26, 'Atlas', 1980, 40, 42);
INSERT INTO public.moon VALUES (27, 'Prometheus', 1980, 80, 42);
INSERT INTO public.moon VALUES (28, 'Pandora', 1980, 100, 42);
INSERT INTO public.moon VALUES (29, 'Pan', 1990, 20, 42);
INSERT INTO public.moon VALUES (30, 'Ariel', 1851, 1160, 43);
INSERT INTO public.moon VALUES (31, 'Umbriel', 1851, 1190, 43);
INSERT INTO public.moon VALUES (32, 'Titania', 1787, 1610, 43);
INSERT INTO public.moon VALUES (33, 'Oberon', 1787, 1550, 43);
INSERT INTO public.moon VALUES (34, 'Miranda', 1948, 485, 43);
INSERT INTO public.moon VALUES (35, 'Puck', 1985, 170, 43);
INSERT INTO public.moon VALUES (36, 'Triton', 1846, 2720, 44);
INSERT INTO public.moon VALUES (37, 'Nereid', 1949, 340, 44);
INSERT INTO public.moon VALUES (38, 'Despina', 1989, 150, 44);
INSERT INTO public.moon VALUES (39, 'Larissa', 1981, 400, 44);
INSERT INTO public.moon VALUES (40, 'Vanth', 2005, NULL, 46);
INSERT INTO public.moon VALUES (41, 'Charon', 1978, 1200, 47);
INSERT INTO public.moon VALUES (42, 'Nix', 2005, 46, 47);
INSERT INTO public.moon VALUES (43, 'Hydra', 2005, 61, 47);
INSERT INTO public.moon VALUES (44, 'Kerberos', 2011, 28, 47);
INSERT INTO public.moon VALUES (45, 'Styx', 2012, 20, 47);
INSERT INTO public.moon VALUES (46, 'Actaea', 2006, NULL, 54);
INSERT INTO public.moon VALUES (47, 'Hi''iaka', 2005, 400, 48);
INSERT INTO public.moon VALUES (48, 'Namaka', 2005, 200, 48);
INSERT INTO public.moon VALUES (49, 'Weywot', 2007, NULL, 49);
INSERT INTO public.moon VALUES (50, 'Ilmare', 2009, NULL, 55);
INSERT INTO public.moon VALUES (51, 'Xiangliu', 2010, NULL, 51);
INSERT INTO public.moon VALUES (52, 'Dysnomia', 2005, 684, 52);
INSERT INTO public.moon VALUES (53, 'MK2', 2016, 160, 50);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0.24, 58.65, false, 13);
INSERT INTO public.planet VALUES (38, 'Venus', 0.62, 243.02, false, 7);
INSERT INTO public.planet VALUES (39, 'Earth', 1.00, 1.00, true, 10);
INSERT INTO public.planet VALUES (40, 'Mars', 1.88, 1.03, true, 13);
INSERT INTO public.planet VALUES (41, 'Jupiter', 11.86, 0.41, true, 14);
INSERT INTO public.planet VALUES (42, 'Saturn', 29.45, 0.44, true, 9);
INSERT INTO public.planet VALUES (43, 'Uranus', 84.02, 0.72, true, 7);
INSERT INTO public.planet VALUES (44, 'Neptune', 164.79, 0.67, true, 6);
INSERT INTO public.planet VALUES (45, 'Ceres', 4.60, 0.38, false, 12);
INSERT INTO public.planet VALUES (46, 'Orcus', 247.50, 6.30, true, 16);
INSERT INTO public.planet VALUES (47, 'Pluto', 247.90, 6.39, true, 16);
INSERT INTO public.planet VALUES (48, 'Haumea', 283.80, 0.16, true, 8);
INSERT INTO public.planet VALUES (49, 'Quaoar', 288.00, 0.37, true, 17);
INSERT INTO public.planet VALUES (50, 'Makemake', 306.20, 0.95, true, 11);
INSERT INTO public.planet VALUES (51, 'Gonggong', 552.50, 0.93, true, 6);
INSERT INTO public.planet VALUES (52, 'Eris', 559.00, 14.56, true, 14);
INSERT INTO public.planet VALUES (53, 'Sedna', 12059.00, 43.00, false, 13);
INSERT INTO public.planet VALUES (54, 'Salacia', 273.98, 0.50, true, 15);
INSERT INTO public.planet VALUES (55, 'Varda', 313.12, 0.23, true, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (6, 'Salasuud', 612.00, 2.90, '2016-08-21', 11);
INSERT INTO public.star VALUES (7, 'Hamal', 66.00, 2.01, '2016-07-20', 11);
INSERT INTO public.star VALUES (8, 'Arcturus', 37.00, 0.05, '2016-06-30', 11);
INSERT INTO public.star VALUES (9, 'Deneb Algedi', 39.00, 2.85, '2017-02-01', 11);
INSERT INTO public.star VALUES (10, 'Rigil Kentaurus', 4.36, 0.01, '2016-11-06', 11);
INSERT INTO public.star VALUES (11, 'Beta Comae Berenices', 30.00, 4.26, NULL, 11);
INSERT INTO public.star VALUES (12, 'Regulus', 77.00, 1.36, '2016-06-30', 11);
INSERT INTO public.star VALUES (13, 'Aldebaran', 65.23, 0.85, '2016-06-30', 11);
INSERT INTO public.star VALUES (14, 'Diphda', 96.22, 2.04, '2016-08-21', 11);
INSERT INTO public.star VALUES (15, 'Enif', 688.20, 2.40, '2016-07-20', 11);
INSERT INTO public.star VALUES (16, 'Kaus Australis', 143.20, 1.85, '2016-07-20', 11);
INSERT INTO public.star VALUES (17, 'Rasalhague', 48.60, 2.08, '2016-07-20', 11);
INSERT INTO public.star VALUES (18, 'Spica', 260.90, 1.04, '2016-06-30', 11);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 13, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 12, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 53, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 55, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 18, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

