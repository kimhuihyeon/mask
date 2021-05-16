package mask.board.QNA.DAO;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import mask.common.AbstractDAO;

@Repository("QNADAO")
public class QNADAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectQNABoardList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectPagingList("QNA.QNAListPaging", map);
	}

	public void QNAInsert(Map<String, Object> map) {
		insert("QNA.QNAInsert", map);
		
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> openQNAList(Map<String, Object> map) {
		return selectList("QNA.openQNAList",map);
	}

	public void QNADelete(Map<String, Object> map) {
		update("QNA.QNADelete",map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> QNAReply(Map<String, Object> map) {
		return selectList("QNA.QNAReplyList",map);
	}

	public void QNAReplyInsert(Map<String, Object> map) {
		insert("QNA.QNAReplyInsert",map);
	}

}
