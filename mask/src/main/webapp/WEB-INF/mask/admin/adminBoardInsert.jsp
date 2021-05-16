<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@ include file="/WEB-INF/mask/layout/admin/layout.jsp"%>
<head>
<script src="//cdn.ckeditor.com/4.4.4/standard/ckeditor.js"></script>
<style type="text/css">
#bb{font-size:10;}
#cc{border : 3px solid #A9A9A9;}

#tx
{ border-style: solid; 
border-width: 0 0 0 8px; 
padding: 12px; 
word-break: break-all; } 
#tx 
{ border-color: LightGray; 
background-color:rgba(211, 211, 211, 0.2);
 }

</style>
</head>		
   <div id="page-wrapper">
<div class="row" style="padding-left:15px;width:900px;">    
	<h1 class="page-header">공지사항 등록</h1>  
</div>
<div class="row">
	<div class="panel panel-default">
		<div class="panel-heading">
                         공지사항을 등록하는 페이지입니다.
        </div>
      <form id="frm" method="post" enctype="multipart/form-data">
        <div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row" style="margin-bottom:5px;">
						<div class="col-sm-30">

 <p id="bb"><B>제목:</B>    &nbsp;  &nbsp;  &nbsp; <input type="text" id="BOARD_TITLE" name="BOARD_TITLE" style="width: 30%;" placeholder="제목을 입력하세요"/>
<br>
<p><B>아이디: &nbsp; <input type="text" id="tx"name="id" style="width: 19%;" placeholder="admin"/>
<br>
  <textarea id="BOARD_CONTENT" name="BOARD_CONTENT">

  </textarea>
</form>



<button href="#this" class="btn" id="write">작성하기</button>
<button  href="#this" class="btn" id="list">목록으로</button>		

</B></p></div></div></div></div></div></div></div></div>
					
			<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">


	CKEDITOR.replace('BOARD_CONTENT',{
		   filebrowserUploadUrl:"${pageContext.request.contextPath}/ckeditor/fileupload.mk",   

		     height : 500 });
	 
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
			comSubmit.setUrl("<c:url value='/admin/OpenAdminBoardList.mk' />");
			comSubmit.submit();
		}
		
		function fn_insertBoard(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/admin/insertNotice.mk' />");

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