package mask.main.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mask.common.CommandMap;
import mask.main.service.MainService;
import mask.member.shop.controller.ShopController;

import org.apache.log4j.Logger;

@Controller
public class MainController {
	Logger log=Logger.getLogger(ShopController.class);
	
	@Resource(name="mainService")
	MainService mainService;
	
	@RequestMapping(value="/main/openMainList.mk")
	public ModelAndView openMainList(CommandMap commandMap, HttpServletRequest req) throws Exception{
		ModelAndView mv = new ModelAndView("/main");
		
		
		HttpSession session = req.getSession();
	    commandMap.put("MEM_ID", session.getAttribute("session_MEM_ID"));
	    commandMap.put("MEM_NUM", session.getAttribute("session_MEM_NUM"));
		
		System.out.println(commandMap.getMap().get("GOODS_NAME"));
		
		List<Map<String,Object>> list = mainService.goodsSelectA(commandMap.getMap());
		List<Map<String,Object>> list2 = mainService.goodsCategorySelectA(commandMap.getMap());
		System.out.println(list);
		mv.addObject("list", list);
		System.out.println(list2);
		mv.addObject("list2", list2);
		
		
		List<Map<String,Object>> list3 = mainService.goodsSelectB(commandMap.getMap());
		List<Map<String,Object>> list4 = mainService.goodsCategorySelectB(commandMap.getMap());
		System.out.println(list3);
		mv.addObject("list3", list3);
		System.out.println(list2);
		mv.addObject("list4", list4);
		
		
		List<Map<String,Object>> list5 = mainService.goodsSelectC(commandMap.getMap());
		List<Map<String,Object>> list6 = mainService.goodsCategorySelectC(commandMap.getMap());
		System.out.println(list5);
		mv.addObject("list5", list5);
		System.out.println(list6);
		mv.addObject("list6", list6);
		
		System.out.println("list6 : "+ list6);
		
		List<Map<String,Object>> list7 = mainService.goodsSelectD(commandMap.getMap());
		List<Map<String,Object>> list8 = mainService.goodsCategorySelectD(commandMap.getMap());
		System.out.println(list3);
		mv.addObject("list7", list7);
		System.out.println(list2);
		mv.addObject("list8", list8);
		
		System.out.println(list7);
		
		return mv;
		
		}
	
	
	@RequestMapping("/shop/mainaddCart.mk")
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
	
			mainService.mainaddCart(commandMap.getMap());
		   
	   }
	

}
