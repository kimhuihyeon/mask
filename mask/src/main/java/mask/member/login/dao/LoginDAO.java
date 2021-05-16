package mask.member.login.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import mask.common.AbstractDAO;

@Repository("loginDAO")
public class LoginDAO extends AbstractDAO {
	
	
	@SuppressWarnings("unchecked") //로그인
	public Map<String, Object>selectId(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("login.selectId", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> findId(Map<String, Object> map) throws Exception {//아이디찾기
		return (Map<String, Object>) selectOne("login.findId", map);
	}
	
		
	public int findOrderNum(Map<String, Object> map) throws Exception { //배송번호찾기
		return (Integer)selectOne("login.findOrderNum", map);
	}
	
	
	public String findPwEmail(Map<String, Object> map) throws Exception { //비번찾기 이메일
		return (String)selectOne("login.findPwEmail", map);
	}

	public void changePW(Map<String,Object> map) throws Exception {//비번변경
		update("login.changePW",map);
	}
}
