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

--Article_quiz
INSERT INTO article_quiz(id_quiz, id_article)
VALUES (1,1);

--type_question
INSERT INTO type_question(nom_type)
VALUES ('Choix multiple');

--Question
INSERT INTO question(num_question, id_quiz, cip, id_type)
VALUES (1, 1, 'larn5378', 1);

--article_question
INSERT INTO article_question(id_article, id_question)
VALUES (1,1);

--type_relation
INSERT INTO type_relation(nom_relation)
VALUES ('Créateur');

--usager_quiz
INSERT INTO usager_quiz(cip, id_quiz, type_relation, id_relation)
VALUES ('larn5378', 1, 'Créateur', 1);

--usager_article_collaboration
INSERT INTO usager_article_collaboration(debut_collaboration, fin_collaboration, id_relation, cip, code_article)
VALUES (CURRENT_DATE, CURRENT_DATE, 1, 'larn5378', 1)

--reponse
INSERT INTO reponse(reponse, bonne_mauvaise, id_question)
VALUES ('', true, 1);

--reponse usager question
INSERT INTO reponse_usager_question(id_question, id_reponse, cip)
VALUES (1, 1, 'larn5378');





