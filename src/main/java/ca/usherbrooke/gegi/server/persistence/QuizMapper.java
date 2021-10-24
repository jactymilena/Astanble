package ca.usherbrooke.gegi.server.persistence;

import ca.usherbrooke.gegi.server.business.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface QuizMapper {
    List<Quiz> select();
    List<Quiz> selectByName(@Param("name") String name);
    List<Question> selectQuestionsByQuiz(@Param("id_quiz")int id_quiz);
    List<Reponse> selectReponsesByQuestion(@Param("id_question")int id_question);
    List<Quiz> selectByID(@Param("id")int id);
    List<Quiz> selectByAuthor(@Param("auteur")String auteur);
    void insert(@Param("quiz") Quiz quiz);
    void update(@Param("quiz") Quiz quiz);
    void delete(@Param("id_quiz") int id_quiz);


}
