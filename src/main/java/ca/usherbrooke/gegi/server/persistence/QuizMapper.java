package ca.usherbrooke.gegi.server.persistence;

import ca.usherbrooke.gegi.server.business.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface QuizMapper {
    List<Quiz> select();
    List<Quiz> selectByName(@Param("name") String name);
//    List<Question> selectQuestionsByQuiz(@Param("id_quiz")int id_quiz);
//    List<Reponse> selectReponsesByQuestion(@Param("id_question")int id_question);
    Quiz selectByID(@Param("id")int id);
    List<QuizAuthor> selectByAuthor(@Param("auteur")String auteur);
    List<Usager> selectAuthorByQuiz(@Param("id_quiz") int id_quiz);
    void insert(@Param("quiz") Quiz quiz);
    void update(@Param("quiz") Quiz quiz);
    void delete(@Param("id_quiz") int id_quiz);


}
