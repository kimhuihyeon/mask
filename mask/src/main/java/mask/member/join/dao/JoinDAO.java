package mask.member.join.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;
import mask.common.AbstractDAO;

@Repository("joinDAO")
public class JoinDAO extends AbstractDAO{
	
	
	public Map<String,Object> selectIdCheck(Map<String, Object> map) throws Exception {
		return selectOne1("join.IdCheck", map);
	}
	
	public void insertJoin(Map<String,Object> map) throws Exception{
		insertJoin("join.insertJoin",map);
	}
	
}
