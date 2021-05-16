package mask.board.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;

import mask.common.util.CommonUtils;

@Controller
@RequestMapping("/ckeditor")
public class EditorController {
	
Logger log = Logger.getLogger(this.getClass());
	
	@ResponseBody
	@RequestMapping("fileupload.mk")
	public void imageUpload(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam MultipartFile upload)
	throws Exception{
		//http header 설정
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		//http body
		//업로드한 파일 이름
		String fileName=upload.getOriginalFilename();
		//바이트 배열로 변환
		byte[] bytes=upload.getBytes();
		//이미지를 업로드할 디렉토리(배포 경로로 설정)
		String uploadPath = 
				request.getSession().getServletContext().getRealPath("/")+"/img/goods_upload/";
		
		//스프링에서 자원은 따로 관리되어야한다
		
		
		//서버에 저장됨
		OutputStream out=new FileOutputStream(
				new File(uploadPath + fileName)); //java.io		
		

		
		//세션에 파일이름 올리기
		request.getSession().setAttribute("GOODS_IMAGE", fileName);
		System.out.println("파일이름 : " + fileName);
		
		out.write(bytes);
		String callback=request.getParameter("CKEditorFuncNum");
		PrintWriter printWriter=response.getWriter();
		String fileUrl
			=request.getContextPath()+"/img/goods_upload/"+fileName;
		System.out.println("fileUrl:"+fileUrl);
		printWriter.println(
				"<script>window.parent.CKEDITOR.tools.callFunction("
				+ callback+",'"+fileUrl+"','이미지가 업로드되었습니다.')"
				+ "</script>");
		//스트림 닫기
		printWriter.flush();
		
		
	}
	
	
}