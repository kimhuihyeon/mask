package mask.member.order.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import mask.member.order.dao.goodsOrderDAO;

@Service("goodsOrderService")
public class goodsOrderServiceImpl implements goodsOrderService{
	
	@Resource(name="goodsOrderDAO")
	goodsOrderDAO goodsOrderDAO;
	
	
	@Override
	public List<Map<String, Object>> selectMemberInfo(Map<String, Object> map) {
		
		return (List<Map<String,Object>>) goodsOrderDAO.selectMemberInfo(map);
	}


	@Override
	public List<Map<String, Object>> goodsSelect(Map<String, Object> map) {
		
		return (List<Map<String,Object>>) goodsOrderDAO.goodsSelect(map);
	}


	@Override
	public List<Map<String, Object>> goodsCategorySelect(Map<String, Object> map) {
	
		return (List<Map<String,Object>>) goodsOrderDAO.goodsCategorySelect(map);
	}


	@Override
	public void goodsOrderInsert(Map<String, Object> map) {
		goodsOrderDAO.goodsOrderInsert(map);
	}


	@Override
	public Map<String, Object> selectOrderInfo(Map<String, Object> map) {
		
		return goodsOrderDAO.selectOrderInfo(map);
	}


	@Override
	public void goodsBasketOrderInsert(Map<String, Object> map) {
		
		goodsOrderDAO.goodsBasketOrderInsert(map);
		
	}


	@Override
	public void goodsBasketStateUpdate(Map<String, Object> map) {
		goodsOrderDAO.goodsBasketStateUpdate(map);
		
	}


	@Override
	public void insertCart(Map<String, Object> map) {
		
		goodsOrderDAO.insertCart(map);
	}


	@Override
	public void insert_admin_order(Map<String, Object> map) {
		goodsOrderDAO.insert_admin_order(map);
	}

}
