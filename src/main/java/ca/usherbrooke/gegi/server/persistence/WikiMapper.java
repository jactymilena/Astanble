package ca.usherbrooke.gegi.server.persistence;


import ca.usherbrooke.gegi.server.business.Wiki;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface WikiMapper {
    List<Wiki> select();
}
