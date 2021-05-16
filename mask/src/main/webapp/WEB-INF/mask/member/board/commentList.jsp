<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

  
</head> 
<body>
<form name="frm" id="frm" method="post" enctype="multipart/form-data">
<c:choose>
         <c:when test="${fn:length(list1) > 0}">
            <c:forEach items="${list1}" var="ct">
   <div style="width:auto; height:auto;">
      <span style="font-size:9pt; color:gray;">${ct.MEM_ID}</span>
      <c:if test="${session_MEMBER.MEM_NUM != null && session_MEMBER.MEM_ID == ct.MEM_ID }">
      <input type="hidden" name="COMMENT_NUM" id="COMMENT_NUM" value="${ct.COMMENT_NUM}">
      <a href="#this" name="delComment" id="delComment"><span style="font-size:9pt; color:gray; padding-right:10px; float:right;">삭제</span></a>
      <a href="#this" name="modifyComment" id="modifyComment"><span style="font-size:9pt; color:gray; padding-right:10px; float:right;">수정</span></a>
      </c:if>
      <br>
      <span style="padding:5px;">${ct.COMMENT_CONTENT} </span>
      
      <span style="float:right; font-size:9pt; color:gray;"><fmt:formatDate pattern="yyyy/MM/dd" value="${ct.COMMENT_DATE}" /></span>
      
   </div>
   </c:forEach>
         </c:when>
      <c:otherwise>
      <span style="color:gray;">댓글이 없습니다.</span>
</c:otherwise>   
      </c:choose>
</div>
</form>

<%@ include file="/WEB-INF/include/include-body.jspf" %>

<script type="text/javascript">





$(document).ready(function() {
$("a[name='delComment']").on("click", function(e){ //삭제하기 버튼
   e.preventDefault();
   fn_deleteComment($(this));
});

$("a[name='modifyComment']").on("click", function(e){ //수정하기 버튼
      e.preventDefault();
      fn_modifyComment($(this));
   });
});



function fn_deleteComment(obj) {
	
   var comSubmit = new ComSubmit();
   if (confirm("정말 해당 댓글을 삭제하겠습니까?") == true){  
	   
   comSubmit.setUrl("<c:url value='/comment/commentDelete.mk' />");
   comSubmit.addParam("COMMENT_NUM", obj.parent().find("#COMMENT_NUM").val());
   comSubmit.submit();
   alert("삭제가 완료되었습니다.");
   }else{   //취소

	     return false;

	 }
 
}

function fn_modifyComment(obj){
   var comSubmit = new ComSubmit("frm");
   comSubmit.setUrl("<c:url value='/comment/updateCommentForm.mk' />");
   comSubmit.addParam("COMMENT_NUM", obj.parent().find("#COMMENT_NUM").val());
   comSubmit.submit();
}
</script>
</body>
</html>