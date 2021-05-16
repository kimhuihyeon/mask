package mask.member.mypage.service;

import java.util.List;
import java.util.Map;

public interface MyPageService {
	
	Map<String, Object> selectMyInfo(Map<String, Object> map)throws Exception;
	
	Map<String, Object> selectMyInfoSta(Map<String, Object> map)throws Exception;
	
	void updateMyInfo(Map<String, Object> map) throws Exception;
	
	void deleteMyInfo(Map<String, Object> map)throws Exception;

}
