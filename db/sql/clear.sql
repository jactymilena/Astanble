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
DROP TABLE IF EXISTS reponse_usager_question CASCADE;
DROP TABLE IF EXISTS article_question CASCADE;
DROP TABLE IF EXISTS question CASCADE;
DROP TABLE IF EXISTS reference_lien CASCADE;
DROP TABLE IF EXISTS usager_courriel CASCADE;
DROP TABLE IF EXISTS usager_quiz CASCADE;
DROP TABLE IF EXISTS article_quiz CASCADE;
DROP TABLE IF EXISTS reference_article CASCADE;
DROP TABLE IF EXISTS usager_thematique CASCADE;
DROP TABLE IF EXISTS article_thematique CASCADE;
DROP TABLE IF EXISTS usager_article_collaboration CASCADE;
DROP TABLE IF EXISTS type_relation CASCADE;
DROP TABLE IF EXISTS usager_statut CASCADE;
DROP TABLE IF EXISTS type_question CASCADE;
DROP TABLE IF EXISTS quiz CASCADE;
DROP TABLE IF EXISTS reference CASCADE;
DROP TABLE IF EXISTS thematique CASCADE;
DROP TABLE IF EXISTS article CASCADE;
DROP TABLE IF EXISTS statut CASCADE;
DROP TABLE IF EXISTS usager CASCADE;