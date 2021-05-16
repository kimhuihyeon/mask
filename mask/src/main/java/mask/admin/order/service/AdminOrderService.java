package mask.admin.order.service;

import java.util.List;
import java.util.Map;


public interface AdminOrderService {

	List<Map<String, Object>> openAdminOrderList(Map<String,Object> map) ;

	List<Map<String, Object>> searchOrderPay(Map<String, Object> map);

	List<Map<String, Object>> openAdminDelivery();

	void orderStateUpdate(Map<String, Object> map);

	List<Map<String, Object>> openAdminOrderSearch(Map<String, Object> map);

	void deliverUpdate(Map<String,Object> map);

	Map<String, Object> addressUpdate(Map<String, Object> map);

	void deliverAddressUpdate(Map<String, Object> map);

	List<Map<String, Object>> adminSalList();

	List<Map<String, Object>> adminSalListOrderPay(Map<String,Object> map);
	
	
}
