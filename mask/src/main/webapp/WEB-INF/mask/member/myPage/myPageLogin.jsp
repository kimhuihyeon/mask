<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<c:import url="/WEB-INF/views/layout/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="myPageLogin_jsp">
    <div class="findPw">
        <div class="container">
            <div class="conataier">
                <label>내 정보</label>
                <div>비밀번호를 입력해주세요</div>
                <div class="find_id">
                    <div class="f_email">
                    
                    <c:if test="${param.info eq 'update'}"> <!-- 회원 탈퇴로 들어왔는지 정보 수정으로 들어왔는지 체크 -->
                    	<c:set var="href" value="${root}ezen/member/myPageUpdate.do"/>
                    </c:if>
                     <c:if test="${param.info eq 'delete'}">
                     	<c:set var="href" value=""/>
                    </c:if>
                    
                    <form class="info" action="${href}">
                        <div class="item">
                          <input type="password" placeholder="비밀번호">
                          <i class="fa fas fa-unlock"></i>
                        </div>
                        <button type="submit">확인</button>
                      </form> 
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
  
</body>
</html>