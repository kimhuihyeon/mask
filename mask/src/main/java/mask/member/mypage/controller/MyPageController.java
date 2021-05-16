package mask.member.mypage.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mask.common.CommandMap;
import mask.member.mypage.service.MyPageService;

@Controller
public class MyPageController {
	
	@Resource(name="myPageService")
	private MyPageService myPageService;
	
	@RequestMapping(value="/member/selectMyInfo.mk")
	public ModelAndView selectMyInfo(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/member/myPage/myPage");
		HttpSession session = request.getSession();
		commandMap.put("MEM_ID", session.getAttribute("session_MEM_ID"));
	    commandMap.put("MEM_NUM", ((Map)session.getAttribute("session_MEMBER")).get("MEM_NUM"));
	     Map<String, Object> map =myPageService.selectMyInfo(commandMap.getMap());
		Map<String, Object> map1 = myPageService.selectMyInfoSta(commandMap.getMap());
		mv.addObject("map", map);
		mv.addObject("map1", map1);
		
		return mv;
	}
	
	@RequestMapping(value="/member/updateMyInfoForm.mk")
	public ModelAndView updateMyInfoForm(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/member/myPage/myPageUpdate");
		HttpSession session = request.getSession();
		commandMap.put("MEM_ID", session.getAttribute("ssession_MEM_ID"));
		commandMap.put("MEM_NUM", ((Map)session.getAttribute("session_MEMBER")).get("MEM_NUM"));
		Map<String, Object> map = myPageService.selectMyInfo(commandMap.getMap());
		mv.addObject("map", map);
		 
		return mv;
	}
	
	@RequestMapping(value="/member/updateMyInfo.mk")
	public ModelAndView updateMyInfo(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/member/selectMyInfo.mk");
		HttpSession session = request.getSession();
		commandMap.put("MEM_NUM", ((Map)session.getAttribute("session_MEMBER")).get("MEM_NUM"));
		myPageService.updateMyInfo(commandMap.getMap());
		
		return mv;
	}
	
	@RequestMapping(value="/member/deleteMyInfo.mk")
	public ModelAndView deleteMyInfo(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/member/openLoginForm.mk");
		HttpSession session = request.getSession();
		commandMap.put("MEM_NUM", ((Map)session.getAttribute("session_MEMBER")).get("MEM_NUM"));
		myPageService.deleteMyInfo(commandMap.getMap());
		session.invalidate();
		
		return mv;
	}
	

}
