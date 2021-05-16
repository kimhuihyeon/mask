package mask.admin.order.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import mask.admin.order.dao.AdminOrderDAO;
import mask.common.CommandMap;

@Service("adminOrderService")
public class AdminOrderServiceImpl implements AdminOrderService{

	Logger log=Logger.getLogger(AdminOrderServiceImpl.class);
	
	@Resource(name="adminOrderDAO")
	AdminOrderDAO adminOrderdao;
	
	@Override
	public List<Map<String, Object>> openAdminOrderList(Map<String,Object> map) {
		
		adminOrderdao.adminOrderList(map);
		
		return adminOrderdao.adminOrderList(map);
	}

	@Override
	public List<Map<String, Object>> searchOrderPay(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Map<String, Object>> openAdminDelivery() {
		return adminOrderdao.adminDeliveryList();
	}

	@Override
	public void orderStateUpdate(Map<String, Object> map) {
		adminOrderdao.adminOrderStateUpdate(map);
	}

	@Override
	public List<Map<String, Object>> openAdminOrderSearch(Map<String, Object> map) {
		return adminOrderdao.openOrderSearch(map);
	}

	@Override
	public void deliverUpdate(Map<String,Object> map) {
		adminOrderdao.deliverUpdate(map);
	}

	@Override
	public Map<String, Object> addressUpdate(Map<String, Object> map) {
		return adminOrderdao.addressUpdate(map);
	}

	@Override
	public void deliverAddressUpdate(Map<String, Object> map) {
		
		adminOrderdao.deliverAddressUpdate(map);
	}

	@Override
	public List<Map<String, Object>> adminSalList() {
		
		return adminOrderdao.adminSalList();
	}

	@Override
	public List<Map<String, Object>> adminSalListOrderPay(Map<String, Object> map) {
		
		return adminOrderdao.adminSalListOrderPay(map);
	}

	
	
	
	
}
