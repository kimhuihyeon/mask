package mask.member.shop.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mask.common.CommandMap;
import mask.member.order.service.goodsOrderService;
import mask.member.shop.service.BasketService;

@Controller
public class ShopController {
	
	Logger log=Logger.getLogger(ShopController.class);
	
	@Resource(name="basketService")
	private BasketService basketService;
	
	@Resource(name = "goodsOrderService")
	goodsOrderService goodsOrderService;
	
	@RequestMapping(value="/shop/basket.mk")
	public ModelAndView basketList(CommandMap commandMap, HttpServletRequest request) throws Exception{
		
		
		
		ModelAndView mv = new ModelAndView("/shop/basket/basket");
		
		HttpSession session = request.getSession();
		commandMap.put("MEM_ID", session.getAttribute("session_MEM_ID"));
		commandMap.put("MEM_NUM", ((Map)session.getAttribute("session_MEMBER")).get("MEM_NUM"));
		System.out.println("장바구니 : MEM_NUM   "+ session.getAttribute("session_MEM_NUM"));
		
		
		
		mv.addObject("MEM_NUM",  commandMap.get("MEM_NUM"));
		
		commandMap.getMap().put("chk", null);
		
		List<Map<String,Object>> list = basketService.basketList(commandMap.getMap()); 
		mv.addObject("list", list);
		System.out.println(commandMap.getMap());
		
		
		return mv;
	}
	
	@RequestMapping(value="/shop/basketModify.mk")
	public ModelAndView basketModify(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/shop/basket.mk");
		mv.addObject("MEM_NUM", commandMap.get("MEM_NUM"));
		basketService.basketModify(commandMap.getMap());
		System.out.println(commandMap.getMap());
		return mv;
				
	}
	
	@RequestMapping(value="/shop/basketDelete.mk")
	public ModelAndView basketDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/shop/basket.mk");
		mv.addObject("MEM_NUM", commandMap.get("MEM_NUM"));
		basketService.basketDelete(commandMap.getMap());
		System.out.println(commandMap.getMap());
		return mv;
	}
	
	/*
	@RequestMapping(value="/order/basketOrder.mk")
	public ModelAndView basketOrder(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/shop/basket/goodsOrder");
		HttpSession session = request.getSession();
		commandMap.put("MEM_ID", session.getAttribute("session_MEM_ID"));
		commandMap.put("MEM_NUM", ((Map)session.getAttribute("session_MEMBER")).get("MEM_NUM"));
		System.out.println("MEM_NUM   "+ ((Map)session.getAttribute("session_MEMBER")).get("MEM_NUM"));
		
		mv.addObject("MEM_NUM",  commandMap.get("MEM_NUM"));
		
		List<Map<String, Object>> list = basketService.basketList(commandMap.getMap());
		mv.addObject("list", list);
		System.out.println(commandMap.getMap());
		return mv;
	}
	*/
	
	@RequestMapping(value="/order/basketOrder.mk")
	public ModelAndView basketOrder(CommandMap commandMap) throws Exception {
	
	
		if(!commandMap.isEmpty()) {
			Iterator<Entry<String,Object>> iterator = commandMap.getMap().entrySet().iterator();
			
			Entry<String, Object> entry =null;
			
			while(iterator.hasNext()) {
				entry=iterator.next();
				log.debug("key : "+entry.getKey()+" , "+"value : "+entry.getValue());
			}
		}
		
		
		ModelAndView mv=new ModelAndView("basketGoodsOrder");
		
		List<Map<String, Object>> list=basketService.basketList(commandMap.getMap());
		
		
		mv.addObject("list", list);
		
		System.out.println("list : "+list);
		
		List<Map<String,Object>> list2=goodsOrderService.selectMemberInfo(commandMap.getMap()); //고객정보
		
		list2.get(0).put("MEM_NUM", commandMap.getMap().get("MEM_NUM"));
		
		mv.addObject("map",list2.get(0));
		
		System.out.println("map : "+list2.get(0));
		
		return mv;
	}
	
	
	@RequestMapping("/shop/basket_num_delete.mk")
	
	   @ResponseBody
	   public void basket_num_delete(CommandMap commandMap) {
	      
	      System.out.println(commandMap.getMap().get("GOODS_BASKET_NUM"));
	      
	      basketService.basket_num_delete(commandMap.getMap());
	      
	   }
	   
	   @RequestMapping("/shop/update_goods_amount.mk")
	   
	   @ResponseBody
	   public void update_goods_amount(CommandMap commandMap) {
	      
	      System.out.println(commandMap.getMap().get("GOODS_BASKET_NUM"));
	      System.out.println(commandMap.getMap().get("GOODS_AMOUNT"));
	      System.out.println("TCOST : "+commandMap.getMap().get("TCOST"));	
	      
	      basketService.update_goods_amount(commandMap.getMap());
	   }
	   
	   @RequestMapping("/member/addCart.mk")
	   @ResponseBody
	   public void addCart(CommandMap commandMap,HttpServletRequest request) {
		   
			HttpSession session = request.getSession();
			System.out.println("session_MEM_NUM : "+ session.getAttribute("session_MEM_NUM"));
			commandMap.put("MEM_NUM", session.getAttribute("session_MEM_NUM"));
			
			if(!commandMap.isEmpty()) {
				Iterator<Entry<String,Object>> iterator = commandMap.getMap().entrySet().iterator();
				
				Entry<String, Object> entry =null;
				
				while(iterator.hasNext()) {
					entry=iterator.next();
					log.debug("key : "+entry.getKey()+" , "+"value : "+entry.getValue());
				}
			}
			
			
			basketService.addCart(commandMap.getMap());
		   
	   }
	   

}
