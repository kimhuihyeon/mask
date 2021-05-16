package mask.member.mypage.service;

import java.util.Map;

import javax.annotation.Resource;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import mask.member.mypage.dao.MyPageDAO;

@Service("myPageService")
public class MyPageServiceImpl implements MyPageService{
	
	@Resource(name="myPageDAO") 
	private MyPageDAO myPageDAO; 
	
	
	@Override
	public Map<String, Object> selectMyInfo(Map<String, Object> map) throws Exception{
		return myPageDAO.selectMyInfo(map); 
	}
	
	@Override
	public Map<String, Object> selectMyInfoSta(Map<String, Object> map) throws Exception{
		return myPageDAO.selectMyInfoSta(map);
	}
	

	
	@Override
	public void updateMyInfo(Map<String, Object> map) throws Exception{
		myPageDAO.updateMyInfo(map);
	}
	
	@Override
	public void deleteMyInfo(Map<String, Object> map) throws Exception{
		myPageDAO.deleteMyInfo(map);
	}

}
