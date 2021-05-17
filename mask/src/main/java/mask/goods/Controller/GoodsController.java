package mask.goods.Controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mask.common.CommandMap;
import mask.goods.Service.GoodsService;

@Controller
public class GoodsController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="goodsService")
	GoodsService goodsService;
	
	@RequestMapping(value="/goods/goodsDetail.mk")
	public ModelAndView goodsDetail(CommandMap commandMap, HttpServletRequest request)throws Exception{
//		ModelAndView mv = new ModelAndView("/goodsDetail");
//		Map<String, Object> list= goodsService.goodDetailList(commandMap.getMap(),req);
//		mv.addObject("list",list);
//		System.out.println("goodsDetail list값 == "+list);
//		System.out.println("sessionID=="+ req.getAttributeNames() );
//		return mv;
//http://localhost:8083/mask/goods/goodsDetail.mk?GOODS_NUM=161
		
		HttpSession session = request.getSession();
		System.out.println("session_MEM_NUM : "+ session.getAttribute("session_MEM_NUM"));
		
		ModelAndView mv=new ModelAndView("goodsDetail");
		
		System.out.println(commandMap.getMap().get("GOODS_NAME"));
		
		List<Map<String,Object>> list1=goodsService.goodsSelect(commandMap.getMap());
		
		
		
		list1.get(0).put("MEM_NUM", session.getAttribute("session_MEM_NUM"));
		
		System.out.println(list1.get(0));
		
		mv.addObject("goodsInfo", list1.get(0));
		
		List<Map<String,Object>> list2=goodsService.goodsCategorySelect(commandMap.getMap());
		
		System.out.println(list2);
		
		mv.addObject("list2", list2);
		
		return mv;
		
	}
	
	
}
