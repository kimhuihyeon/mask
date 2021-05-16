package mask.member.order.service;

import java.util.List;
import java.util.Map;

public interface goodsOrderService {

	List<Map<String,Object>> selectMemberInfo(Map<String,Object> map);
	
	List<Map<String,Object>> goodsSelect(Map<String,Object> map);
	
	List<Map<String,Object>> goodsCategorySelect(Map<String,Object> map);
	
	void goodsOrderInsert(Map<String,Object> map);
	
	Map<String,Object> selectOrderInfo(Map<String,Object> map);

	void goodsBasketOrderInsert(Map<String, Object> map);
	
	void goodsBasketStateUpdate(Map<String,Object> map);
	
	void insertCart(Map<String,Object> map);
	
	void insert_admin_order(Map<String,Object> map);
}
