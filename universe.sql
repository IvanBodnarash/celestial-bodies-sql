--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(50) NOT NULL,
    constellation character varying(50) NOT NULL,
    size_kpc numeric(6,1),
    has_life boolean,
    age_million_years integer,
    description text
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
    name character varying(50) NOT NULL,
    orbital_speed_km_s numeric(6,3),
    distance_from_earth_in_km bigint,
    planet_id integer
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
    name character varying(50) NOT NULL,
    surface_gravity numeric(5,3) NOT NULL,
    has_life boolean,
    description text,
    star_id integer
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
-- Name: space_mission; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_mission (
    space_mission_id integer NOT NULL,
    name character varying(50) NOT NULL,
    launch_year integer,
    is_active boolean NOT NULL,
    planet_id integer
);


ALTER TABLE public.space_mission OWNER TO freecodecamp;

--
-- Name: space_mission_space_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_mission_space_mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_mission_space_mission_id_seq OWNER TO freecodecamp;

--
-- Name: space_mission_space_mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_mission_space_mission_id_seq OWNED BY public.space_mission.space_mission_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    spectral_classification character varying(50) NOT NULL,
    radius_km bigint,
    age_million_years integer,
    description text,
    galaxy_id integer
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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: space_mission space_mission_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission ALTER COLUMN space_mission_id SET DEFAULT nextval('public.space_mission_space_mission_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Sagittarius', 26.8, true, 13600, 'The Milky Way contains billions of planetary systems and likely over 100 billion planets');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Andromeda', 2.4, NULL, 10000, 'Andromeda I is a dwarf spheroidal galaxy (dSph) about 2.40 million light-years away in the constellation Andromeda.');
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', 'Canes Venatici', 23.6, NULL, 400, 'The Whirlpool Galaxy, also known as Messier 51a (M51a) or NGC 5194, is an interacting grand-design spiral galaxy with a Seyfert 2 active galactic nucleus.');
INSERT INTO public.galaxy VALUES (4, 'NGC 4845', 'Virgo', 24.5, NULL, 13000, 'NGC 4845 (also known as NGC 4910) is a spiral galaxy located in the constellation Virgo around 65 million light years away.');
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud (SMC)', 'Tucana and Hydrus', 5.8, NULL, 11500, 'The Small Magellanic Cloud (SMC) is a dwarf galaxy near the Milky Way.');
INSERT INTO public.galaxy VALUES (6, 'Lindsay-Shapley Ring', 'Volans', 42.0, NULL, 10000, 'AM 0644–741, also known as the Lindsay-Shapley Ring, is an unbarred lenticular galaxy, and a ring galaxy, which is 300 million light-years away in the southern constellation Volans.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1.022, 384400, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 2.138, 78300000, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 1.351, 78300000, 4);
INSERT INTO public.moon VALUES (4, 'Io', 17.334, 628300000, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 13.740, 628300000, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 10.880, 628300000, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 8.204, 628300000, 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', 26.570, 628300000, 5);
INSERT INTO public.moon VALUES (9, 'Titan', 5.570, 1275000000, 6);
INSERT INTO public.moon VALUES (10, 'Enceladus', 12.640, 1275000000, 6);
INSERT INTO public.moon VALUES (11, 'Mimas', 14.280, 1275000000, 6);
INSERT INTO public.moon VALUES (12, 'Tethys', 11.350, 1275000000, 6);
INSERT INTO public.moon VALUES (13, 'Dione', 10.030, 1275000000, 6);
INSERT INTO public.moon VALUES (14, 'Rhea', 8.480, 1275000000, 6);
INSERT INTO public.moon VALUES (15, 'Iapetus', 3.260, 1275000000, 6);
INSERT INTO public.moon VALUES (16, 'Miranda', 6.660, 2721000000, 7);
INSERT INTO public.moon VALUES (17, 'Ariel', 5.510, 2721000000, 7);
INSERT INTO public.moon VALUES (18, 'Umbriel', 4.670, 2721000000, 7);
INSERT INTO public.moon VALUES (19, 'Titania', 3.640, 2721000000, 7);
INSERT INTO public.moon VALUES (20, 'Oberon', 3.150, 2721000000, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 3.700, false, 'It is a rocky planet with a trace atmosphere and a surface gravity slightly higher than that of Mars.', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 8.870, false, 'Similar in size and mass to Earth, Venus has no liquid water, and its atmosphere is far thicker and denser than that of any other rocky body in the Solar System.', 1);
INSERT INTO public.planet VALUES (3, 'Earth', 9.810, true, 'Earth is the third planet from the Sun and the only astronomical object known to harbor life.', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 3.720, false, 'Mars is a desert-like rocky planet with a tenuous atmosphere that is primarily carbon dioxide.', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 24.790, false, 'This is a gas giant with a mass nearly 2.5 times that of all the other planets in the Solar System.', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 10.440, false, 'It is a gas giant, with an average radius of about 9 times that of Earth.', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 8.690, false, 'Most of the planet is made of water, ammonia, and methane in a supercritical phase of matter.', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 11.270, false, 'It is the fourth-largest planet in the Solar System by diameter, the third-most-massive planet, and the densest giant planet.', 1);
INSERT INTO public.planet VALUES (9, 'Kepler-16b', 14.520, false, 'The historic "First Tatooine." It is a Saturn-sized cold gas giant made of hydrogen and helium.', 2);
INSERT INTO public.planet VALUES (10, 'TOI-1338b', 10.300, false, 'A Neptune-sized planet famous for being discovered by a 17-year-old NASA intern.', 14);
INSERT INTO public.planet VALUES (11, 'Kepler-47b', 2.200, false, 'The innermost planet of the system. It is a hot, low-density Neptune-like planet that orbits very close to its twin suns, giving it a blazing equilibrium temperature.', 16);
INSERT INTO public.planet VALUES (12, 'Kepler-47d', 4.700, false, 'The largest planet in the system, sandwiched between planets b and c.', 16);
INSERT INTO public.planet VALUES (13, 'Kepler-35b', 5.900, false, 'A "sub-Jupiter" gas giant that is roughly 8 times the size of Earth.', 17);


--
-- Data for Name: space_mission; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_mission VALUES (1, 'Mariner 10', 1973, false, 1);
INSERT INTO public.space_mission VALUES (2, 'Magellan', 1989, false, 2);
INSERT INTO public.space_mission VALUES (3, 'Apollo 11', 1969, false, 3);
INSERT INTO public.space_mission VALUES (4, 'Viking 1', 1975, false, 4);
INSERT INTO public.space_mission VALUES (5, 'Curiosity', 2011, true, 4);
INSERT INTO public.space_mission VALUES (6, 'Perseverance', 2020, true, 4);
INSERT INTO public.space_mission VALUES (7, 'Galileo', 1989, false, 5);
INSERT INTO public.space_mission VALUES (8, 'Juno', 2011, true, 5);
INSERT INTO public.space_mission VALUES (9, 'Cassini', 1997, false, 6);
INSERT INTO public.space_mission VALUES (10, 'Voyager 2', 1977, true, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G2V', 695700, 4600, 'The Sun is the star located at the centre of the Solar System.', 1);
INSERT INTO public.star VALUES (2, 'Kepler-16A', 'K-type', 651634, 2000, 'An orange main-sequence star (K-type) with about 69% the mass of our Sun.', 1);
INSERT INTO public.star VALUES (3, 'Kepler-16B', 'M-type', 157456, 2000, 'A small red dwarf (M-type) with about 20% the mass of our Sun.', 1);
INSERT INTO public.star VALUES (4, 'M31-0044', 'Early B-type', 13400000, 10, 'A massive, luminous semidetached binary.', 2);
INSERT INTO public.star VALUES (5, 'M31-V0224', 'B-type Giant', 8300000, 15, 'A detached eclipsing binary located in a young, star-forming spiral arm.', 2);
INSERT INTO public.star VALUES (6, 'DIRECT V01', 'B-type Supergiant', 18100000, 4, 'Discovered by the DIRECT project survey targeting eclipsing binaries.', 2);
INSERT INTO public.star VALUES (7, 'SN 2011dh', 'Yellow Supergiant', 1530000000, 15, 'A dying supergiant star. It was roughly 220 times wider than our Sun and millions of times more luminous.', 3);
INSERT INTO public.star VALUES (8, 'SN 2005cs', 'M-type', 4170000000, 20, 'An bloated, cool giant. If placed in our solar system, its radius would engulf Mars.', 3);
INSERT INTO public.star VALUES (9, 'IGR J12580', 'Brown Dwarf', 75000, 500, 'A faint, dense substellar object torn apart by the core black hole in 2013.', 4);
INSERT INTO public.star VALUES (10, 'NGC4845-RSG1', 'M-type', 5570000000, 15, 'A bloated supergiant star in the galaxys spiral arms. It spans 800 times wider than the Sun', 4);
INSERT INTO public.star VALUES (11, 'NGC4845-LBV1', 'Luminous Blue Variable (O-type)', 700000000, 6, 'An unstable hyper-massive giant. While 100 times wider than the Sun.', 4);
INSERT INTO public.star VALUES (12, 'HD 5980', 'Wolf-Rayet (WN4)', 146000000, 3, 'One of the most massive binary systems known. The primary star is roughly 21 times wider than our Sun.', 5);
INSERT INTO public.star VALUES (13, 'AzV 476', 'Late O-type', 76000000, 4, 'A newly studied eclipsing binary. The primary star is 11 times larger than the Sun.', 5);
INSERT INTO public.star VALUES (14, 'TOI-1338 A', 'F8V (Yellow-white main-sequence)', 913500, 6000, 'It is larger, heavier, and substantially brighter than our Sun.', 1);
INSERT INTO public.star VALUES (15, 'TOI-1338 B', 'M (Red dwarf)', 212800, 6000, 'A small, incredibly faint, and cool low-mass star that orbits its larger companion tightly every 14.6 days.', 1);
INSERT INTO public.star VALUES (16, 'Kepler-47 A', 'G6V (Main-sequence yellow dwarf)', 671270, 4000, 'It is a near-twin to our Sun. It shares nearly identical mass (just 4% heavier) and a slightly smaller radius (96% of the Suns).', 1);
INSERT INTO public.star VALUES (17, 'Kepler-47 B', 'M4V (Main-sequence red dwarf)', 243720, 4000, 'This star is drastically smaller, cooler, and dimmer than the Sun.', 1);
INSERT INTO public.star VALUES (18, 'AM0644-ULX1', 'Neutron Star or Black Hole + Giant Star', 350000000, 10, 'An Ultra-Luminous X-ray source. A collapsed dead star (neutron star/black hole).', 6);
INSERT INTO public.star VALUES (19, 'AM0644-O4V', 'O-type Main Sequence (Blue Giant)', 970000000, 1, 'A blistering, newly formed blue star in the ring. It is roughly 14 times larger than the Sun', 6);
INSERT INTO public.star VALUES (20, 'AM0644-RSG', 'Red Supergiant (M-type)', 6260000000, 8, 'A hyper-expanded dying star on the verge of a supernova. It is 900 times wider than the Sun.', 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: space_mission_space_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_mission_space_mission_id_seq', 10, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 20, true);


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
-- Name: space_mission space_mission_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_name_key UNIQUE (name);


--
-- Name: space_mission space_mission_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_pkey PRIMARY KEY (space_mission_id);


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
-- Name: space_mission space_mission_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

