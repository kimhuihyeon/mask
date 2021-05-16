package mask.board.board.service;

import java.util.List;
import java.util.Map;

public interface BoardService {

	
	
	List<Map<String, Object>> selectBoardList(Map<String, Object> map)throws Exception;
			
	void insertBoard(Map<String, Object> map) throws Exception;
    
	Map<String, Object> openBoardDetail(Map<String, Object> map) throws Exception;
	
	void updateHitLike(Map<String, Object> map) throws Exception;
	
	void updateDisHitLike(Map<String, Object> map) throws Exception;
	
	void updateBoard(Map<String, Object> map) throws Exception;

	void deleteBoard(Map<String, Object> map) throws Exception;

}
