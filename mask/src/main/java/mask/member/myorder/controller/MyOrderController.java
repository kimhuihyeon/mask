package mask.member.myorder.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mask.common.CommandMap;
import mask.member.myorder.service.MyOrderService;


@Controller
public class MyOrderController {
   
   @Resource(name="myOrderService")
   private MyOrderService myOrderService;
   
   @RequestMapping(value="/member/MyOrderList.mk") 
   public ModelAndView openMyOrderList(CommandMap commandMap, HttpServletRequest request)throws Exception{
  	  ModelAndView mv = new ModelAndView("/member/orderList");
      List<Map<String, Object>> list = myOrderService.openMyOrderList(commandMap.getMap());
      HttpSession session = request.getSession();
      commandMap.put("MEM_ID", session.getAttribute("session_MEM_ID"));
      commandMap.put("MEM_NUM", session.getAttribute("session_MEM_NUM"));
      mv.addObject("MEM_NUM",  commandMap.get("MEM_NUM"));
      mv.addObject("ORDER_NUM",  commandMap.get("ORDER_NUM"));
      mv.addObject("list", list);
      System.out.println(commandMap.getMap());
		return mv;
  }
   
   
   @RequestMapping(value="/member/openMyOrderDetail.mk")
   public ModelAndView openMyOrderDetail(CommandMap commandMap)throws Exception{
      ModelAndView mv = new ModelAndView("/member/myOrderDetail");
      List<Map<String, Object>> list = myOrderService.openMyOrderDetailList(commandMap.getMap());
      mv.addObject("list", list);
      Map<String, Object> map = myOrderService.openMyOrderDetail(commandMap.getMap());
      mv.addObject("map", map);
      mv.addObject("ORDER_NUM", commandMap.get("ORDER_NUM"));
      mv.addObject("MEM_NUM", commandMap.get("MEM_NUM"));
      
      return mv;
   }


   @RequestMapping(value="/member/MyOrderUpdate.mk")
   public ModelAndView openMyOrderUpdate(CommandMap commandMap) throws Exception{
	      ModelAndView mv = new ModelAndView("redirect:/member/MyOrderList.mk");
	      myOrderService.openMyOrderUpdate(commandMap.getMap());
	      mv.addObject("ORDER_NUM", commandMap.get("ORDER_NUM"));
	      mv.addObject("MEM_NUM", commandMap.get("MEM_NUM"));
	      return mv;
	      
	   }
   
   @RequestMapping(value="/member/myOrderStatus.mk")
   public ModelAndView myOrderStatus(CommandMap commandMap) throws Exception{
      ModelAndView mv = new ModelAndView("redirect:/member/MyOrderList.mk");
      myOrderService.myOrderStatus(commandMap.getMap());
      mv.addObject("ORDER_NUM", commandMap.get("ORDER_NUM"));
      mv.addObject("MEM_NUM", commandMap.get("MEM_NUM"));
      return mv;
   }

   @RequestMapping(value="/member/orderMyDeliver.mk")
   public ModelAndView orderMyDeliver(CommandMap commandMap, 
		   HttpServletRequest request)throws Exception{
      ModelAndView mv = new ModelAndView("/member/orderChange");
     // HttpSession session = request.getSession();
      Map<String, Object> map = myOrderService.orderMyDeliver(commandMap.getMap());
    /*  mv.addObject("MEM_NUM",  commandMap.get("MEM_NUM"));
      commandMap.put("MEM_ID", session.getAttribute("session_MEM_ID"));
      commandMap.put("MEM_NUM", session.getAttribute("session_MEM_NUM"));
      mv.addObject("ORDER_NUM", commandMap.get("ORDER_NUM"));*/
      mv.addObject("map", map);
      return mv;
   }
   
   

  
   @RequestMapping(value="/member/orderMyDeliverUpdate.mk")
   public ModelAndView orderMyDeliverUpdate(CommandMap commandMap) throws Exception{
      ModelAndView mv = new ModelAndView("redirect:/member/orderMyDeliver.mk");
      myOrderService.orderMyDeliverUpdate(commandMap.getMap());
      mv.addObject("ORDER_NUM", commandMap.get("ORDER_NUM"));
      return mv;
      
   }

   
 }