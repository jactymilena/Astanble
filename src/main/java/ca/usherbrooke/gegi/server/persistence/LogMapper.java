package ca.usherbrooke.gegi.server.persistence;

import ca.usherbrooke.gegi.server.business.Article;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
public interface LogMapper {
    void insertArticleUserLog(@Param("article") Article article);
    void insertQuizUserQuestionLog(@Param("cip") String cip, @Param("id_quiz") int id_quiz,
                           @Param("id_question") int id_question, @Param("id_type") int id_type,
                           @Param("id_field") int id_field);
    void insertQuizUserLog(@Param("cip") String cip, @Param("id_quiz") int id_quiz,
                           @Param("id_type") int id_type, @Param("id_field") int id_field);
    void insertUserUserLog();
}
