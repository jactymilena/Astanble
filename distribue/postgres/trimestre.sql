--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.21
-- Dumped by pg_dump version 13.2

-- Started on 2021-03-23 14:19:26 EDT

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

--
-- TOC entry 9 (class 2615 OID 1371903)
-- Name: app; Type: SCHEMA; Schema: -; Owner: s3iprojet00
--

CREATE SCHEMA app;


--
-- TOC entry 5 (class 2615 OID 1318071)
-- Name: laboratoire2; Type: SCHEMA; Schema: -; Owner: administrateur
--

CREATE SCHEMA laboratoire2;


SET default_tablespace = '';

--
-- TOC entry 193 (class 1259 OID 1371904)
-- Name: ap; Type: TABLE; Schema: app; Owner: s3iprojet00
--

CREATE TABLE app.ap (
    ap_id character(6) NOT NULL,
    libelle text NOT NULL,
    inscription timestamp without time zone NOT NULL
);


--
-- TOC entry 194 (class 1259 OID 1371910)
-- Name: ap_app; Type: TABLE; Schema: app; Owner: s3iprojet00
--

CREATE TABLE app.ap_app (
    ap_id character(6) NOT NULL,
    app_id character(5) NOT NULL
);


--
-- TOC entry 195 (class 1259 OID 1371913)
-- Name: ap_cheminement; Type: TABLE; Schema: app; Owner: s3iprojet00
--

CREATE TABLE app.ap_cheminement (
    cheminement_id character(3) NOT NULL,
    programme_id character(3) NOT NULL,
    ap_id character(6) NOT NULL
);


--
-- TOC entry 196 (class 1259 OID 1371916)
-- Name: ap_etudiant; Type: TABLE; Schema: app; Owner: s3iprojet00
--

CREATE TABLE app.ap_etudiant (
    ap_id character(6) NOT NULL,
    cip character(8) NOT NULL
);


--
-- TOC entry 197 (class 1259 OID 1371919)
-- Name: ap_version; Type: TABLE; Schema: app; Owner: s3iprojet00
--

CREATE TABLE app.ap_version (
    fonction character(1),
    version_id character(2) NOT NULL,
    cheminement_id character(3) NOT NULL,
    programme_id character(3) NOT NULL,
    ap_id character(6) NOT NULL
);


--
-- TOC entry 198 (class 1259 OID 1371922)
-- Name: app; Type: TABLE; Schema: app; Owner: s3iprojet00
--

CREATE TABLE app.app (
    app_id character(5) NOT NULL,
    libelle text NOT NULL,
    inscription timestamp without time zone NOT NULL
);


--
-- TOC entry 199 (class 1259 OID 1371928)
-- Name: cheminement; Type: TABLE; Schema: app; Owner: s3iprojet00
--

CREATE TABLE app.cheminement (
    cheminement_id character(3) NOT NULL,
    libelle text NOT NULL,
    inscription timestamp without time zone NOT NULL,
    programme_id character(3) NOT NULL
);


--
-- TOC entry 200 (class 1259 OID 1371934)
-- Name: departement; Type: TABLE; Schema: app; Owner: s3iprojet00
--

CREATE TABLE app.departement (
    departement_id integer NOT NULL,
    libelle text NOT NULL,
    inscription timestamp without time zone NOT NULL,
    faculte_id integer NOT NULL
);


--
-- TOC entry 201 (class 1259 OID 1371940)
-- Name: departement_departement_id_seq; Type: SEQUENCE; Schema: app; Owner: s3iprojet00
--

CREATE SEQUENCE app.departement_departement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3240 (class 0 OID 0)
-- Dependencies: 201
-- Name: departement_departement_id_seq; Type: SEQUENCE OWNED BY; Schema: app; Owner: s3iprojet00
--

ALTER SEQUENCE app.departement_departement_id_seq OWNED BY app.departement.departement_id;


--
-- TOC entry 202 (class 1259 OID 1371942)
-- Name: etudiant; Type: TABLE; Schema: app; Owner: s3iprojet00
--

CREATE TABLE app.etudiant (
    cip character(8) NOT NULL,
    nom text,
    courriel text,
    inscription timestamp without time zone,
    programme_id character(3)
);


--
-- TOC entry 203 (class 1259 OID 1371948)
-- Name: etudiant_app; Type: TABLE; Schema: app; Owner: s3iprojet00
--

CREATE TABLE app.etudiant_app (
    etudiant_app_id integer NOT NULL,
    cip text,
    nom text,
    courriel text,
    programme text,
    programme_nom text,
    app text,
    app_titre text,
    ap text,
    departement text,
    faculte text,
    universite text
);


--
-- TOC entry 204 (class 1259 OID 1371954)
-- Name: etudiant_app_etudiant_app_id_seq; Type: SEQUENCE; Schema: app; Owner: s3iprojet00
--

CREATE SEQUENCE app.etudiant_app_etudiant_app_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3241 (class 0 OID 0)
-- Dependencies: 204
-- Name: etudiant_app_etudiant_app_id_seq; Type: SEQUENCE OWNED BY; Schema: app; Owner: s3iprojet00
--

ALTER SEQUENCE app.etudiant_app_etudiant_app_id_seq OWNED BY app.etudiant_app.etudiant_app_id;


--
-- TOC entry 205 (class 1259 OID 1371956)
-- Name: faculte; Type: TABLE; Schema: app; Owner: s3iprojet00
--

CREATE TABLE app.faculte (
    faculte_id integer NOT NULL,
    libelle text NOT NULL,
    inscription timestamp without time zone NOT NULL,
    universite_id integer NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 1371962)
-- Name: faculte_faculte_id_seq; Type: SEQUENCE; Schema: app; Owner: s3iprojet00
--

CREATE SEQUENCE app.faculte_faculte_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3242 (class 0 OID 0)
-- Dependencies: 206
-- Name: faculte_faculte_id_seq; Type: SEQUENCE OWNED BY; Schema: app; Owner: s3iprojet00
--

ALTER SEQUENCE app.faculte_faculte_id_seq OWNED BY app.faculte.faculte_id;


--
-- TOC entry 207 (class 1259 OID 1371964)
-- Name: programme; Type: TABLE; Schema: app; Owner: s3iprojet00
--

CREATE TABLE app.programme (
    programme_id character(3) NOT NULL,
    libelle text NOT NULL,
    inscription timestamp without time zone NOT NULL,
    departement_id integer,
    faculte_id character(2) NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 1372101)
-- Name: trimester; Type: TABLE; Schema: app; Owner: s3iprojet00
--

CREATE TABLE app.trimester (
    trimestre_id character varying(3),
    trimester character varying(4096),
    debut date,
    fin date,
    inscription timestamp with time zone DEFAULT now()
);


--
-- TOC entry 208 (class 1259 OID 1371970)
-- Name: universite; Type: TABLE; Schema: app; Owner: s3iprojet00
--

CREATE TABLE app.universite (
    universite_id integer NOT NULL,
    libelle text NOT NULL,
    inscription timestamp without time zone NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 1371976)
-- Name: universite_universite_id_seq; Type: SEQUENCE; Schema: app; Owner: s3iprojet00
--

CREATE SEQUENCE app.universite_universite_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3243 (class 0 OID 0)
-- Dependencies: 209
-- Name: universite_universite_id_seq; Type: SEQUENCE OWNED BY; Schema: app; Owner: s3iprojet00
--

ALTER SEQUENCE app.universite_universite_id_seq OWNED BY app.universite.universite_id;


--
-- TOC entry 210 (class 1259 OID 1371978)
-- Name: v_etudiant_app; Type: VIEW; Schema: app; Owner: s3iprojet00
--

CREATE VIEW app.v_etudiant_app AS
 SELECT etudiant_app.etudiant_app_id,
    etudiant_app.cip,
    etudiant_app.nom,
    etudiant_app.courriel,
    etudiant_app.programme,
    etudiant_app.programme_nom,
    etudiant_app.app,
    etudiant_app.app_titre,
    etudiant_app.ap,
    etudiant_app.departement,
    etudiant_app.faculte,
    etudiant_app.universite
   FROM app.etudiant_app;


--
-- TOC entry 211 (class 1259 OID 1371982)
-- Name: version; Type: TABLE; Schema: app; Owner: s3iprojet00
--

CREATE TABLE app.version (
    version_id character(2) NOT NULL,
    libelle text NOT NULL,
    inscription timestamp without time zone,
    cheminement_id character(3) NOT NULL,
    programme_id character(3) NOT NULL
);


--
-- TOC entry 187 (class 1259 OID 1318072)
-- Name: article; Type: TABLE; Schema: laboratoire2; Owner: administrateur
--

CREATE TABLE laboratoire2.article (
    noarticle integer NOT NULL,
    description character varying(1024),
    prixunitaire numeric NOT NULL,
    quantiteenstock integer NOT NULL
);



--
-- TOC entry 188 (class 1259 OID 1318080)
-- Name: client; Type: TABLE; Schema: laboratoire2; Owner: administrateur
--

CREATE TABLE laboratoire2.client (
    noclient integer NOT NULL,
    nomclient character varying(64) NOT NULL,
    notelephone character varying(14)
);



--
-- TOC entry 189 (class 1259 OID 1318085)
-- Name: commande; Type: TABLE; Schema: laboratoire2; Owner: administrateur
--

CREATE TABLE laboratoire2.commande (
    nocommande integer NOT NULL,
    noclient integer,
    datecommande date NOT NULL
);



--
-- TOC entry 190 (class 1259 OID 1318090)
-- Name: detaillivraison; Type: TABLE; Schema: laboratoire2; Owner: administrateur
--

CREATE TABLE laboratoire2.detaillivraison (
    nocommande integer NOT NULL,
    noarticle integer NOT NULL,
    nolivraison integer NOT NULL,
    quantitelivree integer
);



--
-- TOC entry 191 (class 1259 OID 1318095)
-- Name: lignecommande; Type: TABLE; Schema: laboratoire2; Owner: administrateur
--

CREATE TABLE laboratoire2.lignecommande (
    nocommande integer NOT NULL,
    noarticle integer NOT NULL,
    quantite integer
);



--
-- TOC entry 192 (class 1259 OID 1318100)
-- Name: livraison; Type: TABLE; Schema: laboratoire2; Owner: administrateur
--

CREATE TABLE laboratoire2.livraison (
    nolivraison integer NOT NULL,
    datelivraison date NOT NULL
);



--
-- TOC entry 3025 (class 2604 OID 1371988)
-- Name: departement departement_id; Type: DEFAULT; Schema: app; Owner: s3iprojet00
--

ALTER TABLE ONLY app.departement ALTER COLUMN departement_id SET DEFAULT nextval('app.departement_departement_id_seq'::regclass);


--
-- TOC entry 3026 (class 2604 OID 1371989)
-- Name: etudiant_app etudiant_app_id; Type: DEFAULT; Schema: app; Owner: s3iprojet00
--

ALTER TABLE ONLY app.etudiant_app ALTER COLUMN etudiant_app_id SET DEFAULT nextval('app.etudiant_app_etudiant_app_id_seq'::regclass);


--
-- TOC entry 3027 (class 2604 OID 1371990)
-- Name: faculte faculte_id; Type: DEFAULT; Schema: app; Owner: s3iprojet00
--

ALTER TABLE ONLY app.faculte ALTER COLUMN faculte_id SET DEFAULT nextval('app.faculte_faculte_id_seq'::regclass);


--
-- TOC entry 3028 (class 2604 OID 1371991)
-- Name: universite universite_id; Type: DEFAULT; Schema: app; Owner: s3iprojet00
--

ALTER TABLE ONLY app.universite ALTER COLUMN universite_id SET DEFAULT nextval('app.universite_universite_id_seq'::regclass);


--
-- TOC entry 3216 (class 0 OID 1371904)
-- Dependencies: 193
-- Data for Name: ap; Type: TABLE DATA; Schema: app; Owner: s3iprojet00
--



--
-- TOC entry 3217 (class 0 OID 1371910)
-- Dependencies: 194
-- Data for Name: ap_app; Type: TABLE DATA; Schema: app; Owner: s3iprojet00
--



--
-- TOC entry 3218 (class 0 OID 1371913)
-- Dependencies: 195
-- Data for Name: ap_cheminement; Type: TABLE DATA; Schema: app; Owner: s3iprojet00
--



--
-- TOC entry 3219 (class 0 OID 1371916)
-- Dependencies: 196
-- Data for Name: ap_etudiant; Type: TABLE DATA; Schema: app; Owner: s3iprojet00
--



--
-- TOC entry 3220 (class 0 OID 1371919)
-- Dependencies: 197
-- Data for Name: ap_version; Type: TABLE DATA; Schema: app; Owner: s3iprojet00
--



--
-- TOC entry 3221 (class 0 OID 1371922)
-- Dependencies: 198
-- Data for Name: app; Type: TABLE DATA; Schema: app; Owner: s3iprojet00
--



--
-- TOC entry 3222 (class 0 OID 1371928)
-- Dependencies: 199
-- Data for Name: cheminement; Type: TABLE DATA; Schema: app; Owner: s3iprojet00
--



--
-- TOC entry 3223 (class 0 OID 1371934)
-- Dependencies: 200
-- Data for Name: departement; Type: TABLE DATA; Schema: app; Owner: s3iprojet00
--



--
-- TOC entry 3225 (class 0 OID 1371942)
-- Dependencies: 202
-- Data for Name: etudiant; Type: TABLE DATA; Schema: app; Owner: s3iprojet00
--



