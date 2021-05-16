package mask.admin.Agoods.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mask.admin.Agoods.service.AgoodsService;
import mask.common.CommandMap;


@Controller
public class AgoodsController {
	@Resource(name="agoodsService")
	private AgoodsService agoodsService;
	
	//@Resource(name = "goodsService")
	  // private GoodsService goodsService;
	
	
	//상품 상세보기 추가!!
	@RequestMapping(value="/admin/goodsDetail.mk")
	public ModelAndView aGoodsDetail(CommandMap commandMap) throws Exception{
		
		ModelAndView mv = new ModelAndView("/admin/admingoodsDetail");
		Map<String,Object> map = agoodsService.agoodsDetail(commandMap.getMap());
		mv.addObject("map", map);
		System.out.println(map);
		
		return mv;
	}
	
	
	
	
	@RequestMapping(value="/admin/goodsList.mk")
	public ModelAndView AdminGoodsList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/adminGoods");
		List<Map<String,Object>> list = agoodsService.openAdminGoodsList(commandMap.getMap());
		mv.addObject("list", list);
	
		
		return mv;
	}
	
	
	
	  @RequestMapping(value="/admin/goodsDelete.mk" )
	  public ModelAndView deleteAdminGoods(CommandMap commandMap) throws Exception{
	  ModelAndView mv = new ModelAndView();
      agoodsService.adminGoodsDelete(commandMap.getMap());
      System.out.println(commandMap.getMap());
	  mv.setViewName("redirect:/admin/goodsList.mk");
	  return mv; 
	  }
	 
	  
	  
		@RequestMapping(value = "/admin/goodsUpdateForm.mk")
		public ModelAndView GoodsUpdateForm(CommandMap commandMap, HttpServletRequest request) throws Exception { // 상품 수정폼(관리자)
			ModelAndView mv = new ModelAndView("/admin/adminGoodsUpdate");
			Map<String,Object> map = agoodsService.agoodsDetail(commandMap.getMap());
			mv.addObject("map", map);
			return mv;
		}  
		
		
		@RequestMapping(value = "/admin/goodsUpdate.mk")
		public ModelAndView GoodsUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception { // 상품 수정완료(관리자)
			ModelAndView mv = new ModelAndView("redirect:/admin/goodsList.mk");
		
			System.out.println(commandMap.getMap());
			agoodsService.adminGoodsUpdate(commandMap.getMap(), request);
			mv.addObject("GOODS_NUM", commandMap.get("GOODS_NUM"));
			return mv;
		}		

	
	
		   @RequestMapping(value = "/admin/goodsWrite.mk") // url
		   public ModelAndView goodsWriteForm(CommandMap commandMap) throws Exception { // 상품등록 폼

		      ModelAndView mv = new ModelAndView("/admin/goodsAdminInsert");
		      mv.addObject("type", "write");
		      mv.addObject("title", "상품등록");
		      return mv;

		   }

		   @RequestMapping(value = "/admin/goodsInsert.mk", method = RequestMethod.POST) 
		   public ModelAndView goodsWrite(CommandMap commandMap, HttpServletRequest request) throws Exception { // 상품등록 
			   ModelAndView mv = new ModelAndView("redirect:/admin/goodsWrite.mk");
		      System.out.println(commandMap.getMap());
		      commandMap.put("GOODS_IMAGE", request.getSession().getAttribute("GOODS_IMAGE"));
		      agoodsService.adminGoodsInsert(commandMap.getMap(), request);
	           System.out.println("글쓰기입니다." + commandMap.getMap());
		      return mv;
    
    
		  	
		

	}
	
}
