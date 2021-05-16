package mask.member.order.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import mask.common.AbstractDAO;


@Repository("goodsOrderDAO")
public class goodsOrderDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectMemberInfo(Map<String, Object> map) {
		
		
		// TODO Auto-generated method stub
		return (List<Map<String,Object>>) selectList("memberGoodsOrder.selectMemberInfo", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> goodsSelect(Map<String, Object> map) {
		
		return (List<Map<String,Object>>) selectList("memberGoodsOrder.goodsSelect", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> goodsCategorySelect(Map<String,Object> map){
		return (List<Map<String,Object>>) selectList("memberGoodsOrder.goodsCategorySelect",map);
	}

	public void goodsOrderInsert(Map<String, Object> map) {
		insert("memberGoodsOrder.goodsOrderInsert", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectOrderInfo(Map<String, Object> map) {
		
		return (Map<String,Object>) selectOne("memberGoodsOrder.selectOrderInfo", map);
	}

	public void goodsBasketOrderInsert(Map<String, Object> map) {
		update("memberGoodsOrder.goodsBasketOrderInsert",map);
	}

	public void goodsBasketStateUpdate(Map<String, Object> map) {
		update("memberGoodsOrder.goodsBasketStateUpdate",map);
		
	}

	public void insertCart(Map<String, Object> map) {
		insert("memberGoodsOrder.insertCart",map);
	}

	public void insert_admin_order(Map<String, Object> map) {
		insert("memberGoodsOrder.insert_admin_order",map);
		
	}
	
}
