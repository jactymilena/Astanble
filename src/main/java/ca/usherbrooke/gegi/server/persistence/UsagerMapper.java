package ca.usherbrooke.gegi.server.persistence;



import ca.usherbrooke.gegi.server.business.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface UsagerMapper {
    List<Usager> select();
    Usager selectByCIP(@Param("cip")String cip);
    Usager selectByEmail(@Param("courriel1")String courriel1);
    void insert(@Param("usager") Usager usager);
    void update(@Param("usager") Usager usager);
    void delete(@Param("cip") String cip);
}

