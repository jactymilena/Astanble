package ca.usherbrooke.gegi.server.persistence;

import ca.usherbrooke.gegi.server.business.Reponse;
import ca.usherbrooke.gegi.server.business.ReponseUsager;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.sql.Timestamp;
import java.util.List;

@Mapper
public interface ReponseMapper {
    List<Reponse> select();
    List<Reponse> selectByQuestion(@Param("id_question") int id_question);
    List<ReponseUsager> selectByUserDateQuiz(@Param("cip") String cip, @Param("id_quiz") int id_quiz, @Param("time") String time);
    List<Reponse> selectByName(@Param("name") String name);
    List<Reponse> selectByID(@Param("id") int id);
    List<Reponse> selectByAuthor(@Param("auteur") String auteur);
    void insertUser(@Param("reponseUser") ReponseUsager reponseUser);
    void insert(@Param("reponse") Reponse reponse);
    void update(@Param("reponse") Reponse reponse);
    void delete(@Param("id_reponse") int id_reponse);
    void deleteUserReponses(@Param("id_quiz") int id_quiz, @Param("date") Timestamp date, @Param("cip") String user_cip);
}
