/*
-- ======================================
-- Suppression de la base de données
-- ======================================
 */

-- ==
-- Identification du schéma
-- ==
SET search_path TO Astanble;

-- ==
-- Suppression des tables
-- ==
DROP TABLE IF EXISTS ReponseUsagerQuestion CASCADE;
DROP TABLE IF EXISTS ArticleQuestion CASCADE;
DROP TABLE IF EXISTS Question CASCADE;
DROP TABLE IF EXISTS ReferenceLien CASCADE;
DROP TABLE IF EXISTS UsagerCourriel CASCADE;
DROP TABLE IF EXISTS UsagerQuiz CASCADE;
DROP TABLE IF EXISTS ArticleQuiz CASCADE;
DROP TABLE IF EXISTS ReferenceArticle CASCADE;
DROP TABLE IF EXISTS UsagerThematique CASCADE;
DROP TABLE IF EXISTS ArticleThematique CASCADE;
DROP TABLE IF EXISTS UsagerArticleCollaboration CASCADE;
DROP TABLE IF EXISTS TypeRelation CASCADE;
DROP TABLE IF EXISTS UsagerStatut CASCADE;
DROP TABLE IF EXISTS TypeQuestion CASCADE;
DROP TABLE IF EXISTS Quiz CASCADE;
DROP TABLE IF EXISTS Reference CASCADE;
DROP TABLE IF EXISTS Thematique CASCADE;
DROP TABLE IF EXISTS Article CASCADE;
DROP TABLE IF EXISTS Statut CASCADE;
DROP TABLE IF EXISTS Usager CASCADE;