--
-- TOC entry 3226 (class 0 OID 1371948)
-- Dependencies: 203
-- Data for Name: etudiant_app; Type: TABLE DATA; Schema: app; Owner: s3iprojet00
--

INSERT INTO app.etudiant_app VALUES (1, 'leca2312', 'Leclerc, Alexandre', 'Alexandre.Leclerc4@USherbrooke.ca', '23650007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (2, 'dioj2117', 'Dionne, Joey', 'Joey.Dionne@USherbrooke.ca', '23653007', 'informatique - TO', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (3, 'libv2001', 'Libioulle, Valentin', 'Valentin.Libioulle@USherbrooke.ca', '23653007', 'informatique - TO', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (4, 'cars2019', 'Carrier, Simon', 'Simon.G.Carrier@USherbrooke.ca', '23650007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (5, 'jutj2701', 'Juteau, Jean-Michel', 'Jean-Michel.Juteau@USherbrooke.ca', '23653007', 'informatique - TO', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (6, 'boug2128', 'Boucher, Gabriel', 'Gabriel.Boucher@USherbrooke.ca', '23653007', 'informatique - TO', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (7, 'colp2502', 'Collin, Philippe', 'Philippe.Collin@USherbrooke.ca', '23650007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (8, 'brid2302', 'Briand, Danik', 'Danik.Briand@USherbrooke.ca', '23650006', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (9, 'boug2128', 'Boucher, Gabriel', 'Gabriel.Boucher@USherbrooke.ca', '23653007', 'informatique - TO', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (10, 'alle2004', 'Allard, Emeri', 'Emeri.Allard@USherbrooke.ca', '23650007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (11, 'cars2019', 'Carrier, Simon', 'Simon.G.Carrier@USherbrooke.ca', '23650007', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (12, 'mate2002', 'Matte, Eric', 'Eric.Matte@USherbrooke.ca', '23650007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (13, 'sanj2302', 'Santerre, Jonathan', 'Jonathan.Santerre2@USherbrooke.ca', '23650007', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (14, 'frem2110', 'Frenette, Marc-André', 'Marc-Andre.Frenette3@USherbrooke.ca', '23650007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (15, 'hepm1701', 'Heppell, Marc-Olivier', 'Marc-Olivier.Heppell@USherbrooke.ca', '23650007', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (16, 'marf3402', 'Martel-Denis, Félix', 'Felix.Martel-Denis@USherbrooke.ca', '23650007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (17, 'beal2726', 'Beaulieu, Louis', 'Louis.J.Beaulieu@USherbrooke.ca', '23650007', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (18, 'fonp2402', 'Fontaine, Philippe', 'Philippe.Fontaine2@USherbrooke.ca', '23650007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (19, 'arse1503', 'Arseneault, Emile', 'Emile.Arseneault@USherbrooke.ca', '23650007', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (20, 'bers3019', 'Bernier-Ouellet, Simon', 'Simon.Bernier-Ouellet@USherbrooke.ca', '23652007', 'informatique - TI', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (21, 'frem2110', 'Frenette, Marc-André', 'Marc-Andre.Frenette3@USherbrooke.ca', '23650007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (22, 'bonj2006', 'Bonsant, Jérémie', 'Jeremie.Bonsant@USherbrooke.ca', '23650007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (23, 'desa2924', 'Desloges, Anne-Marie', 'Anne-Marie.Desloges@USherbrooke.ca', '23650007', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (24, 'bonp2402', 'Bonin, Philippe', 'Philippe.Bonin2@USherbrooke.ca', '23653007', 'informatique - TO', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (25, 'perj2324', 'Perron-Langlois, Joël', 'Joel.Perron-Langlois@USherbrooke.ca', '23650007', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (26, 'lusf1702', 'Lussier, Francis', 'Francis.Lussier2@USherbrooke.ca', '23653007', 'informatique - TO', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (27, 'leca2312', 'Leclerc, Alexandre', 'Alexandre.Leclerc4@USherbrooke.ca', '23650007', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (28, 'brem2104', 'Breton, Maxime', 'Maxime.Breton@USherbrooke.ca', '23650007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (29, 'balp2101', 'Balthazar, Philippe', 'Philippe.Balthazar@USherbrooke.ca', '23650007', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (30, 'poum2319', 'Poulin, Marc-Antoine', 'Marc-Antoine.Poulin2@USherbrooke.ca', '23652007', 'informatique - TI', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (31, 'desa2727', 'Desnoyers, Alexandre', 'Alexandre.Desnoyers@USherbrooke.ca', '23652007', 'informatique - TI', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (32, 'desa2924', 'Desloges, Anne-Marie', 'Anne-Marie.Desloges@USherbrooke.ca', '23650007', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (33, 'sera1901', 'Sermaxhaj, Adriatik', 'Adriatik.Sermaxhaj@USherbrooke.ca', '23652007', 'informatique - TI', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (34, 'bonp2402', 'Bonin, Philippe', 'Philippe.Bonin2@USherbrooke.ca', '23653007', 'informatique - TO', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (35, 'lapf2312', 'Lapalme, Félix', 'Felix.Lapalme@USherbrooke.ca', '23650007', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (36, 'godj2407', 'Godin, Jérôme', 'Jerome.Godin@USherbrooke.ca', '23653007', 'informatique - TO', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (37, 'fonp2402', 'Fontaine, Philippe', 'Philippe.Fontaine2@USherbrooke.ca', '23650007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (38, 'lemc2223', 'Lemonde, Christopher', 'Christopher.Lemonde@USherbrooke.ca', '23650007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (39, 'cota1810', 'Côté, Alexandre', 'Alexandre.Cote11@USherbrooke.ca', '23650007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (40, 'hepm1701', 'Heppell, Marc-Olivier', 'Marc-Olivier.Heppell@USherbrooke.ca', '23650007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (41, 'bouj2249', 'Boucher, Jonathan', 'Jonathan.Boucher3@USherbrooke.ca', '23650007', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (42, 'mera2411', 'Mercier-Nicol, Antoine', 'Antoine.Mercier-Nicol@USherbrooke.ca', '23653007', 'informatique - TO', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (43, 'poum2319', 'Poulin, Marc-Antoine', 'Marc-Antoine.Poulin2@USherbrooke.ca', '23652007', 'informatique - TI', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (44, 'sera1901', 'Sermaxhaj, Adriatik', 'Adriatik.Sermaxhaj@USherbrooke.ca', '23652007', 'informatique - TI', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (45, 'bosb3201', 'Bossé, Bianca', 'Bianca.Bosse@USherbrooke.ca', '23650007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (46, 'lemc2223', 'Lemonde, Christopher', 'Christopher.Lemonde@USherbrooke.ca', '23650007', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (47, 'alle2004', 'Allard, Emeri', 'Emeri.Allard@USherbrooke.ca', '23650007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (48, 'belo2302', 'Bellavance, Olivier', 'Olivier.Bellavance@USherbrooke.ca', '23650007', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (49, 'cota1810', 'Côté, Alexandre', 'Alexandre.Cote11@USherbrooke.ca', '23650007', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (50, 'lixz2201', 'Li, Zi Long', 'Zi.Long.Li@USherbrooke.ca', '23650008', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (51, 'bosb3201', 'Bossé, Bianca', 'Bianca.Bosse@USherbrooke.ca', '23650007', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (52, 'marf3402', 'Martel-Denis, Félix', 'Felix.Martel-Denis@USherbrooke.ca', '23650007', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (53, 'rica2507', 'Ricard Lalonde, Alexandre', 'Alexandre.Ricard.Lalonde@USherbrooke.ca', '23653007', 'informatique - TO', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (54, 'bonp2402', 'Bonin, Philippe', 'Philippe.Bonin2@USherbrooke.ca', '23653007', 'informatique - TO', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (55, 'brem2104', 'Breton, Maxime', 'Maxime.Breton@USherbrooke.ca', '23650007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (56, 'dror2204', 'Drouin, Raphaël', 'Raphael.Drouin@USherbrooke.ca', '23650007', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (57, 'colp2502', 'Collin, Philippe', 'Philippe.Collin@USherbrooke.ca', '23650007', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (58, 'leca2312', 'Leclerc, Alexandre', 'Alexandre.Leclerc4@USherbrooke.ca', '23650007', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (59, 'fonp2402', 'Fontaine, Philippe', 'Philippe.Fontaine2@USherbrooke.ca', '23650007', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (60, 'hepm1701', 'Heppell, Marc-Olivier', 'Marc-Olivier.Heppell@USherbrooke.ca', '23650007', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (61, 'bise2103', 'Bisson, Éric', 'Eric.Bisson@USherbrooke.ca', '23653007', 'informatique - TO', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (62, 'lixz2201', 'Li, Zi Long', 'Zi.Long.Li@USherbrooke.ca', '23650008', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (63, 'bers3019', 'Bernier-Ouellet, Simon', 'Simon.Bernier-Ouellet@USherbrooke.ca', '23652007', 'informatique - TI', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (64, 'alle2004', 'Allard, Emeri', 'Emeri.Allard@USherbrooke.ca', '23650007', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (65, 'bonj2006', 'Bonsant, Jérémie', 'Jeremie.Bonsant@USherbrooke.ca', '23650007', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (66, 'choj2705', 'Chouinard-Beaupré, Julien', 'Julien.Chouinard-Beaupre@USherbrooke.ca', '23652007', 'informatique - TI', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (67, 'bena2215', 'Benoit, Alexandre', 'Alexandre.C.Benoit@USherbrooke.ca', '23650007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (68, 'sanj2302', 'Santerre, Jonathan', 'Jonathan.Santerre2@USherbrooke.ca', '23650007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (69, 'traa2306', 'Tran, Austin-Didier', 'Austin-Didier.Tran@USherbrooke.ca', '23650007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (70, 'bonp2402', 'Bonin, Philippe', 'Philippe.Bonin2@USherbrooke.ca', '23653007', 'informatique - TO', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (71, 'buca2201', 'Buche, Alexandre', 'Alexandre.Buche@USherbrooke.ca', '23650007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (72, 'beam2039', 'Beaudoin, Marc-Antoine', 'Marc-Antoine.Beaudoin2@USherbrooke.ca', '23650007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (73, 'libv2001', 'Libioulle, Valentin', 'Valentin.Libioulle@USherbrooke.ca', '23653007', 'informatique - TO', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (74, 'maia2604', 'Maisonneuve, Alex', 'Alex.Maisonneuve@USherbrooke.ca', '23653007', 'informatique - TO', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (75, 'dorh2301', 'Dorion, Hugo', 'Hugo.Dorion@USherbrooke.ca', '23650007', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (76, 'bers3019', 'Bernier-Ouellet, Simon', 'Simon.Bernier-Ouellet@USherbrooke.ca', '23652007', 'informatique - TI', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (77, 'lixz2201', 'Li, Zi Long', 'Zi.Long.Li@USherbrooke.ca', '23650008', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (78, 'janp1702', 'Janelle, Philippe', 'Philippe.Janelle@USherbrooke.ca', '23650007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (79, 'jale1402', 'Jalbert, Etienne', 'Etienne.Jalbert@USherbrooke.ca', '23653007', 'informatique - TO', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (80, 'ricn1501', 'Richard, Nicolas', 'Nicolas.Richard3@USherbrooke.ca', '23651606', 'informatique', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (81, 'marq2901', 'Marienneau, Quentin', 'Quentin.Marienneau@USherbrooke.ca', '4EH00001', 'Informatique', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (82, 'diaa2116', 'Diallo, Alex Brian', 'Alex.Brian.Diallo@USherbrooke.ca', '23600007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (83, 'dorh2301', 'Dorion, Hugo', 'Hugo.Dorion@USherbrooke.ca', '23650007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (84, 'trej2334', 'Tremblay, Jordan Prince', 'Jordan.Prince.Tremblay@USherbrooke.ca', '23650007', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (85, 'goud2703', 'Goulet, David', 'David.Goulet4@USherbrooke.ca', '23652506', 'informatique', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (86, 'dorh2301', 'Dorion, Hugo', 'Hugo.Dorion@USherbrooke.ca', '23650007', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (87, 'godj2407', 'Godin, Jérôme', 'Jerome.Godin@USherbrooke.ca', '23653007', 'informatique - TO', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (88, 'lapf2312', 'Lapalme, Félix', 'Felix.Lapalme@USherbrooke.ca', '23650007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (89, 'poum2319', 'Poulin, Marc-Antoine', 'Marc-Antoine.Poulin2@USherbrooke.ca', '23652007', 'informatique - TI', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (90, 'dioj2117', 'Dionne, Joey', 'Joey.Dionne@USherbrooke.ca', '23653007', 'informatique - TO', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (91, 'bosb3201', 'Bossé, Bianca', 'Bianca.Bosse@USherbrooke.ca', '23650007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (92, 'marq2901', 'Marienneau, Quentin', 'Quentin.Marienneau@USherbrooke.ca', '4EH00001', 'Informatique', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (93, 'cota1810', 'Côté, Alexandre', 'Alexandre.Cote11@USherbrooke.ca', '23650007', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (94, 'bena2215', 'Benoit, Alexandre', 'Alexandre.C.Benoit@USherbrooke.ca', '23650007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (95, 'diaa2116', 'Diallo, Alex Brian', 'Alex.Brian.Diallo@USherbrooke.ca', '23600007', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (96, 'poum2319', 'Poulin, Marc-Antoine', 'Marc-Antoine.Poulin2@USherbrooke.ca', '23652007', 'informatique - TI', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (97, 'bonj2006', 'Bonsant, Jérémie', 'Jeremie.Bonsant@USherbrooke.ca', '23650007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (98, 'trej2334', 'Tremblay, Jordan Prince', 'Jordan.Prince.Tremblay@USherbrooke.ca', '23650007', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (99, 'jale1402', 'Jalbert, Etienne', 'Etienne.Jalbert@USherbrooke.ca', '23653007', 'informatique - TO', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (100, 'choj2705', 'Chouinard-Beaupré, Julien', 'Julien.Chouinard-Beaupre@USherbrooke.ca', '23652007', 'informatique - TI', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (101, 'perj2324', 'Perron-Langlois, Joël', 'Joel.Perron-Langlois@USherbrooke.ca', '23650007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (102, 'beln2109', 'Béland, Nicolas', 'Nicolas.Beland2@USherbrooke.ca', '23650007', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (205, 'laci2103', 'Lachance, Ian', 'Ian.Lachance@USherbrooke.ca', '23650007', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (103, 'gosa3202', 'Gosselin, Alexandra', 'Alexandra.Gosselin2@USherbrooke.ca', '23652007', 'informatique - TI', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (104, 'beam2039', 'Beaudoin, Marc-Antoine', 'Marc-Antoine.Beaudoin2@USherbrooke.ca', '23650007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (105, 'hepm1701', 'Heppell, Marc-Olivier', 'Marc-Olivier.Heppell@USherbrooke.ca', '23650007', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (106, 'dror2204', 'Drouin, Raphaël', 'Raphael.Drouin@USherbrooke.ca', '23650007', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (107, 'bers3019', 'Bernier-Ouellet, Simon', 'Simon.Bernier-Ouellet@USherbrooke.ca', '23652007', 'informatique - TI', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (108, 'bert2204', 'Bernard, Thomas', 'Thomas.Bernard@USherbrooke.ca', '23650007', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (109, 'frem2110', 'Frenette, Marc-André', 'Marc-Andre.Frenette3@USherbrooke.ca', '23650007', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (110, 'alle2004', 'Allard, Emeri', 'Emeri.Allard@USherbrooke.ca', '23650007', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (111, 'bouf1819', 'Bourbonnais, Félix', 'Felix.Bourbonnais@USherbrooke.ca', '23652007', 'informatique - TI', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (112, 'lemc2223', 'Lemonde, Christopher', 'Christopher.Lemonde@USherbrooke.ca', '23650007', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (113, 'godj2407', 'Godin, Jérôme', 'Jerome.Godin@USherbrooke.ca', '23653007', 'informatique - TO', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (114, 'jale1402', 'Jalbert, Etienne', 'Etienne.Jalbert@USherbrooke.ca', '23653007', 'informatique - TO', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (115, 'bali1801', 'Balafrej, Ismaël', 'Ismael.Balafrej@USherbrooke.ca', '23650007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (116, 'fonp2402', 'Fontaine, Philippe', 'Philippe.Fontaine2@USherbrooke.ca', '23650007', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (117, 'bonj2006', 'Bonsant, Jérémie', 'Jeremie.Bonsant@USherbrooke.ca', '23650007', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (118, 'gosa3202', 'Gosselin, Alexandra', 'Alexandra.Gosselin2@USherbrooke.ca', '23652007', 'informatique - TI', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (119, 'godj2407', 'Godin, Jérôme', 'Jerome.Godin@USherbrooke.ca', '23653007', 'informatique - TO', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (120, 'marf3402', 'Martel-Denis, Félix', 'Felix.Martel-Denis@USherbrooke.ca', '23650007', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (121, 'comb2301', 'Compagnat, Brian', 'Brian.Compagnat@USherbrooke.ca', '23651007', 'informatique- TE', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (122, 'dror2204', 'Drouin, Raphaël', 'Raphael.Drouin@USherbrooke.ca', '23650007', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (123, 'lusf1702', 'Lussier, Francis', 'Francis.Lussier2@USherbrooke.ca', '23653007', 'informatique - TO', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (124, 'lemc2223', 'Lemonde, Christopher', 'Christopher.Lemonde@USherbrooke.ca', '23650007', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (125, 'alle2004', 'Allard, Emeri', 'Emeri.Allard@USherbrooke.ca', '23650007', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (126, 'beln2109', 'Béland, Nicolas', 'Nicolas.Beland2@USherbrooke.ca', '23650007', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (127, 'bouf1819', 'Bourbonnais, Félix', 'Felix.Bourbonnais@USherbrooke.ca', '23652007', 'informatique - TI', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (128, 'rica2507', 'Ricard Lalonde, Alexandre', 'Alexandre.Ricard.Lalonde@USherbrooke.ca', '23653007', 'informatique - TO', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (129, 'poum2319', 'Poulin, Marc-Antoine', 'Marc-Antoine.Poulin2@USherbrooke.ca', '23652007', 'informatique - TI', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (130, 'bolb2201', 'Bolduc-Meilleur, Benjamin', 'Benjamin.Bolduc-Meilleur@USherbrooke.ca', '23650007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (131, 'comb2301', 'Compagnat, Brian', 'Brian.Compagnat@USherbrooke.ca', '23651007', 'informatique- TE', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (132, 'bena2215', 'Benoit, Alexandre', 'Alexandre.C.Benoit@USherbrooke.ca', '23650007', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (133, 'trej2334', 'Tremblay, Jordan Prince', 'Jordan.Prince.Tremblay@USherbrooke.ca', '23650007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (134, 'allb2701', 'Allaire-Lemay, Bruno', 'Bruno.Allaire-Lemay@USherbrooke.ca', '23650007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (135, 'janp1702', 'Janelle, Philippe', 'Philippe.Janelle@USherbrooke.ca', '23650007', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (136, 'sanj2302', 'Santerre, Jonathan', 'Jonathan.Santerre2@USherbrooke.ca', '23650007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (137, 'beln2109', 'Béland, Nicolas', 'Nicolas.Beland2@USherbrooke.ca', '23650007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (138, 'maia2604', 'Maisonneuve, Alex', 'Alex.Maisonneuve@USherbrooke.ca', '23653007', 'informatique - TO', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (139, 'sera1901', 'Sermaxhaj, Adriatik', 'Adriatik.Sermaxhaj@USherbrooke.ca', '23652007', 'informatique - TI', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (140, 'choj2705', 'Chouinard-Beaupré, Julien', 'Julien.Chouinard-Beaupre@USherbrooke.ca', '23652007', 'informatique - TI', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (141, 'bert2204', 'Bernard, Thomas', 'Thomas.Bernard@USherbrooke.ca', '23650007', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (142, 'arse1503', 'Arseneault, Emile', 'Emile.Arseneault@USherbrooke.ca', '23650007', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (143, 'lemc2223', 'Lemonde, Christopher', 'Christopher.Lemonde@USherbrooke.ca', '23650007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (144, 'comb2301', 'Compagnat, Brian', 'Brian.Compagnat@USherbrooke.ca', '23651007', 'informatique- TE', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (145, 'traa2306', 'Tran, Austin-Didier', 'Austin-Didier.Tran@USherbrooke.ca', '23650007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (146, 'lemc2223', 'Lemonde, Christopher', 'Christopher.Lemonde@USherbrooke.ca', '23650007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (147, 'beal2726', 'Beaulieu, Louis', 'Louis.J.Beaulieu@USherbrooke.ca', '23650007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (148, 'marf3402', 'Martel-Denis, Félix', 'Felix.Martel-Denis@USherbrooke.ca', '23650007', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (149, 'bouv1906', 'Bougie, Vincent', 'Vincent.Bougie@USherbrooke.ca', '23653007', 'informatique - TO', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (150, 'bers3019', 'Bernier-Ouellet, Simon', 'Simon.Bernier-Ouellet@USherbrooke.ca', '23652007', 'informatique - TI', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (151, 'dupm2216', 'Dupuis, Maxime', 'Maxime.Dupuis2@USherbrooke.ca', '23650007', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (152, 'mate2002', 'Matte, Eric', 'Eric.Matte@USherbrooke.ca', '23650007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (153, 'gosa3202', 'Gosselin, Alexandra', 'Alexandra.Gosselin2@USherbrooke.ca', '23652007', 'informatique - TI', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (154, 'dioj2117', 'Dionne, Joey', 'Joey.Dionne@USherbrooke.ca', '23653007', 'informatique - TO', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (155, 'belo2302', 'Bellavance, Olivier', 'Olivier.Bellavance@USherbrooke.ca', '23650007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (156, 'janp1702', 'Janelle, Philippe', 'Philippe.Janelle@USherbrooke.ca', '23650007', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (157, 'traa2306', 'Tran, Austin-Didier', 'Austin-Didier.Tran@USherbrooke.ca', '23650007', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (158, 'brem2104', 'Breton, Maxime', 'Maxime.Breton@USherbrooke.ca', '23650007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (159, 'cord1701', 'Corbeil Stroombergen, David', 'David.Corbeil.Stroombergen@USherbrooke.ca', '23653007', 'informatique - TO', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (160, 'bonp2402', 'Bonin, Philippe', 'Philippe.Bonin2@USherbrooke.ca', '23653007', 'informatique - TO', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (161, 'dioj2117', 'Dionne, Joey', 'Joey.Dionne@USherbrooke.ca', '23653007', 'informatique - TO', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (162, 'lusf1702', 'Lussier, Francis', 'Francis.Lussier2@USherbrooke.ca', '23653007', 'informatique - TO', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (163, 'beam2039', 'Beaudoin, Marc-Antoine', 'Marc-Antoine.Beaudoin2@USherbrooke.ca', '23650007', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (164, 'leta1602', 'Létourneau, Adam', 'Adam.Letourneau@USherbrooke.ca', '23650007', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (165, 'balp2101', 'Balthazar, Philippe', 'Philippe.Balthazar@USherbrooke.ca', '23650007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (166, 'lapf2312', 'Lapalme, Félix', 'Felix.Lapalme@USherbrooke.ca', '23650007', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (167, 'mate2002', 'Matte, Eric', 'Eric.Matte@USherbrooke.ca', '23650007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (168, 'allb2701', 'Allaire-Lemay, Bruno', 'Bruno.Allaire-Lemay@USherbrooke.ca', '23650007', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (169, 'dorh2301', 'Dorion, Hugo', 'Hugo.Dorion@USherbrooke.ca', '23650007', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (170, 'janp1702', 'Janelle, Philippe', 'Philippe.Janelle@USherbrooke.ca', '23650007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (206, 'jale1402', 'Jalbert, Etienne', 'Etienne.Jalbert@USherbrooke.ca', '23653007', 'informatique - TO', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (171, 'fouf2305', 'Fournier-Gaumond, Frédérick', 'Frederick.Fournier-Gaumond@USherbrooke.ca', '23650007', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (172, 'colp2502', 'Collin, Philippe', 'Philippe.Collin@USherbrooke.ca', '23650007', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (173, 'royb2006', 'Roy, Benjamin', 'Benjamin.B.Roy@USherbrooke.ca', '23650007', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (174, 'leta1602', 'Létourneau, Adam', 'Adam.Letourneau@USherbrooke.ca', '23650007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (175, 'royb2006', 'Roy, Benjamin', 'Benjamin.B.Roy@USherbrooke.ca', '23650007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (176, 'saun2403', 'Saudrais, Nicolas', 'Nicolas.Saudrais@USherbrooke.ca', '23650007', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (177, 'balp2101', 'Balthazar, Philippe', 'Philippe.Balthazar@USherbrooke.ca', '23650007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (178, 'desa2727', 'Desnoyers, Alexandre', 'Alexandre.Desnoyers@USherbrooke.ca', '23652007', 'informatique - TI', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (179, 'balp2101', 'Balthazar, Philippe', 'Philippe.Balthazar@USherbrooke.ca', '23650007', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (180, 'bali1801', 'Balafrej, Ismaël', 'Ismael.Balafrej@USherbrooke.ca', '23650007', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (181, 'saun2403', 'Saudrais, Nicolas', 'Nicolas.Saudrais@USherbrooke.ca', '23650007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (182, 'mera2411', 'Mercier-Nicol, Antoine', 'Antoine.Mercier-Nicol@USherbrooke.ca', '23653007', 'informatique - TO', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (183, 'bouj2249', 'Boucher, Jonathan', 'Jonathan.Boucher3@USherbrooke.ca', '23650007', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (184, 'jutj2701', 'Juteau, Jean-Michel', 'Jean-Michel.Juteau@USherbrooke.ca', '23653007', 'informatique - TO', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (185, 'libv2001', 'Libioulle, Valentin', 'Valentin.Libioulle@USherbrooke.ca', '23653007', 'informatique - TO', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (186, 'becj2903', 'Béchard Marinier, Joseph', 'Joseph.Bechard.Marinier@USherbrooke.ca', '23650007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (187, 'bouj2249', 'Boucher, Jonathan', 'Jonathan.Boucher3@USherbrooke.ca', '23650007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (188, 'bouf1819', 'Bourbonnais, Félix', 'Felix.Bourbonnais@USherbrooke.ca', '23652007', 'informatique - TI', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (189, 'bolb2201', 'Bolduc-Meilleur, Benjamin', 'Benjamin.Bolduc-Meilleur@USherbrooke.ca', '23650007', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (190, 'slia3201', 'Slimani, Aida', 'Aida.Slimani@USherbrooke.ca', '23600007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (191, 'becj2903', 'Béchard Marinier, Joseph', 'Joseph.Bechard.Marinier@USherbrooke.ca', '23650007', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (192, 'slia3201', 'Slimani, Aida', 'Aida.Slimani@USherbrooke.ca', '23600007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (193, 'bosb3201', 'Bossé, Bianca', 'Bianca.Bosse@USherbrooke.ca', '23650007', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (194, 'laci2103', 'Lachance, Ian', 'Ian.Lachance@USherbrooke.ca', '23650007', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (195, 'lapf2312', 'Lapalme, Félix', 'Felix.Lapalme@USherbrooke.ca', '23650007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (196, 'janp1702', 'Janelle, Philippe', 'Philippe.Janelle@USherbrooke.ca', '23650007', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (197, 'lapf2312', 'Lapalme, Félix', 'Felix.Lapalme@USherbrooke.ca', '23650007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (198, 'beln2109', 'Béland, Nicolas', 'Nicolas.Beland2@USherbrooke.ca', '23650007', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (199, 'dror2204', 'Drouin, Raphaël', 'Raphael.Drouin@USherbrooke.ca', '23650007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (200, 'colp2502', 'Collin, Philippe', 'Philippe.Collin@USherbrooke.ca', '23650007', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (201, 'dupm2216', 'Dupuis, Maxime', 'Maxime.Dupuis2@USherbrooke.ca', '23650007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (202, 'beal2726', 'Beaulieu, Louis', 'Louis.J.Beaulieu@USherbrooke.ca', '23650007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (203, 'saun2403', 'Saudrais, Nicolas', 'Nicolas.Saudrais@USherbrooke.ca', '23650007', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (204, 'traa2306', 'Tran, Austin-Didier', 'Austin-Didier.Tran@USherbrooke.ca', '23650007', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (207, 'mera2411', 'Mercier-Nicol, Antoine', 'Antoine.Mercier-Nicol@USherbrooke.ca', '23653007', 'informatique - TO', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (208, 'dupm2216', 'Dupuis, Maxime', 'Maxime.Dupuis2@USherbrooke.ca', '23650007', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (209, 'bolb2201', 'Bolduc-Meilleur, Benjamin', 'Benjamin.Bolduc-Meilleur@USherbrooke.ca', '23650007', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (210, 'comb2301', 'Compagnat, Brian', 'Brian.Compagnat@USherbrooke.ca', '23651007', 'informatique- TE', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (211, 'mera2411', 'Mercier-Nicol, Antoine', 'Antoine.Mercier-Nicol@USherbrooke.ca', '23653007', 'informatique - TO', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (212, 'dupm2216', 'Dupuis, Maxime', 'Maxime.Dupuis2@USherbrooke.ca', '23650007', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (213, 'bonj2006', 'Bonsant, Jérémie', 'Jeremie.Bonsant@USherbrooke.ca', '23650007', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (214, 'royb2006', 'Roy, Benjamin', 'Benjamin.B.Roy@USherbrooke.ca', '23650007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (215, 'fouf2305', 'Fournier-Gaumond, Frédérick', 'Frederick.Fournier-Gaumond@USherbrooke.ca', '23650007', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (216, 'cars2019', 'Carrier, Simon', 'Simon.G.Carrier@USherbrooke.ca', '23650007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (217, 'bosb3201', 'Bossé, Bianca', 'Bianca.Bosse@USherbrooke.ca', '23650007', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (218, 'dorh2301', 'Dorion, Hugo', 'Hugo.Dorion@USherbrooke.ca', '23650007', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (219, 'janp1702', 'Janelle, Philippe', 'Philippe.Janelle@USherbrooke.ca', '23650007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (220, 'libv2001', 'Libioulle, Valentin', 'Valentin.Libioulle@USherbrooke.ca', '23653007', 'informatique - TO', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (221, 'bouf1819', 'Bourbonnais, Félix', 'Felix.Bourbonnais@USherbrooke.ca', '23652007', 'informatique - TI', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (222, 'becj2903', 'Béchard Marinier, Joseph', 'Joseph.Bechard.Marinier@USherbrooke.ca', '23650007', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (223, 'lixz2201', 'Li, Zi Long', 'Zi.Long.Li@USherbrooke.ca', '23650008', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (224, 'sanj2302', 'Santerre, Jonathan', 'Jonathan.Santerre2@USherbrooke.ca', '23650007', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (225, 'leca2312', 'Leclerc, Alexandre', 'Alexandre.Leclerc4@USherbrooke.ca', '23650007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (226, 'becj2903', 'Béchard Marinier, Joseph', 'Joseph.Bechard.Marinier@USherbrooke.ca', '23650007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (227, 'desa2924', 'Desloges, Anne-Marie', 'Anne-Marie.Desloges@USherbrooke.ca', '23650007', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (228, 'lusf1702', 'Lussier, Francis', 'Francis.Lussier2@USherbrooke.ca', '23653007', 'informatique - TO', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (229, 'bise2103', 'Bisson, Éric', 'Eric.Bisson@USherbrooke.ca', '23653007', 'informatique - TO', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (230, 'buca2201', 'Buche, Alexandre', 'Alexandre.Buche@USherbrooke.ca', '23650007', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (231, 'bonp2402', 'Bonin, Philippe', 'Philippe.Bonin2@USherbrooke.ca', '23653007', 'informatique - TO', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (232, 'desa2727', 'Desnoyers, Alexandre', 'Alexandre.Desnoyers@USherbrooke.ca', '23652007', 'informatique - TI', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (233, 'mate2002', 'Matte, Eric', 'Eric.Matte@USherbrooke.ca', '23650007', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (234, 'balp2101', 'Balthazar, Philippe', 'Philippe.Balthazar@USherbrooke.ca', '23650007', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (235, 'choj2705', 'Chouinard-Beaupré, Julien', 'Julien.Chouinard-Beaupre@USherbrooke.ca', '23652007', 'informatique - TI', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (236, 'royb2006', 'Roy, Benjamin', 'Benjamin.B.Roy@USherbrooke.ca', '23650007', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (237, 'lixz2201', 'Li, Zi Long', 'Zi.Long.Li@USherbrooke.ca', '23650008', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (238, 'diaa2116', 'Diallo, Alex Brian', 'Alex.Brian.Diallo@USherbrooke.ca', '23600007', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (239, 'bolb2201', 'Bolduc-Meilleur, Benjamin', 'Benjamin.Bolduc-Meilleur@USherbrooke.ca', '23650007', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (240, 'bouf1819', 'Bourbonnais, Félix', 'Felix.Bourbonnais@USherbrooke.ca', '23652007', 'informatique - TI', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (241, 'bali1801', 'Balafrej, Ismaël', 'Ismael.Balafrej@USherbrooke.ca', '23650007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (242, 'hepm1701', 'Heppell, Marc-Olivier', 'Marc-Olivier.Heppell@USherbrooke.ca', '23650007', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (243, 'brid2302', 'Briand, Danik', 'Danik.Briand@USherbrooke.ca', '23650006', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (244, 'lapf2312', 'Lapalme, Félix', 'Felix.Lapalme@USherbrooke.ca', '23650007', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (245, 'bouv1906', 'Bougie, Vincent', 'Vincent.Bougie@USherbrooke.ca', '23653007', 'informatique - TO', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (246, 'bouj2249', 'Boucher, Jonathan', 'Jonathan.Boucher3@USherbrooke.ca', '23650007', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (247, 'bouj2249', 'Boucher, Jonathan', 'Jonathan.Boucher3@USherbrooke.ca', '23650007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (248, 'leta1602', 'Létourneau, Adam', 'Adam.Letourneau@USherbrooke.ca', '23650007', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (249, 'bali1801', 'Balafrej, Ismaël', 'Ismael.Balafrej@USherbrooke.ca', '23650007', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (250, 'frem2110', 'Frenette, Marc-André', 'Marc-Andre.Frenette3@USherbrooke.ca', '23650007', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (251, 'perj2324', 'Perron-Langlois, Joël', 'Joel.Perron-Langlois@USherbrooke.ca', '23650007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (252, 'belo2302', 'Bellavance, Olivier', 'Olivier.Bellavance@USherbrooke.ca', '23650007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (253, 'choj2705', 'Chouinard-Beaupré, Julien', 'Julien.Chouinard-Beaupre@USherbrooke.ca', '23652007', 'informatique - TI', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (254, 'trej2334', 'Tremblay, Jordan Prince', 'Jordan.Prince.Tremblay@USherbrooke.ca', '23650007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (255, 'jutj2701', 'Juteau, Jean-Michel', 'Jean-Michel.Juteau@USherbrooke.ca', '23653007', 'informatique - TO', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (256, 'colp2502', 'Collin, Philippe', 'Philippe.Collin@USherbrooke.ca', '23650007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (257, 'lemc2223', 'Lemonde, Christopher', 'Christopher.Lemonde@USherbrooke.ca', '23650007', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (258, 'beal2726', 'Beaulieu, Louis', 'Louis.J.Beaulieu@USherbrooke.ca', '23650007', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (259, 'dorh2301', 'Dorion, Hugo', 'Hugo.Dorion@USherbrooke.ca', '23650007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (260, 'boug2128', 'Boucher, Gabriel', 'Gabriel.Boucher@USherbrooke.ca', '23653007', 'informatique - TO', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (261, 'brem2104', 'Breton, Maxime', 'Maxime.Breton@USherbrooke.ca', '23650007', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (262, 'bouf1819', 'Bourbonnais, Félix', 'Felix.Bourbonnais@USherbrooke.ca', '23652007', 'informatique - TI', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (263, 'allb2701', 'Allaire-Lemay, Bruno', 'Bruno.Allaire-Lemay@USherbrooke.ca', '23650007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (264, 'fouf2305', 'Fournier-Gaumond, Frédérick', 'Frederick.Fournier-Gaumond@USherbrooke.ca', '23650007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (265, 'allb2701', 'Allaire-Lemay, Bruno', 'Bruno.Allaire-Lemay@USherbrooke.ca', '23650007', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (266, 'saun2403', 'Saudrais, Nicolas', 'Nicolas.Saudrais@USherbrooke.ca', '23650007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (267, 'leta1602', 'Létourneau, Adam', 'Adam.Letourneau@USherbrooke.ca', '23650007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (268, 'jutj2701', 'Juteau, Jean-Michel', 'Jean-Michel.Juteau@USherbrooke.ca', '23653007', 'informatique - TO', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (269, 'cord1701', 'Corbeil Stroombergen, David', 'David.Corbeil.Stroombergen@USherbrooke.ca', '23653007', 'informatique - TO', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (270, 'belo2302', 'Bellavance, Olivier', 'Olivier.Bellavance@USherbrooke.ca', '23650007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (271, 'desa2924', 'Desloges, Anne-Marie', 'Anne-Marie.Desloges@USherbrooke.ca', '23650007', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (272, 'gosa3202', 'Gosselin, Alexandra', 'Alexandra.Gosselin2@USherbrooke.ca', '23652007', 'informatique - TI', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (273, 'perj2324', 'Perron-Langlois, Joël', 'Joel.Perron-Langlois@USherbrooke.ca', '23650007', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (274, 'buca2201', 'Buche, Alexandre', 'Alexandre.Buche@USherbrooke.ca', '23650007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (275, 'beln2109', 'Béland, Nicolas', 'Nicolas.Beland2@USherbrooke.ca', '23650007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (276, 'cord1701', 'Corbeil Stroombergen, David', 'David.Corbeil.Stroombergen@USherbrooke.ca', '23653007', 'informatique - TO', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (277, 'bouv1906', 'Bougie, Vincent', 'Vincent.Bougie@USherbrooke.ca', '23653007', 'informatique - TO', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (278, 'cota1810', 'Côté, Alexandre', 'Alexandre.Cote11@USherbrooke.ca', '23650007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (279, 'marq2901', 'Marienneau, Quentin', 'Quentin.Marienneau@USherbrooke.ca', '4EH00001', 'Informatique', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (280, 'arse1503', 'Arseneault, Emile', 'Emile.Arseneault@USherbrooke.ca', '23650007', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (281, 'marq2901', 'Marienneau, Quentin', 'Quentin.Marienneau@USherbrooke.ca', '4EH00001', 'Informatique', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (282, 'becj2903', 'Béchard Marinier, Joseph', 'Joseph.Bechard.Marinier@USherbrooke.ca', '23650007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (283, 'maia2604', 'Maisonneuve, Alex', 'Alex.Maisonneuve@USherbrooke.ca', '23653007', 'informatique - TO', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (284, 'fouf2305', 'Fournier-Gaumond, Frédérick', 'Frederick.Fournier-Gaumond@USherbrooke.ca', '23650007', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (285, 'bise2103', 'Bisson, Éric', 'Eric.Bisson@USherbrooke.ca', '23653007', 'informatique - TO', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (286, 'laci2103', 'Lachance, Ian', 'Ian.Lachance@USherbrooke.ca', '23650007', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (287, 'cars2019', 'Carrier, Simon', 'Simon.G.Carrier@USherbrooke.ca', '23650007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (288, 'brem2104', 'Breton, Maxime', 'Maxime.Breton@USherbrooke.ca', '23650007', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (289, 'buca2201', 'Buche, Alexandre', 'Alexandre.Buche@USherbrooke.ca', '23650007', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (290, 'bers3019', 'Bernier-Ouellet, Simon', 'Simon.Bernier-Ouellet@USherbrooke.ca', '23652007', 'informatique - TI', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (291, 'cord1701', 'Corbeil Stroombergen, David', 'David.Corbeil.Stroombergen@USherbrooke.ca', '23653007', 'informatique - TO', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (292, 'maia2604', 'Maisonneuve, Alex', 'Alex.Maisonneuve@USherbrooke.ca', '23653007', 'informatique - TO', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (293, 'desa2727', 'Desnoyers, Alexandre', 'Alexandre.Desnoyers@USherbrooke.ca', '23652007', 'informatique - TI', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (294, 'bouv1906', 'Bougie, Vincent', 'Vincent.Bougie@USherbrooke.ca', '23653007', 'informatique - TO', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (295, 'godj2407', 'Godin, Jérôme', 'Jerome.Godin@USherbrooke.ca', '23653007', 'informatique - TO', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (296, 'alle2004', 'Allard, Emeri', 'Emeri.Allard@USherbrooke.ca', '23650007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (297, 'becj2903', 'Béchard Marinier, Joseph', 'Joseph.Bechard.Marinier@USherbrooke.ca', '23650007', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (298, 'bolb2201', 'Bolduc-Meilleur, Benjamin', 'Benjamin.Bolduc-Meilleur@USherbrooke.ca', '23650007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (299, 'sera1901', 'Sermaxhaj, Adriatik', 'Adriatik.Sermaxhaj@USherbrooke.ca', '23652007', 'informatique - TI', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (300, 'desa2924', 'Desloges, Anne-Marie', 'Anne-Marie.Desloges@USherbrooke.ca', '23650007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (301, 'rica2507', 'Ricard Lalonde, Alexandre', 'Alexandre.Ricard.Lalonde@USherbrooke.ca', '23653007', 'informatique - TO', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (302, 'bert2204', 'Bernard, Thomas', 'Thomas.Bernard@USherbrooke.ca', '23650007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (303, 'belo2302', 'Bellavance, Olivier', 'Olivier.Bellavance@USherbrooke.ca', '23650007', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (304, 'belo2302', 'Bellavance, Olivier', 'Olivier.Bellavance@USherbrooke.ca', '23650007', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (305, 'bouv1906', 'Bougie, Vincent', 'Vincent.Bougie@USherbrooke.ca', '23653007', 'informatique - TO', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (306, 'sera1901', 'Sermaxhaj, Adriatik', 'Adriatik.Sermaxhaj@USherbrooke.ca', '23652007', 'informatique - TI', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (307, 'traa2306', 'Tran, Austin-Didier', 'Austin-Didier.Tran@USherbrooke.ca', '23650007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (308, 'marq2901', 'Marienneau, Quentin', 'Quentin.Marienneau@USherbrooke.ca', '4EH00001', 'Informatique', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (309, 'goud2703', 'Goulet, David', 'David.Goulet4@USherbrooke.ca', '23652506', 'informatique', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (310, 'mate2002', 'Matte, Eric', 'Eric.Matte@USherbrooke.ca', '23650007', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (311, 'maia2604', 'Maisonneuve, Alex', 'Alex.Maisonneuve@USherbrooke.ca', '23653007', 'informatique - TO', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (312, 'mera2411', 'Mercier-Nicol, Antoine', 'Antoine.Mercier-Nicol@USherbrooke.ca', '23653007', 'informatique - TO', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (313, 'fonp2402', 'Fontaine, Philippe', 'Philippe.Fontaine2@USherbrooke.ca', '23650007', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (314, 'traa2306', 'Tran, Austin-Didier', 'Austin-Didier.Tran@USherbrooke.ca', '23650007', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (315, 'mera2411', 'Mercier-Nicol, Antoine', 'Antoine.Mercier-Nicol@USherbrooke.ca', '23653007', 'informatique - TO', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (316, 'sanj2302', 'Santerre, Jonathan', 'Jonathan.Santerre2@USherbrooke.ca', '23650007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (317, 'bouf1819', 'Bourbonnais, Félix', 'Felix.Bourbonnais@USherbrooke.ca', '23652007', 'informatique - TI', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (318, 'saun2403', 'Saudrais, Nicolas', 'Nicolas.Saudrais@USherbrooke.ca', '23650007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (319, 'allb2701', 'Allaire-Lemay, Bruno', 'Bruno.Allaire-Lemay@USherbrooke.ca', '23650007', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (320, 'bouj2249', 'Boucher, Jonathan', 'Jonathan.Boucher3@USherbrooke.ca', '23650007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (321, 'diaa2116', 'Diallo, Alex Brian', 'Alex.Brian.Diallo@USherbrooke.ca', '23600007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (322, 'rica2507', 'Ricard Lalonde, Alexandre', 'Alexandre.Ricard.Lalonde@USherbrooke.ca', '23653007', 'informatique - TO', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (323, 'leta1602', 'Létourneau, Adam', 'Adam.Letourneau@USherbrooke.ca', '23650007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (324, 'trej2334', 'Tremblay, Jordan Prince', 'Jordan.Prince.Tremblay@USherbrooke.ca', '23650007', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (325, 'sanj2302', 'Santerre, Jonathan', 'Jonathan.Santerre2@USherbrooke.ca', '23650007', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (326, 'dror2204', 'Drouin, Raphaël', 'Raphael.Drouin@USherbrooke.ca', '23650007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (327, 'bouv1906', 'Bougie, Vincent', 'Vincent.Bougie@USherbrooke.ca', '23653007', 'informatique - TO', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (328, 'perj2324', 'Perron-Langlois, Joël', 'Joel.Perron-Langlois@USherbrooke.ca', '23650007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (329, 'choj2705', 'Chouinard-Beaupré, Julien', 'Julien.Chouinard-Beaupre@USherbrooke.ca', '23652007', 'informatique - TI', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (330, 'sera1901', 'Sermaxhaj, Adriatik', 'Adriatik.Sermaxhaj@USherbrooke.ca', '23652007', 'informatique - TI', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (331, 'marf3402', 'Martel-Denis, Félix', 'Felix.Martel-Denis@USherbrooke.ca', '23650007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (332, 'beam2039', 'Beaudoin, Marc-Antoine', 'Marc-Antoine.Beaudoin2@USherbrooke.ca', '23650007', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (333, 'gosa3202', 'Gosselin, Alexandra', 'Alexandra.Gosselin2@USherbrooke.ca', '23652007', 'informatique - TI', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (334, 'bouj2249', 'Boucher, Jonathan', 'Jonathan.Boucher3@USherbrooke.ca', '23650007', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (335, 'dror2204', 'Drouin, Raphaël', 'Raphael.Drouin@USherbrooke.ca', '23650007', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (336, 'laci2103', 'Lachance, Ian', 'Ian.Lachance@USherbrooke.ca', '23650007', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (337, 'rica2507', 'Ricard Lalonde, Alexandre', 'Alexandre.Ricard.Lalonde@USherbrooke.ca', '23653007', 'informatique - TO', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (338, 'leca2312', 'Leclerc, Alexandre', 'Alexandre.Leclerc4@USherbrooke.ca', '23650007', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (339, 'jutj2701', 'Juteau, Jean-Michel', 'Jean-Michel.Juteau@USherbrooke.ca', '23653007', 'informatique - TO', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (340, 'perj2324', 'Perron-Langlois, Joël', 'Joel.Perron-Langlois@USherbrooke.ca', '23650007', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (341, 'cars2019', 'Carrier, Simon', 'Simon.G.Carrier@USherbrooke.ca', '23650007', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (342, 'beam2039', 'Beaudoin, Marc-Antoine', 'Marc-Antoine.Beaudoin2@USherbrooke.ca', '23650007', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (343, 'arse1503', 'Arseneault, Emile', 'Emile.Arseneault@USherbrooke.ca', '23650007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (344, 'leta1602', 'Létourneau, Adam', 'Adam.Letourneau@USherbrooke.ca', '23650007', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (345, 'mate2002', 'Matte, Eric', 'Eric.Matte@USherbrooke.ca', '23650007', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (346, 'beam2039', 'Beaudoin, Marc-Antoine', 'Marc-Antoine.Beaudoin2@USherbrooke.ca', '23650007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (347, 'laci2103', 'Lachance, Ian', 'Ian.Lachance@USherbrooke.ca', '23650007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (348, 'trej2334', 'Tremblay, Jordan Prince', 'Jordan.Prince.Tremblay@USherbrooke.ca', '23650007', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (349, 'jale1402', 'Jalbert, Etienne', 'Etienne.Jalbert@USherbrooke.ca', '23653007', 'informatique - TO', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (350, 'maia2604', 'Maisonneuve, Alex', 'Alex.Maisonneuve@USherbrooke.ca', '23653007', 'informatique - TO', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (351, 'bert2204', 'Bernard, Thomas', 'Thomas.Bernard@USherbrooke.ca', '23650007', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (352, 'bosb3201', 'Bossé, Bianca', 'Bianca.Bosse@USherbrooke.ca', '23650007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (353, 'balp2101', 'Balthazar, Philippe', 'Philippe.Balthazar@USherbrooke.ca', '23650007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (354, 'bonp2402', 'Bonin, Philippe', 'Philippe.Bonin2@USherbrooke.ca', '23653007', 'informatique - TO', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (355, 'bers3019', 'Bernier-Ouellet, Simon', 'Simon.Bernier-Ouellet@USherbrooke.ca', '23652007', 'informatique - TI', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (356, 'rica2507', 'Ricard Lalonde, Alexandre', 'Alexandre.Ricard.Lalonde@USherbrooke.ca', '23653007', 'informatique - TO', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (357, 'ricn1501', 'Richard, Nicolas', 'Nicolas.Richard3@USherbrooke.ca', '23651606', 'informatique', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (358, 'jutj2701', 'Juteau, Jean-Michel', 'Jean-Michel.Juteau@USherbrooke.ca', '23653007', 'informatique - TO', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (359, 'desa2924', 'Desloges, Anne-Marie', 'Anne-Marie.Desloges@USherbrooke.ca', '23650007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (360, 'fouf2305', 'Fournier-Gaumond, Frédérick', 'Frederick.Fournier-Gaumond@USherbrooke.ca', '23650007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (361, 'dioj2117', 'Dionne, Joey', 'Joey.Dionne@USherbrooke.ca', '23653007', 'informatique - TO', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (362, 'leca2312', 'Leclerc, Alexandre', 'Alexandre.Leclerc4@USherbrooke.ca', '23650007', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (363, 'godj2407', 'Godin, Jérôme', 'Jerome.Godin@USherbrooke.ca', '23653007', 'informatique - TO', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (364, 'marf3402', 'Martel-Denis, Félix', 'Felix.Martel-Denis@USherbrooke.ca', '23650007', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (365, 'desa2924', 'Desloges, Anne-Marie', 'Anne-Marie.Desloges@USherbrooke.ca', '23650007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (366, 'alle2004', 'Allard, Emeri', 'Emeri.Allard@USherbrooke.ca', '23650007', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (367, 'dorh2301', 'Dorion, Hugo', 'Hugo.Dorion@USherbrooke.ca', '23650007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (368, 'fouf2305', 'Fournier-Gaumond, Frédérick', 'Frederick.Fournier-Gaumond@USherbrooke.ca', '23650007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (369, 'hepm1701', 'Heppell, Marc-Olivier', 'Marc-Olivier.Heppell@USherbrooke.ca', '23650007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (370, 'buca2201', 'Buche, Alexandre', 'Alexandre.Buche@USherbrooke.ca', '23650007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (371, 'dupm2216', 'Dupuis, Maxime', 'Maxime.Dupuis2@USherbrooke.ca', '23650007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (372, 'bert2204', 'Bernard, Thomas', 'Thomas.Bernard@USherbrooke.ca', '23650007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (373, 'colp2502', 'Collin, Philippe', 'Philippe.Collin@USherbrooke.ca', '23650007', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (374, 'fonp2402', 'Fontaine, Philippe', 'Philippe.Fontaine2@USherbrooke.ca', '23650007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (375, 'bise2103', 'Bisson, Éric', 'Eric.Bisson@USherbrooke.ca', '23653007', 'informatique - TO', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (376, 'cars2019', 'Carrier, Simon', 'Simon.G.Carrier@USherbrooke.ca', '23650007', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (377, 'marq2901', 'Marienneau, Quentin', 'Quentin.Marienneau@USherbrooke.ca', '4EH00001', 'Informatique', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (378, 'buca2201', 'Buche, Alexandre', 'Alexandre.Buche@USherbrooke.ca', '23650007', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (379, 'laci2103', 'Lachance, Ian', 'Ian.Lachance@USherbrooke.ca', '23650007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (380, 'boug2128', 'Boucher, Gabriel', 'Gabriel.Boucher@USherbrooke.ca', '23653007', 'informatique - TO', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (381, 'bouv1906', 'Bougie, Vincent', 'Vincent.Bougie@USherbrooke.ca', '23653007', 'informatique - TO', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (382, 'becj2903', 'Béchard Marinier, Joseph', 'Joseph.Bechard.Marinier@USherbrooke.ca', '23650007', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (383, 'diaa2116', 'Diallo, Alex Brian', 'Alex.Brian.Diallo@USherbrooke.ca', '23600007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (384, 'lusf1702', 'Lussier, Francis', 'Francis.Lussier2@USherbrooke.ca', '23653007', 'informatique - TO', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (385, 'arse1503', 'Arseneault, Emile', 'Emile.Arseneault@USherbrooke.ca', '23650007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (386, 'poum2319', 'Poulin, Marc-Antoine', 'Marc-Antoine.Poulin2@USherbrooke.ca', '23652007', 'informatique - TI', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (387, 'beal2726', 'Beaulieu, Louis', 'Louis.J.Beaulieu@USherbrooke.ca', '23650007', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (388, 'boug2128', 'Boucher, Gabriel', 'Gabriel.Boucher@USherbrooke.ca', '23653007', 'informatique - TO', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (389, 'bena2215', 'Benoit, Alexandre', 'Alexandre.C.Benoit@USherbrooke.ca', '23650007', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (390, 'jutj2701', 'Juteau, Jean-Michel', 'Jean-Michel.Juteau@USherbrooke.ca', '23653007', 'informatique - TO', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (391, 'beam2039', 'Beaudoin, Marc-Antoine', 'Marc-Antoine.Beaudoin2@USherbrooke.ca', '23650007', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (392, 'lapf2312', 'Lapalme, Félix', 'Felix.Lapalme@USherbrooke.ca', '23650007', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (393, 'jale1402', 'Jalbert, Etienne', 'Etienne.Jalbert@USherbrooke.ca', '23653007', 'informatique - TO', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (394, 'dupm2216', 'Dupuis, Maxime', 'Maxime.Dupuis2@USherbrooke.ca', '23650007', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (395, 'jale1402', 'Jalbert, Etienne', 'Etienne.Jalbert@USherbrooke.ca', '23653007', 'informatique - TO', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (396, 'bise2103', 'Bisson, Éric', 'Eric.Bisson@USherbrooke.ca', '23653007', 'informatique - TO', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (397, 'bonj2006', 'Bonsant, Jérémie', 'Jeremie.Bonsant@USherbrooke.ca', '23650007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (398, 'frem2110', 'Frenette, Marc-André', 'Marc-Andre.Frenette3@USherbrooke.ca', '23650007', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (399, 'bali1801', 'Balafrej, Ismaël', 'Ismael.Balafrej@USherbrooke.ca', '23650007', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (400, 'brem2104', 'Breton, Maxime', 'Maxime.Breton@USherbrooke.ca', '23650007', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (401, 'gosa3202', 'Gosselin, Alexandra', 'Alexandra.Gosselin2@USherbrooke.ca', '23652007', 'informatique - TI', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (402, 'buca2201', 'Buche, Alexandre', 'Alexandre.Buche@USherbrooke.ca', '23650007', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (403, 'belo2302', 'Bellavance, Olivier', 'Olivier.Bellavance@USherbrooke.ca', '23650007', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (404, 'comb2301', 'Compagnat, Brian', 'Brian.Compagnat@USherbrooke.ca', '23651007', 'informatique- TE', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (405, 'frem2110', 'Frenette, Marc-André', 'Marc-Andre.Frenette3@USherbrooke.ca', '23650007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (406, 'cota1810', 'Côté, Alexandre', 'Alexandre.Cote11@USherbrooke.ca', '23650007', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (407, 'cord1701', 'Corbeil Stroombergen, David', 'David.Corbeil.Stroombergen@USherbrooke.ca', '23653007', 'informatique - TO', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (408, 'lixz2201', 'Li, Zi Long', 'Zi.Long.Li@USherbrooke.ca', '23650008', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (409, 'bolb2201', 'Bolduc-Meilleur, Benjamin', 'Benjamin.Bolduc-Meilleur@USherbrooke.ca', '23650007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (410, 'godj2407', 'Godin, Jérôme', 'Jerome.Godin@USherbrooke.ca', '23653007', 'informatique - TO', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (411, 'libv2001', 'Libioulle, Valentin', 'Valentin.Libioulle@USherbrooke.ca', '23653007', 'informatique - TO', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (412, 'bise2103', 'Bisson, Éric', 'Eric.Bisson@USherbrooke.ca', '23653007', 'informatique - TO', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (413, 'bonj2006', 'Bonsant, Jérémie', 'Jeremie.Bonsant@USherbrooke.ca', '23650007', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (414, 'bert2204', 'Bernard, Thomas', 'Thomas.Bernard@USherbrooke.ca', '23650007', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (415, 'libv2001', 'Libioulle, Valentin', 'Valentin.Libioulle@USherbrooke.ca', '23653007', 'informatique - TO', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (416, 'beal2726', 'Beaulieu, Louis', 'Louis.J.Beaulieu@USherbrooke.ca', '23650007', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (417, 'frem2110', 'Frenette, Marc-André', 'Marc-Andre.Frenette3@USherbrooke.ca', '23650007', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (418, 'trej2334', 'Tremblay, Jordan Prince', 'Jordan.Prince.Tremblay@USherbrooke.ca', '23650007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (419, 'comb2301', 'Compagnat, Brian', 'Brian.Compagnat@USherbrooke.ca', '23651007', 'informatique- TE', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (420, 'bolb2201', 'Bolduc-Meilleur, Benjamin', 'Benjamin.Bolduc-Meilleur@USherbrooke.ca', '23650007', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (421, 'bena2215', 'Benoit, Alexandre', 'Alexandre.C.Benoit@USherbrooke.ca', '23650007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (422, 'mate2002', 'Matte, Eric', 'Eric.Matte@USherbrooke.ca', '23650007', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (423, 'leca2312', 'Leclerc, Alexandre', 'Alexandre.Leclerc4@USherbrooke.ca', '23650007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (424, 'lusf1702', 'Lussier, Francis', 'Francis.Lussier2@USherbrooke.ca', '23653007', 'informatique - TO', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (425, 'cord1701', 'Corbeil Stroombergen, David', 'David.Corbeil.Stroombergen@USherbrooke.ca', '23653007', 'informatique - TO', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (426, 'bena2215', 'Benoit, Alexandre', 'Alexandre.C.Benoit@USherbrooke.ca', '23650007', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (427, 'royb2006', 'Roy, Benjamin', 'Benjamin.B.Roy@USherbrooke.ca', '23650007', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (428, 'lixz2201', 'Li, Zi Long', 'Zi.Long.Li@USherbrooke.ca', '23650008', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (429, 'bena2215', 'Benoit, Alexandre', 'Alexandre.C.Benoit@USherbrooke.ca', '23650007', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (430, 'fonp2402', 'Fontaine, Philippe', 'Philippe.Fontaine2@USherbrooke.ca', '23650007', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (431, 'dioj2117', 'Dionne, Joey', 'Joey.Dionne@USherbrooke.ca', '23653007', 'informatique - TO', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (432, 'perj2324', 'Perron-Langlois, Joël', 'Joel.Perron-Langlois@USherbrooke.ca', '23650007', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (433, 'bali1801', 'Balafrej, Ismaël', 'Ismael.Balafrej@USherbrooke.ca', '23650007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (434, 'dror2204', 'Drouin, Raphaël', 'Raphael.Drouin@USherbrooke.ca', '23650007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (435, 'bise2103', 'Bisson, Éric', 'Eric.Bisson@USherbrooke.ca', '23653007', 'informatique - TO', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (436, 'arse1503', 'Arseneault, Emile', 'Emile.Arseneault@USherbrooke.ca', '23650007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (437, 'cord1701', 'Corbeil Stroombergen, David', 'David.Corbeil.Stroombergen@USherbrooke.ca', '23653007', 'informatique - TO', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (438, 'choj2705', 'Chouinard-Beaupré, Julien', 'Julien.Chouinard-Beaupre@USherbrooke.ca', '23652007', 'informatique - TI', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (439, 'royb2006', 'Roy, Benjamin', 'Benjamin.B.Roy@USherbrooke.ca', '23650007', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (440, 'beln2109', 'Béland, Nicolas', 'Nicolas.Beland2@USherbrooke.ca', '23650007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (441, 'allb2701', 'Allaire-Lemay, Bruno', 'Bruno.Allaire-Lemay@USherbrooke.ca', '23650007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (442, 'traa2306', 'Tran, Austin-Didier', 'Austin-Didier.Tran@USherbrooke.ca', '23650007', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (443, 'cars2019', 'Carrier, Simon', 'Simon.G.Carrier@USherbrooke.ca', '23650007', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (444, 'leta1602', 'Létourneau, Adam', 'Adam.Letourneau@USherbrooke.ca', '23650007', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (445, 'cota1810', 'Côté, Alexandre', 'Alexandre.Cote11@USherbrooke.ca', '23650007', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (446, 'saun2403', 'Saudrais, Nicolas', 'Nicolas.Saudrais@USherbrooke.ca', '23650007', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (447, 'gosa3202', 'Gosselin, Alexandra', 'Alexandra.Gosselin2@USherbrooke.ca', '23652007', 'informatique - TI', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (448, 'boug2128', 'Boucher, Gabriel', 'Gabriel.Boucher@USherbrooke.ca', '23653007', 'informatique - TO', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (449, 'poum2319', 'Poulin, Marc-Antoine', 'Marc-Antoine.Poulin2@USherbrooke.ca', '23652007', 'informatique - TI', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (450, 'diaa2116', 'Diallo, Alex Brian', 'Alex.Brian.Diallo@USherbrooke.ca', '23600007', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (451, 'rica2507', 'Ricard Lalonde, Alexandre', 'Alexandre.Ricard.Lalonde@USherbrooke.ca', '23653007', 'informatique - TO', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (452, 'royb2006', 'Roy, Benjamin', 'Benjamin.B.Roy@USherbrooke.ca', '23650007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (453, 'janp1702', 'Janelle, Philippe', 'Philippe.Janelle@USherbrooke.ca', '23650007', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (454, 'mera2411', 'Mercier-Nicol, Antoine', 'Antoine.Mercier-Nicol@USherbrooke.ca', '23653007', 'informatique - TO', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (455, 'cota1810', 'Côté, Alexandre', 'Alexandre.Cote11@USherbrooke.ca', '23650007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (456, 'sanj2302', 'Santerre, Jonathan', 'Jonathan.Santerre2@USherbrooke.ca', '23650007', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (457, 'desa2727', 'Desnoyers, Alexandre', 'Alexandre.Desnoyers@USherbrooke.ca', '23652007', 'informatique - TI', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (458, 'libv2001', 'Libioulle, Valentin', 'Valentin.Libioulle@USherbrooke.ca', '23653007', 'informatique - TO', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (459, 'sera1901', 'Sermaxhaj, Adriatik', 'Adriatik.Sermaxhaj@USherbrooke.ca', '23652007', 'informatique - TI', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (460, 'colp2502', 'Collin, Philippe', 'Philippe.Collin@USherbrooke.ca', '23650007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (461, 'maia2604', 'Maisonneuve, Alex', 'Alex.Maisonneuve@USherbrooke.ca', '23653007', 'informatique - TO', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (462, 'arse1503', 'Arseneault, Emile', 'Emile.Arseneault@USherbrooke.ca', '23650007', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (463, 'bosb3201', 'Bossé, Bianca', 'Bianca.Bosse@USherbrooke.ca', '23650007', 'informatique -SN', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (464, 'beal2726', 'Beaulieu, Louis', 'Louis.J.Beaulieu@USherbrooke.ca', '23650007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (465, 'brem2104', 'Breton, Maxime', 'Maxime.Breton@USherbrooke.ca', '23650007', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (466, 'dupm2216', 'Dupuis, Maxime', 'Maxime.Dupuis2@USherbrooke.ca', '23650007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (467, 'balp2101', 'Balthazar, Philippe', 'Philippe.Balthazar@USherbrooke.ca', '23650007', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (468, 'bert2204', 'Bernard, Thomas', 'Thomas.Bernard@USherbrooke.ca', '23650007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (469, 'lusf1702', 'Lussier, Francis', 'Francis.Lussier2@USherbrooke.ca', '23653007', 'informatique - TO', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (470, 'bali1801', 'Balafrej, Ismaël', 'Ismael.Balafrej@USherbrooke.ca', '23650007', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (471, 'allb2701', 'Allaire-Lemay, Bruno', 'Bruno.Allaire-Lemay@USherbrooke.ca', '23650007', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (472, 'dioj2117', 'Dionne, Joey', 'Joey.Dionne@USherbrooke.ca', '23653007', 'informatique - TO', 'projet', 'Conception d''une architecture de système ', 'GIF301-01:GIF310-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (473, 'desa2727', 'Desnoyers, Alexandre', 'Alexandre.Desnoyers@USherbrooke.ca', '23652007', 'informatique - TI', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (474, 'diaa2116', 'Diallo, Alex Brian', 'Alex.Brian.Diallo@USherbrooke.ca', '23600007', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (475, 'fouf2305', 'Fournier-Gaumond, Frédérick', 'Frederick.Fournier-Gaumond@USherbrooke.ca', '23650007', 'informatique -SN', 'app3', 'Langages et compilation', 'GIF340-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (476, 'beln2109', 'Béland, Nicolas', 'Nicolas.Beland2@USherbrooke.ca', '23650007', 'informatique -SN', 'app2', 'Analyse de performance', 'GIF360-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (477, 'boug2128', 'Boucher, Gabriel', 'Gabriel.Boucher@USherbrooke.ca', '23653007', 'informatique - TO', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (478, 'marf3402', 'Martel-Denis, Félix', 'Felix.Martel-Denis@USherbrooke.ca', '23650007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (479, 'comb2301', 'Compagnat, Brian', 'Brian.Compagnat@USherbrooke.ca', '23651007', 'informatique- TE', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (480, 'slia3201', 'Slimani, Aida', 'Aida.Slimani@USherbrooke.ca', '23600007', 'informatique -SN', 'app6', 'Systèmes d''exploitation', 'GIF320-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (481, 'saun2403', 'Saudrais, Nicolas', 'Nicolas.Saudrais@USherbrooke.ca', '23650007', 'informatique -SN', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (482, 'laci2103', 'Lachance, Ian', 'Ian.Lachance@USherbrooke.ca', '23650007', 'informatique -SN', 'app1', 'Architecture et langage machine', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (483, 'hepm1701', 'Heppell, Marc-Olivier', 'Marc-Olivier.Heppell@USherbrooke.ca', '23650007', 'informatique -SN', 'app5', 'Prototypage d''architecture', 'GIF310-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');
INSERT INTO app.etudiant_app VALUES (484, 'desa2727', 'Desnoyers, Alexandre', 'Alexandre.Desnoyers@USherbrooke.ca', '23652007', 'informatique - TI', 'app4', 'Résaux et protocoles de communication', 'GIF331-01:GIF362-01', 'Génie Électrique et génie informatique', 'Génie', 'Sherbrooke');


--
-- TOC entry 3228 (class 0 OID 1371956)
-- Dependencies: 205
-- Data for Name: faculte; Type: TABLE DATA; Schema: app; Owner: s3iprojet00
--



--
-- TOC entry 3230 (class 0 OID 1371964)
-- Dependencies: 207
-- Data for Name: programme; Type: TABLE DATA; Schema: app; Owner: s3iprojet00
--



--
-- TOC entry 3234 (class 0 OID 1372101)
-- Dependencies: 212
-- Data for Name: trimester; Type: TABLE DATA; Schema: app; Owner: s3iprojet00
--

INSERT INTO app.trimester VALUES ('H20', 'Hiver 2020', '2020-01-03', '2020-04-28', '2021-03-17 15:19:17.563382-04');
INSERT INTO app.trimester VALUES ('E20', 'Été 2020', '2020-05-01', '2020-08-18', '2021-03-17 15:19:49.246792-04');
INSERT INTO app.trimester VALUES ('A20', 'Automne 2020', '2020-08-29', '2020-12-23', '2021-03-17 15:20:40.349642-04');


--
-- TOC entry 3231 (class 0 OID 1371970)
-- Dependencies: 208
-- Data for Name: universite; Type: TABLE DATA; Schema: app; Owner: s3iprojet00
--



--
-- TOC entry 3233 (class 0 OID 1371982)
-- Dependencies: 211
-- Data for Name: version; Type: TABLE DATA; Schema: app; Owner: s3iprojet00
--



--
-- TOC entry 3210 (class 0 OID 1318072)
-- Dependencies: 187
-- Data for Name: article; Type: TABLE DATA; Schema: laboratoire2; Owner: administrateur
--

INSERT INTO laboratoire2.article VALUES (10, 'Cadre en boule', 10.99, 10);
INSERT INTO laboratoire2.article VALUES (20, 'Sapin', 12.99, 10);
INSERT INTO laboratoire2.article VALUES (40, 'Epinette bleue', 25.99, 10);
INSERT INTO laboratoire2.article VALUES (50, 'Chaine', 22.99, 10);
INSERT INTO laboratoire2.article VALUES (60, 'Érable argent', 15.99, 10);
INSERT INTO laboratoire2.article VALUES (70, 'Herbe puce', 10.99, 10);
INSERT INTO laboratoire2.article VALUES (80, 'Poirier', 26.99, 10);
INSERT INTO laboratoire2.article VALUES (81, 'Catalpa', 25.99, 10);
INSERT INTO laboratoire2.article VALUES (90, 'Pommier', 25.99, 10);
INSERT INTO laboratoire2.article VALUES (95, 'Genvrier', 15.99, 10);


--
-- TOC entry 3211 (class 0 OID 1318080)
-- Dependencies: 188
-- Data for Name: client; Type: TABLE DATA; Schema: laboratoire2; Owner: administrateur
--

INSERT INTO laboratoire2.client VALUES (10, 'Luc Sansom', '(999)999-9999');
INSERT INTO laboratoire2.client VALUES (20, 'Dollard Tremblay', '(888)888-8888');
INSERT INTO laboratoire2.client VALUES (30, 'Lin B', '(777)777-7777');
INSERT INTO laboratoire2.client VALUES (40, 'Jean Leconte', '(666)666-6666');
INSERT INTO laboratoire2.client VALUES (50, 'Hafed Alaoui', '(555)555-5555');
INSERT INTO laboratoire2.client VALUES (60, 'Marie Leconte', '(666)666-6666');
INSERT INTO laboratoire2.client VALUES (70, 'Simon Lecoq', '(444)444-4419');
INSERT INTO laboratoire2.client VALUES (80, 'Dollard Tremblay', NULL);


--
-- TOC entry 3212 (class 0 OID 1318085)
-- Dependencies: 189
-- Data for Name: commande; Type: TABLE DATA; Schema: laboratoire2; Owner: administrateur
--

INSERT INTO laboratoire2.commande VALUES (1, 10, '2019-01-06');
INSERT INTO laboratoire2.commande VALUES (2, 20, '2019-02-06');
INSERT INTO laboratoire2.commande VALUES (3, 10, '2019-02-06');
INSERT INTO laboratoire2.commande VALUES (4, 10, '2019-05-07');
INSERT INTO laboratoire2.commande VALUES (5, 30, '2019-07-09');
INSERT INTO laboratoire2.commande VALUES (6, 20, '2019-07-09');
INSERT INTO laboratoire2.commande VALUES (7, 40, '2019-07-15');
INSERT INTO laboratoire2.commande VALUES (8, 40, '2019-07-15');


--
-- TOC entry 3213 (class 0 OID 1318090)
-- Dependencies: 190
-- Data for Name: detaillivraison; Type: TABLE DATA; Schema: laboratoire2; Owner: administrateur
--

INSERT INTO laboratoire2.detaillivraison VALUES (1, 10, 100, 7);
INSERT INTO laboratoire2.detaillivraison VALUES (1, 70, 100, 5);
INSERT INTO laboratoire2.detaillivraison VALUES (1, 10, 101, 3);
INSERT INTO laboratoire2.detaillivraison VALUES (2, 40, 102, 2);
INSERT INTO laboratoire2.detaillivraison VALUES (2, 95, 102, 1);
INSERT INTO laboratoire2.detaillivraison VALUES (3, 20, 100, 1);
INSERT INTO laboratoire2.detaillivraison VALUES (1, 90, 103, 1);
INSERT INTO laboratoire2.detaillivraison VALUES (4, 40, 104, 1);
INSERT INTO laboratoire2.detaillivraison VALUES (5, 70, 105, 2);


--
-- TOC entry 3214 (class 0 OID 1318095)
-- Dependencies: 191
-- Data for Name: lignecommande; Type: TABLE DATA; Schema: laboratoire2; Owner: administrateur
--

INSERT INTO laboratoire2.lignecommande VALUES (1, 10, 10);
INSERT INTO laboratoire2.lignecommande VALUES (1, 70, 5);
INSERT INTO laboratoire2.lignecommande VALUES (1, 90, 1);
INSERT INTO laboratoire2.lignecommande VALUES (2, 10, 2);
INSERT INTO laboratoire2.lignecommande VALUES (2, 40, 2);
INSERT INTO laboratoire2.lignecommande VALUES (2, 95, 3);
INSERT INTO laboratoire2.lignecommande VALUES (3, 10, 1);
INSERT INTO laboratoire2.lignecommande VALUES (3, 20, 1);
INSERT INTO laboratoire2.lignecommande VALUES (3, 70, 5);
INSERT INTO laboratoire2.lignecommande VALUES (4, 10, 1);
INSERT INTO laboratoire2.lignecommande VALUES (4, 40, 1);
INSERT INTO laboratoire2.lignecommande VALUES (4, 50, 1);
INSERT INTO laboratoire2.lignecommande VALUES (4, 70, 5);
INSERT INTO laboratoire2.lignecommande VALUES (5, 70, 3);
INSERT INTO laboratoire2.lignecommande VALUES (5, 10, 5);
INSERT INTO laboratoire2.lignecommande VALUES (5, 20, 5);
INSERT INTO laboratoire2.lignecommande VALUES (6, 10, 5);
INSERT INTO laboratoire2.lignecommande VALUES (6, 40, 1);
INSERT INTO laboratoire2.lignecommande VALUES (7, 10, 2);
INSERT INTO laboratoire2.lignecommande VALUES (7, 50, 1);
INSERT INTO laboratoire2.lignecommande VALUES (8, 10, 2);
INSERT INTO laboratoire2.lignecommande VALUES (8, 20, 3);


--
-- TOC entry 3215 (class 0 OID 1318100)
-- Dependencies: 192
-- Data for Name: livraison; Type: TABLE DATA; Schema: laboratoire2; Owner: administrateur
--

INSERT INTO laboratoire2.livraison VALUES (100, '2019-06-03');
INSERT INTO laboratoire2.livraison VALUES (101, '2019-06-04');
INSERT INTO laboratoire2.livraison VALUES (102, '2019-06-04');
INSERT INTO laboratoire2.livraison VALUES (103, '2019-06-05');
INSERT INTO laboratoire2.livraison VALUES (104, '2019-07-07');
INSERT INTO laboratoire2.livraison VALUES (105, '2019-07-08');


--
-- TOC entry 3244 (class 0 OID 0)
-- Dependencies: 201
-- Name: departement_departement_id_seq; Type: SEQUENCE SET; Schema: app; Owner: s3iprojet00
--

SELECT pg_catalog.setval('app.departement_departement_id_seq', 1, false);


--
-- TOC entry 3245 (class 0 OID 0)
-- Dependencies: 204
-- Name: etudiant_app_etudiant_app_id_seq; Type: SEQUENCE SET; Schema: app; Owner: s3iprojet00
--

SELECT pg_catalog.setval('app.etudiant_app_etudiant_app_id_seq', 484, true);


--
-- TOC entry 3246 (class 0 OID 0)
-- Dependencies: 206
-- Name: faculte_faculte_id_seq; Type: SEQUENCE SET; Schema: app; Owner: s3iprojet00
--

SELECT pg_catalog.setval('app.faculte_faculte_id_seq', 1, false);


--
-- TOC entry 3247 (class 0 OID 0)
-- Dependencies: 209
-- Name: universite_universite_id_seq; Type: SEQUENCE SET; Schema: app; Owner: s3iprojet00
--

SELECT pg_catalog.setval('app.universite_universite_id_seq', 1, false);


--
-- TOC entry 3043 (class 2606 OID 1371993)
-- Name: ap prk_constraint_ap; Type: CONSTRAINT; Schema: app; Owner: s3iprojet00
--

ALTER TABLE ONLY app.ap
    ADD CONSTRAINT prk_constraint_ap PRIMARY KEY (ap_id);


--
-- TOC entry 3045 (class 2606 OID 1371995)
-- Name: ap_app prk_constraint_ap_app; Type: CONSTRAINT; Schema: app; Owner: s3iprojet00
--

ALTER TABLE ONLY app.ap_app
    ADD CONSTRAINT prk_constraint_ap_app PRIMARY KEY (ap_id, app_id);


--
-- TOC entry 3047 (class 2606 OID 1371997)
-- Name: ap_cheminement prk_constraint_ap_cheminement; Type: CONSTRAINT; Schema: app; Owner: s3iprojet00
--

ALTER TABLE ONLY app.ap_cheminement
    ADD CONSTRAINT prk_constraint_ap_cheminement PRIMARY KEY (cheminement_id, programme_id, ap_id);


--
-- TOC entry 3049 (class 2606 OID 1371999)
-- Name: ap_etudiant prk_constraint_ap_etudiant; Type: CONSTRAINT; Schema: app; Owner: s3iprojet00
--

ALTER TABLE ONLY app.ap_etudiant
    ADD CONSTRAINT prk_constraint_ap_etudiant PRIMARY KEY (ap_id, cip);


--
-- TOC entry 3051 (class 2606 OID 1372001)
-- Name: ap_version prk_constraint_ap_version; Type: CONSTRAINT; Schema: app; Owner: s3iprojet00
--

ALTER TABLE ONLY app.ap_version
    ADD CONSTRAINT prk_constraint_ap_version PRIMARY KEY (version_id, cheminement_id, programme_id, ap_id);


--
-- TOC entry 3053 (class 2606 OID 1372003)
-- Name: app prk_constraint_app; Type: CONSTRAINT; Schema: app; Owner: s3iprojet00
--

ALTER TABLE ONLY app.app
    ADD CONSTRAINT prk_constraint_app PRIMARY KEY (app_id);


--
-- TOC entry 3055 (class 2606 OID 1372005)
-- Name: cheminement prk_constraint_cheminement; Type: CONSTRAINT; Schema: app; Owner: s3iprojet00
--

ALTER TABLE ONLY app.cheminement
    ADD CONSTRAINT prk_constraint_cheminement PRIMARY KEY (cheminement_id, programme_id);


--
-- TOC entry 3057 (class 2606 OID 1372007)
-- Name: departement prk_constraint_departement; Type: CONSTRAINT; Schema: app; Owner: s3iprojet00
--

ALTER TABLE ONLY app.departement
    ADD CONSTRAINT prk_constraint_departement PRIMARY KEY (departement_id);


--
-- TOC entry 3059 (class 2606 OID 1372009)
-- Name: etudiant prk_constraint_etudiant; Type: CONSTRAINT; Schema: app; Owner: s3iprojet00
--

ALTER TABLE ONLY app.etudiant
    ADD CONSTRAINT prk_constraint_etudiant PRIMARY KEY (cip);


--
-- TOC entry 3061 (class 2606 OID 1372011)
-- Name: etudiant_app prk_constraint_etudiant_app; Type: CONSTRAINT; Schema: app; Owner: s3iprojet00
--

ALTER TABLE ONLY app.etudiant_app
    ADD CONSTRAINT prk_constraint_etudiant_app PRIMARY KEY (etudiant_app_id);


--
-- TOC entry 3063 (class 2606 OID 1372013)
-- Name: faculte prk_constraint_faculte; Type: CONSTRAINT; Schema: app; Owner: s3iprojet00
--

ALTER TABLE ONLY app.faculte
    ADD CONSTRAINT prk_constraint_faculte PRIMARY KEY (faculte_id);


--
-- TOC entry 3065 (class 2606 OID 1372015)
-- Name: programme prk_constraint_programme; Type: CONSTRAINT; Schema: app; Owner: s3iprojet00
--

ALTER TABLE ONLY app.programme
    ADD CONSTRAINT prk_constraint_programme PRIMARY KEY (programme_id);


--
-- TOC entry 3067 (class 2606 OID 1372017)
-- Name: universite prk_constraint_universite; Type: CONSTRAINT; Schema: app; Owner: s3iprojet00
--

ALTER TABLE ONLY app.universite
    ADD CONSTRAINT prk_constraint_universite PRIMARY KEY (universite_id);


--
-- TOC entry 3069 (class 2606 OID 1372019)
-- Name: version prk_constraint_version; Type: CONSTRAINT; Schema: app; Owner: s3iprojet00
--

ALTER TABLE ONLY app.version
    ADD CONSTRAINT prk_constraint_version PRIMARY KEY (version_id, cheminement_id, programme_id);


--
-- TOC entry 3031 (class 2606 OID 1318079)
-- Name: article pk_article; Type: CONSTRAINT; Schema: laboratoire2; Owner: administrateur
--

ALTER TABLE ONLY laboratoire2.article
    ADD CONSTRAINT pk_article PRIMARY KEY (noarticle);


--
-- TOC entry 3033 (class 2606 OID 1318084)
-- Name: client pk_client; Type: CONSTRAINT; Schema: laboratoire2; Owner: administrateur
--

ALTER TABLE ONLY laboratoire2.client
    ADD CONSTRAINT pk_client PRIMARY KEY (noclient);


--
-- TOC entry 3035 (class 2606 OID 1318089)
-- Name: commande pk_commande; Type: CONSTRAINT; Schema: laboratoire2; Owner: administrateur
--

ALTER TABLE ONLY laboratoire2.commande
    ADD CONSTRAINT pk_commande PRIMARY KEY (nocommande);


--
-- TOC entry 3037 (class 2606 OID 1318094)
-- Name: detaillivraison pk_detaillivraison; Type: CONSTRAINT; Schema: laboratoire2; Owner: administrateur
--

ALTER TABLE ONLY laboratoire2.detaillivraison
    ADD CONSTRAINT pk_detaillivraison PRIMARY KEY (nocommande, noarticle, nolivraison);


--
-- TOC entry 3039 (class 2606 OID 1318099)
-- Name: lignecommande pk_lignecommande; Type: CONSTRAINT; Schema: laboratoire2; Owner: administrateur
--

ALTER TABLE ONLY laboratoire2.lignecommande
    ADD CONSTRAINT pk_lignecommande PRIMARY KEY (nocommande, noarticle);


--
-- TOC entry 3041 (class 2606 OID 1318104)
-- Name: livraison pk_livraison; Type: CONSTRAINT; Schema: laboratoire2; Owner: administrateur
--

ALTER TABLE ONLY laboratoire2.livraison
    ADD CONSTRAINT pk_livraison PRIMARY KEY (nolivraison);


--
-- TOC entry 3207 (class 2618 OID 1372020)
-- Name: v_etudiant_app del_etudiant_app; Type: RULE; Schema: app; Owner: s3iprojet00
--

CREATE RULE del_etudiant_app AS
    ON UPDATE TO app.v_etudiant_app DO INSTEAD  DELETE FROM app.etudiant_app
  WHERE (etudiant_app.etudiant_app_id = old.etudiant_app_id);


--
-- TOC entry 3208 (class 2618 OID 1372021)
-- Name: v_etudiant_app ins_etudiant_app; Type: RULE; Schema: app; Owner: s3iprojet00
--

CREATE RULE ins_etudiant_app AS
    ON INSERT TO app.v_etudiant_app DO INSTEAD  INSERT INTO app.etudiant_app (etudiant_app_id, cip, nom, courriel, programme, programme_nom, app, app_titre, ap, departement, faculte, universite)
  VALUES (new.etudiant_app_id, new.cip, new.nom, new.courriel, new.programme, new.programme_nom, new.app, new.app_titre, new.ap, new.departement, new.faculte, new.universite);


--
-- TOC entry 3209 (class 2618 OID 1372022)
-- Name: v_etudiant_app upd_etudiant_app; Type: RULE; Schema: app; Owner: s3iprojet00
--

CREATE RULE upd_etudiant_app AS
    ON UPDATE TO app.v_etudiant_app DO INSTEAD  UPDATE app.etudiant_app SET cip = new.cip, nom = new.nom, courriel = new.courriel, programme = new.programme, programme_nom = new.programme_nom, app = new.app, app_titre = new.app_titre, ap = new.ap, departement = new.departement, faculte = new.faculte, universite = new.universite
  WHERE (etudiant_app.etudiant_app_id = new.etudiant_app_id);


--
-- TOC entry 3075 (class 2606 OID 1372023)
-- Name: ap_app fk_ap_app_ap_id; Type: FK CONSTRAINT; Schema: app; Owner: s3iprojet00
--

ALTER TABLE ONLY app.ap_app
    ADD CONSTRAINT fk_ap_app_ap_id FOREIGN KEY (ap_id) REFERENCES app.ap(ap_id);


--
-- TOC entry 3076 (class 2606 OID 1372028)
-- Name: ap_app fk_ap_app_app_id; Type: FK CONSTRAINT; Schema: app; Owner: s3iprojet00
--

ALTER TABLE ONLY app.ap_app
    ADD CONSTRAINT fk_ap_app_app_id FOREIGN KEY (app_id) REFERENCES app.app(app_id);


--
-- TOC entry 3077 (class 2606 OID 1372033)
-- Name: ap_cheminement fk_ap_cheminement_ap_id; Type: FK CONSTRAINT; Schema: app; Owner: s3iprojet00
--

ALTER TABLE ONLY app.ap_cheminement
    ADD CONSTRAINT fk_ap_cheminement_ap_id FOREIGN KEY (ap_id) REFERENCES app.ap(ap_id);


--
-- TOC entry 3078 (class 2606 OID 1372038)
-- Name: ap_cheminement fk_ap_cheminement_programme_id; Type: FK CONSTRAINT; Schema: app; Owner: s3iprojet00
--

ALTER TABLE ONLY app.ap_cheminement
    ADD CONSTRAINT fk_ap_cheminement_programme_id FOREIGN KEY (programme_id) REFERENCES app.programme(programme_id);


--
-- TOC entry 3079 (class 2606 OID 1372043)
-- Name: ap_etudiant fk_ap_etudiant_ap_id; Type: FK CONSTRAINT; Schema: app; Owner: s3iprojet00
--

ALTER TABLE ONLY app.ap_etudiant
    ADD CONSTRAINT fk_ap_etudiant_ap_id FOREIGN KEY (ap_id) REFERENCES app.ap(ap_id);


--
-- TOC entry 3080 (class 2606 OID 1372048)
-- Name: ap_etudiant fk_ap_etudiant_cip; Type: FK CONSTRAINT; Schema: app; Owner: s3iprojet00
--

ALTER TABLE ONLY app.ap_etudiant
    ADD CONSTRAINT fk_ap_etudiant_cip FOREIGN KEY (cip) REFERENCES app.etudiant(cip);


--
-- TOC entry 3081 (class 2606 OID 1372053)
-- Name: ap_version fk_ap_version_ap_id; Type: FK CONSTRAINT; Schema: app; Owner: s3iprojet00
--

ALTER TABLE ONLY app.ap_version
    ADD CONSTRAINT fk_ap_version_ap_id FOREIGN KEY (ap_id) REFERENCES app.ap(ap_id);


--
-- TOC entry 3082 (class 2606 OID 1372058)
-- Name: ap_version fk_ap_version_programme_id; Type: FK CONSTRAINT; Schema: app; Owner: s3iprojet00
--

ALTER TABLE ONLY app.ap_version
    ADD CONSTRAINT fk_ap_version_programme_id FOREIGN KEY (programme_id) REFERENCES app.programme(programme_id);


--
-- TOC entry 3083 (class 2606 OID 1372063)
-- Name: cheminement fk_cheminement_programme_id; Type: FK CONSTRAINT; Schema: app; Owner: s3iprojet00
--

ALTER TABLE ONLY app.cheminement
    ADD CONSTRAINT fk_cheminement_programme_id FOREIGN KEY (programme_id) REFERENCES app.programme(programme_id);


--
-- TOC entry 3084 (class 2606 OID 1372068)
-- Name: departement fk_departement_faculte_id; Type: FK CONSTRAINT; Schema: app; Owner: s3iprojet00
--

ALTER TABLE ONLY app.departement
    ADD CONSTRAINT fk_departement_faculte_id FOREIGN KEY (faculte_id) REFERENCES app.faculte(faculte_id);


--
-- TOC entry 3085 (class 2606 OID 1372073)
-- Name: etudiant fk_etudiant_programme_id; Type: FK CONSTRAINT; Schema: app; Owner: s3iprojet00
--

ALTER TABLE ONLY app.etudiant
    ADD CONSTRAINT fk_etudiant_programme_id FOREIGN KEY (programme_id) REFERENCES app.programme(programme_id);


--
-- TOC entry 3086 (class 2606 OID 1372078)
-- Name: faculte fk_faculte_universite_id; Type: FK CONSTRAINT; Schema: app; Owner: s3iprojet00
--

ALTER TABLE ONLY app.faculte
    ADD CONSTRAINT fk_faculte_universite_id FOREIGN KEY (universite_id) REFERENCES app.universite(universite_id);


--
-- TOC entry 3087 (class 2606 OID 1372083)
-- Name: programme fk_programme_departement_id; Type: FK CONSTRAINT; Schema: app; Owner: s3iprojet00
--

ALTER TABLE ONLY app.programme
    ADD CONSTRAINT fk_programme_departement_id FOREIGN KEY (departement_id) REFERENCES app.departement(departement_id);


--
-- TOC entry 3088 (class 2606 OID 1372088)
-- Name: version fk_version_programme_id; Type: FK CONSTRAINT; Schema: app; Owner: s3iprojet00
--

ALTER TABLE ONLY app.version
    ADD CONSTRAINT fk_version_programme_id FOREIGN KEY (programme_id) REFERENCES app.programme(programme_id);


--
-- TOC entry 3070 (class 2606 OID 1318105)
-- Name: commande fk_commande_relations_client; Type: FK CONSTRAINT; Schema: laboratoire2; Owner: administrateur
--

ALTER TABLE ONLY laboratoire2.commande
    ADD CONSTRAINT fk_commande_relations_client FOREIGN KEY (noclient) REFERENCES laboratoire2.client(noclient) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3071 (class 2606 OID 1318110)
-- Name: detaillivraison fk_detailli_relations_lignecom; Type: FK CONSTRAINT; Schema: laboratoire2; Owner: administrateur
--

ALTER TABLE ONLY laboratoire2.detaillivraison
    ADD CONSTRAINT fk_detailli_relations_lignecom FOREIGN KEY (nocommande, noarticle) REFERENCES laboratoire2.lignecommande(nocommande, noarticle) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- TOC entry 3072 (class 2606 OID 1318115)
-- Name: detaillivraison fk_detailli_relations_livraiso; Type: FK CONSTRAINT; Schema: laboratoire2; Owner: administrateur
--

ALTER TABLE ONLY laboratoire2.detaillivraison
    ADD CONSTRAINT fk_detailli_relations_livraiso FOREIGN KEY (nolivraison) REFERENCES laboratoire2.livraison(nolivraison) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3074 (class 2606 OID 1318125)
-- Name: lignecommande fk_lignecom_relations_article; Type: FK CONSTRAINT; Schema: laboratoire2; Owner: administrateur
--

ALTER TABLE ONLY laboratoire2.lignecommande
    ADD CONSTRAINT fk_lignecom_relations_article FOREIGN KEY (noarticle) REFERENCES laboratoire2.article(noarticle) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3073 (class 2606 OID 1318120)
-- Name: lignecommande fk_lignecom_relations_commande; Type: FK CONSTRAINT; Schema: laboratoire2; Owner: administrateur
--

ALTER TABLE ONLY laboratoire2.lignecommande
    ADD CONSTRAINT fk_lignecom_relations_commande FOREIGN KEY (nocommande) REFERENCES laboratoire2.commande(nocommande) ON UPDATE RESTRICT ON DELETE CASCADE;


-- Completed on 2021-03-23 14:19:33 EDT

--
-- PostgreSQL database dump complete
--

