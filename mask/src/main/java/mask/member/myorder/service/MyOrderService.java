package mask.member.myorder.service;

import java.util.List;
import java.util.Map;

public interface MyOrderService {

   List<Map<String, Object>> openMyOrderList(Map<String, Object> map)throws Exception;
 
   
   //주문상세
   Map<String, Object> openMyOrderDetail(Map<String, Object> map)throws Exception;
   
   List<Map<String, Object>> openMyOrderDetailList(Map<String, Object> map)throws Exception;

   //주문상세
   
   
   
   
   void myOrderStatus(Map<String, Object> map)throws Exception;

   void openMyOrderUpdate(Map<String, Object> map)throws Exception;
   

   Map<String, Object> orderMyDeliver(Map<String, Object> map)throws Exception;
 

   void orderMyDeliverUpdate(Map<String, Object> map)throws Exception;


}


