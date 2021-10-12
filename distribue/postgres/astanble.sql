/*
-- ======================================
--  Création de la base de données
-- ======================================
 */


-- ==
-- Définition du schéma
-- ==
CREATE SCHEMA IF NOT EXISTS Astanble;
SET search_path TO Astanble;

-- ==
-- Définition des tables
-- ==

-- Table Usager
-- Un usager s'identifie à l'aide de son CIP. Un usagé unactif ou supprimé est gardé dans la base de données
-- avec une date de suppression.
CREATE TABLE usager
(
    CIP              CHAR(8) NOT NULL,
    nom_usager       VARCHAR(50) NOT NULL,
    prenom_usager    VARCHAR(50) NOT NULL,
    date_suppression DATE,
    courriel1 VARCHAR(70) NOT NULL,
    courriel2 VARCHAR(70),
    PRIMARY KEY (CIP)
);

-- Table Statut
-- Statut d'un usager.
CREATE TABLE statut
(
    id_statut  SERIAL PRIMARY KEY NOT NULL,
    nom_statut VARCHAR(50) NOT NULL
);

-- Table Article
CREATE TABLE article
(
    id_article                SERIAL PRIMARY KEY NOT NULL,
    nom_article               VARCHAR(100) NOT NULL,
    content TEXT,
    description_robot_article VARCHAR(500),
    description_article       VARCHAR(500)
);

-- Table Thematique
-- Thématique pouvant être associée à un article ou à un usager
CREATE TABLE thematique
(
    id_thematique   SERIAL PRIMARY KEY NOT NULL,
    nom_thematique  VARCHAR(100) NOT NULL
);

-- Table Reference
CREATE TABLE reference
(
    id_reference   SERIAL PRIMARY KEY NOT NULL,
    nom_reference  VARCHAR(100) NOT NULL
);

-- Table Quiz
CREATE TABLE quiz
(
    id_quiz   SERIAL PRIMARY KEY NOT NULL,
    nom_quiz  VARCHAR(100) NOT NULL
);

-- Table TypeQuestion
CREATE TABLE type_question
(
    id_type  SERIAL PRIMARY KEY NOT NULL,
    nom_type VARCHAR(50) NOT NULL
);

-- Table UsagerStatut
-- Un usager peut être associé à un ou à plusieurs statuts
CREATE TABLE usager_statut
(
    id_statut_usager SERIAL PRIMARY KEY NOT NULL,
    statut_show      BOOLEAN NOT NULL,
    id_statut        INT NOT NULL,
    debut_statut     DATE NOT NULL,
    CIP              CHAR(8) NOT NULL,
    FOREIGN KEY (CIP) REFERENCES usager(CIP) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_statut) REFERENCES statut(id_statut) ON UPDATE CASCADE ON DELETE CASCADE,
    UNIQUE (CIP, id_statut)
);

-- Table TypeRelation
-- Type de relation d'un usager avec un quizz ou avec un article. Ex: auteur, coauteur, collaborateur
CREATE TABLE type_relation
(
  id_relation  SERIAL PRIMARY KEY NOT NULL,
  nom_relation VARCHAR(30)
);

-- Table UsagerArticleCollaboration
-- Collaboration d'un usager avec un article
CREATE TABLE usager_article_collaboration
(
    id_collab           SERIAL PRIMARY KEY NOT NULL,
    debut_collaboration DATE NOT NULL,
    fin_collaboration   DATE NOT NULL,
    id_relation         INT NOT NULL,
    CIP                 CHAR(8) NOT NULL,
    code_article        INT NOT NULL,
    FOREIGN KEY (CIP) REFERENCES usager(CIP) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (code_article) REFERENCES article(id_article) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_relation) REFERENCES type_relation(id_relation) ON UPDATE CASCADE ON DELETE RESTRICT,
    UNIQUE (CIP, code_article) -- **
);

