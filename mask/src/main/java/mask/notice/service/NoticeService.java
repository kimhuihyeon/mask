package mask.notice.service;

import java.util.List;
import java.util.Map;

public interface NoticeService {	
	
	List<Map<String, Object>> NoticeBoardList(Map<String, Object> map)throws Exception;
	
	Map<String, Object> NoticeDetail(Map<String, Object> map) throws Exception;
	

}
