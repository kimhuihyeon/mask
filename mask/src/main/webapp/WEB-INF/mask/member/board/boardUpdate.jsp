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
						${map.BOARD_TYPE}</div>
					<div class="panel-body">
						<div class="dataTable_wrapper">
						<form id="frm" method="post">
							<div id="dataTables-example_wrapper"
								class="dataTables_wrapper form-inline dt-bootstrap no-footer">
								<div class="row" style="margin-bottom: 5px;">
									<div class="col-sm-30">

										<p id="bb">
										<div style="text-align: left; margin-left: 30px;">
										${map.BOARD_NUM }
						<input type="hidden" id="BOARD_NUM" name="BOARD_NUM" value="${map.BOARD_NUM }">
									
											<B>제목:</B> &nbsp; &nbsp; &nbsp; 
											<input type="text" class="form-control" id="BOARD_TITLE" name="BOARD_TITLE"  value="${map.BOARD_TITLE }" class="wdp_90"></input>
										
											</div>
										
									</div>
								</div>
									 <div style="text-align: left; width:150%;"> 		
									<textarea id="BOARD_CONTENT" name="BOARD_CONTENT">
									${map.BOARD_CONTENT}
									</textarea>
									</div>
									</form>	
									<center>
									<button href="#this" class="btn" id="update" value="수정">수정하기</button>
									<button href="#this" class="btn" id="list" value="목록">목록으로</button>
									<button href="#this" class="btn" id="delete" value="삭제">삭제하기</button>
							</center>
							</div>
							</div>
							</div>
							</div>
							</div>
							</div>
							</div>
							
<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">


	CKEDITOR.replace('BOARD_CONTENT',{
		   filebrowserUploadUrl:"${pageContext.request.contextPath}/ckeditor/fileupload.mk",     height : 500 });
	   
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});
			
			$("#update").on("click", function(e){ //작성하기 버튼
				e.preventDefault();
				fn_updateBoard();
			});

			$("#delete").on("click", function(e){ //삭제하기 버튼
				e.preventDefault();
				fn_deleteBoard();
			});
		});

		
		function fn_openBoardList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/openBoardList.mk' />");
			comSubmit.submit();
		}
		
		function fn_updateBoard(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/board/updateBoard.mk' />");
			comSubmit.submit();
		}

		function fn_deleteBoard(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/deleteBoard.mk' />");
			comSubmit.addParam("BOARD_NUM", $("#BOARD_NUM").val());
			comSubmit.submit();
			
		}
		
	</script>
							
</body>
</html>