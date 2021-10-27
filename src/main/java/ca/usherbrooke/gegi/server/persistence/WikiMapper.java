package ca.usherbrooke.gegi.server.persistence;


import ca.usherbrooke.gegi.server.business.Article;
import ca.usherbrooke.gegi.server.business.ArticleAuthor;
import ca.usherbrooke.gegi.server.business.Usager;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface WikiMapper {
    List<ArticleAuthor> select();
    List<Usager> selectAuthorOfArticle(@Param("id") String id);
    List<Article> selectByName(@Param("article")String article);
    List<Article> selectByAuthor(@Param("auteur")String auteur);
    List<ArticleAuthor> selectByThematique(@Param("id_thematique")Integer id_thematique);
    List<Article> selectById(@Param("id_article")String id_article);
    List<ArticleAuthor> selectSearchByName(@Param("nom_article")String nom_article);
    List<ArticleAuthor> selectSearchByAuthor(@Param("prenom_usager")String prenom_usager);
    List<ArticleAuthor> selectSearchByDescription(@Param("description_article")String description_article);
    void insert(@Param("article") Article article);
    void update(@Param("article") Article article);
    void delete(@Param("id_article") int id_article);
}

