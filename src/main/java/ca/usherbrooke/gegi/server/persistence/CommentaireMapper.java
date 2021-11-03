package ca.usherbrooke.gegi.server.persistence;

import ca.usherbrooke.gegi.server.business.Commentaire;
import ca.usherbrooke.gegi.server.business.ReponseCommentaire;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CommentaireMapper {
    List<Commentaire> selectByArticle(@Param("id_article") int id_article);
    List<ReponseCommentaire> selectReponseByCommentaire(@Param("id_commentaire") int id_commentaire);
    void insertCommentaire(@Param("commentaire") Commentaire commentaire);
    void insertReponseCommentaire(@Param("commentaire") Commentaire commentaire);
}
