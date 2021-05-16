package mask.board.review.Controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mask.board.review.Service.ReviewService;
import mask.common.CommandMap;

@Controller
public class RevivewController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="reviewService")
	ReviewService reviewService;
	
	
	
	@RequestMapping(value="/board/reviewList.mk")
    public ModelAndView reviewList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/board/Review/ReviewCheck");
		
    	return mv;
    }
	
	
	@RequestMapping(value="/board/selectReviewBoardList.mk")
    public ModelAndView selectBoardList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	List<Map<String,Object>> list = reviewService.selectBoardList(commandMap.getMap());
    	mv.addObject("list", list);
    	if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
    	System.out.println("후기게시판 리스트" + list);
    	return mv;
    }
	
	
	@RequestMapping(value="/board/reviewInsert.mk")
	public ModelAndView reviewInsert(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/board/reviewList.mk");
		reviewService.reviewInsert(commandMap.getMap(), request);
		mv.addObject("BOARD_NUM", commandMap.get("BOARD_NUM"));
		mv.addObject("GOODS_NUM", commandMap.get("GOODS_NUM"));
		mv.addObject("MEM_ID", commandMap.get("MEM_ID"));
		
		
		return mv;
	}
	
	
	   @RequestMapping(value = "/board/reviewDelete.mk")
	   public ModelAndView reviewDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
	      
		   ModelAndView mv = new ModelAndView();
		   reviewService.reviewDelete(commandMap.getMap(),request);
		   mv.addObject("BOARD_NUM", commandMap.get("BOARD_NUM"));
		   mv.setViewName("redirect:/board/reviewList.mk");
	      
	      return mv;      
	   }
	   
	   @RequestMapping(value = "/board/reviewUpdate.mk")
	   public ModelAndView reviewUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception {
	      
		   ModelAndView mv = new ModelAndView();
		   reviewService.reviewUpdate(commandMap.getMap(),request);
		   mv.addObject("BOARD_NUM", commandMap.get("BOARD_NUM"));
		   mv.setViewName("redirect:/board/reviewList.mk");
	      
	      return mv;      
	   }
	   
}
