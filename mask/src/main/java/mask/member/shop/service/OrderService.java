package mask.member.shop.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import mask.common.CommandMap;

public interface OrderService {

	//주문하기 폼 select
	
Map<String, Object> orderMemberInfo(CommandMap commandMap, HttpServletRequest request) throws Exception;
	
	void insertOrder(CommandMap commandMap, HttpServletRequest request) throws Exception;

	Map<String, Object> selectOrder(CommandMap commandMap, HttpServletRequest request) throws Exception;

	
		//주문하기 완료 insert

	
	
}
