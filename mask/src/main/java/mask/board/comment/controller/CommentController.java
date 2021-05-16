package mask.board.comment.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mask.board.comment.service.CommentService;
import mask.common.CommandMap;

@Controller
public class CommentController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="commentService")
	private CommentService commentService;
	
	@RequestMapping(value="/comment/insertComment.mk") 
    public ModelAndView insertComment(CommandMap commandMap, HttpServletRequest request) throws Exception{
      ModelAndView mv = new ModelAndView("redirect:/board/openBoardDetail.mk");
      commentService.insertCommentWrite(commandMap.getMap(), request);
      mv.addObject("BOARD_NUM", commandMap.get("BOARD_NUM"));
         
      return mv;
   }
	
	
	@RequestMapping(value = "/comment/commentDelete.mk")
	   public ModelAndView commentDelete(CommandMap commandMap) throws Exception {
	      ModelAndView mv = new ModelAndView("redirect:/board/openBoardList.mk");
	      commentService.deleteComment(commandMap.getMap());
	      mv.addObject("COMMENT_NUM", commandMap.get("COMMENT_NUM"));
	      
	      return mv;      
	   }
	
	@RequestMapping(value="/comment/updateCommentForm.mk")
	   public ModelAndView updateCommentForm(CommandMap commandMap)throws Exception {
	      ModelAndView mv = new ModelAndView("/member/board/commentModify");
	      List<Map<String, Object>> list1 = commentService.openCommentList(commandMap.getMap());
	      mv.addObject("list1", list1);
	      Map<String, Object> map = commentService.updateCommentForm(commandMap.getMap());
	      mv.addObject("map", map);
	      mv.addObject("CONTENT_NUM", commandMap.get("COMMENT_NUM"));
	      return mv;
	   }
	
		   @RequestMapping(value="/comment/updateComment.mk") 
	   public ModelAndView updateComment(CommandMap commandMap)throws Exception{
		   ModelAndView mv = new ModelAndView("redirect:/board/openBoardDetail.mk");
		   mv.addObject("CONTENT_NUM", commandMap.get("COMMENT_NUM"));
		   mv.addObject("BOARD_NUM", commandMap.get("BOARD_NUM"));
		   mv.addObject("CONTENT_CONTENT", commandMap.get("COMMENT_CONTENT"));
		   commentService.updateComment(commandMap.getMap());
		   return mv;
	   }
}
