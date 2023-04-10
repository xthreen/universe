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
    name character varying(60) NOT NULL,
    distance_in_kpc numeric(5,1),
    coordinates text,
    distance_in_ly integer,
    size_in_ly integer,
    visible_with_naked_eye boolean
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
    name character varying(60) NOT NULL,
    planet_id integer,
    visible_with_naked_eye boolean,
    radius_in_km integer
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
-- Name: novae; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.novae (
    novae_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.novae OWNER TO freecodecamp;

--
-- Name: novae_nova_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.novae_nova_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.novae_nova_id_seq OWNER TO freecodecamp;

--
-- Name: novae_nova_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.novae_nova_id_seq OWNED BY public.novae.novae_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    star_id integer,
    visible_with_naked_eye boolean,
    radius_in_km integer,
    number_of_moons integer,
    is_exoplanet boolean
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
    name character varying(60) NOT NULL,
    galaxy_id integer,
    distance_in_ly integer,
    description text,
    visible_with_naked_eye boolean,
    solar_radii integer
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: novae novae_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.novae ALTER COLUMN novae_id SET DEFAULT nextval('public.novae_nova_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 7.9, '17h 45m 40.03599s -29° 00´ 28.1699"', 26996, 87400, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 765.0, '00h 42m 44.3s +41° 16´ 9"', 250000000, 152000, true);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 50.0, '05h 23m 34.5s -69° 45´ 22"', 163000, 32000, true);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 970.0, '01h 33m 50.9s +30° 39´ 36"', 3200000, 61120, true);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 9550.0, '12h 39m 59.4s -11° 37´ 33"', 31100000, 49000, false);
INSERT INTO public.galaxy VALUES (4, 'Small Magellanic Cloud', 62.4, '00h 52m 44.8s -72° 49´ 43"', 203700, 18900, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, true, 1737);
INSERT INTO public.moon VALUES (2, 'Io', 3, false, 1821);
INSERT INTO public.moon VALUES (3, 'Europa', 3, false, 1560);
INSERT INTO public.moon VALUES (4, 'Ganymede', 3, false, 2634);
INSERT INTO public.moon VALUES (5, 'Callisto', 3, false, 2410);
INSERT INTO public.moon VALUES (6, 'Adrastea', 3, false, 8);
INSERT INTO public.moon VALUES (7, 'Metis', 3, false, 21);
INSERT INTO public.moon VALUES (8, 'Thebe', 3, false, 49);
INSERT INTO public.moon VALUES (9, 'Amalthea', 3, false, 83);
INSERT INTO public.moon VALUES (10, 'Himalia', 3, false, 69);
INSERT INTO public.moon VALUES (11, 'Elara', 3, false, 39);
INSERT INTO public.moon VALUES (12, 'Pasiphae', 3, false, 29);
INSERT INTO public.moon VALUES (13, 'Carme', 3, false, 23);
INSERT INTO public.moon VALUES (14, 'Sinope', 3, false, 17);
INSERT INTO public.moon VALUES (15, 'Titan', 4, false, 2574);
INSERT INTO public.moon VALUES (16, 'Rhea', 4, false, 763);
INSERT INTO public.moon VALUES (17, 'Iapetus', 4, false, 902);
INSERT INTO public.moon VALUES (18, 'Dione', 4, false, 531);
INSERT INTO public.moon VALUES (19, 'Tethys', 4, false, 531);
INSERT INTO public.moon VALUES (20, 'Enceladus', 4, false, 252);


--
-- Data for Name: novae; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.novae VALUES (1, 'SN 185', 1);
INSERT INTO public.novae VALUES (2, 'SN 386', 1);
INSERT INTO public.novae VALUES (3, 'SN 393', 1);
INSERT INTO public.novae VALUES (4, 'SN 1006', 1);
INSERT INTO public.novae VALUES (5, 'SN 1885A', 2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, 6371, 1, false);
INSERT INTO public.planet VALUES (2, 'Mars', 1, true, 3389, 2, false);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, true, 69911, 95, false);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, true, 58232, 83, false);
INSERT INTO public.planet VALUES (5, 'Uranus', 1, false, 25362, 27, false);
INSERT INTO public.planet VALUES (6, 'Neptune', 1, false, 24622, 14, false);
INSERT INTO public.planet VALUES (7, 'Proxima Centauri b', 5, false, NULL, NULL, true);
INSERT INTO public.planet VALUES (8, 'Proxima Centauri d', 5, false, NULL, NULL, true);
INSERT INTO public.planet VALUES (9, 'Mercury', 1, true, 4880, 0, false);
INSERT INTO public.planet VALUES (10, 'Venus', 1, true, 6051, 0, false);
INSERT INTO public.planet VALUES (11, 'Pluto', 1, false, 2376, 1, false);
INSERT INTO public.planet VALUES (12, 'Ceres', 1, false, 966, 0, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1, NULL, 'Our Home Star, the Sun, is a yellow dwarf star located at the center of our solar system.', true, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 9, 'The brightest star in the night night sky, located in the constellation Canis Major, it is a binary star system consisting of a main-sequence star and a white-dwarf.', true, 2);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 548, 'A red supergiant star located in the constellation Orion, it is one of the largest and most luminous stars in the Milky Way galaxy.', true, 764);
INSERT INTO public.star VALUES (4, 'Vega', 1, 25, 'A blue-white main-sequence star located in the constellation Lyra, it is one of the brightest stars in the northern hemisphere and is often used as a standard reference star for astronomers', true, 2);
INSERT INTO public.star VALUES (5, 'Alpha Centauri', 1, 4, 'A triple star system consisting of three stars: Alpha Centauri A, Alpha Centauri B, and Proxima Centauri. It is the closest star system to Earth, located approximately 4.37 light years away.', false, 1);
INSERT INTO public.star VALUES (6, 'Polaris', 1, 433, 'A yellow supergiant star located in the constellation Ursa Minor, it is also known as the North Star and has been used for navigation for thousands of years.', true, 37);
INSERT INTO public.star VALUES (7, 'Antares', 1, 550, 'A red supergiant star located in the constellation Scorpius, it is one of the brightest stars in the sky and has a diameter approximately 700 times that of the Sun.', true, 5);
INSERT INTO public.star VALUES (8, 'Rigel', 1, 863, 'A blue supergiant star located in the constellation Orion, it is one of the brightest stars in the sky and is approximately 40 000 times more luminous than the Sun', true, 78);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: novae_nova_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.novae_nova_id_seq', 5, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


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
-- Name: novae novae_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.novae
    ADD CONSTRAINT novae_name_key UNIQUE (name);


--
-- Name: novae novae_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.novae
    ADD CONSTRAINT novae_pkey PRIMARY KEY (novae_id);


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
-- Name: novae novae_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.novae
    ADD CONSTRAINT novae_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

