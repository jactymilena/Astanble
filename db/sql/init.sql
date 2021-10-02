
CREATE SCHEMA IF NOT EXISTS Astanble;
SET search_path TO Astanble;

CREATE TABLE Usager
(
    CIP CHAR(8) NOT NULL,
    nom_etudiant VARCHAR(50) NOT NULL,
    PRIMARY KEY (CIP)
);

CREATE TABLE Statut
(
    id_statut SERIAL PRIMARY KEY NOT NULL,
    nom_statut VARCHAR(50) NOT NULL
);

CREATE TABLE Article
(
    nom_article VARCHAR(100) NOT NULL,
    description_robot_article VARCHAR(500),
    description_article VARCHAR(500),
    code_article SERIAL PRIMARY KEY NOT NULL
);

CREATE TABLE Thematique
(
    code_thematique SERIAL PRIMARY KEY NOT NULL,
    nom_thematique VARCHAR(100) NOT NULL
);

CREATE TABLE Reference
(
    code_reference SERIAL PRIMARY KEY NOT NULL,
    nom_reference VARCHAR(100) NOT NULL
);

CREATE TABLE Quiz
(
    code_quiz SERIAL PRIMARY KEY NOT NULL,
    nom_quiz VARCHAR(100) NOT NULL
);

CREATE TABLE TypeQuestion
(
    id_type SERIAL PRIMARY KEY NOT NULL,
    nom_type INT NOT NULL,
    PRIMARY KEY (id_type)
);

CREATE TABLE UsagerStatut
(
    statut_show BOOLEAN NOT NULL,
    id_statut INT NOT NULL,
    debut_statut INT NOT NULL,
    CIP CHAR(8) NOT NULL,
    PRIMARY KEY (debut_statut),
    FOREIGN KEY (CIP) REFERENCES usager(CIP),
    FOREIGN KEY (id_statut) REFERENCES statut(id_statut),
    UNIQUE (CIP, id_statut)
);

CREATE TABLE UsagerArticleCollaboration
(
    debut_collaboration INT NOT NULL,
    fin_collaboration INT NOT NULL,
    type_rellation INT NOT NULL,
    CIP INT NOT NULL,
    code_article INT NOT NULL,
    PRIMARY KEY (type_rellation),
    FOREIGN KEY (CIP) REFERENCES usager(CIP),
    FOREIGN KEY (code_article) REFERENCES article(code_article),
    UNIQUE (CIP, code_article)
);

CREATE TABLE ArticleThematique
(
    numero_ordre INT NOT NULL,
    code_article INT NOT NULL,
    code_thematique INT NOT NULL,
    PRIMARY KEY (code_article, code_thematique),
    FOREIGN KEY (code_article) REFERENCES article(code_article),
    FOREIGN KEY (code_thematique) REFERENCES thematique(code_thematique)
);

CREATE TABLE UsagerThematique
(
    CIP INT NOT NULL,
    code_thematique INT NOT NULL,
    PRIMARY KEY (CIP, code_thematique),
    FOREIGN KEY (CIP) REFERENCES usager(CIP),
    FOREIGN KEY (code_thematique) REFERENCES thematique(code_thematique)
);

CREATE TABLE ReferenceArticle
(
    code_article INT NOT NULL,
    code_reference INT NOT NULL,
    PRIMARY KEY (code_article, code_reference),
    FOREIGN KEY (code_article) REFERENCES article(code_article),
    FOREIGN KEY (code_reference) REFERENCES reference(code_reference)
);

CREATE TABLE ArticleQuiz
(
    code_quiz INT NOT NULL,
    code_article INT NOT NULL,
    PRIMARY KEY (code_quiz, code_article),
    FOREIGN KEY (code_quiz) REFERENCES quizz(code_quizz),
    FOREIGN KEY (code_article) REFERENCES article(code_article)
);

CREATE TABLE UsagerQuiz
(
    type_rellation INT NOT NULL,
    CIP INT NOT NULL,
    code_quiz INT NOT NULL,
    PRIMARY KEY (CIP, code_quiz),
    FOREIGN KEY (CIP) REFERENCES usager(CIP),
    FOREIGN KEY (code_quiz) REFERENCES quizz(code_quiz)
);

CREATE TABLE UsagerCourriel
(
    courriel INT NOT NULL,
    CIP INT NOT NULL,
    PRIMARY KEY (courriel, CIP),
    FOREIGN KEY (CIP) REFERENCES usager(CIP)
);

CREATE TABLE ReferenceLien
(
    lien INT NOT NULL,
    code_reference INT NOT NULL,
    PRIMARY KEY (lien, code_reference),
    FOREIGN KEY (code_reference) REFERENCES reference(code_reference)
);

CREATE TABLE Question
(
    num_quiz INT NOT NULL,
    bonne_mauvaise INT NOT NULL,
    reponse INT NOT NULL,
    id_reponse INT NOT NULL,
    code_quiz INT NOT NULL,
    CIP INT NOT NULL,
    id_type INT NOT NULL,
    PRIMARY KEY (num_quiz),
    FOREIGN KEY (code_quiz) REFERENCES quizz(code_quizz),
    FOREIGN KEY (CIP) REFERENCES usager(CIP),
    FOREIGN KEY (id_type) REFERENCES type_question(id_type)
);

CREATE TABLE ArticleQuestion
(
    code_article INT NOT NULL,
    num_quiz INT NOT NULL,
    PRIMARY KEY (code_article, num_quiz),
    FOREIGN KEY (code_article) REFERENCES article(code_article),
    FOREIGN KEY (num_quiz) REFERENCES question(num_quiz)
);

CREATE TABLE ReponseUsagerQuestion
(
    num_quiz INT NOT NULL,
    CIP INT NOT NULL,
    PRIMARY KEY (num_quiz, CIP),
    FOREIGN KEY (num_quiz) REFERENCES question(num_quiz),
    FOREIGN KEY (CIP) REFERENCES usager(CIP)
);