-- Table ArticleThematique
CREATE TABLE article_thematique -- **
(
    numero_ordre    INT NOT NULL,
    id_article      INT NOT NULL,
    id_thematique   INT NOT NULL,
    PRIMARY KEY (id_article, id_thematique),
    FOREIGN KEY (id_article) REFERENCES article(id_article) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_thematique) REFERENCES thematique(id_thematique) ON UPDATE CASCADE ON DELETE CASCADE
);

-- UsagerThematique
-- Un usager peut choisir une ou plusieurs thématiques
CREATE TABLE usager_thematique
(
    CIP             CHAR(8) NOT NULL,
    id_thematique   INT NOT NULL,
    PRIMARY KEY (CIP, id_thematique),
    FOREIGN KEY (CIP) REFERENCES usager(CIP) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_thematique) REFERENCES thematique(id_thematique) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Table ReferenceArticle
CREATE TABLE reference_article
(
    id_article   INT NOT NULL,
    id_reference INT NOT NULL,
    PRIMARY KEY (id_article, id_reference),
    FOREIGN KEY (id_article) REFERENCES article(id_article) ON UPDATE CASCADE ON DELETE CASCADE ,
    FOREIGN KEY (id_reference) REFERENCES reference(id_reference) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Table ArticleQuiz
CREATE TABLE article_quiz
(
    id_quiz    INT NOT NULL,
    id_article INT NOT NULL,
    PRIMARY KEY (id_quiz, id_article),
    FOREIGN KEY (id_quiz) REFERENCES quiz(id_quiz) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_article) REFERENCES article(id_article) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Table UsagerQuiz
CREATE TABLE usager_quiz
(
    type_relation INT NOT NULL,
    CIP           CHAR(8) NOT NULL,
    id_quiz       INT NOT NULL,
    id_relation   INT NOT NULL,
    PRIMARY KEY (CIP, id_quiz),
    FOREIGN KEY (CIP) REFERENCES usager(CIP) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_quiz) REFERENCES quiz(id_quiz) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_relation) REFERENCES type_relation(id_relation) ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Table ReferenceLien
CREATE TABLE reference_lien
(
    lien           VARCHAR(100) NOT NULL,
    code_reference INT NOT NULL,
    PRIMARY KEY (lien, code_reference),
    FOREIGN KEY (code_reference) REFERENCES reference(id_reference) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Table Question
CREATE TABLE question
(
    id_question    SERIAL PRIMARY KEY NOT NULL,
    num_question   INT NOT NULL,
    id_quiz        INT NOT NULL,
    CIP            CHAR(8),
    id_type        INT, --NOT NULL BESOIN DU DEFAULT TYPE,
    FOREIGN KEY (id_quiz) REFERENCES quiz(id_quiz) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (CIP) REFERENCES usager(CIP) ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (id_type) REFERENCES type_question(id_type) ON UPDATE CASCADE ON DELETE SET NULL
);

-- Table Reponse
CREATE TABLE reponse
(
  id_reponse     SERIAL PRIMARY KEY NOT NULL,
  reponse        VARCHAR(200) NOT NULL,
  bonne_mauvaise BOOLEAN NOT NULL,
  id_question    INT NOT NULL,
  FOREIGN KEY (id_question) REFERENCES question(id_question) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Table ArticleQuestion
CREATE TABLE article_question
(
    id_article_question SERIAL PRIMARY KEY,
    id_article          INT NOT NULL,
    id_question         INT NOT NULL,
    FOREIGN KEY (id_article) REFERENCES article(id_article) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_question) REFERENCES question(id_question) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Table ReponseUsagerQuestion
CREATE TABLE reponse_usager_question
(
    id_reponse_usager_question SERIAL PRIMARY KEY NOT NULL,
    id_question                INT NOT NULL,
    id_reponse                 INT,
    CIP                        CHAR(8) NOT NULL,
    FOREIGN KEY (id_question) REFERENCES question(id_question) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_reponse) REFERENCES reponse(id_reponse) ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (CIP) REFERENCES usager(CIP) ON UPDATE CASCADE ON DELETE CASCADE
);