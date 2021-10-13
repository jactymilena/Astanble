package ca.usherbrooke.gegi.server.persistence;


import ca.usherbrooke.gegi.server.business.Article;
import ca.usherbrooke.gegi.server.business.Wiki;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface WikiMapper {
    List<Wiki> select();
    List<Wiki> selectByName(@Param("article")String article);
    List<Wiki> selectByAuthor(@Param("auteur")String auteur);
    List<Wiki> selectByThematique(@Param("id_thematique")Integer id_thematique);
    List<Wiki> selectById(@Param("id_article")Integer id_article);
    void insert(@Param("article") Article article);
    void update(@Param("article") Article article);
    void delete(@Param("article") int id_article);

}

