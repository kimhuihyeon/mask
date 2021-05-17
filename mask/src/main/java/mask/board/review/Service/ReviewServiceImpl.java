package mask.board.review.Service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import mask.board.review.DAO.ReviewDAO;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {

	@Resource(name="reviewDAO")
	ReviewDAO reviewDAO;
	
	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		return reviewDAO.selectBoardList(map);
	}
	
	@Override
	public List<Map<String, Object>> openBoardList(Map<String, Object> map) throws Exception {
		return reviewDAO.openBoardList(map);
	}
	
	@Override
	public void reviewInsert(Map<String, Object> map, HttpServletRequest request) throws Exception {
		reviewDAO.reviewInsert(map);
	}
	
	@Override
	public void reviewDelete(Map<String, Object> map, HttpServletRequest request) throws Exception {
		reviewDAO.reviewDelete(map);
	}
	@Override
	public Map<String, Object> reviewDetail(Map<String, Object> map) throws Exception {
		return reviewDAO.reviewDetail(map);
	}
	
	@Override
	public void reviewUpdate(Map<String, Object> map, HttpServletRequest request) throws Exception {
		reviewDAO.reviewUpdate(map);
	}
}
