package mask.member.join.controller;


import java.util.Iterator;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mask.common.CommandMap;
import mask.member.join.service.JoinService;

@Controller
public class JoinController {
	
	Logger log=Logger.getLogger(JoinController.class); 
	
	@Resource(name="joinService")
	JoinService joinService;
	
	@RequestMapping("/member/openJoinForm.mk")
	public String openJoinForm(CommandMap commandMap) {
		return "/member/join";
	}
	
	
	@RequestMapping(value="/member/idCheck.mk" , method=RequestMethod.POST)
	@ResponseBody
	public String idCheck(CommandMap commandMap) throws Exception {
		
		
		if(joinService.IdCheck(commandMap.getMap())!=null) {
			return (String) commandMap.getMap().get("MEM_ID");
		}
		
		return null;
	}
	
	@RequestMapping(value="/member/insertJoin.mk", method=RequestMethod.POST)
	public String insertJoin(CommandMap commandMap) throws Exception {
		
	
		
		if(!commandMap.isEmpty()) {
			Iterator<Entry<String, Object>> iterator=commandMap.getMap().entrySet().iterator();
			
			Entry<String,Object> entry=null;
			
			while(iterator.hasNext()) {
				entry=iterator.next();
				log.debug("key : "+entry.getKey()+" , "+"value : "+entry.getValue());
			}
		}
		
		
		joinService.insertJoin(commandMap.getMap());
		
		return "/member/join";
	}
	
	
}
