   package mask.member.myorder.service;
   
   import java.util.List;
   import java.util.Map;
   
   import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
   
   import mask.member.myorder.dao.MyOrderDAO;
   
   @Service("myOrderService")
   public class MyOrderServiceImpl implements MyOrderService {
	   
	   
      @Resource(name="myOrderDAO")
      private MyOrderDAO myOrderDAO;
      
      //주문상세
      public Map<String, Object> openMyOrderDetail(Map<String, Object> map)throws Exception{
          return myOrderDAO.openMyOrderDetail(map);
       }
       
       public List<Map<String, Object>> openMyOrderDetailList(Map<String, Object> map)throws Exception{
          return myOrderDAO.openMyOrderDetailList(map);
       }
      //주문상세
      
      @Override
      public List<Map<String, Object>> openMyOrderList(Map<String, Object> map)throws Exception{
         return myOrderDAO.openMyOrderList(map);
      }
      
    @Override
    public void myOrderStatus(Map<String, Object> map)throws Exception {
    	myOrderDAO.myOrderStatus(map);
           }
    
    
       
      @Override
      public void openMyOrderUpdate(Map<String, Object> map)throws Exception{
          myOrderDAO.openMyOrderUpdate(map);
       }
      
      @Override
      public Map<String, Object> orderMyDeliver(Map<String, Object> map)throws Exception {
          return myOrderDAO.orderMyDeliver(map);
           }
      
      @Override
       public void orderMyDeliverUpdate(Map<String, Object> map)throws Exception{
          myOrderDAO.orderMyDeliverUpdate(map);
       }
   }