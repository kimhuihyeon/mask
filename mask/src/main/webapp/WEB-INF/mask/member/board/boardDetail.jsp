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
					<P>	${map.BOARD_TYPE}</P></div>
					<div class="panel-body">
						<div class="dataTable_wrapper">
								
								<div class="row" style="margin-bottom: 5px;">
					
						

											   <input type="hidden" name="BOARD_NUM" id="BOARD_NUM" value="${map.BOARD_NUM}">
								</div>

					 <div style="text-align: left;"> 	
							         <c:if test="${session_MEMBER.MEM_NUM != null }"> 																		
									
									 				제목 : ${map.BOARD_TITLE} | 아이디 : ${map.MEM_ID}
									 				<br>
									 				 날짜: ${map.BOARD_DATE} | 조회수: ${map.BOARD_COUNT} | 추천수: ${map.BOARD_UP}	
									 <textarea id="BOARD_CONTENT" name="BOARD_CONTENT" readOnly>
									 ${map.BOARD_CONTENT} 
									 </textarea>
									 </c:if>
									 
									   <c:if test="${session_MEMBER.MEM_NUM == null }">																
									 <textarea class="form-control" id="BOARD_CONTENT" name="BOARD_CONTENT" readOnly>
                                   
                                   로그인 후 이용해주세요.
									 			
									 </textarea>
									 </c:if>
									</div>
					</div>
							
							
						
							
			   <c:if test="${session_MEMBER.MEM_NUM != null && session_MEMBER.MEM_ID == map.MEM_ID }">							
	             <button href="#this" class="btn" id="list" value="목록으로">목록으로</button>
				<button href="#this" class="btn" id="update" value="수정하기">수정하기</button>
							 &nbsp;&nbsp;&nbsp;&nbsp;
								 </c:if> 
							 <a href='#this' id="like" ><img src='http://www.mo2mo2.kr/resources/images/light/icon-like1.png' width="20"></a>
							추천수: ${map.BOARD_UP}
							 <a href='#this' id="dislike" ><img src='https://png.pngtree.com/png-vector/20190307/ourlarge/pngtree-vector-angry-emoticon-icon-png-image_762960.jpg' width="25"></a>
								<br><br>
			<br>
			   
      <hr>
      <c:if test="${session_MEMBER.MEM_NUM != null}">
		<div class="panel-body">	
			<div class="board">	
			 <form name="frm" id="frm" method="post" enctype="multipart/form-data" style="width: 90%;">
        <input type="hidden" name="BOARD_NUM" id="BOARD_NUM" value="${map.BOARD_NUM}">
        <input type="hidden" id="MEM_NUM" name="MEM_NUM" value="${session_MEMBER.MEM_NUM}"/>
			<textarea id="COMMENT_CONTENT" name="COMMENT_CONTENT" placeholder="100자 이상은 입력이 불가합니다*^^*" class="form-control" cols="30" rows="10" style="width: 90%; height: 100; padding: 6px; padding: 10px" ></textarea>
			<div id="test_cnt">(0 / 100)</div>
			  <a href="#this" id="commentWrite"><input type="button" value="댓글쓰기" class="btn"></a> 
			  </form> 
			 
   
	</div>
  </div>
  <!-- 댓글 수정 -->
  
   <div class="board">
 	<div class="panel panel-default" style="width: 90%" >
   <%@ include file="commentList.jsp" %>
   </div>
  </div>
  
  </div>
  </div>
  </div>
  </div>
   </c:if>
							
<%@ include file="/WEB-INF/include/include-body.jspf" %>

	<script type="text/javascript">

	CKEDITOR.replace('BOARD_CONTENT',{
		   filebrowserUploadUrl:"${pageContext.request.contextPath}/ckeditor/fileupload.mk",  height : 400 , width: 900 });




    $(document).ready(function() {
        $('#COMMENT_CONTENT').on('keyup', function() {
            $('#test_cnt').html("("+$(this).val().length+" / 100)");
 
            if($(this).val().length > 100) {
                $(this).val($(this).val().substring(0, 100));
                $('#test_cnt').html("(100 / 100)");
            }
        });
    });


	   
	
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
	            comSubmit.setUrl("<c:url value='/comment/insertComment.mk' />");
	   
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
		       {
		    	   <c:if test="${session_MEM_ID == map.MEM_ID }">
		    	    alert("본인이 작성하신 글에는 추천이 불가능합니다!");
		    	    return false;
		    	    </c:if>   
		    	var board_num = "${map.BOARD_NUM}";
		    	var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/board/updateHitLike.mk'/>");
				comSubmit.addParam("BOARD_NUM", board_num);
		        comSubmit.submit();
		        alert("좋아요!")
		        
		        }
		    });

		$("#dislike").click(function(){
		       {
		    	    <c:if test="${session_MEM_ID == map.MEM_ID }">
		    	    alert("본인이 작성하신 글에는 비추천이 불가능합니다!");
		    	    return false;
		    	    </c:if>   
		    	var board_num = "${map.BOARD_NUM}";
		    	var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/board/updateDisHitLike.mk'/>");
				comSubmit.addParam("BOARD_NUM", board_num);
		        comSubmit.submit();
		        alert("싫어요!")
		        
		        }
		    });
		
	</script>
							
</body>
</html>