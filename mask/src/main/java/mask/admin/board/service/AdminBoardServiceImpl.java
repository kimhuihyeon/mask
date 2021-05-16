package mask.admin.board.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import mask.admin.board.dao.AdminBoardDAO;

@Service("adminBoardService")
public class AdminBoardServiceImpl implements AdminBoardService {
	
	  @Resource(name="adminBoardDAO")
	    private AdminBoardDAO adminBoardDAO;
	  
	  public List<Map<String, Object>> selectAdminBoardList(Map<String, Object> map)throws Exception{
	       return adminBoardDAO.selectAdminBoardList(map);
	    }
	  
		@Override
		public void admindeleteBoard(Map<String, Object> map) throws Exception {
			adminBoardDAO.admindeleteBoard(map);
		}
		
		@Override
		public List<Map<String, Object>> SearchA(Map<String, Object> map)throws Exception{
			return adminBoardDAO.SearchA(map);
		}
		
		   @Override
		   	public void insertBoard(Map<String, Object> map) throws Exception {
			   adminBoardDAO.insertBoard(map);     	
		   	}
	  
	  

}
