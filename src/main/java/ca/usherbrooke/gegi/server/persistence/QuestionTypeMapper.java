package ca.usherbrooke.gegi.server.persistence;

import ca.usherbrooke.gegi.server.business.QuestionType;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface QuestionTypeMapper {
    List<QuestionType> all();
}
