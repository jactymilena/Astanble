/*
-- ======================================
-- Remplissage de la base de données (Insertions)
-- ======================================
 */

-- ==
-- Identification du schéma
-- ==
SET search_path TO Astanble;

-- ==
-- Insertion des données
-- ==

-- Article
INSERT INTO article(nom_article, description_robot_article, description_article, content)
VALUES ('Nébuleuse','description robot', 'Amas de gaz et de poussières interstellaires.',
        'Une nébuleuse est, en astronomie, un objet céleste composé de gaz raréfié, ' ||
        'de plasma ou de poussières interstellaires. Avant les années 1920, ' ||
        'le terme désignait tout objet du ciel d’aspect diffus');

--Thematique
INSERT INTO thematique(nom_thematique)
VALUES ('Espace');

--Article_thematique
INSERT INTO article_thematique(id_article, id_thematique, numero_ordre)
VALUES(1, 1, 1);

--Statut
INSERT INTO statut(nom_statut)
VALUES ('Génie informatique');

--Usager
INSERT INTO usager(cip, nom_usager, prenom_usager, courriel1, courriel2)
VALUES ('larn5378', 'LArchevêque-Carrière', 'Naomie', 'larn5378@usherbrooke.ca', NULL);

--Usager_thematique
INSERT INTO usager_thematique(cip, id_thematique)
VALUES ('larn5378', 1);

--Usager_statut
INSERT INTO usager_statut(statut_show, id_statut, debut_statut, cip)
VALUES (true, 1, CURRENT_DATE, 'larn5378');

--Quiz
INSERT INTO quiz(nom_quiz)
VALUES('Apprendre sur les nébuleuses!');









