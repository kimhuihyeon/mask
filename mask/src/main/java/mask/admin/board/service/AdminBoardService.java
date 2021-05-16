package mask.admin.board.service;

import java.util.List;
import java.util.Map;

public interface AdminBoardService {
	
	List<Map<String, Object>> selectAdminBoardList(Map<String, Object> map)throws Exception;
	void admindeleteBoard(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> SearchA(Map<String, Object> map)throws Exception;
	
	void insertBoard(Map<String, Object> map) throws Exception;
}
