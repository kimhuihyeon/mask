package mask.member.myorder.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import mask.common.AbstractDAO;

@Repository("myOrderDAO")
public class MyOrderDAO extends AbstractDAO{
   
	

   @SuppressWarnings("unchecked")
   public List<Map<String, Object>> openMyOrderList(Map<String, Object> map)throws Exception{
      return (List<Map<String, Object>>) selectList("myOrder.openMyOrderList", map);
   }
   
   //주문상세
   @SuppressWarnings("unchecked")
   public List<Map<String, Object>> openMyOrderDetailList(Map<String, Object> map)throws Exception{
      return (List<Map<String, Object>>)openBoardListt("myOrder.openMyOrderDetail", map);
   }
   
   @SuppressWarnings("unchecked")
   public Map<String, Object> openMyOrderDetail(Map<String, Object> map)throws Exception{
      return (Map<String, Object>) selectOne("myOrder.openMyOrderMap", map);
   }
 
  //주문상세

   public void openMyOrderUpdate(Map<String, Object> map)throws Exception{
      update("myOrder.openMyOrderUpdate", map);
   }
   
   public void  myOrderStatus(Map<String, Object> map)throws Exception{
	      update("myOrder.myOrderStatus", map);
	   }
   
 

 @SuppressWarnings("unchecked")
   public Map<String, Object> orderMyDeliver(Map<String, Object> map)throws Exception{
      return (Map<String, Object>) selectOne("myOrder.orderMyDeliver", map);
   }
   
 
     public void  orderMyDeliverUpdate(Map<String, Object> map)throws Exception{
	      update("myOrder.orderMyDeliverUpdate", map);
	   }
   

}