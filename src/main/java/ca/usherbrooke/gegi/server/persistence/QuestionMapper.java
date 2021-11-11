package ca.usherbrooke.gegi.server.persistence;

import ca.usherbrooke.gegi.server.business.Question;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface QuestionMapper {

    List<Question> select();
    List<Question> selectByQuiz(@Param("id_quiz") int id_quiz);
    List<Question> selectByReponse(@Param("id_reponse") int id_reponse);
    List<Question> selectByName(@Param("name") String name);
    List<Question> selectByID(@Param("id") int id);
    List<Question> selectByType(@Param("type") int type);
    Question selectByTypeQuestion(@Param("id_question") int id_question);
    void insert(@Param("question") Question question);
    void update(@Param("question") Question question);
    void delete(@Param("id_question") int id_question);
}
