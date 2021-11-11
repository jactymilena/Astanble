package ca.usherbrooke.gegi.server.persistence;

import ca.usherbrooke.gegi.server.business.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface QuizMapper {
    List<Quiz> select();
    List<Quiz> selectByName(@Param("name") String name);
    Quiz selectByID(@Param("id")int id);
    List<QuizAuthor> selectByAuthor(@Param("auteur")String auteur);
    List<Usager> selectAuthorByQuiz(@Param("id_quiz") int id_quiz);
    List<Quiz> selectByQuestionRepondue(@Param("cip") String cip);
    void insert(@Param("quiz") Quiz quiz);
    void update(@Param("quiz") Quiz quiz);
    void delete(@Param("id_quiz") int id_quiz);

}
