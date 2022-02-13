--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

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
-- Name: candidate_educations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.candidate_educations (
    id integer NOT NULL,
    school_id integer NOT NULL,
    department_id integer NOT NULL,
    beginning_date date NOT NULL,
    ending_date date,
    candidate_id integer NOT NULL
);


ALTER TABLE public.candidate_educations OWNER TO postgres;

--
-- Name: candidate_images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.candidate_images (
    id integer NOT NULL,
    candidate_id integer NOT NULL,
    url character varying NOT NULL,
    image_id character varying NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.candidate_images OWNER TO postgres;

--
-- Name: candidate_images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.candidate_images ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.candidate_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 3000
    CACHE 1
);


--
-- Name: candidate_languages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.candidate_languages (
    id integer NOT NULL,
    candidate_id integer NOT NULL,
    language_id integer NOT NULL,
    level character(1) NOT NULL
);


ALTER TABLE public.candidate_languages OWNER TO postgres;

--
-- Name: candidate_languages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.candidate_languages ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.candidate_languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 3000
    CACHE 1
);


--
-- Name: candidate_programming_languages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.candidate_programming_languages (
    id integer NOT NULL,
    candidate_id integer NOT NULL,
    programming_language_id integer NOT NULL
);


ALTER TABLE public.candidate_programming_languages OWNER TO postgres;

--
-- Name: candidate_programming_languages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.candidate_programming_languages ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.candidate_programming_languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 3000
    CACHE 1
);


--
-- Name: candidate_technologies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.candidate_technologies (
    id integer NOT NULL,
    candidate_id integer NOT NULL,
    technology_id integer NOT NULL
);


ALTER TABLE public.candidate_technologies OWNER TO postgres;

--
-- Name: candidate_technologies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.candidate_technologies ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.candidate_technologies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 3000
    CACHE 1
);


--
-- Name: candidate_websites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.candidate_websites (
    id integer NOT NULL,
    candidate_id integer NOT NULL,
    github_address character varying,
    linkedin_address character varying
);


ALTER TABLE public.candidate_websites OWNER TO postgres;

--
-- Name: candidate_websites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.candidate_websites ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.candidate_websites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 3000
    CACHE 1
);


--
-- Name: candidate_work_experiences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.candidate_work_experiences (
    id integer NOT NULL,
    candidate_id integer NOT NULL,
    work_place character varying(50) NOT NULL,
    "position" character varying(50) NOT NULL,
    beginning_date date NOT NULL,
    ending_date date
);


ALTER TABLE public.candidate_work_experiences OWNER TO postgres;

--
-- Name: candidates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.candidates (
    id integer NOT NULL,
    first_name character varying(35) NOT NULL,
    last_name character varying(20) NOT NULL,
    identity_number character varying(11) NOT NULL,
    birth_year integer NOT NULL
);


ALTER TABLE public.candidates OWNER TO postgres;

--
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    city_name character varying(20) NOT NULL
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.cities ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    school_id integer NOT NULL
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- Name: departments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.departments ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.departments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 3200
    CACHE 1
);


--
-- Name: educations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.candidate_educations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.educations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 3200
    CACHE 1
);


--
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    id integer NOT NULL,
    first_name character varying(35) NOT NULL,
    last_name character varying(20) NOT NULL
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- Name: employers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employers (
    id integer NOT NULL,
    company_name character varying(255) NOT NULL,
    web_address character varying(50) NOT NULL,
    phone_number character varying(12) NOT NULL
);


ALTER TABLE public.employers OWNER TO postgres;

--
-- Name: job_advertisements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_advertisements (
    id integer NOT NULL,
    employer_id integer NOT NULL,
    job_id integer NOT NULL,
    city_id integer NOT NULL,
    work_type_id integer NOT NULL,
    work_time_type_id integer NOT NULL,
    min_salary numeric(8,3),
    max_salary numeric(8,3),
    position_description character varying NOT NULL,
    open_position integer NOT NULL,
    created_date date DEFAULT CURRENT_DATE,
    last_apply_date date NOT NULL,
    is_active boolean DEFAULT false
);


