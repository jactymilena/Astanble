package ca.usherbrooke.gegi.server.persistence;


import ca.usherbrooke.gegi.server.business.Article;
import ca.usherbrooke.gegi.server.business.Thematique;
import ca.usherbrooke.gegi.server.business.Wiki;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ThematiqueMapper {
    List<Thematique> select();
    List<Thematique> selectByArticleId(@Param("id_article") int id_article);
    int insert(@Param("thematique") Thematique thematique);
    void delete(@Param("id_thematique") int id_thematique);
}

