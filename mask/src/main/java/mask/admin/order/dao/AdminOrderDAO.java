package mask.admin.order.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import mask.common.AbstractDAO;


@Repository("adminOrderDAO")
public class AdminOrderDAO extends AbstractDAO{

	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> adminOrderList(Map<String,Object> map){
		System.out.println("★★ Select_ORDER_PAY : "+map.get("Select_ORDER_PAY"));
		return (List<Map<String,Object>>) selectList("adminOrder.selectOrderList",map);
		
	}

	public void searchOrderPay() {
		
		
		
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminDeliveryList() {
		return (List<Map<String,Object>>) selectList("adminOrder.selectDeliveryList");
	}

	public void adminOrderStateUpdate(Map<String, Object> map) {
		update("adminOrder.OrderStateUpdate", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> openOrderSearch(Map<String, Object> map) {
		
		return (List<Map<String,Object>>) selectList("adminOrder.OrderSearchList", map);
		
	}

	public void deliverUpdate(Map<String, Object> map) {
		
		update("adminOrder.deliverUpdate", map);
		
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> addressUpdate(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("adminOrder.addressUpdateSelect", map);
	}

	public void deliverAddressUpdate(Map<String, Object> map) {
		
		update("adminOrder.deliverAddressUpdate", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminSalList() {
		return selectList("adminOrder.adminSalList");
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminSalListOrderPay(Map<String, Object> map) {
		
		return selectList("adminOrder.adminSalListOrderPay",map);
	}

	
	
}