ALTER TABLE public.job_advertisements OWNER TO postgres;

--
-- Name: job_titles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_titles (
    id integer NOT NULL,
    title character varying NOT NULL
);


ALTER TABLE public.job_titles OWNER TO postgres;

--
-- Name: work_time_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.work_time_types (
    id integer NOT NULL,
    time_type character varying(20) NOT NULL
);


ALTER TABLE public.work_time_types OWNER TO postgres;

--
-- Name: work_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.work_types (
    id integer NOT NULL,
    type character varying(20) NOT NULL
);


ALTER TABLE public.work_types OWNER TO postgres;

--
-- Name: inactive_job_advertisements; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.inactive_job_advertisements AS
 SELECT jb.id AS jobadvertisementid,
    e.company_name,
    jt.title,
    c.city_name,
    w_type.type,
    w_time_type.time_type,
    jb.min_salary,
    jb.max_salary,
    jb.position_description,
    jb.open_position,
    jb.created_date,
    jb.last_apply_date
   FROM (((((public.job_advertisements jb
     JOIN public.employers e ON ((jb.employer_id = e.id)))
     JOIN public.job_titles jt ON ((jb.job_id = jt.id)))
     JOIN public.cities c ON ((jb.city_id = c.id)))
     JOIN public.work_types w_type ON ((jb.work_type_id = w_type.id)))
     JOIN public.work_time_types w_time_type ON ((jb.work_time_type_id = w_time_type.id)))
  WHERE (jb.is_active = false);


ALTER TABLE public.inactive_job_advertisements OWNER TO postgres;

--
-- Name: job_advertisements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.job_advertisements ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.job_advertisements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: job_titles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.job_titles ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.job_titles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 32676
    CACHE 1
);


--
-- Name: languages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.languages (
    id integer NOT NULL,
    name character varying(10) NOT NULL,
    level character(1)
);


ALTER TABLE public.languages OWNER TO postgres;

--
-- Name: languages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.languages ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 3000
    CACHE 1
);


--
-- Name: programming_languages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.programming_languages (
    id integer NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.programming_languages OWNER TO postgres;

--
-- Name: programming_languages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.programming_languages ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.programming_languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 3000
    CACHE 1
);


--
-- Name: schools; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schools (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.schools OWNER TO postgres;

--
-- Name: schools_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.schools ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.schools_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 3200
    CACHE 1
);


--
-- Name: technologies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.technologies (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.technologies OWNER TO postgres;

--
-- Name: technologies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.technologies ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.technologies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 3000
    CACHE 1
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(50) NOT NULL,
    password character varying(25) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 32676
    CACHE 1
);


--
-- Name: verification_code_candidates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.verification_code_candidates (
    id integer NOT NULL,
    candidate_id integer NOT NULL
);


ALTER TABLE public.verification_code_candidates OWNER TO postgres;

--
-- Name: verification_code_employers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.verification_code_employers (
    id integer NOT NULL,
    employer_id integer NOT NULL
);


ALTER TABLE public.verification_code_employers OWNER TO postgres;

--
-- Name: verification_codes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.verification_codes (
    id integer NOT NULL,
    code character varying NOT NULL,
    is_verified boolean NOT NULL,
    verified_date date
);


ALTER TABLE public.verification_codes OWNER TO postgres;

--
-- Name: verification_codes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.verification_codes ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.verification_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 32676
    CACHE 1
);


--
-- Name: work_experiences_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.candidate_work_experiences ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.work_experiences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 3200
    CACHE 1
);


--
-- Name: work_time_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.work_time_types ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.work_time_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: work_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.work_types ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.work_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: job_advertisements job_advertisements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_advertisements
    ADD CONSTRAINT job_advertisements_pkey PRIMARY KEY (id);


--
-- Name: candidate_educations pk_candidate_education; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_educations
    ADD CONSTRAINT pk_candidate_education PRIMARY KEY (id);


--
-- Name: candidate_images pk_candidate_image; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_images
    ADD CONSTRAINT pk_candidate_image PRIMARY KEY (id);


