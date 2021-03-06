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

--Article
INSERT INTO article(nom_article, description_robot_article, description_article, content)
VALUES ('Nebuleuse','description robot', 'Amas de gaz et de poussières interstellaires.',
        'Une nébuleuse est, en astronomie, un objet céleste composé de gaz raréfié, ' ||
        'de plasma ou de poussières interstellaires. Avant les années 1920, ' ||
        'le terme désignait tout objet du ciel d’aspect diffus'),
       ('Orion (constellation)', 'description robot', 'Orion (« le Chasseur ») est une constellation située quasiment sur l''équateur céleste.',
        'La constellation d''Orion est mentionnée sous cette dénomination dans l’Odyssée d''Homère1, les Odes d''Horace2, les Phénomènes d''Aratus de Soles et l’Énéide de Virgile. Elle est répertoriée parmi les quarante-huit constellations de l’Almageste de Ptolémée.

Dans la mythologie grecque, elle représente Orion, un chasseur légendaire qui se vantait de pouvoir tuer n''importe quel animal. Dans certaines versions de la légende, il fut tué par le Scorpion, qui a été placé à l''opposé de la voûte céleste par les dieux qui les ont ainsi séparés afin qu''ils ne soient jamais au-dessus de l''horizon en même temps. Sirius est son chien, ainsi que le nom de l''étoile principale de la constellation voisine du Grand Chien3.

La constellation d''Orion est aussi citée dans la Bible, dans les livres de Job (9.9) (38.31-32) et d''Amos (5.8) . -- WIKIPEDIA'),
       ('Milky Way', 'description robot', 'This article is about the galaxy. For other uses, see Milky Way (disambiguation).',
        'The Milky Way[a] is the galaxy that includes the Solar System, with the name describing the galaxy''s appearance from Earth: a hazy band of light seen in the night sky formed from stars that cannot be individually distinguished by the naked eye. The term Milky Way is a translation of the Latin via lactea, from the Greek γαλακτικός κύκλος (galaktikos kýklos), meaning "milky circle."[20][21][22] From Earth, the Milky Way appears as a band because its disk-shaped structure is viewed from within. Galileo Galilei first resolved the band of light into individual stars with his telescope in 1610. Until the early 1920s, most astronomers thought that the Milky Way contained all the stars in the Universe.[23] Following the 1920 Great Debate between the astronomers Harlow Shapley and Heber Curtis,[24] observations by Edwin Hubble showed that the Milky Way is just one of many galaxies.

The Milky Way is a barred spiral galaxy with an estimated visible diameter of 100,000–200,000 light-years. Recent simulations suggest that a dark matter disk, also containing some visible stars, may extend up to a diameter of almost 2 million light-years.[12][13] The Milky Way has several satellite galaxies and is part of the Local Group of galaxies, which form part of the Virgo Supercluster, which is itself a component of the Laniakea Supercluster.[25][26]

It is estimated to contain 100–400 billion stars[27][28] and at least that number of planets.[29][30] The Solar System is located at a radius of about 27,000 light-years from the Galactic Center,[3] on the inner edge of the Orion Arm, one of the spiral-shaped concentrations of gas and dust. The stars in the innermost 10,000 light-years form a bulge and one or more bars that radiate from the bulge. The galactic center is an intense radio source known as Sagittarius A*, a supermassive black hole of 4.100 (± 0.034) million solar masses. Stars and gases at a wide range of distances from the Galactic Center orbit at approximately 220 kilometers per second. The constant rotation speed contradicts the laws of Keplerian dynamics and suggests that much (about 90%)[31][32] of the mass of the Milky Way is invisible to telescopes, neither emitting nor absorbing electromagnetic radiation. This conjectural mass has been termed "dark matter".[33] The rotational period is about 240 million years at the radius of the Sun.[17] The Milky Way as a whole is moving at a velocity of approximately 600 km per second with respect to extragalactic frames of reference. The oldest stars in the Milky Way are nearly as old as the Universe itself and thus probably formed shortly after the Dark Ages of the Big Bang.[34 -- WIKIPEDIA'),
       ('Earth', 'description robot', 'This article is about the planet. For its human aspects, see World. For other uses, see Earth (disambiguation) and Planet Earth (disambiguation).',
        'Earth is the third planet from the Sun and the only astronomical object known to harbour and support life. About 29.2% of Earth''s surface is land consisting of continents and islands. The remaining 70.8% is covered with water, mostly by oceans, seas, gulfs, and other salt-water bodies, but also by lakes, rivers, and other freshwater, which together constitute the hydrosphere. Much of Earth''s polar regions are covered in ice. Earth''s outer layer is divided into several rigid tectonic plates that migrate across the surface over many millions of years, while its interior remains active with a solid iron inner core, a liquid outer core that generates Earth''s magnetic field, and a convective mantle that drives plate tectonics.

Earth''s atmosphere consists mostly of nitrogen and oxygen. More solar energy is received by tropical regions than polar regions and is redistributed by atmospheric and ocean circulation. Greenhouse gases also play an important role in regulating the surface temperature. A region''s climate is not only determined by latitude, but also by elevation and proximity to moderating oceans, among other factors. Severe weather, such as tropical cyclones, thunderstorms, and heatwaves, occurs in most areas and greatly impacts life. --- WIKIPEDIA'),
       ('Moon', 'description', 'This article is about Earth''s natural satellite. For moons in general, see Natural satellite. For other uses, see Moon (disambiguation).',
        'The Moon is Earth''s only natural satellite. At about one-quarter the diameter of Earth (comparable to the width of Australia),[15] it is the largest natural satellite in the Solar System relative to the size of its planet,[f] the fifth largest satellite in the Solar System overall, and is larger than any known dwarf planet. Orbiting Earth at an average distance of 384,400 km (238,900 mi),[16] or about 30 times Earth''s diameter, its gravitational influence slightly lengthens Earth''s day and is the main driver of Earth''s tides. The Moon is classified as a planetary-mass object and a differentiated rocky body, and lacks any significant atmosphere, hydrosphere, or magnetic field. Its surface gravity is about one-sixth of Earth''s (0.1654 g); Jupiter''s moon Io is the only satellite in the Solar System known to have a higher surface gravity and density. -- WIKIPEDIA'),
       ('Mars', 'description robot', 'This article is about the planet. For the deity, see Mars (mythology). For other uses, see Mars (disambiguation).',
        'Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System, being larger than only Mercury. In English, Mars carries the name of the Roman god of war and is often referred to as the "Red Planet".[17][18] The latter refers to the effect of the iron oxide prevalent on Mars''s surface, which gives it a reddish appearance (as shown), that is distinctive among the astronomical bodies visible to the naked eye.[19] Mars is a terrestrial planet with a thin atmosphere, with surface features reminiscent of the impact craters of the Moon and the valleys, deserts and polar ice caps of Earth. -- WIKIPEDIA');

INSERT INTO article(nom_article, description_robot_article, description_article, content)
VALUES ('Chien','description robot', 'Animal poilu domestiqué',
        'Le Chien (Canis lupus familiaris) est la sous-espèce domestique de Canis lupus (Loup gris),' ||
        ' un mammifère de la famille des Canidés (Canidae),' ||
        ' laquelle comprend également le dingo, chien domestique retourné à l''état sauvage. '),

       ('Chat', 'description robot', 'Le chat est un animal poilu domestiqué',
        'Le Chat domestique (Felis silvestris catus) est la sous-espèce issue de la domestication du Chat sauvage (Felis silvestris), mammifère carnivore de la famille des Félidés.' ||
        'Il est l’un des principaux animaux de compagnie et compte aujourd’hui une cinquantaine de races différentes reconnues par les instances de certification. Dans de très nombreux pays, le chat entre dans le cadre de la législation sur les carnivores domestiques à l’instar du chien et du furet.'),

       ('Baleine bleu', 'description robot', 'This article is about a specific whale',
        'La baleine bleue (Balaenoptera musculus), appelée aussi rorqual bleu, est une espèce de cétacés de la famille des Balaenopteridae. Pouvant dépasser 30 mètres de longueur et 170 tonnes.' ||
        'Long et mince, le corps de la baleine bleue peut prendre diverses teintes de gris-bleuté sur le dos et un peu plus clair en dessous. '),

       ('Poulet', 'description robot', 'This article is about the chicken.',
        'Un poulet est une jeune volaille, mâle ou femelle, de la sous-espèce Gallus gallus domesticus, élevée pour sa chair. S''il s''agit du même animal, les conditions de production des poulets de chair diffèrent de celles des poules pondeuses qui sont élevées pour leurs œufs. Par exemple le rythme de croissance des poules pondeuses est bien moins important que celui des poulets de chair.'),

       ('Tigre', 'description', 'This article is about very dangereus cat',
        'Le Tigre (Panthera tigris) est une espèce de mammifère carnivore de la famille des félidés (Felidae) du genre Panthera. Aisément reconnaissable à sa fourrure rousse rayée de noir, il est le plus grand félin sauvage et l''un des plus grands carnivores terrestres.' ||
        ' L''espèce est divisée en neuf sous-espèces présentant des différences mineures de taille ou de comportement.');

--Thematique
INSERT INTO thematique(nom_thematique)
VALUES ('Espace'),
       ('Arts, lettres et langues'),
       ('Droit'),
       ('Environnement et développement durable'),
       ('Études plurisectorielles'),
       ('Génie'),
       ('Informatique'),
       ('Musique'),
       ('Sciences de l''activité physique'),
       ('Sciences de la santé'),
       ('Sciences de l''éducation'),
       ('Sciences humaines'),
       ('Sciences pures'),
       ('Administration'),
       ('Théologie et de sciences religieuses');

--Article_thematique
INSERT INTO article_thematique(id_article, id_thematique, numero_ordre)
VALUES(1, 1, 1),
       (2, 1, 1),
       (3, 1, 1),
       (4, 1, 1),
       (5, 1, 1),
       (6, 1, 1);

INSERT INTO article_thematique(id_article, id_thematique, numero_ordre)
VALUES(7, 2, 1),
      (8, 2, 1),
      (9, 2, 1),
      (10, 2, 1),
      (11, 2, 1);

--Statut
INSERT INTO statut(nom_statut)
VALUES ('Génie informatique');

--Usager
INSERT INTO usager(cip, nom_usager, prenom_usager, courriel1, courriel2)
VALUES
       ('larn5378', 'LArcheveque-Carriere', 'Naomie', 'larn5378@usherbrooke.ca', NULL),
       ('rouy2404', 'Routhier-Chevrier', 'Yan', 'rouy2404@usherbrooke.ca', NULL),
       ('mill3003', 'Milette', 'Laurence', 'mill3003@usherbrooke.ca', NULL),
       ('paqv2407', 'Paquin', 'Veronique', 'paqv2407@usherbrooke.ca', NULL),
       ('saej3101', 'Milena Saenz Rosales', 'Jacty', 'saej3101@usherbrooke.ca', NULL),
       ('stla0801', 'Antho', 'Antho', 'Antho@usherbrooke.ca', NULL),
       ('lers0601', 'simon', 'simon', 'simon@usherbrooke.ca', NULL),
       ('stgt0901', ' St-Gelais', 'Thomas', 'stgt0901@usherbrooke.ca', NULL);

--Usager_thematique
INSERT INTO usager_thematique(cip, id_thematique)
VALUES
       ('larn5378', 1),
       ('rouy2404', 1),
       ('mill3003', 1),
       ('paqv2407', 1),
       ('saej3101', 1),
       ('stgt0901', 1),
       ('larn5378', 2),
       ('rouy2404', 2),
       ('mill3003', 2),
       ('paqv2407', 2),
       ('saej3101', 2),
       ('stgt0901', 2);

--Usager_statut
INSERT INTO usager_statut(statut_show, id_statut, debut_statut, cip)
VALUES
       (true, 1, CURRENT_DATE, 'larn5378'),
       (true, 1, CURRENT_DATE, 'rouy2404'),
       (true, 1, CURRENT_DATE, 'mill3003'),
       (true, 1, CURRENT_DATE, 'paqv2407'),
       (true, 1, CURRENT_DATE, 'saej3101'),
       (true, 1, CURRENT_DATE, 'stgt0901');

--Quiz
INSERT INTO quiz(nom_quiz)
VALUES('Apprendre sur les nébuleuses!');

--Article_quiz
INSERT INTO article_quiz(id_quiz, id_article)
VALUES (1,1);

--type_question
INSERT INTO type_question(nom_type)
VALUES ('Carte'),('Choix multiple');

--Question
INSERT INTO question(num_question, question_content, id_quiz, cip, id_type)
VALUES (1, 'Quelle est la bonne définition dune nébuleuse?' , 1, 'larn5378', 1);

INSERT INTO question(num_question, question_content, id_quiz, cip, id_type)
VALUES (2, 'Quelle était la définition du mot nébuleuse les années 1920?' , 1, 'larn5378', 1);

INSERT INTO question(num_question, question_content, id_quiz, cip, id_type)
VALUES (3, 'Est-ce qu une nébuleuse est un objet céleste composé de gaz raréfié en astronomie?' , 1, 'larn5378', 2);

--article_question
INSERT INTO article_question(id_article, id_question)
VALUES (1,1);
INSERT INTO article_question(id_article, id_question)
VALUES (1,2);
INSERT INTO article_question(id_article, id_question)
VALUES (1,3);

--type_relation
INSERT INTO type_relation(nom_relation)
VALUES ('Auteur'),
       ('Co-auteur'),
       ('Éditeur');

--usager_quiz
INSERT INTO usager_quiz(cip, id_quiz, id_relation)
VALUES ('larn5378', 1, 1);

--usager_article_collaboration
INSERT INTO usager_article_collaboration(debut_collaboration, fin_collaboration, id_relation, cip, code_article)
VALUES
       (CURRENT_DATE, CURRENT_DATE, 1, 'larn5378', 1),
       (CURRENT_DATE, CURRENT_DATE, 1, 'rouy2404', 3),
       (CURRENT_DATE, CURRENT_DATE, 1, 'mill3003', 3),
       (CURRENT_DATE, CURRENT_DATE, 1, 'paqv2407', 4),
       (CURRENT_DATE, CURRENT_DATE, 1, 'saej3101', 5),
       (CURRENT_DATE, CURRENT_DATE, 1, 'stgt0901', 6);

--reponse
INSERT INTO reponse(reponse_content, bonne_mauvaise, id_question)
VALUES ('poussières interstellaires.', true, 1),
       ('Une étoile.', false, 1),
       ('Amas de roches et deau.', false, 1),
       ('objet', true, 2),
       ('oui', true, 3),
       ('non', false, 3);


--reponse usager question
INSERT INTO reponse_usager_question(id_question, id_reponse, cip)
VALUES (1, 1, 'larn5378');

--commentaire
INSERT INTO commentaire(commentaire_content, cip, id_article, date_commentaire)
VALUES ('Article très intéressant', 'saej3101', 1, '2021-11-04 08:05:06'),
       ('Très belles nébuleuses', 'mill3003', 1, '2021-11-04 08:10:06');

INSERT INTO commentaire(commentaire_content, cip, id_article, id_reponse_commentaire, date_commentaire)
VALUES ('Pas en accord avec toi', 'rouy2404', 1, 1, '2021-11-05 08:05:06'),
       ('Cest vrai', 'stgt0901', 1, 2, '2021-11-05 08:05:06');


-- ============================================================================
--                          Creation des vues
-- ============================================================================

-- ==
-- Creation de la vue des articles et usager
-- ==
CREATE OR REPLACE VIEW  view_usager_wiki as
SELECT article.id_article, article.nom_article, article.description_article, article.content, type_relation.nom_relation,
       usager.cip, usager.prenom_usager, usager.nom_usager, usager.prenom_usager || ' ' || usager.nom_usager AS nom_complet_usager
FROM article, usager_article_collaboration, type_relation, usager
WHERE article.id_article = usager_article_collaboration.code_article AND
        type_relation.id_relation = usager_article_collaboration.id_relation AND
        usager_article_collaboration.cip = usager.cip;

-- ==
-- Creation de la vue des articles et quiz
-- ==
CREATE OR REPLACE VIEW  view_article_quiz as
SELECT article.id_article, article.nom_article, article.description_article, article.content, quiz.id_quiz, quiz.nom_quiz
FROM article, article_quiz, quiz
WHERE article.id_article = article_quiz.id_article AND
        quiz.id_quiz = article_quiz.id_quiz;

-- ==
-- Creation de la vue des quiz et usager
-- ==
CREATE OR REPLACE VIEW  view_quiz_usager_reponse as
SELECT u.cip, u.prenom_usager, u.nom_usager, u.prenom_usager || ' ' || u.nom_usager AS nom_complet_usager,
       qz.id_quiz, qz.nom_quiz, q.id_question, q.num_question, q.question_content, tq.id_type, tq.nom_type,
       r.id_reponse, r.reponse_content, r.bonne_mauvaise, reponse_usager_question.date_time_response
FROM reponse_usager_question
LEFT JOIN question q on reponse_usager_question.id_question = q.id_question
LEFT JOIN quiz qz on q.id_quiz = qz.id_quiz
LEFT JOIN reponse r on reponse_usager_question.id_reponse = r.id_reponse
LEFT JOIN usager u on reponse_usager_question.cip = u.cip
LEFT JOIN type_question tq on q.id_type = tq.id_type;

-- ==
-- Creation de la vue de reponse, question et quiz
-- ==
CREATE OR REPLACE VIEW view_reponse_quizname as
    SELECT r.id_reponse, r.reponse_content, r.bonne_mauvaise, q.id_question, q.num_question, q.question_content, q.cip,
           q.id_type, qu.id_quiz, qu.nom_quiz
    FROM reponse as r
    LEFT JOIN question as q ON r.id_question= q.id_question
    LEFT JOIN quiz as qu ON qu.id_quiz=q.id_quiz;

-- ==
-- Creation de la vue des quiz et usager + type de relation
-- ==
CREATE OR REPLACE VIEW  view_usager_quiz_relation as
SELECT q.id_quiz, q.nom_quiz, tr.id_relation, tr.nom_relation, u.cip, u.prenom_usager, u.nom_usager,
       u.prenom_usager || ' ' || u.nom_usager AS nom_complet_usager
FROM usager_quiz uq
LEFT JOIN quiz q on q.id_quiz = uq.id_quiz
LEFT JOIN usager u on uq.cip = u.cip
LEFT JOIN type_relation tr on uq.id_relation = tr.id_relation;

-- ==
-- Creation de la vue des articles et references
-- ==
CREATE OR REPLACE VIEW  view_article_reference as
SELECT a.id_article, a.nom_article, r.id_reference, r.nom_reference, rl.lien
FROM reference_article ra
LEFT JOIN reference r on ra.id_reference = r.id_reference
LEFT JOIN article a on ra.id_article = a.id_article
LEFT JOIN reference_lien rl on r.id_reference = rl.code_reference;

-- ==
-- Creation de la vue des articles et thematiques
-- ==
CREATE OR REPLACE VIEW  view_article_thematique as
SELECT a.id_article, a.nom_article, t.id_thematique, t.nom_thematique
FROM article_thematique at
LEFT JOIN article a on at.id_article = a.id_article
LEFT JOIN thematique t on at.id_thematique = t.id_thematique;

-- ==
-- Creation de la vue des usagers et statuts
-- ==
CREATE OR REPLACE VIEW  view_usager_statut as
SELECT u.cip, u.prenom_usager, u.nom_usager, u.prenom_usager || ' ' || u.nom_usager AS nom_complet_usager,
       s.id_statut, s.nom_statut
FROM usager_statut us
LEFT JOIN statut s on us.id_statut = s.id_statut
LEFT JOIN usager u on us.cip = u.cip;

-- ==
-- Creation de la vue des usagers et thematique
-- ==
CREATE OR REPLACE VIEW  view_usager_thematique as
SELECT u.cip, u.prenom_usager, u.nom_usager, u.prenom_usager || ' ' || u.nom_usager AS nom_complet_usager,
       t.id_thematique, t.nom_thematique
FROM usager_thematique ut
LEFT JOIN usager u on ut.cip = u.cip
LEFT JOIN thematique t on ut.id_thematique = t.id_thematique;


-- ============================================================================
--                          Creation des triggers
-- ============================================================================