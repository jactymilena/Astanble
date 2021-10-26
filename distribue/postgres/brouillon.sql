SELECT * FROM astanble.article;
WHERE content LIKE 'objet';

SELECT SIMILARITY(nom_article, 'n'), SIMILARITY(nom_article, 'n') / LENGTH(nom_article), LENGTH(nom_article) AS grandeur, nom_article FROM astanble.article;
WHERE SIMILARITY(content, 'objet') > 0.3;

SELECT content <-> 'the', content FROM astanble.article;

SELECT * FROM astanble.article
WHERE SIMILARITY(content, 'objet') > 0.3 OR
        content LIKE 'objet' OR
                content <-> 'objet' < 0.9;

SELECT SIMILARITY('objet', 'objet');

SELECT content % 'the' FROM astanble.article;

CREATE INDEX CONCURRENTLY ON astanble.article USING GIN (content gin_trgm_ops);

SELECT * FROM astanble.article
WHERE SIMILARITY(nom_article,  'mi') > 0.1
ORDER BY SIMILARITY(nom_article,  'mi') DESC
LIMIT 100;