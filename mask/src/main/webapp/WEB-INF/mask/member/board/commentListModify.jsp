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
   <div>
      <span style="font-size:9pt; color:gray;">${ct.MEM_ID}</span>
      <c:if test="${session_MEMBER.MEM_NUM != null && session_MEMBER.MEM_ID == ct.MEM_ID }">
      <input type="hidden" name="COMMENT_NUM" id="COMMENT_NUM" value="${ct.COMMENT_NUM}">
      <a href="#this" name='cancle' id="cancle"><span style="font-size:9pt; color:gray; padding-right:10px; float:right;">취소</span></a>
      <a href="#this" name='modifyComment' id="modifyComment"><span style="font-size:9pt; color:gray; padding-right:10px; float:right;">수정</span></a>
      </c:if>
      <br>
      <span style="padding:5px;">${ct.COMMENT_CONTENT} </span>
 
      <span style="float:right; font-size:9pt; color:gray; padding:5px;"><fmt:formatDate pattern="yyyy/MM/dd" value="${ct.COMMENT_DATE}" /></span>
      
   </div>
   </c:forEach>
   </c:when>
      </c:choose>
</div>
</form>

<%@ include file="/WEB-INF/include/include-body.jspf" %>

<script type="text/javascript">
$("a[name='cancle']").on("click", function(e){ 
   e.preventDefault();
   cancle();
});

$("a[name='modifyComment']").on("click", function(e){
	   e.preventDefault();
	   fn_modifyComment();
	});

function fn_modifyComment(){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/comment/updateCommentForm.mk' />");
	comSubmit.submit();
}
	
function cancle(){
   history.go(-1);
   location.reload();
   }

</script>
</body>
</html>