--
-- Name: candidate_languages pk_candidate_language; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_languages
    ADD CONSTRAINT pk_candidate_language PRIMARY KEY (id);


--
-- Name: candidate_programming_languages pk_candidate_programming_language; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_programming_languages
    ADD CONSTRAINT pk_candidate_programming_language PRIMARY KEY (id);


--
-- Name: candidate_technologies pk_candidate_technology; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_technologies
    ADD CONSTRAINT pk_candidate_technology PRIMARY KEY (id);


--
-- Name: candidate_websites pk_candidate_website; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_websites
    ADD CONSTRAINT pk_candidate_website PRIMARY KEY (id);


--
-- Name: candidate_work_experiences pk_candidate_work_experience; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_work_experiences
    ADD CONSTRAINT pk_candidate_work_experience PRIMARY KEY (id);


--
-- Name: candidates pk_candidates; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidates
    ADD CONSTRAINT pk_candidates PRIMARY KEY (id);


--
-- Name: departments pk_department; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT pk_department PRIMARY KEY (id);


--
-- Name: employees pk_employees; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT pk_employees PRIMARY KEY (id);


--
-- Name: employers pk_employers; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employers
    ADD CONSTRAINT pk_employers PRIMARY KEY (id);


--
-- Name: job_titles pk_job_titles; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT pk_job_titles PRIMARY KEY (id);


--
-- Name: languages pk_language; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT pk_language PRIMARY KEY (id);


--
-- Name: programming_languages pk_programming_language; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programming_languages
    ADD CONSTRAINT pk_programming_language PRIMARY KEY (id);


--
-- Name: schools pk_school; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schools
    ADD CONSTRAINT pk_school PRIMARY KEY (id);


--
-- Name: technologies pk_technology; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.technologies
    ADD CONSTRAINT pk_technology PRIMARY KEY (id);


--
-- Name: users pk_users; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT pk_users PRIMARY KEY (id);


--
-- Name: verification_code_candidates pk_verification_code_candidates; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.verification_code_candidates
    ADD CONSTRAINT pk_verification_code_candidates PRIMARY KEY (id);


--
-- Name: verification_code_employers pk_verification_code_employers; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.verification_code_employers
    ADD CONSTRAINT pk_verification_code_employers PRIMARY KEY (id);


--
-- Name: verification_codes pk_verification_codes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.verification_codes
    ADD CONSTRAINT pk_verification_codes PRIMARY KEY (id);


--
-- Name: candidates uc_candidates_identity_number; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidates
    ADD CONSTRAINT uc_candidates_identity_number UNIQUE (identity_number);


--
-- Name: job_titles uc_job_titles_title; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT uc_job_titles_title UNIQUE (title);


--
-- Name: users uc_users_email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uc_users_email UNIQUE (email);


--
-- Name: verification_codes uc_verification_codes_code; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.verification_codes
    ADD CONSTRAINT uc_verification_codes_code UNIQUE (code);


--
-- Name: work_time_types work_time_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_time_types
    ADD CONSTRAINT work_time_types_pkey PRIMARY KEY (id);


--
-- Name: work_types work_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_types
    ADD CONSTRAINT work_types_pkey PRIMARY KEY (id);


--
-- Name: candidate_work_experiences fk_candidate; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_work_experiences
    ADD CONSTRAINT fk_candidate FOREIGN KEY (candidate_id) REFERENCES public.candidates(id);


--
-- Name: candidate_educations fk_candidate; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_educations
    ADD CONSTRAINT fk_candidate FOREIGN KEY (candidate_id) REFERENCES public.candidates(id);


--
-- Name: candidate_languages fk_candidate; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_languages
    ADD CONSTRAINT fk_candidate FOREIGN KEY (candidate_id) REFERENCES public.candidates(id);


--
-- Name: candidate_programming_languages fk_candidate; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_programming_languages
    ADD CONSTRAINT fk_candidate FOREIGN KEY (candidate_id) REFERENCES public.candidates(id);


