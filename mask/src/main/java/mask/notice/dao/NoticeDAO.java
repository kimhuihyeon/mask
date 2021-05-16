package mask.notice.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mask.common.AbstractDAO;
import mask.common.CommandMap;
import mask.notice.service.NoticeService;

@Repository("noticeDAO")
public class NoticeDAO extends AbstractDAO{
	
	
	   @SuppressWarnings("unchecked")
	   public List<Map<String, Object>> NoticeBoardList(Map<String, Object> map)throws Exception{
	      return (List<Map<String, Object>>)selectPagingList("notice.NoticeList", map);
	   }
	   
	   @SuppressWarnings("unchecked")
		public Map<String, Object> NoticeDetail(Map<String, Object> map) throws Exception{
			return (Map<String, Object>) selectOne("notice.NoticeDetail", map);
		}
	   
	   public void updateHitCnt(Map<String, Object> map) throws Exception{
				update("notice.noticeupdateHitCnt", map);       //조회수 증가
			}
	   
	  
		
}
