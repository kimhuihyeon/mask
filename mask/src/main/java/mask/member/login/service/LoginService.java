package mask.member.login.service;

import java.util.Map;

public interface LoginService {

	public Map<String, Object>selectId(Map<String, Object> map) throws Exception;//로그인
	
	public int findId(Map<String, Object> map) throws Exception;//아이디찾기
	
		
	public int findOrderNum(Map<String, Object> map) throws Exception ; //배송번호찾기
	
	
	
	public String findPwEmail(Map<String, Object> map) throws Exception ; //비번찾기 이메일


	public void changePW(Map<String,Object> map) throws Exception ;//비번변경

	public Map<String, Object> findIdWithEmail(Map<String, Object> map) throws Exception;
	
	
}
