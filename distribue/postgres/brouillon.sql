SET search_path TO Astanble;

SELECT * FROM astanble.article
WHERE content LIKE 'objet';

SELECT SIMILARITY(nom_article, 'n'), SIMILARITY(nom_article, 'n') / LENGTH(nom_article), LENGTH(nom_article) AS grandeur, nom_article FROM astanble.article
WHERE SIMILARITY(content, 'objet') > 0.3;

SELECT content <-> 'the', content FROM astanble.article;

SELECT * FROM astanble.article
WHERE SIMILARITY(content, 'objet') > 0.3 OR
        content LIKE 'objet' OR
                content <-> 'objet' < 0.9;

SELECT astanble.SIMILARITY('objet', 'objet');


SELECT content % 'the' FROM astanble.article;


SELECT * FROM astanble.article
WHERE SIMILARITY(nom_article,  'mi'::varchar) > 0.1
ORDER BY SIMILARITY(nom_article,  'mi'::varchar) DESC
LIMIT 100;

SELECT * FROM astanble.usager;

SELECT * FROM astanble.view_usager_wiki;

SHOW search_path;
SET search_path TO Astanble;



SELECT astanble.SIMILARITY(prenom_usager,  'vero'), prenom_usager, nom_usager FROM astanble.view_usager_wiki
WHERE astanble.SIMILARITY(prenom_usager,  'vero') > 0.3 or
        astanble.SIMILARITY(nom_usager, 'vero') > 0.3
ORDER BY astanble.SIMILARITY(prenom_usager,   'vero') DESC
LIMIT 100;

SELECT astanble.SIMILARITY(prenom_usager,  'mil'), astanble.SIMILARITY(nom_usager,  'mil'), prenom_usager, nom_usager FROM astanble.view_usager_wiki
LIMIT 100;

SELECT * FROM astanble.view_usager_wiki;

SELECT
    a.id_article,
    a.nom_article,
    a.content,
    a.description_robot_article,
    a.description_article
FROM
    astanble.article AS a

        JOIN astanble.article_thematique AS at
ON at.id_article = a.id_article

WHERE at.id_thematique = 1;

SELECT
    cip,
    prenom_usager,
    nom_usager,
    nom_complet_usager
FROM astanble.view_usager_quiz_relation
WHERE id_quiz = 1
  AND nom_relation = 'Auteur' OR nom_relation = 'Co-Auteur';

SELECT * FROM astanble.view_quiz_usager_reponse;

SELECT * FROM astanble.view_usager_quiz_relation
WHERE nom_relation = 'Auteur' OR nom_relation = 'Co-Auteur';

SELECT * FROM astanble.view_usager_quiz_relation
WHERE cip = 'larn5378' AND nom_relation = 'Auteur' OR nom_relation = 'Co-Auteur';

SELECT * FROM astanble.question WHERE id_quiz = 1;

SELECT id_quiz, nom_quiz
FROM view_quiz_usager_reponse
    WHERE cip = 'saej3101';

SELECT * FROM view_article_quiz;


SELECT * FROM commentaire;

SELECT
    id_commentaire,
    commentaire_content,
    cip,
    id_article
FROM
    astanble.commentaire
WHERE id_reponse_commentaire IS NULL AND id_article = 1
ORDER BY id_commentaire;

SELECT cip, nom_usager, prenom_usager
FROM usager
WHERE cip = 'saej3101';

INSERT INTO astanble.commentaire(commentaire_content, cip, id_article)
VALUES ('allo', 'saej3101', 1);

SELECT * FROM astanble.commentaire;




INSERT INTO astanble.reponse_usager_question(
    id_question,
    id_reponse,
    CIP
)
VALUES (1,
        1,
        'saej3101');

SELECT * FROM astanble.reponse;

SELECT id_quiz, nom_quiz
FROM astanble.view_quiz_usager_reponse
WHERE cip = 'saej3101'
GROUP BY id_quiz, nom_quiz;
