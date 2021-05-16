<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/mask/layout/header.jsp"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <script type="text/javascript">//로그인검사
$(document).ready(function(){ 
	var message = "${message}";
	var url = "${url}";
	if(message!=null && message!=''){
		alert(message);
		if(url!=null && url!=''){
			location.href = "<c:url value='${url}'/>";
		}else{
			history.go(-1);
		}
	}else{
		location.href = "<c:url value='/main/openMainList.mk'/>";//로그인 이후 나타나는 화면
	}
})
</script>
</head>
<body>

</body>
</html>