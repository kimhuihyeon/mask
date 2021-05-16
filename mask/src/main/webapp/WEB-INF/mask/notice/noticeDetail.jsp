<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/include/include-header.jspf" %>

<c:set var='root' value='${pageContext.request.contextPath}/'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<title>Document</title>
<c:import url="/WEB-INF/mask/layout/header.jsp"/>
<head>


<style type="text/css">

.boardWrite .container{
    margin-top: 70px;
    height: 200vh;
    text-align: center;
}

.boardWrite .board{
    margin-top:70px;
    margin:auto;
    width:1000px;
    padding:30px;
    
}

.boardWrite .board .aaaaa{
    border: 1px solid;
    text-align: left;
    height: 30px;
    margin-bottom: 10px;
}

.boardWrite .board input{
    outline: none;
    padding:5px;
    box-sizing: border-box;
}

.boardWrite form{
    float: left;
    text-align: left;
    margin-left: 20px;
}

.boardWrite button:hover{
    opacity: .7;
    
 }   
 
</style>
</head>
<body>
	<div class="boardWrite">
		<div class="container">
			<div class="board">
				<div class="panel panel-default">
					<div class="panel-heading"
						style="font-weight: bolder; padding: 50px; font-size: 30px;">
							공지사항</div>
				<div class="panel-body">
						<div class="dataTable_wrapper">
								
								<div class="row" style="margin-bottom: 5px; text-align: left;">
							  	
									&nbsp;&nbsp;제목: &nbsp; ${map.BOARD_TITLE} <BR> &nbsp; &nbsp;날짜: ${map.BOARD_DATE} | 조회수: ${map.BOARD_COUNT} </span>
											<input type="hidden" id="BOARD_TITLE" name="BOARD_TITLE" class="wdp_90"></input>
											<input type="hidden" id="BOARD_NUM" name="BOARD_NUM" class="wdp_90"></input>
								
								</div>
									<textarea id="BOARD_CONTENT" name="BOARD_CONTENT"  readOnly style="width: 90%"> 
									 ${map.BOARD_CONTENT}
									</textarea>
									<button href="#this" class="btn" id="list" value="목록으로">목록으로</button>
										</div>
										
									</div>
								</div>
				
									</div>
						
			
						
							</div>
							
							</div>
							</div>
							</div>
							
			
			
							
							<!-- 코멘트 달기 -->
							
					
			</div>
</div>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
	CKEDITOR.replace('BOARD_CONTENT',{
		   filebrowserUploadUrl:"${pageContext.request.contextPath}/ckeditor/fileupload.mk",     height : 500 });
	   
		$(document).ready(function(){
			$("#list").on("click", function(e){ 
				e.preventDefault();               
				fn_openNoticeList();                  
			});

		
		});
		
		function fn_openNoticeList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/noticeBoardList.mk' />");
			comSubmit.submit();
		}

			</script>
							
</body>
</html>