package mask.notice.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mask.notice.service.NoticeService;
import mask.common.CommandMap;

@Controller
public class NoticeController {

	
	 @Resource(name="noticeService")
	   private NoticeService noticeService;

	  //공지사항!!
	  
	  @RequestMapping(value="/admin/selectNoticeList.mk")
	  public ModelAndView NoticeBoardList(CommandMap commandMap) throws Exception{
	  	ModelAndView mv = new ModelAndView("jsonView");
	  	
	  	List<Map<String,Object>> list = noticeService.NoticeBoardList(commandMap.getMap());
	  	mv.addObject("list", list);
	  	if(list.size() > 0){
	  		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
	  	}
	  	else{
	  		mv.addObject("TOTAL", 0);
	  	}
	  	
	  	return mv;
	  	
	  }
	  
	  @RequestMapping(value="/admin/noticeBoardList.mk") 
	   public ModelAndView openNoticeList(CommandMap commandMap)throws Exception{
	      ModelAndView mv = new ModelAndView("/notice/noticeList");
			return mv;
	  }
	  
	  //공지사항 고객 상세보기

		@RequestMapping(value="/admin/noticeDetail.mk")
		public ModelAndView openBoardDetail(CommandMap commandMap) throws Exception{
			ModelAndView mv = new ModelAndView("/notice/noticeDetail");
			Map<String,Object> map = noticeService.NoticeDetail(commandMap.getMap());
			mv.addObject("map", map);
			
			return mv;
		}
		
	
}
