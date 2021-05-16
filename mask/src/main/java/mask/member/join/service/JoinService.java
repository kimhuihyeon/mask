package mask.member.join.service;

import java.util.Map;

public interface JoinService {
	
	
	Map<String, Object> IdCheck(Map<String,Object> map) throws Exception; 
	
	void insertJoin(Map<String,Object> map) throws Exception;
	
}
