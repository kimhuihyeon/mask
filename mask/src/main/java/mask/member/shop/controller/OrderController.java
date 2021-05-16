package mask.member.shop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import mask.common.CommandMap;
import mask.member.shop.service.OrderService;

@Controller
public class OrderController {

	@Resource(name="orderService")
	private OrderService orderService;

	@RequestMapping(value = "/shop/goodsOrder.mk", method = RequestMethod.GET)
	   public ModelAndView goodsOrder(CommandMap commandMap, HttpServletRequest request) throws Exception { // 상품디테일에서 구매 
	      ModelAndView mv = new ModelAndView("/goodsOrder");
	      Object MEM_NUM = ""; //세션값 가져오기 
	      HttpSession session = request.getSession(); 
	      commandMap.put("MEM_NUM", ((Map)session.getAttribute("session_MEMBER")).get("MEM_NUM"));
	      return mv;
	   }
	
	
	@RequestMapping(value="/order/orderPay.mk")
	public ModelAndView orderPay(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("member/orderCom");
		System.out.println("들어옴");
	    //Object MEM_NUM = ""; //세션값 가져오기 
		HttpSession session = request.getSession(); 
		commandMap.put("MEM_NUM", ((Map)session.getAttribute("session_MEMBER")).get("MEM_NUM"));
		Map<String,Object> map = orderService.selectOrder(commandMap, request);
		
		mv.addObject("map", map);
		return mv;
		}

	
	
	
	
}
