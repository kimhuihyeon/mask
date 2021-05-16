package mask.notice.service;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import mask.notice.dao.NoticeDAO;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {
	
	@Resource(name="noticeDAO") 
	private NoticeDAO noticeDAO; 
	
	  public List<Map<String, Object>> NoticeBoardList(Map<String, Object> map)throws Exception{
	       return noticeDAO.NoticeBoardList(map);
	    }
	  
	    
	  @Override
		public Map<String, Object> NoticeDetail (Map<String, Object> map) throws Exception { 
			noticeDAO.updateHitCnt(map);
			Map<String, Object> resultMap = noticeDAO.NoticeDetail(map);
			return resultMap;
		}
	  

}
