<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var='root' value="${pageContext.request.contextPath }"/>
<c:import url="/WEB-INF/mask/layout/header.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
function search(){
	if((pwsearch.MEM_ID.value!=null)&&(pwsearch.MEM_EMAIL.value!=null)){
		pwsearch.submit();
	}else if(pwsearch.MEM_ID.value==null) {
		alert("아이디를 입력하세요.")
	}else if(pwsearch.MEM_EMAIL.value==null) {
		alert("이메일주소를 입력하세요.")
	}

}function showMsg(m){
	
	if(m==0){
		
	}else if(m==1){
		alert("입력하신 정보가 등록하신 정보와 다릅니다.");
		window.open("openFindPwResult.mk","_self", "" );
	}
}function login(){
	window.open("openLoginForm.mk","_self","");
}



</script>


</head>
<body onload="showMsg(${msg})">
<form action="openFindPwResult.mk" name="pwsearch" method="post" >
	 <div class="findPw" id="findPw">
        <div class="container">
            <div class="left-conataier">
                <label>비밀번호 찾기</label>
                <input type="radio" name="check-box" id="email" checked>
                <input type="radio" name="check-box" id="phone">
                <div class="check">
                    <label for="email">이메일</label>
<!--                     <label for="phone">휴대폰</label> -->
                </div>
                <div class="find_id">
                    <div class="f_email">
                    <form class="info">
   <!--                      <div class="item">
                          <input type="text" placeholder="이름">
                          <i class="fa fas fa-id-card"></i>
                        </div> -->
                        <div class="item">
                            <input type="text" name="MEM_ID" placeholder="아이디">
                            <i class="fa fa-user"></i>
                          </div>
                        <div class="item">
                          <input type="email" name="MEM_EMAIL" placeholder="Email">
                          <i class="fa fas fa-envelope"></i>
                        </div>
                        <button type="button" value="비밀번호 찾기 " onclick="search()" >확인</button>
                      </form> 
                    </div>
<!--                       <div class="f_phone">
                      <form class="info">
                        <div class="item">
                            <input type="text" placeholder="이름" name="name">
                            <i class="fa fas fa-id-card"></i>
                        </div>
                        <div class="item">
                            <input type="text" placeholder="아이디">
                            <i class="fa fa-user"></i>
                          </div>
                        <div class="item">
                            <input type="email" placeholder="휴대폰 번호" name="phone">
                            <i class="fa fas fa-phone"></i>
                          </div>
                        <button type="submit">확인</button>
                      </form>
                    </div>
                </div>
            </div>
        </div>
      </div> -->
</body>
</html>