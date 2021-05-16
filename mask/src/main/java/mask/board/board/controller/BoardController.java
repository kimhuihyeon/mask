package mask.board.board.controller;



import java.util.List;
import mask.board.comment.service.CommentService;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import mask.common.CommandMap;
import mask.board.board.service.BoardService;

@Controller
public class BoardController {
	
	 @Resource(name="boardService")
	   private BoardService boardService;
	 
	 @Resource(name="commentService")
	   private CommentService commentService;
	 
	/*
	  @RequestMapping(value="/board/openBoardList.mk") 
	   public ModelAndView openMyOrderList(CommandMap commandMap)throws Exception{
	      ModelAndView mv = new ModelAndView("/member/board/noticeList");
	      List<Map<String, Object>> list = boardService.selectBoardList(commandMap.getMap());
	      mv.addObject("list", list);
	      System.out.println(commandMap.getMap());
			return mv;
	  }*/
	 
	 
	 @RequestMapping(value="/board/openBoardList.mk") 
	   public ModelAndView openBoardList(CommandMap commandMap , HttpServletRequest request)throws Exception{
			HttpSession session = request.getSession();
			commandMap.put("MEM_ID", session.getAttribute("session_MEM_ID"));
			
	      ModelAndView mv = new ModelAndView("/member/board/boardList");
			return mv;
	  }
	 
	  
	  @RequestMapping(value="/board/selectBoardList.mk" )
	  public ModelAndView selectBoardList(CommandMap commandMap , HttpServletRequest request) throws Exception{
			HttpSession session = request.getSession();
			commandMap.put("MEM_ID", session.getAttribute("session_MEM_ID"));
			
		  
	  	ModelAndView mv = new ModelAndView("jsonView");
	  	
	  	List<Map<String,Object>> list = boardService.selectBoardList(commandMap.getMap());
	  	mv.addObject("list", list);
	  	if(list.size() > 0){
	  		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
	  	}
	  	else{
	  		mv.addObject("TOTAL", 0);
	  	}
	  	
	  	return mv;
	  }
	  
	  
	  ///글작성
	  
		@RequestMapping(value="/board/openBoardWrite.mk")
		public ModelAndView openBoardWrite(CommandMap commandMap) throws Exception{
			ModelAndView mv = new ModelAndView("/member/board/boardWrite");
			
			return mv;
	}
		
		
		
		@RequestMapping(value="/board/insertBoard.mk")
		public ModelAndView insertBoard(CommandMap commandMap, HttpServletRequest request) throws Exception{
			HttpSession session = request.getSession();
			commandMap.put("MEM_ID", session.getAttribute("session_MEM_ID"));
		    commandMap.put("MEM_NUM", ((Map)session.getAttribute("session_MEMBER")).get("MEM_NUM"));
			ModelAndView mv = new ModelAndView("redirect:/board/openBoardList.mk"); //commandmap으로 받아서 입력이되면 openBoardList.do로 리다이렉트
			boardService.insertBoard(commandMap.getMap());
			
			return mv;
		}
		

	
		@RequestMapping(value="/board/openBoardDetail.mk")
		public ModelAndView openBoardDetail(CommandMap commandMap , HttpServletRequest request) throws Exception{
			HttpSession session = request.getSession();
			commandMap.put("MEM_ID", session.getAttribute("session_MEM_ID"));
		    commandMap.put("MEM_NUM", ((Map)session.getAttribute("session_MEMBER")).get("MEM_NUM"));
		
			ModelAndView mv = new ModelAndView("/member/board/boardDetail");
			List<Map<String, Object>> list1 = commentService.openCommentList(commandMap.getMap());
			mv.addObject("list1", list1);
			Map<String,Object> map = boardService.openBoardDetail(commandMap.getMap());
			mv.addObject("map", map);
			
			return mv;
		}
		
		@RequestMapping(value="/board/updateHitLike.mk")
		public ModelAndView updateHitLike(CommandMap commandMap) throws Exception{
			ModelAndView mv = new ModelAndView("redirect:/board/openBoardDetail.mk");	
			boardService.updateHitLike(commandMap.getMap());
			mv.addObject("BOARD_NUM", commandMap.get("BOARD_NUM"));
			return mv;
		}
		
		@RequestMapping(value="/board/updateDisHitLike.mk")
		public ModelAndView updateDisHitLike(CommandMap commandMap) throws Exception{
			ModelAndView mv = new ModelAndView("redirect:/board/openBoardDetail.mk");	
			boardService.updateDisHitLike(commandMap.getMap());
			mv.addObject("BOARD_NUM", commandMap.get("BOARD_NUM"));
			return mv;
		}
		
		@RequestMapping(value="/board/openBoardUpdate.mk")
		public ModelAndView openBoardUpdate(CommandMap commandMap) throws Exception{
			ModelAndView mv = new ModelAndView("/member/board/boardUpdate");
            Map<String,Object> map = boardService.openBoardDetail(commandMap.getMap());
			mv.addObject("map", map);
			
			return mv;
		}
		
		
		@RequestMapping(value="/board/updateBoard.mk")
		public ModelAndView updateBoard(CommandMap commandMap) throws Exception{
			ModelAndView mv = new ModelAndView("redirect:/board/openBoardDetail.mk");
			
			boardService.updateBoard(commandMap.getMap());
			
			mv.addObject("BOARD_NUM", commandMap.get("BOARD_NUM"));
			
			return mv;
		}
		
	
		@RequestMapping(value="/board/deleteBoard.mk")
		public ModelAndView deleteBoard(CommandMap commandMap) throws Exception{
			ModelAndView mv = new ModelAndView("redirect:/board/openBoardList.mk");
			boardService.deleteBoard(commandMap.getMap());
			return mv;
		}
}
