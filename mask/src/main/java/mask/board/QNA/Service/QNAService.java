package mask.board.QNA.Service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface QNAService {

	List<Map<String, Object>> selectQNABoardList(Map<String, Object> map)throws Exception;

	void QNAInsert(Map<String, Object> map, HttpServletRequest request)throws Exception;

	List<Map<String, Object>> openQNAList(Map<String, Object> map)throws Exception;

	void QNADelete(Map<String, Object> map)throws Exception;

	List<Map<String, Object>> QNAReply(Map<String, Object> map)throws Exception;

	void QNAReplyInsert(Map<String, Object> map, HttpServletRequest request)throws Exception;

}
