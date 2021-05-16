package mask.member.login.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import mask.member.login.dao.LoginDAO;

@Service("loginService")
public class LoginServiceImpl implements LoginService{
	
	@Resource(name="loginDAO")
	private LoginDAO loginDAO;
	
	@Override
	public Map<String, Object> selectId(Map<String, Object> map) throws Exception {
		return loginDAO.selectId(map);
	}
	
	@Override
	public Map<String, Object> findId(Map<String, Object> map) throws Exception {
		 return loginDAO.findId(map);

	}
	
	@Override
	public String findPwEmail(Map<String, Object> map) throws Exception {
		return (String)loginDAO.findPwEmail(map);
	}
	
	 @Override
	public int findOrderNum(Map<String, Object> map) throws Exception {
		 return loginDAO.findOrderNum(map);
	}
	
	@Override
	public void changePW(Map<String, Object> map) throws Exception {
		loginDAO.changePW(map);
	}
}
