package mask.member.order.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import mask.admin.order.controller.AdminOrderController;
import mask.common.CommandMap;
import mask.member.order.service.goodsOrderService;


@Controller
public class goodsOrderController {
	
	Logger log = Logger.getLogger(AdminOrderController.class);

	@Resource(name = "goodsOrderService")
	goodsOrderService goodsOrderService;
	
	@RequestMapping("/member/goodsOrder.mk")
	public ModelAndView goodsOrderForm(CommandMap commandMap) {
		
		
		
		
		ModelAndView mv=new ModelAndView("goodsOrder2");
		
		List<Map<String,Object>> list=goodsOrderService.selectMemberInfo(commandMap.getMap());
		
		
		
		Map<String,Object> map2=new HashMap<String,Object>();
		
		map2.put("GOODS_NAME", commandMap.get("GOODS_NAME"));
		map2.put("GOODS_CATEGORY", commandMap.get("GOODS_CATEGORY"));
		map2.put("GOODS_AMOUNT", commandMap.get("GOODS_AMOUNT"));
		map2.put("GOODS_PRICE",commandMap.get("GOODS_PRICE"));
		map2.put("ORDER_TCOST",commandMap.get("ORDER_TCOST"));
		map2.put("MEM_NUM", commandMap.get("MEM_NUM"));
		map2.put("GOODS_NUM", commandMap.get("GOODS_NUM"));
		
		mv.addObject("map", list.get(0));
		mv.addObject("map2",map2);
		mv.addObject("A", null);
		
		if(commandMap.getMap().containsKey("A")) {
			mv.addObject("A", "A");
		}
		
		System.out.println(list);
		return mv;
	}
	
	@RequestMapping("/member/memberInfo.mk")
	public List<Map<String,Object>> memberInfo(CommandMap commandMap) {
		
		
		List<Map<String,Object>> list=goodsOrderService.selectMemberInfo(commandMap.getMap());
		
		System.out.println(list);
	
		return list;
	}
	
	@RequestMapping("/goodsTest.mk")
	public ModelAndView goodsTest(CommandMap commandMap) {
		
		ModelAndView mv=new ModelAndView("goodsDetail");
		
		List<Map<String,Object>> list1=goodsOrderService.goodsSelect(commandMap.getMap());
		
		System.out.println(list1.get(1));
		mv.addObject("goodsInfo", list1.get(1));
		
		List<Map<String,Object>> list2=goodsOrderService.goodsCategorySelect(commandMap.getMap());
		
		System.out.println(list2);
		
		mv.addObject("list2", list2);
		
		return mv;
	}
	
	@RequestMapping(value="/goodsOrderInsert.mk",method=RequestMethod.POST)
	public ModelAndView goodsOrderInsert(CommandMap commandMap) {
		
		ModelAndView mv=new ModelAndView("/member/orderCom");
		
		if(!commandMap.isEmpty()) {
			Iterator<Entry<String,Object>> iterator = commandMap.getMap().entrySet().iterator();
			
			Entry<String, Object> entry =null;
			
			while(iterator.hasNext()) {
				entry=iterator.next();
				log.debug("key : "+entry.getKey()+" , "+"value : "+entry.getValue());
			}
		}
		
		goodsOrderService.goodsOrderInsert(commandMap.getMap());
		
		if(commandMap.getMap().containsKey("Basket")){
			goodsOrderService.goodsBasketOrderInsert(commandMap.getMap());
			goodsOrderService.goodsBasketStateUpdate(commandMap.getMap());
		}
		
		List<Map<String,Object>> list=goodsOrderService.selectMemberInfo(commandMap.getMap());
		
		Map<String,Object> map=list.get(0);
		
		System.out.println(map);
		mv.addObject("map", map);
		
		Map<String,Object> map2=goodsOrderService.selectOrderInfo(commandMap.getMap());
		
		if(commandMap.getMap().containsKey("A")) {
			System.out.println("있음");
			goodsOrderService.insertCart(commandMap.getMap());
		}
		
		goodsOrderService.insert_admin_order(commandMap.getMap());
		
		System.out.println(map2);
		
		mv.addObject("map2",map2);
		
		return mv;
	}
}
	