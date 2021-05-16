package mask.board.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import mask.common.AbstractDAO;

@Repository("boardDAO")
public class BoardDAO extends AbstractDAO{
	
	   @SuppressWarnings("unchecked")
	   public List<Map<String, Object>> selectBoardList(Map<String, Object> map)throws Exception{
	      return (List<Map<String, Object>>)selectPagingList("board.selectBoardList", map);
	   }
	   
	/*   
	   @SuppressWarnings("unchecked")
	   public List<Map<String, Object>> openBoardList(Map<String, Object> map)throws Exception{
	      return (List<Map<String, Object>>) selectList("board.selectBoardList", map);
	   }
	   */
	   
	   public void insertBoard(Map<String, Object> map) throws Exception{
		   insert("board.insertBoard", map);
			}
	
	   public void updateHitCnt(Map<String, Object> map) throws Exception{
			update("board.updateHitCnt", map);       //조회수 증가
		}
	   
	   public void updateHitLike(Map<String, Object> map) throws Exception{
		   System.out.println(map.get("BOARD_NUM"));
			update("board.updateHitLike", map);       //좋아요ㅎ.ㅎ
		}
	   
	   public void updateDisHitLike(Map<String, Object> map) throws Exception{
		   System.out.println(map.get("BOARD_NUM"));
			update("board.updateDisHitLike", map);       //싫어요ㅎ.ㅎ
		}
	   
	   @SuppressWarnings("unchecked")
		public Map<String, Object> openBoardDetail(Map<String, Object> map) throws Exception{
			return (Map<String, Object>) selectOne("board.openBoardDetail", map);
		}

	   public void updateBoard(Map<String, Object> map) throws Exception{
		   
			update("board.updateBoard", map);    //수정하기
		}

		public void deleteBoard(Map<String, Object> map) throws Exception{
			update("board.deleteBoard", map);     //삭제하기
		}
}
