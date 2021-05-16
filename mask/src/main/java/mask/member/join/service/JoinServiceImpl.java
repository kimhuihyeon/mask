package mask.member.join.service;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import mask.member.join.dao.JoinDAO;

@Service("joinService")
public class JoinServiceImpl implements JoinService{
	
	Logger log=Logger.getLogger(JoinService.class);
	
	@Resource(name="joinDAO")
	private JoinDAO joinDAO;
	
	@Override
	public Map<String,Object> IdCheck(Map<String, Object> map) throws Exception {
		
		if(joinDAO.selectIdCheck(map)==null) {
			return null;
		}
		
		Map<String,Object> resultMap=joinDAO.selectIdCheck(map);
		
		
		return resultMap;
	}

	@Override
	public void insertJoin(Map<String, Object> map) throws Exception {
		
		joinDAO.insertJoin(map);
		
	}
	
	
}
