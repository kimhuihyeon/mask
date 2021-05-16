<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/include/include-header.jspf" %>

<c:set var='root' value='${pageContext.request.contextPath}/'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>title here</title>
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
 
.input-div{
    vertical-align: middle;
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
					
						

											   <input type="hidden" name="BOARD_NUM" id="BOARD_NUM" value="${map.BOARD_NUM}">
								</div>

					 <div style="text-align: left;"> 	
							    	 <textarea class="form-control" id="BOARD_CONTENT" name="BOARD_CONTENT" readOnly>

									 				제목 : ${map.BOARD_TITLE} | 날짜: ${map.BOARD_DATE} | 조회수: ${map.BOARD_COUNT} | 추천수: ${map.BOARD_UP}	
									 ${map.BOARD_CONTENT} 
									 </textarea>
									
							
							
									</div>
					</div>
					
							
							
			   <c:if test="${session_MEMBER.MEM_NUM != null	}">								
	             <button href="#this" class="btn" id="list" value="목록으로">목록으로</button>
				<button href="#this" class="btn" id="update" value="수정하기">수정하기</button>					
							 &nbsp;&nbsp;&nbsp;&nbsp;
							 <a href='#this' id="like" ><img src='https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=http%3A%2F%2Fcfile29.uf.tistory.com%2Fimage%2F99211E435E1AD8CA1499CB' width="20"></a>
							 ${map.BOARD_UP} 
							 </c:if>
							 		<br><br>
			<br>
			   
      <hr>		   
      <c:if test="${session_MEMBER.MEM_NUM != null}">
		<div class="panel-body">	
			<div class="board">	
			 <form name="frm" id="frm" method="post" enctype="multipart/form-data" style="width: 90%;">
        <input type="hidden" name="BOARD_NUM" id="BOARD_NUM" value="${map.BOARD_NUM}">
        <input type="hidden" id="MEM_NUM" name="MEM_NUM" value="${session_MEMBER.MEM_NUM}"/>
		<input type="hidden" id="COMMENT_NUM" name="COMMENT_NUM" value="${map.COMMENT_NUM}"/>
	    <textarea id="COMMENT_CONTENT" name="COMMENT_CONTENT" class="form-control" rows="5" cols="40" style="width: 90%; height: 100; padding: 6px; padding: 10px" >${map.COMMENT_CONTENT}</textarea>		
<a href="#this" id="commentWrite"><input type="button" value="수정완료" class="btn"></a> 

</form> 
 
</div>
	</div>
	<!-- 댓글 수정 -->

  <div class="board">
 	<div class="panel panel-default" style="width: 90%" >
   <%@ include file="commentListModify.jsp" %>
   </div>
  </div>
  
   </c:if>
   
  </div>
  </div>
  </div>
  </div>
  </div>
				
<%@ include file="/WEB-INF/include/include-body.jspf" %>

	<script type="text/javascript">

	CKEDITOR.replace('BOARD_CONTENT',{
		   filebrowserUploadUrl:"${pageContext.request.contextPath}/ckeditor/fileupload.mk",     height : 400 , width: 900 , });
	   
	
		$(document).ready(function(){
			$("#list").on("click", function(e){ 
				e.preventDefault();               
				fn_openBoardListt();                  
			});
			
			$("#update").on("click", function(e){ 
				e.preventDefault();            
				fn_openBoardUpdatee();
			});

			$("#commentWrite").on("click", function(e){
			         e.preventDefault();
			         commentWrite();
			      });

		
		});

		 function commentWrite(){
	         var comSubmit = new ComSubmit("frm");
	            comSubmit.setUrl("<c:url value='/comment/updateComment.mk' />");
	   
	            if (!$("#COMMENT_CONTENT").val()) {
	               alert("내용을 입력하세요.");
	               $("#COMMENT_CONTENT").focus();
	               return false;
	            }
	          alert("댓글이 정상적으로 등록 되었습니다.");
	         comSubmit.submit();
	         }

		
		
		function fn_openBoardListt(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/openBoardList.mk' />");
			comSubmit.submit();
		}
		
		function fn_openBoardUpdatee(){
			var board_num = "${map.BOARD_NUM}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/openBoardUpdate.mk' />");
			comSubmit.addParam("BOARD_NUM", board_num);
			comSubmit.submit();
		}

		$("#like").click(function(){
		    if(confirm("해당 글을 추천하시겠습니까?")){
		    	var board_num = "${map.BOARD_NUM}";
		    	var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/board/updateHitLike.mk'/>");
				comSubmit.addParam("BOARD_NUM", board_num);
		        comSubmit.submit();
		        alert("해당 글을 추천하였습니다.")
		        
		        }
		    });
		
	</script>
							
</body>
</html>