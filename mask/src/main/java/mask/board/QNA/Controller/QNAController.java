package mask.board.QNA.Controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mask.board.QNA.Service.QNAService;
import mask.common.CommandMap;

@Controller
public class QNAController {
	
	@Resource(name="QNAService")
	QNAService QNAservice;
	
	@RequestMapping(value="/board/QNAopenBoardList.mk") 
	   public ModelAndView QNAopenBoardList(CommandMap commandMap)throws Exception{
	      ModelAndView mv = new ModelAndView("/board/QNA/QNAList");
	      List<Map<String,Object>> list = QNAservice.openQNAList(commandMap.getMap());
		  	mv.addObject("list", list);
	      
			return mv;
	  }
	 
	  
	  @RequestMapping(value="/board/QNAselectBoardList.mk")
	  public ModelAndView QNAselectBoardList(CommandMap commandMap) throws Exception{
	  	ModelAndView mv = new ModelAndView("jsonView");
	  	
	  	List<Map<String,Object>> list = QNAservice.openQNAList(commandMap.getMap());
	  	mv.addObject("list", list);
	  	if(list.size() > 0){
	  		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
	  	}
	  	else{
	  		mv.addObject("TOTAL", 0);
	  	}
	  	
	  	return mv;
	  }
	  
	  
	
	
	@RequestMapping(value="/board/QNAInsert.mk")
	public ModelAndView QNAInsert(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/board/QNAopenBoardList.mk");
		QNAservice.QNAInsert(commandMap.getMap(), request);
		mv.addObject("BOARD_NUM", commandMap.get("BOARD_NUM"));
		mv.addObject("GOODS_NUM", commandMap.get("GOODS_NUM"));
		mv.addObject("MEM_ID", commandMap.get("MEM_ID"));
		
		System.out.println("QNA INSERT" + commandMap.getMap());
		
		return mv;
	}
	
	
	@RequestMapping(value="/board/QNAReplyList.mk") 
	   public ModelAndView QNAReplyList(CommandMap commandMap)throws Exception{
	      ModelAndView mv = new ModelAndView("/board/QNA/QNAReply");
	      mv.addObject("BOARD_NUM", commandMap.get("BOARD_NUM"));
	      
	      List<Map<String,Object>> list = QNAservice.QNAReply(commandMap.getMap());
		  	mv.addObject("list", list);
		  	System.out.println("QNA REPLY" + list);
			return mv;
	  }
	
	@RequestMapping(value="/board/QNAReplyInsert.mk")
	public ModelAndView QNAReplyInsert(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/board/QNAopenBoardList.mk");
		System.out.println("QNA QNAINSERT" + commandMap.getMap());
		
		QNAservice.QNAReplyInsert(commandMap.getMap(), request);
		mv.addObject("BOARD_COUNT", commandMap.get("BOARD_COUNT"));
		mv.addObject("GOODS_NUM", commandMap.get("GOODS_NUM"));
		mv.addObject("MEM_ID", commandMap.get("MEM_ID"));
		
		return mv;
	}
	
	
	
	
	   @RequestMapping(value = "/board/QNADelete.mk")
	   public ModelAndView QNADelete(CommandMap commandMap) throws Exception {
	      ModelAndView mv = new ModelAndView("redirect:/board/QNAopenBoardList.mk");
	      mv.addObject("BOARD_NUM", commandMap.get("BOARD_NUM"));
	      QNAservice.QNADelete(commandMap.getMap());
	      
	      return mv;      
	   }
}