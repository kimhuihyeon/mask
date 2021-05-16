package mask.member.shop.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import mask.common.AbstractDAO;
import mask.common.CommandMap;

@Repository("orderDao")
public class OrderDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> orderMemberInfo(CommandMap commandMap) throws Exception{
		return (Map<String, Object>) selectOne("order.orderMemberInfo", commandMap.getMap());
	}

	
	//주문하기 폼 select
	public void insertOrder(CommandMap commandMap) throws Exception{
		insert("order.insertOrder", commandMap.getMap());
	}
	
	
	//주문하기 완료 insert
		 @SuppressWarnings("unchecked") 
		 public Map<String, Object> selectOrder(CommandMap commandMap) { 
			 return (Map<String, Object>) selectOne("ShopOrder.selectOrder", commandMap.getMap()); 
		 }
}
