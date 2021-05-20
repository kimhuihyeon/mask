package mask.member.login.controller;

import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mask.common.CommandMap;
import mask.member.login.service.Email;
import mask.member.login.service.EmailSender;
import mask.member.login.service.LoginService;

@Controller
public class LoginController {

   Logger log = Logger.getLogger(this.getClass());

   
   @Resource(name = "loginService")
   private LoginService loginService;

   @RequestMapping(value = "/member/openLoginForm.mk") //세션생성?
   public ModelAndView loginForm(HttpServletRequest request) throws Exception {
      //session
      HttpSession session = request.getSession();
      
      System.out.println("session : " + session.getAttribute("session_MEMBER"));
      
      /*
       * if(session.getAttribute("session_MEMBER")!=null) { ModelAndView mv = new
       * ModelAndView(); mv.setViewName("redirect:/main/openMainList.mk"); return mv;
       * } else {
       */
       
         ModelAndView mv = new ModelAndView("/member/Login");
         return mv;
      }
//   }
   @RequestMapping(value = "/member/login.mk", method = {RequestMethod.GET, RequestMethod.POST})
   public ModelAndView login(CommandMap commandMap, HttpServletRequest request) throws Exception {
      ModelAndView mv = new ModelAndView("/member/LoginCheck");
      String message = "";
      String url = "";

      HttpSession session = request.getSession();

      //아이디 확인문
      Map<String, Object> chk = loginService.selectId(commandMap.getMap());
      if (chk==null) { // 아이디가 있는지 없는지를 확인
    	     mv.setViewName("/member/Login");
	         mv.addObject("message", "해당 아이디가 없습니다.");
	         return mv;
	       
      } else {
         if (chk.get("MEM_PW").equals(commandMap.get("MEM_PW"))) {
            session.setAttribute("session_MEM_ID", commandMap.get("MEM_ID"));
            session.setAttribute("session_MEM_NUM",chk.get("MEM_NUM"));
            session.setAttribute("session_MEMBER", chk);
         } else { // if문을 통해 sql과 정보 일치 확인
          	mv.setViewName("/member/Login");
            mv.addObject("message", "비밀번호를 확인해 주세요.");
            return mv;   
            }
      }
      
      System.out.println("아이디확인"+chk);
      mv.addObject("message",message);
      mv.addObject("url",url);
       
      return mv;
   }
   
   @RequestMapping(value="/member/logout.mk",method = {RequestMethod.POST}) // 로그아웃
    public ModelAndView logout(CommandMap commandMap, HttpServletRequest request, HttpSession httpSession) throws Exception {
          HttpSession session = request.getSession();
          if (session != null)
             session.invalidate();
          ModelAndView mv = new ModelAndView();
          mv.setViewName("redirect:/main/logoutSc.mk");
          return mv;
       }
    @RequestMapping(value="/main/logoutSc.mk")
    public ModelAndView openJoinForm(CommandMap commandMap)throws Exception{
       ModelAndView mv = new ModelAndView("/member/logout");
       
       return mv;
    }
 

   @RequestMapping(value = "/member/findId.mk") // 아이디 찾기 폼을 보여주는 메소드
   public ModelAndView findId(CommandMap commandMap) throws Exception {
      ModelAndView mv = new ModelAndView("/member/findId");
  	  int ran = new Random().nextInt(900000) + 100000;
	
	  mv.addObject("random",ran);
	 
      return mv;
   }
   
   /*	@RequestMapping(value = "/member/openFindIdResult.do", method = {RequestMethod.GET, RequestMethod.POST}, produces = "application/text; charset=utf8")

	public @ResponseBody String findIdResult(CommandMap commandMap) throws Exception {
		String id = String.valueOf(loginService.findId(commandMap.getMap()));
		
		if(id.equals("1")) {
			String findId = (String)(loginService.findIdWithEmail(commandMap.getMap()).get("MEM_ID"));
			System.out.println(findId);
			return findId;
			
		}else {
			return id;
		}
	}
	*/

   //아이디찾기결과
      @RequestMapping(value = "/member/openFindIdResult.mk", method = {RequestMethod.GET , RequestMethod.POST}, produces = "application/text; charset=utf8")
      public @ResponseBody
        String findIdResult(CommandMap commandMap) throws Exception {
    	    String id = String.valueOf(loginService.findId(commandMap.getMap()));       
    	    if(id.equals("1")) {
    			String findId = (String)(loginService.findIdWithEmail(commandMap.getMap()).get("MEM_ID"));
    			System.out.println(findId);
    			return findId;    			
    		}else {
    			return id;
    		}
      }
   
   
    @RequestMapping("/member/findPw.mk")
    public ModelAndView findPw (@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
       ModelAndView  mv = new ModelAndView("/member/findPw");
       model.addAttribute("msg",0);
       return mv;
    }
   

   
   @RequestMapping(value = "/member/findOrderNum.mk") // 배송번호찾기폼
   public ModelAndView findOrderNum(CommandMap commandMap) throws Exception {
      ModelAndView mv = new ModelAndView("/member/findOrderNum");
      
      return mv;
   }
   
   //배송번호찾기결과
   @RequestMapping(value = "/member/openFindOrderNumResult.mk", method = {RequestMethod.POST},produces="application/json")
   @ResponseBody
   public  int findOrderNumResult(CommandMap paramMap) throws Exception {

      int orderNum = loginService.findOrderNum(paramMap.getMap());
         System.out.println("배송번호찾기:   "+orderNum);
         
         return orderNum;
   }
   
   
   
   
   @Autowired
      private EmailSender emailSender;
      @Autowired
      private Email email;
       @RequestMapping("/member/openFindPwResult.mk")
       public ModelAndView sendEmailAction (@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
           ModelAndView mav;
           String id=(String) paramMap.get("MEM_ID");
           String e_mail=(String) paramMap.get("MEM_EMAIL");
           String pw= loginService.findPwEmail(paramMap);
           System.out.println(pw);
           
           if(pw !=null) {
               email.setContent("비밀번호는 "+pw+" 입니다.");
               email.setReceiver(e_mail);
               email.setSubject(id+"님 비밀번호 찾기 메일입니다.");
               emailSender.SendEmail(email);
               mav= new ModelAndView("redirect:/member/findId.mk");
               return mav;
           }else {
               mav=new ModelAndView("redirect:/member/findId.mk");
               return mav;
           }
       }
      // 찾기 부분 유효성검사

      @RequestMapping(value = "/board.mk") 
      public ModelAndView board(CommandMap commandMap) throws Exception {
         ModelAndView mv = new ModelAndView("/ckboard");
         
         return mv;
      }
}