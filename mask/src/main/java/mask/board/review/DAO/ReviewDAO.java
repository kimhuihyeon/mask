package mask.board.review.DAO;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import mask.common.AbstractDAO;

@Repository("reviewDAO")
public class ReviewDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("review.reviewListPaging", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> openBoardList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("review.reviewListPaging",map);
	}

	public void reviewInsert(Map<String, Object> map) throws Exception {
		insert("review.reviewInsert", map);
		
	}

	public void reviewDelete(Map<String, Object> map)throws Exception {
		update("review.reviewDelete",map);
		
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> reviewDetail(Map<String, Object> map)throws Exception {
		return (Map<String, Object>) selectList("review.reviweDetail",map);
	}

	public void reviewUpdate(Map<String, Object> map)throws Exception {
		update("review.reviewUpdate",map);
	}
	
	

}