--
-- Name: candidate_technologies fk_candidate; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_technologies
    ADD CONSTRAINT fk_candidate FOREIGN KEY (candidate_id) REFERENCES public.candidates(id);


--
-- Name: candidate_images fk_candidate; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_images
    ADD CONSTRAINT fk_candidate FOREIGN KEY (candidate_id) REFERENCES public.candidates(id);


--
-- Name: candidate_websites fk_candidate; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_websites
    ADD CONSTRAINT fk_candidate FOREIGN KEY (candidate_id) REFERENCES public.candidates(id);


--
-- Name: candidates fk_candidates_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidates
    ADD CONSTRAINT fk_candidates_users FOREIGN KEY (id) REFERENCES public.users(id);


--
-- Name: job_advertisements fk_city; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_advertisements
    ADD CONSTRAINT fk_city FOREIGN KEY (city_id) REFERENCES public.cities(id);


--
-- Name: candidate_educations fk_department; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_educations
    ADD CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES public.departments(id);


--
-- Name: employees fk_employees_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_employees_users FOREIGN KEY (id) REFERENCES public.users(id);


--
-- Name: job_advertisements fk_employer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_advertisements
    ADD CONSTRAINT fk_employer FOREIGN KEY (employer_id) REFERENCES public.employers(id);


--
-- Name: employers fk_employers_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employers
    ADD CONSTRAINT fk_employers_users FOREIGN KEY (id) REFERENCES public.users(id);


--
-- Name: job_advertisements fk_job; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_advertisements
    ADD CONSTRAINT fk_job FOREIGN KEY (job_id) REFERENCES public.job_titles(id);


--
-- Name: candidate_languages fk_language; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_languages
    ADD CONSTRAINT fk_language FOREIGN KEY (language_id) REFERENCES public.languages(id);


--
-- Name: candidate_programming_languages fk_programming_language; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_programming_languages
    ADD CONSTRAINT fk_programming_language FOREIGN KEY (programming_language_id) REFERENCES public.programming_languages(id);


--
-- Name: departments fk_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT fk_school FOREIGN KEY (school_id) REFERENCES public.schools(id);


--
-- Name: candidate_educations fk_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_educations
    ADD CONSTRAINT fk_school FOREIGN KEY (school_id) REFERENCES public.schools(id);


--
-- Name: candidate_technologies fk_technology; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_technologies
    ADD CONSTRAINT fk_technology FOREIGN KEY (technology_id) REFERENCES public.technologies(id);


--
-- Name: verification_code_candidates fk_verification_code_candidates_candidates; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.verification_code_candidates
    ADD CONSTRAINT fk_verification_code_candidates_candidates FOREIGN KEY (candidate_id) REFERENCES public.candidates(id);


--
-- Name: verification_code_candidates fk_verification_code_candidates_verification_codes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.verification_code_candidates
    ADD CONSTRAINT fk_verification_code_candidates_verification_codes FOREIGN KEY (id) REFERENCES public.verification_codes(id);


--
-- Name: verification_code_employers fk_verification_code_employers_employers; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.verification_code_employers
    ADD CONSTRAINT fk_verification_code_employers_employers FOREIGN KEY (employer_id) REFERENCES public.employers(id);


--
-- Name: verification_code_employers fk_verification_code_employers_verification_codes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.verification_code_employers
    ADD CONSTRAINT fk_verification_code_employers_verification_codes FOREIGN KEY (id) REFERENCES public.verification_codes(id);


--
-- Name: job_advertisements fk_work_time_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_advertisements
    ADD CONSTRAINT fk_work_time_type FOREIGN KEY (work_time_type_id) REFERENCES public.work_time_types(id);


--
-- Name: job_advertisements fk_work_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_advertisements
    ADD CONSTRAINT fk_work_type FOREIGN KEY (work_type_id) REFERENCES public.work_types(id);


--
-- Name: verification_code_employers fks1clk7itwip3bu2yd5kabirin; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.verification_code_employers
    ADD CONSTRAINT fks1clk7itwip3bu2yd5kabirin FOREIGN KEY (id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

