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
-- Name: being; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.being (
    being_id integer NOT NULL,
    is_human boolean,
    planet_id integer NOT NULL,
    name character varying(250) NOT NULL
);


ALTER TABLE public.being OWNER TO freecodecamp;

--
-- Name: being_being_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.being ALTER COLUMN being_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.being_being_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    distance_from_earth numeric(15,4),
    number_of_stars bigint,
    age_in_million_years numeric(15,2),
    has_blackholes boolean,
    galaxy_types character varying(80),
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
    name character varying(250) NOT NULL,
    moon_types character varying(80),
    age_in_million_years numeric(15,2),
    distance_from_earth numeric(15,4),
    planet_id integer,
    is_spherical boolean,
    description text,
    has_life boolean DEFAULT false,
    size integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.moon ALTER COLUMN moon_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.moon_moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_types character varying(80),
    age_in_million_years numeric(15,2),
    distance_from_earth numeric(15,4),
    number_of_moons integer,
    galaxy_id integer,
    star_id integer,
    description text,
    has_life boolean DEFAULT false,
    is_spherical boolean,
    size integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.planet ALTER COLUMN planet_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.planet_planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    is_star_system boolean,
    star_types character varying(80),
    age_in_million_years numeric(15,2),
    distance_from_earth numeric(15,4),
    description text
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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: being; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.being OVERRIDING SYSTEM VALUE VALUES (1, true, 6, 'Pete');
INSERT INTO public.being OVERRIDING SYSTEM VALUE VALUES (2, true, 6, 'Peeve');
INSERT INTO public.being OVERRIDING SYSTEM VALUE VALUES (3, false, 7, 'Martian');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0.0000, 400000000000, 13610000000.00, true, 'Barred Spiral', 'Our home galaxy, containing our Solar System and a barred spiral structure.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 2500000.0000, 1000000000000, 10000000000.00, true, 'Spiral', 'The closest major galaxy to the Milky Way; on a collision course with us.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 2900000.0000, 40000000000, 10000000000.00, true, 'Spiral', 'The third-largest member of our Local Group of galaxies, known for active star formation.');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 163000.0000, 30000000000, 1300000000.00, true, 'Irregular/Magellanic Spiral', 'A bright satellite galaxy of the Milky Way visible from the Southern Hemisphere.');
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 23000000.0000, 800000000000, 13200000000.00, true, 'Spiral/Lenticular', 'Famous for its bright nucleus and a striking, broad dust lane that gives it a hat-like appearance.');
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 23000000.0000, 100000000000, 500000000.00, true, 'Spiral', 'A classic grand-design spiral galaxy interacting gravitationally with a smaller companion galaxy.');
INSERT INTO public.galaxy VALUES (7, 'Messier 87', 53000000.0000, 1000000000000, 130000000000.00, true, 'Elliptical', 'A massive elliptical galaxy in the Virgo Cluster featuring a famous supermassive black hole imaged in 2019.');
INSERT INTO public.galaxy VALUES (8, 'Cartwheel Galaxy', 500000000.0000, 1000000000, 300000000.00, true, 'Lenticular/Ring', 'A striking ring galaxy formed by a high-speed collision with a smaller companion galaxy.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (1, 'Moon', 'Natural Satellite (Terrestrial)', 4530.00, 0.0000, 6, true, 'Earths only natural satellite and the fifth largest moon in the Solar System.', false, 1737);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (2, 'Phobos', 'Irregular (Captured Asteroid/Planetesimal)', 4500.00, 0.0000, 7, false, 'The larger and closer of the two natural satellites of Mars, heavily cratered and irregularly shaped.', false, 11);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (3, 'Deimos', 'Irregular (Captured Asteroid/Planetesimal)', 4500.00, 0.0000, 7, false, 'The smaller and outermost of the two moons orbiting Mars, characterized by a smooth, dust-covered surface.', false, 6);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (4, 'Io', 'Galilean / Volcanic', 4503.00, 0.0000, 19, true, 'The most volcanically active body in the Solar System, orbiting Jupiter.', false, 1821);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (5, 'Europa', 'Galilean / Ice-covered', 4503.00, 0.0000, 19, true, 'An icy moon of Jupiter with a subsurface global ocean that could potentially harbor life.', false, 1560);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (6, 'Ganymede', 'Galilean / Rocky-Icy', 4503.00, 0.0000, 19, true, 'The largest moon in the Solar System, even bigger than Mercury, orbiting Jupiter.', false, 2634);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (7, 'Callisto', 'Galilean / Heavily Cratered', 4503.00, 0.0000, 19, true, 'The most heavily cratered object in the Solar System, orbiting Jupiter.', false, 2410);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (8, 'Titan', 'Icy / Dense Atmosphere', 4503.00, 0.0000, 20, true, 'Saturns largest moon, featuring a thick nitrogen atmosphere and surface lakes of liquid methane.', false, 2574);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (9, 'Enceladus', 'Icy / Cryovolcanic', 4503.00, 0.0000, 20, true, 'A small icy moon of Saturn with active geysers spewing water vapor and organic molecules from a subsurface ocean.', false, 252);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (10, 'Mimas', 'Icy / Impact Crater', 4503.00, 0.0000, 20, true, 'A moon of Saturn famously dominated by the giant Herschel impact crater, giving it a Death Star appearance.', false, 198);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (11, 'Titania', 'Icy / Terrestrial', 4503.00, 0.0000, 21, true, 'The largest moon of Uranus, characterized by massive canyon systems and fault lines.', false, 788);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (12, 'Oberon', 'Icy / Cratered', 4503.00, 0.0000, 21, true, 'The outermost major moon of Uranus, featuring old, heavily cratered terrain and dark impact basins.', false, 761);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (13, 'Umbriel', 'Icy / Dark Surface', 4503.00, 0.0000, 21, true, 'The darkest of the major moons of Uranus, known for a mysterious bright ring of material in one of its craters.', false, 584);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (14, 'Ariel', 'Icy / Bright Smooth Terrain', 4503.00, 0.0000, 21, true, 'The brightest and possibly youngest-looking major moon of Uranus, featuring extensive valley networks.', false, 578);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (15, 'Miranda', 'Icy / Complex Jumbled Terrain', 4503.00, 0.0000, 21, true, 'The innermost and most unusual of the major Uranian moons, featuring extreme cliff walls and canyon structures.', false, 235);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (16, 'Triton', 'Retrograde / Cryovolcanic', 4503.00, 0.0000, 22, true, 'Neptunes largest moon, orbiting in a retrograde direction and featuring active nitrogen geysers.', false, 1353);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (17, 'Proteus', 'Irregular / Heavily Cratered', 4503.00, 0.0000, 22, true, 'A dark, irregularly shaped inner moon of Neptune that is close to the limit where gravity pulls a body into a sphere.', false, 210);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (18, 'Charon', 'Icy / Barycentric Companion', 4503.00, 0.0000, 24, true, 'The largest moon of Pluto, so massive that Pluto and Charon orbit a common center of mass outside Pluto.', false, 606);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (19, 'Nix', 'Small / Irregular Outer Moon', 4503.00, 0.0000, 24, true, 'A small, elongated natural satellite orbiting the Pluto-Charon system.', false, 49);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (20, 'Hydra', 'Small / Irregular Outer Moon', 4503.00, 0.0000, 24, true, 'The outermost known moon of the Pluto system, featuring a highly irregular shape and icy composition.', false, 51);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (6, 'Earth', 'Terrestrial', 4543.00, 0.0000, 1, 1, 2, 'Our home planet, the only known world harboring life, located in the Milky Way.', true, true, 6371);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (7, 'Mars', 'Terrestrial', 4603.00, 0.0000, 2, 1, 2, 'The dusty, cold, desert world with a very thin atmosphere, known as the Red Planet.', false, true, 3389);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (19, 'Jupiter', 'Gas Giant', 4503.00, 0.0000, 95, 1, 2, 'The largest planet in our Solar System, famous for its Great Red Spot storm and numerous moons.', false, true, 69911);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (20, 'Saturn', 'Gas Giant', 4503.00, 0.0000, 146, 1, 2, 'The iconic ringed gas giant, renowned for its extensive and complex system of icy rings.', false, true, 58232);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (21, 'Uranus', 'Ice Giant', 4503.00, 0.0000, 28, 1, 2, 'A pale blue ice giant that orbits the Sun on its side due to a severe axial tilt.', false, true, 25362);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (22, 'Neptune', 'Ice Giant', 4503.00, 0.0000, 16, 1, 2, 'The outermost major planet in our Solar System, characterized by deep blue coloration and supersonic winds.', false, true, 24622);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (17, 'Mercury', 'Terrestrial', 4503.00, 0.0000, 0, 1, 2, 'The smallest and closest planet to the Sun, with extreme temperature fluctuations.', false, true, 2439);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (18, 'Venus', 'Terrestrial', 4503.00, 0.0000, 0, 1, 2, 'A scorching hot rocky world wrapped in a dense, toxic carbon dioxide atmosphere with a runaway greenhouse effect.', false, true, 6051);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (24, 'Pluto', 'Dwarf Planet (Ice Dwarf)', 4503.00, 4.6700, 5, 1, 2, 'A complex icy dwarf planet in the Kuiper Belt, formerly classified as the ninth planet of our Solar System.', false, true, 1188);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (8, 'Proxima Centauri b', 'Exoplanet (Terrestrial)', 4850.00, 4.2500, 0, 1, 3, 'A rocky exoplanet orbiting within the habitable zone of the red dwarf star Proxima Centauri.', false, true, 6999);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (9, 'Sirius b b (Hypothetical/Notional)', 'Gas Giant', 242.00, 8.6000, 0, 1, 4, 'A hypothetical or placeholder gas giant located within the Sirius multi-star system.', false, true, 45000);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (10, 'WOH G64 b (Hypothetical)', 'Gas Giant', 4.00, 160000.0000, 0, 2, 10, 'A hypothetical giant planet orbiting the massive hypergiant star WOH G64 in the Large Magellanic Cloud.', false, true, 900000);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Sun', 1, true, 'G-type Main-Sequence (Yellow Dwarf)', 4600.00, 0.0000, 'The star at the center of our Solar System, vital for life on Earth.');
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1, true, 'M-type Main-Sequence (Red Dwarf)', 4850.00, 4.2500, 'The closest known star to the Sun, part of the Alpha Centauri triple star system.');
INSERT INTO public.star VALUES (4, 'Sirius', 1, true, 'A-type Main-Sequence (White Dwarf binary)', 242.00, 8.6000, 'The brightest star in the night sky, located in the constellation Canis Major.');
INSERT INTO public.star VALUES (5, 'Betelgeuse', 1, false, 'M-type Supergiant (Red Supergiant)', 8.50, 642.5000, 'A massive, highly luminous red supergiant in the constellation Orion, nearing the end of its life cycle.');
INSERT INTO public.star VALUES (6, 'Vega', 1, true, 'A-type Main-Sequence', 455.00, 25.0400, 'A bright, rapidly rotating star in the constellation Lyra, historically used as a baseline for the photometric magnitude scale.');
INSERT INTO public.star VALUES (7, 'Polaris', 1, true, 'F-type Supergiant (Yellow Supergiant)', 70.00, 433.0000, 'The current northern pole star, part of a multiple star system in the constellation Ursa Minor.');
INSERT INTO public.star VALUES (8, 'Alpha Centauri A', 1, true, 'G-type Main-Sequence', 5000.00, 4.3700, 'The primary star of the Alpha Centauri system, very similar in mass and type to our Sun.');
INSERT INTO public.star VALUES (9, 'Rigel', 1, true, 'B-type Supergiant (Blue Supergiant)', 8.00, 863.0000, 'A scorching blue supergiant star in the constellation Orion, vastly brighter than the Sun.');
INSERT INTO public.star VALUES (10, 'WOH G64', 4, false, 'Red Supergiant', 4.00, 160000.0000, 'A massive hypergiant star located in the Large Magellanic Cloud, surrounded by a dusty cocoon.');
INSERT INTO public.star VALUES (11, 'S Doradus', 4, false, 'Luminous Blue Variable (LBV)', 5.00, 163000.0000, 'One of the most luminous individual stars known, situated in the Large Magellanic Cloud.');
INSERT INTO public.star VALUES (12, 'B324', 3, false, 'Yellow Supergiant', 10.00, 2900000.0000, 'A bright extragalactic star located within the spiral arms of the Triangulum Galaxy (M33).');
INSERT INTO public.star VALUES (13, 'LGGS J004406.32+420131.3', 2, false, 'Yellow Supergiant', 12.00, 2500000.0000, 'One of the brightest confirmed individual stars in the Andromeda Galaxy (M31).');


--
-- Name: being_being_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.being_being_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 13, true);


--
-- Name: being being_being_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.being
    ADD CONSTRAINT being_being_id_key UNIQUE (being_id);


--
-- Name: being being_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.being
    ADD CONSTRAINT being_name_key UNIQUE (name);


--
-- Name: being being_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.being
    ADD CONSTRAINT being_pkey PRIMARY KEY (being_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


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
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


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
-- Name: planet planet_name_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_planet_id_key UNIQUE (name, planet_id);


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
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: being being_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.being
    ADD CONSTRAINT being_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

