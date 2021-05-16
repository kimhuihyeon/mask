package mask.admin.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import mask.common.AbstractDAO;

@Repository("adminBoardDAO")
public class AdminBoardDAO extends AbstractDAO {
	
	 @SuppressWarnings("unchecked")
	   public List<Map<String, Object>> selectAdminBoardList(Map<String, Object> map)throws Exception{
	      return (List<Map<String, Object>>)selectPagingList("notice.admimBoardList", map);
	   }
	 
	 public void admindeleteBoard(Map<String, Object> map) throws Exception{
			update("board.deleteBoard", map);     //삭제하기
		}
	 
		@SuppressWarnings("unchecked")
		   public List<Map<String, Object>> SearchA(Map<String, Object> map)throws Exception{
		      return (List<Map<String, Object>>)selectPagingList("notice.SearchA", map);
		   }
		
		  public void insertBoard(Map<String, Object> map) throws Exception{
			   insert("notice.insertBoard", map);
				}
		
}
