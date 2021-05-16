package mask.admin.member.service;

import java.util.List;
import java.util.Map;

public interface AdminMemberService {
	
	 List<Map<String, Object>> selectMemberList(Map<String, Object> map)throws Exception;
	 
	 void admindeletemem(Map<String, Object> map) throws Exception;
	  
}
