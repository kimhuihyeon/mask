package mask.admin.order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mask.admin.order.service.AdminOrderService;
import mask.common.CommandMap;

@Controller
public class AdminOrderController {

	Logger log = Logger.getLogger(AdminOrderController.class);

	@Resource(name = "adminOrderService")
	AdminOrderService adminOrderService;

	/* ========================= 주문목록 페이지 ========================= */

	@RequestMapping("/admin/orderList.mk")
	public ModelAndView adminOrderList(CommandMap commandMap) {
		
		ModelAndView mv=new ModelAndView("/admin/goodsAdminOrder");
		System.out.println(commandMap.getMap().containsKey("name"));
		
		
		
		if(commandMap.getMap().containsKey("name")) {
			
			String S_name=(String) commandMap.getMap().get("name");
			String S_value=(String) commandMap.getMap().get("value");
			
			System.out.println("name : "+commandMap.getMap().get("name"));
			System.out.println("value : "+commandMap.getMap().get("value"));
			
			if(commandMap.getMap().get("name").equals("ORDER_NUM")) {
				commandMap.getMap().put("name", "A.ORDER_NUM");
			}else if(commandMap.getMap().get("name").equals("MEM_NAME")) {
				commandMap.getMap().put("name", "B.MEM_NAME");
			}else {
				System.out.println("실행");
				commandMap.put("name", "A.MEM_NAME");
				commandMap.put("value","%%");
				S_value=" ";
			}
			
			List<Map<String, Object>> list = adminOrderService.openAdminOrderSearch(commandMap.getMap());
			
			if(!list.isEmpty()) {
				list.get(0).put("name", S_name);
				list.get(0).put("value", S_value);
			}else {
				Map<String,Object> map_s=new HashMap<String, Object>();
				
				map_s.put("name", S_name);
				map_s.put("value", S_value);
				
				list.add(map_s);
				
			}
			System.out.println("list : "+list);
			
			mv.addObject("list", list);
			
		}else {
		
			
		
			String Select_ORDER_PAY=null;
			String Select_AORDER_STATE=null;
		
			/*주문 상태 조회*/
			if(commandMap.getMap().get("Select_ORDER_PAY")==null&&commandMap.getMap().get("Select_AORDER_STATE")!=null) {
				commandMap.put("Select_ORDER_PAY","%%");
				commandMap.put("Select_AORDER_STATE",commandMap.getMap().get("Select_AORDER_STATE"));
				Select_AORDER_STATE=(String) commandMap.getMap().get("Select_AORDER_STATE");
			
				log.debug("Select_ORDER_PAY : "+Select_ORDER_PAY);
				log.debug("Select_AORDER_STATE : "+Select_AORDER_STATE);
			
		
				/*결제 방식 조회*/
				}else if(commandMap.getMap().get("Select_ORDER_PAY")!=null&&commandMap.getMap().get("Select_AORDER_STATE")==null){
		
					Select_ORDER_PAY=(String) commandMap.getMap().get("Select_ORDER_PAY");
					commandMap.put("Select_AORDER_STATE","%%");
			
					log.debug("Select_ORDER_PAY : "+Select_ORDER_PAY);
					log.debug("Select_AORDER_STATE : "+Select_AORDER_STATE);
			
		
				}else {
					commandMap.put("Select_ORDER_PAY","%%");
					commandMap.put("Select_AORDER_STATE", "%%");
				}
		
			List<Map<String, Object>> list = adminOrderService.openAdminOrderList(commandMap.getMap());
		
		//실행 후///
		
		
		
			if(Select_ORDER_PAY != null) {
				if(!list.isEmpty()) {
					list.get(0).put("Select_ORDER_PAY", list.get(0).get("ORDER_PAY"));
					list.get(0).put("Select_AORDER_STATE", "");
				}else {
					Map<String,Object> value=new HashMap<String,Object>();
					value.put("Select_ORDER_PAY", Select_ORDER_PAY);
					value.put("Select_AORDER_STATE", "");
					list.add(value);
				}
			}else if(Select_AORDER_STATE!=null) {
				if(!list.isEmpty()) {
					list.get(0).put("Select_ORDER_PAY", "");
					list.get(0).put("Select_AORDER_STATE", list.get(0).get("AORDER_STATE"));
				}else {
					Map<String,Object> value=new HashMap<String,Object>();
					value.put("Select_ORDER_PAY", "");
					value.put("Select_AORDER_STATE", Select_AORDER_STATE);
					list.add(value);
				}
			}else if(Select_ORDER_PAY==null&&Select_AORDER_STATE==null){
				if(!list.isEmpty()) {
					list.get(0).put("Select_ORDER_PAY", "");
					list.get(0).put("Select_ORDER_PAY", "");
				}else {
					Map<String,Object> value=new HashMap<String,Object>();
					value.put("Select_ORDER_PAY", "");
					value.put("Select_AORDER_STATE", "");
					list.add(value);
				}
			}
		
			System.out.println("List : " +list);
		
			mv.addObject("list", list);
		
		}
		
		return mv;
	}

	@RequestMapping(value = "/admin/orderUpdate.mk", method = RequestMethod.POST)
	@ResponseBody
	public void orderUpdate(CommandMap commandMap) {

		adminOrderService.orderStateUpdate(commandMap.getMap());

		System.out.println(commandMap.getMap().get("AORDER_STATE"));
		System.out.println(commandMap.getMap().get("ORDER_NUM"));

	}


	@RequestMapping("/admin/deliverList.mk")
	public ModelAndView test(CommandMap commandMap) {

		ModelAndView mv = new ModelAndView("/admin/adminDelivery");

		List<Map<String, Object>> list = adminOrderService.openAdminDelivery();

		mv.addObject("list", list);

		return mv;
	}
	
	
	/*배송정보 등록*/
	@RequestMapping(value="/admin/deliverUpdate.mk",method=RequestMethod.POST)
	@ResponseBody
	public void deliverUpdate(CommandMap commandMap) {
		
		adminOrderService.deliverUpdate(commandMap.getMap());
		
		System.out.println(commandMap);
		
	}
	
	/*배송지변경 창*/
	@RequestMapping("/admin/addressUpdate.mk")
	public String addressUpdate(CommandMap commandMap,Model model) {
		
		Map<String,Object> map=adminOrderService.addressUpdate(commandMap.getMap());
		
		model.addAttribute("map", map);
		
		return "/admin/adminDeliveryUpdate";
	}
	
	/*배송지 변경*/
	@RequestMapping(value="/admin/deliverAddressUpdate.mk")
	@ResponseBody
	public void deliverAddressUpdate(CommandMap commandMap) {
		
		adminOrderService.deliverAddressUpdate(commandMap.getMap());
		
	}
	
	
	/*테스트*/
	@RequestMapping("/admin/adminSalList.mk")
	public ModelAndView adminSalList(CommandMap commandMap) {
		
		ModelAndView mv=new ModelAndView("/admin/adminSalList");
		
		List<Map<String,Object>> list=null;
		
		if(commandMap.getMap().containsKey("ORDER_PAY")) {
			
			list = adminOrderService.adminSalListOrderPay(commandMap.getMap());
			
		}else {
		
			list = adminOrderService.adminSalList();
			
			System.out.println(list);
		}
		
		mv.addObject("list", list);
		
		return mv;
	}
}
