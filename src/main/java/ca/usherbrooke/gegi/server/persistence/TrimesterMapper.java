package ca.usherbrooke.gegi.server.persistence;


import ca.usherbrooke.gegi.server.business.Trimester;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Mapper;


import java.util.List;

@Mapper
public interface TrimesterMapper {

    List<Trimester> select();
    void insertTrimester(@Param("trimestre") Trimester trimester);
}
