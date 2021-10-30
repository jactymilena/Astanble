package ca.usherbrooke.gegi.server.persistence;

import ca.usherbrooke.gegi.server.business.log.ArticleUserLog;
import ca.usherbrooke.gegi.server.business.log.QuizUserLog;
import ca.usherbrooke.gegi.server.business.log.UserLog;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface LogMapper {
    void insertArticleUserLog(@Param("log") ArticleUserLog log);
    //void insertQuizUserLog(@Param("log") QuizUserLog log);
    //void insertUserUserLog(@Param("log") UserLog log);
}
