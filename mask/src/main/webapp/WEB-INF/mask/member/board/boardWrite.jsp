<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/include/include-header.jspf" %>

<c:set var='root' value='${pageContext.request.contextPath}/'/>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>insert title here</title>
 
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
 <script src="//cdn.ckeditor.com/4.4.4/standard/ckeditor.js"></script>


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
						커뮤니티</div>
						<div class="panel-body">
						<div class="dataTable_wrapper">				
								<div class="row" style="margin-bottom: 5px;">			
						<form id="frm" method="post" enctype="multipart/form-data">
										   <div style="text-align: left;"> 
											제목:
											<input type="text" class="form-control" id="BOARD_TITLE" name="BOARD_TITLE" style="width: 50%"></input>
										    <input type="hidden" class="form-control" id="MEM_ID" name="MEM_ID" style="width: 50%"></input>
									
										</div>														
									 <textarea class="form-control" id="BOARD_CONTENT" name="BOARD_CONTENT" style="width: 100%;">					
									</textarea>
								
							
								
									
									</form>	
									<div>
							
									

									</div>
									
									
							</div>
							</div>
							<button href="#this" class="btn" id="write">작성하기</button>
	                       <button  href="#this" class="btn" id="list">목록으로</button>
							</div>
							</div>
							</div>
							</div>
							</div>
							
<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">


	CKEDITOR.replace('BOARD_CONTENT',{
		   filebrowserUploadUrl:"${pageContext.request.contextPath}/ckeditor/fileupload.mk",     height : 500 , width: 890 });

	 
           

	 
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});
			
			$("#write").on("click", function(e){ //작성하기 버튼
				e.preventDefault();
				fn_insertBoard();
			});
		});
		
		function fn_openBoardList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/openBoardList.mk' />");
			comSubmit.submit();
		}
		
		function fn_insertBoard(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/board/insertBoard.mk' />");

			 if(!$("#BOARD_TITLE").val()){
	             alert("제목을 입력하세요");
	             $("#BOARD_TITLE").focus();
	             return false;
	          }

			 if(!$("#BOARD_CONTENT").val()){
	             alert("내용을 입력하세요");
	             $("#BOARD_CONTENT").focus();
	             return false;
	          }
			
			comSubmit.submit();

			
		}
		
	</script>
							
</body>
</html>