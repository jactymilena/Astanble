package server.persistence;


import server.business.Wiki;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Mapper;


import java.util.List;

@Mapper
public interface WikiMapper {

    List<Wiki> select();
}
