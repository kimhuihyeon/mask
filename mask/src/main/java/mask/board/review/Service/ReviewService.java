package mask.board.review.Service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface ReviewService {

	List<Map<String, Object>> selectBoardList(Map<String, Object> map)throws Exception;

	List<Map<String, Object>> openBoardList(Map<String, Object> map)throws Exception;

	void reviewInsert(Map<String, Object> map, HttpServletRequest request)throws Exception;

	void reviewDelete(Map<String, Object> map, HttpServletRequest request)throws Exception;

	Map<String, Object> reviewDetail(Map<String, Object> map)throws Exception;

	void reviewUpdate(Map<String, Object> map, HttpServletRequest request)throws Exception;

}
