--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: CrewDatabase; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE "CrewDatabase" IS 'Database Task SeekAndHit';


--
-- Name: airport; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA airport;


ALTER SCHEMA airport OWNER TO postgres;

--
-- Name: SCHEMA airport; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA airport IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = airport, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: aircraft; Type: TABLE; Schema: airport; Owner: postgres
--

CREATE TABLE aircraft (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE aircraft OWNER TO postgres;

--
-- Name: aircraft_crew; Type: TABLE; Schema: airport; Owner: postgres
--

CREATE TABLE aircraft_crew (
    id integer NOT NULL,
    crew_id integer NOT NULL,
    aircraft_id integer NOT NULL,
    date_assigned timestamp without time zone
);


ALTER TABLE aircraft_crew OWNER TO postgres;

--
-- Name: aircraft_crew_id_seq; Type: SEQUENCE; Schema: airport; Owner: postgres
--

CREATE SEQUENCE aircraft_crew_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE aircraft_crew_id_seq OWNER TO postgres;

--
-- Name: aircraft_crew_id_seq; Type: SEQUENCE OWNED BY; Schema: airport; Owner: postgres
--

ALTER SEQUENCE aircraft_crew_id_seq OWNED BY aircraft_crew.id;


--
-- Name: aircraft_id_seq; Type: SEQUENCE; Schema: airport; Owner: postgres
--

CREATE SEQUENCE aircraft_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE aircraft_id_seq OWNER TO postgres;

--
-- Name: aircraft_id_seq; Type: SEQUENCE OWNED BY; Schema: airport; Owner: postgres
--

ALTER SEQUENCE aircraft_id_seq OWNED BY aircraft.id;


--
-- Name: crew; Type: TABLE; Schema: airport; Owner: postgres
--

CREATE TABLE crew (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    date_of_employment timestamp without time zone
);


ALTER TABLE crew OWNER TO postgres;

--
-- Name: crew_id_seq; Type: SEQUENCE; Schema: airport; Owner: postgres
--

CREATE SEQUENCE crew_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE crew_id_seq OWNER TO postgres;

--
-- Name: crew_id_seq; Type: SEQUENCE OWNED BY; Schema: airport; Owner: postgres
--

ALTER SEQUENCE crew_id_seq OWNED BY crew.id;


--
-- Name: aircraft id; Type: DEFAULT; Schema: airport; Owner: postgres
--

ALTER TABLE ONLY aircraft ALTER COLUMN id SET DEFAULT nextval('aircraft_id_seq'::regclass);


--
-- Name: aircraft_crew id; Type: DEFAULT; Schema: airport; Owner: postgres
--

ALTER TABLE ONLY aircraft_crew ALTER COLUMN id SET DEFAULT nextval('aircraft_crew_id_seq'::regclass);


--
-- Name: crew id; Type: DEFAULT; Schema: airport; Owner: postgres
--

ALTER TABLE ONLY crew ALTER COLUMN id SET DEFAULT nextval('crew_id_seq'::regclass);


--
-- Name: aircraft_crew aircraft_crew_pkey; Type: CONSTRAINT; Schema: airport; Owner: postgres
--

ALTER TABLE ONLY aircraft_crew
    ADD CONSTRAINT aircraft_crew_pkey PRIMARY KEY (id);


--
-- Name: aircraft aircraft_pkey; Type: CONSTRAINT; Schema: airport; Owner: postgres
--

ALTER TABLE ONLY aircraft
    ADD CONSTRAINT aircraft_pkey PRIMARY KEY (id);


--
-- Name: crew crew_pkey; Type: CONSTRAINT; Schema: airport; Owner: postgres
--

ALTER TABLE ONLY crew
    ADD CONSTRAINT crew_pkey PRIMARY KEY (id);


--
-- Name: aircraft_crew aircraft_crew_aircraft_id_fkey; Type: FK CONSTRAINT; Schema: airport; Owner: postgres
--

ALTER TABLE ONLY aircraft_crew
    ADD CONSTRAINT aircraft_crew_aircraft_id_fkey FOREIGN KEY (aircraft_id) REFERENCES aircraft(id);


--
-- Name: aircraft_crew aircraft_crew_crew_id_fkey; Type: FK CONSTRAINT; Schema: airport; Owner: postgres
--

ALTER TABLE ONLY aircraft_crew
    ADD CONSTRAINT aircraft_crew_crew_id_fkey FOREIGN KEY (crew_id) REFERENCES crew(id);


--
-- PostgreSQL database dump complete
--

--
--	Testing DATA   
--

INSERT INTO crew(name, date_of_employment) VALUES ('Tomislav Nebojsa Tokic', '1988-01-17');
INSERT INTO crew(name, date_of_employment) VALUES ('Marin Nikolic', '1991-11-05');
INSERT INTO crew(name, date_of_employment) VALUES ('Nikola Dujmovic', '1993-01-18');
INSERT INTO crew(name, date_of_employment) VALUES ('Zdravko Tokic', '1956-05-17');
INSERT INTO crew(name, date_of_employment) VALUES ('Neven Lastro', '1988-10-01');
INSERT INTO crew(name, date_of_employment) VALUES ('Igor Dujmovic', '1991-01-17');
INSERT INTO aircraft(name) VALUES ('Peon');
INSERT INTO aircraft(name) VALUES ('Wisp');
INSERT INTO aircraft(name) VALUES ('Grunt');
INSERT INTO aircraft(name) VALUES ('Huntress');
INSERT INTO aircraft_crew(crew_id, aircraft_id, date_assigned) VALUES (1,3,'YESTERDAY');
INSERT INTO aircraft_crew(crew_id, aircraft_id, date_assigned) VALUES (1,4,'NOW');
INSERT INTO aircraft_crew(crew_id, aircraft_id, date_assigned) VALUES (1,2,'TOMORROW');
INSERT INTO aircraft_crew(crew_id, aircraft_id, date_assigned) VALUES (2,2,'TODAY');
INSERT INTO aircraft_crew(crew_id, aircraft_id, date_assigned) VALUES (3,3,'YESTERDAY');
INSERT INTO aircraft_crew(crew_id, aircraft_id, date_assigned) VALUES (3,2,'NOW');
INSERT INTO aircraft_crew(crew_id, aircraft_id, date_assigned) VALUES (4,1,'NOW');
INSERT INTO aircraft_crew(crew_id, aircraft_id, date_assigned) VALUES (5,2,'TODAY');
INSERT INTO aircraft_crew(crew_id, aircraft_id, date_assigned) VALUES (5,3,'TODAY');

--
-- Sample Queries
--
/* Oldest */
SELECT name FROM crew ORDER BY date_of_employment LIMIT 1; 
/* Fifth oldest */
SELECT name FROM crew ORDER BY date_of_employment LIMIT 1 OFFSET 4; 
/* Most experienced */
SELECT name FROM crew ORDER BY (SELECT COUNT(*) FROM aircraft_crew WHERE aircraft_crew.crew_id = crew.id) DESC LIMIT 1; 
/* Least experienced */
SELECT name FROM crew ORDER BY (SELECT COUNT(*) FROM aircraft_crew WHERE aircraft_crew.crew_id = crew.id) LIMIT 1; 
 

