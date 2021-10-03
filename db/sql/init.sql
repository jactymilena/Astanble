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
CREATE TABLE Usager
(
    CIP              CHAR(8) NOT NULL,
    nom_usager       VARCHAR(50) NOT NULL,
    prenom_usager    VARCHAR(50) NOT NULL,
    date_suppression DATE,
    PRIMARY KEY (CIP)
);

-- Table Statut
-- Statut d'un usager.
CREATE TABLE Statut
(
    id_statut  SERIAL PRIMARY KEY NOT NULL,
    nom_statut VARCHAR(50) NOT NULL
);

-- Table Article
CREATE TABLE Article
(
    code_article              SERIAL PRIMARY KEY NOT NULL,
    nom_article               VARCHAR(100) NOT NULL,
    description_robot_article VARCHAR(500),
    description_article       VARCHAR(500)
);

-- Table Thematique
-- Thématique pouvant être associée à un article ou à un usager
CREATE TABLE Thematique
(
    code_thematique SERIAL PRIMARY KEY NOT NULL,
    nom_thematique  VARCHAR(100) NOT NULL
);

-- Table Reference
CREATE TABLE Reference
(
    code_reference SERIAL PRIMARY KEY NOT NULL,
    nom_reference  VARCHAR(100) NOT NULL
);

-- Table Quiz
CREATE TABLE Quiz
(
    code_quiz SERIAL PRIMARY KEY NOT NULL,
    nom_quiz  VARCHAR(100) NOT NULL
);

-- Table TypeQuestion
CREATE TABLE TypeQuestion
(
    id_type  SERIAL PRIMARY KEY NOT NULL,
    nom_type VARCHAR(50) NOT NULL
);

-- Table UsagerStatut
-- Un usager peut être associé à un ou à plusieurs statuts
CREATE TABLE UsagerStatut
(
    id_statut_usager SERIAL PRIMARY KEY NOT NULL,
    statut_show      BOOLEAN NOT NULL,
    id_statut        INT NOT NULL,
    debut_statut     DATE NOT NULL,
    CIP              CHAR(8) NOT NULL,
    FOREIGN KEY (CIP) REFERENCES usager(CIP),
    FOREIGN KEY (id_statut) REFERENCES statut(id_statut),
    UNIQUE (CIP, id_statut)
);

-- Table TypeRelation
-- Type de relation d'un usager avec un quizz ou avec un article. Ex: auteur, coauteur, collaborateur
CREATE TABLE TypeRelation
(
  id_relation  SERIAL PRIMARY KEY NOT NULL,
  nom_relation VARCHAR(30)
);

-- Table UsagerArticleCollaboration
-- Collaboration d'un usager avec un article
CREATE TABLE UsagerArticleCollaboration
(
    id_collab           SERIAL PRIMARY KEY NOT NULL,
    debut_collaboration DATE NOT NULL,
    fin_collaboration   DATE NOT NULL,
    id_relation         INT NOT NULL,
    CIP                 CHAR(8) NOT NULL,
    code_article        INT NOT NULL,
    FOREIGN KEY (CIP) REFERENCES usager(CIP),
    FOREIGN KEY (code_article) REFERENCES article(code_article),
    FOREIGN KEY (id_relation) REFERENCES typeRelation(id_relation),
    UNIQUE (CIP, code_article) -- **
);

-- Table ArticleThematique
CREATE TABLE ArticleThematique -- **
(
    numero_ordre    INT NOT NULL,
    code_article    INT NOT NULL,
    code_thematique INT NOT NULL,
    PRIMARY KEY (code_article, code_thematique),
    FOREIGN KEY (code_article) REFERENCES article(code_article),
    FOREIGN KEY (code_thematique) REFERENCES thematique(code_thematique)
);

-- UsagerThematique
-- Un usager peut choisir une ou plusieurs thématiques
CREATE TABLE UsagerThematique
(
    CIP             CHAR(8) NOT NULL,
    code_thematique INT NOT NULL,
    PRIMARY KEY (CIP, code_thematique),
    FOREIGN KEY (CIP) REFERENCES usager(CIP),
    FOREIGN KEY (code_thematique) REFERENCES thematique(code_thematique)
);

-- Table ReferenceArticle
CREATE TABLE ReferenceArticle
(
    code_article   INT NOT NULL,
    code_reference INT NOT NULL,
    PRIMARY KEY (code_article, code_reference),
    FOREIGN KEY (code_article) REFERENCES article(code_article),
    FOREIGN KEY (code_reference) REFERENCES reference(code_reference)
);

-- Table ArticleQuiz
CREATE TABLE ArticleQuiz
(
    code_quiz    INT NOT NULL,
    code_article INT NOT NULL,
    PRIMARY KEY (code_quiz, code_article),
    FOREIGN KEY (code_quiz) REFERENCES quiz(code_quiz),
    FOREIGN KEY (code_article) REFERENCES article(code_article)
);

-- Table UsagerQuiz
CREATE TABLE UsagerQuiz
(
    type_relation INT NOT NULL, -- ??
    CIP           CHAR(8) NOT NULL,
    code_quiz     INT NOT NULL,
    id_relation   INT NOT NULL,
    PRIMARY KEY (CIP, code_quiz),
    FOREIGN KEY (CIP) REFERENCES usager(CIP),
    FOREIGN KEY (code_quiz) REFERENCES quiz(code_quiz),
    FOREIGN KEY (id_relation) REFERENCES typeRelation(id_relation)
);

-- Table UsagerCourriel
CREATE TABLE UsagerCourriel
(
    courriel VARCHAR(70) NOT NULL,
    CIP      CHAR(8) NOT NULL,
    PRIMARY KEY (courriel, CIP),
    FOREIGN KEY (CIP) REFERENCES usager(CIP)
);

-- Table ReferenceLien
CREATE TABLE ReferenceLien
(
    lien           VARCHAR(100) NOT NULL,
    code_reference INT NOT NULL,
    PRIMARY KEY (lien, code_reference),
    FOREIGN KEY (code_reference) REFERENCES reference(code_reference)
);

-- Table Question
CREATE TABLE Question
(
    num_question   SERIAL PRIMARY KEY NOT NULL,
    bonne_mauvaise INT NOT NULL,
    reponse        VARCHAR(100) NOT NULL,
    code_quiz      INT NOT NULL,
    CIP            CHAR(8) NOT NULL,
    id_type        INT NOT NULL,
    FOREIGN KEY (code_quiz) REFERENCES quiz(code_quiz),
    FOREIGN KEY (CIP) REFERENCES usager(CIP),
    FOREIGN KEY (id_type) REFERENCES typeQuestion(id_type)
);

-- Table ArticleQuestion
CREATE TABLE ArticleQuestion
(
    id_article_question SERIAL PRIMARY KEY,
    code_article        INT NOT NULL,
    num_question        INT NOT NULL,
    FOREIGN KEY (code_article) REFERENCES article(code_article),
    FOREIGN KEY (num_question) REFERENCES question(num_question)
);

-- Table ReponseUsagerQuestion
CREATE TABLE ReponseUsagerQuestion
(
    num_quiz INT NOT NULL,
    CIP      CHAR(8) NOT NULL,
    PRIMARY KEY (num_quiz, CIP),
    FOREIGN KEY (num_quiz) REFERENCES question(num_question),
    FOREIGN KEY (CIP) REFERENCES usager(CIP)
);