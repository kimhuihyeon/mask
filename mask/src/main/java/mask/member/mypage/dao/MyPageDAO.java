package mask.member.mypage.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import mask.common.AbstractDAO;

@Repository("myPageDAO")
public class MyPageDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	   public Map<String, Object> selectMyInfo(Map<String, Object> map)throws Exception{
	      return (Map<String, Object>) selectOne("myPage.selectMyInfo", map);
	   }
	
	
	
	@SuppressWarnings("unchecked")
	 public Map<String, Object> selectMyInfoSta(Map<String, Object> map)throws Exception{
	      return (Map<String, Object>) selectOne("myPage.selectMyInfoSta", map);
	   }
	
	//업데이트는 void로	
	public void  updateMyInfo(Map<String, Object> map) throws Exception{
		update("myPage.updateMyInfo", map);   
	}
	
	 public void deleteMyInfo(Map<String, Object> map)throws Exception{
	      update("myPage.deleteMyInfo", map);
	   }

}
