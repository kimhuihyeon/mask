package mask.admin.member.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mask.admin.member.service.AdminMemberService;
import mask.common.CommandMap;

@Controller
public class AdminMemberController {
	@Resource(name="adminMemberService")
	private AdminMemberService adminMemberService;
	
	@RequestMapping(value="/admin/memberList.mk")
	public ModelAndView AdminGoodsList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/adminMember");	
		return mv;
	}

	
	 @RequestMapping(value="/admin/selectMemberList.mk")
	   public ModelAndView selectMemberList(CommandMap commandMap)throws Exception{
	      ModelAndView mv = new ModelAndView("jsonView");
	      
	      List<Map<String, Object>> list = adminMemberService.selectMemberList(commandMap.getMap());
	      mv.addObject("list", list);
	      if(list.size()>0) {
	         mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
	      }
	      else {
	         mv.addObject("TOTAL", 0);
	      }
	      return mv;
	   }
	 
	 //페이징 처리!!
	 
	 
	 
	 @RequestMapping(value="/admin/memberDelete.mk")
		public ModelAndView deletemem(CommandMap commandMap) throws Exception{
			ModelAndView mv = new ModelAndView("redirect:/admin/memberList.mk");
		//	mv.addObject("MEM_NUM", commandMap.get("MEM_NUM"));
			adminMemberService.admindeletemem(commandMap.getMap());
						
			return mv;
	 }
	 
	 

	

}
