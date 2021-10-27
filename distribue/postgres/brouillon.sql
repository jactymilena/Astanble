SELECT * FROM astanble.article;
WHERE content LIKE 'objet';

SELECT SIMILARITY(nom_article, 'n'), SIMILARITY(nom_article, 'n') / LENGTH(nom_article), LENGTH(nom_article) AS grandeur, nom_article FROM astanble.article;
WHERE SIMILARITY(content, 'objet') > 0.3;

SELECT content <-> 'the', content FROM astanble.article;

SELECT * FROM astanble.article
WHERE SIMILARITY(content, 'objet') > 0.3 OR
        content LIKE 'objet' OR
                content <-> 'objet' < 0.9;

SELECT astanble.SIMILARITY('objet', 'objet');


SELECT content % 'the' FROM astanble.article;

CREATE INDEX CONCURRENTLY ON astanble.article USING GIN (content gin_trgm_ops);

SELECT * FROM astanble.article
WHERE SIMILARITY(nom_article,  'mi'::varchar) > 0.1
ORDER BY SIMILARITY(nom_article,  'mi'::varchar) DESC
LIMIT 100;

SELECT * FROM astanble.usager;

SELECT * FROM astanble.view_usager_wiki;

SHOW search_path;
SET search_path TO Astanble;



SELECT astanble.SIMILARITY(prenom_usager,  'vero'), prenom_usager, nom_usager FROM astanble.usager;
WHERE astanble.SIMILARITY(prenom_usager,  'mil') > 0.3 or
        astanble.SIMILARITY(nom_usager, 'mil') > 0.3
ORDER BY astanble.SIMILARITY(prenom_usager,   'mil') DESC
LIMIT 100;
