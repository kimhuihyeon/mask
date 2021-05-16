package mask.board.QNA.Service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import mask.board.QNA.DAO.QNADAO;

@Service("QNAService")
public class QNAServiceImpl  implements QNAService{

	@Resource(name="QNADAO")
	QNADAO qNADAO;
	
	@Override
	public List<Map<String, Object>> selectQNABoardList(Map<String, Object> map) throws Exception {
		return qNADAO.selectQNABoardList(map);
	}
	
	
	@Override
	public void QNAInsert(Map<String, Object> map, HttpServletRequest request) throws Exception {
		qNADAO.QNAInsert(map);
	}
	
	
	@Override
	public List<Map<String, Object>> openQNAList(Map<String, Object> map) throws Exception {
		return qNADAO.openQNAList(map);
		
	}
	
	@Override
	public void QNADelete(Map<String, Object> map)throws Exception{
		qNADAO.QNADelete(map);
		
		
		
	}

	@Override
	public List<Map<String, Object>> QNAReply(Map<String, Object> map) throws Exception {
		return qNADAO.QNAReply(map);
		
	}
	
	
	@Override
	public void QNAReplyInsert(Map<String, Object> map, HttpServletRequest request) throws Exception {
		qNADAO.QNAReplyInsert(map);
	}
}
