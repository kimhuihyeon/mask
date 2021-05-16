package mask.admin.board.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mask.admin.board.service.AdminBoardService;
import mask.common.CommandMap;
import mask.notice.service.NoticeService;

@Controller
public class AdminBoardController {
	
	 @Resource(name="adminBoardService")
	   private AdminBoardService adminBoardService;
	
	 @RequestMapping(value="/admin/OpenAdminBoardList.mk") 
	   public ModelAndView adminBoardList(CommandMap commandMap)throws Exception{
	      ModelAndView mv = new ModelAndView("/admin/adminBoardList");
	      
			return mv;
	  }
	 
	  @RequestMapping(value="/admin/SelectAdminBoardList.mk")
	  public ModelAndView selectAdminBoardList(CommandMap commandMap) throws Exception{
	  	ModelAndView mv = new ModelAndView("jsonView");
	  	
	  	List<Map<String,Object>> list = adminBoardService.selectAdminBoardList(commandMap.getMap());
	  	mv.addObject("list", list);
	  	if(list.size() > 0){
	  		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
	  	}
	  	else{
	  		mv.addObject("TOTAL", 0);
	  	}
	  	
	  	return mv;
	  }
	  
	  
	  @RequestMapping(value="/admin/admindeleteBoard.mk")
		public ModelAndView deleteBoard(CommandMap commandMap) throws Exception{
			ModelAndView mv = new ModelAndView("redirect:/admin/OpenAdminBoardList.mk");
			adminBoardService.admindeleteBoard(commandMap.getMap());
			return mv;
		}
	  
	  
	  
	  //검색!!
	  
		@RequestMapping(value="/admin/SearchA.mk")
		   public ModelAndView SearchA(CommandMap commandMap)throws Exception{
		      ModelAndView mv = new ModelAndView("/admin/adminBoardList");
		      List<Map<String, Object>> list = adminBoardService.SearchA(commandMap.getMap());
		      mv.addObject("list", list);
		      return mv;  
		   }
	  
		
		@RequestMapping(value="/admin/noticeWrite.mk")
		public ModelAndView openBoardWrite(CommandMap commandMap) throws Exception{
			ModelAndView mv = new ModelAndView("/admin/adminBoardInsert");
			return mv;		
		}
		
		
		
		@RequestMapping(value="/admin/insertNotice.mk")
		public ModelAndView insertBoard(CommandMap commandMap) throws Exception{
			ModelAndView mv = new ModelAndView("redirect:/admin/OpenAdminBoardList.mk"); //commandmap으로 받아서 입력이되면 openBoardList.do로 리다이렉트
			adminBoardService.insertBoard(commandMap.getMap());
			return mv;
		}
	  
	  
		
	

}
