package mask.board.board.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import mask.board.board.dao.BoardDAO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
    @Resource(name="boardDAO")
    private BoardDAO boardDAO;
    


    public List<Map<String, Object>> selectBoardList(Map<String, Object> map)throws Exception{
       return boardDAO.selectBoardList(map);
    }
    
   /* public List<Map<String, Object>> openBoardList(Map<String, Object> map)throws Exception{
        return boardDAO.openBoardList(map);
     }*/
    
    @Override
   	public void insertBoard(Map<String, Object> map) throws Exception {
       	boardDAO.insertBoard(map);     	
   	}
       
    
    @Override
	public Map<String, Object> openBoardDetail(Map<String, Object> map) throws Exception {
        boardDAO.updateHitCnt(map);
    	Map<String, Object> resultMap = boardDAO.openBoardDetail(map);
		return  resultMap;
	}
	
    @Override
	public void updateHitLike(Map<String, Object> map) throws Exception{
		boardDAO.updateHitLike(map);
	}
    
    @Override
   	public void updateDisHitLike(Map<String, Object> map) throws Exception{
   		boardDAO.updateDisHitLike(map);
   	}
    

	@Override
	public void updateBoard(Map<String, Object> map) throws Exception{
		boardDAO.updateBoard(map);
	}

	@Override
	public void deleteBoard(Map<String, Object> map) throws Exception {
		boardDAO.deleteBoard(map);
	}


}
