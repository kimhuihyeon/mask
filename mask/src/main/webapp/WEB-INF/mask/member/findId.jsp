<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var='root' value='${pageContext.request.contextPath}/'/>
<c:import url="/WEB-INF/mask/layout/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findId</title>

</head>
<body>
<form name="myform" action="openFindIdResult.mk" method="post">
	<div class="findId">
        <div class="container">
        <div class="left-conataier">
            <label for="search_1">아이디 찾기</label>
            
            <input type="radio" name="check-box" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
            <!-- <input type="radio" name="check-box" id="phone"> -->
            <div class="check">
                <label for="email">이메일</label>
                <!-- <label for="phone">휴대폰</label> -->
            </div>
            <div class="find_id" >
                <div class="f_email">
                <form class="info">
                    <div class="item">
                      <input type="text" id="MEM_NAME" name="MEM_NAME" placeholder="이름">
                      <i class="fa fa-user"></i>
                    </div>
                    <div class="item">
                      <input type="email"  id="MEM_EMAIL" name="MEM_EMAIL" placeholder="Email">
                      <i class="fa fas fa-envelope"></i>
                    </div>
                    <button id="searchBtn" type="button" onclick="idSearch_click();" >확인</button>
                    
                  </form> 
                </div>
<!--                   <div class="f_phone">
                  <form class="info">
                    <div class="item">
                        <input type="text" placeholder="이름" name="name">
                        <i class="fa fa-user"></i>
                    </div>
                    <div class="item">
                        <input type="email" placeholder="휴대폰 번호" name="phone">
                        <i class="fa fas fa-phone"></i>
                      </div>
                    <button type="submit">확인</button>
                  </form>-->
                </div>
            </div>
        </div>
    </div>
</form>
    </div> 



</body>

<script type="text/javascript">




function begin(){
    document.myform.MEM_NAME.focus();
  }
  function checkId(){
    if(!document.myform.MEM_NAME.value){
      alert("아이디를 입력하지 않으셨습니다.");
      document.myform.id.focus();
      return false;
    }
    if(!document.myform.MEM_EMAIL.value){
      alert("비밀번호를 입력하지 않으셨습니다.");
      document.myform.passwd.focus();
      return false;
    }

  }
  
  function fsubmit(){
     var id = $("#MEM_NAME")[0].value;
     var pw = $("#MEM_EMAIL")[0].value;
     if(id==null || id==''){
        alert("이름을 입력하세요.");
        return false;
     }
     if(pw==null || pw==''){
        alert("이메일을 입력하세요.");
        return false;
     }
     myform.submit();
  } 




 // 아이디 값 받고 출력하는 ajax
var idSearch_click = function(){
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/member/openFindIdResult.mk?MEM_NAME="
				+$('#MEM_NAME').val()+"&MEM_EMAIL="+$('#MEM_EMAIL').val(),
				async:false,
					
		success:function(data){
			if(data == null){
				alert("회원정보가 없습니다");	
			} else {
				alert($('#MEM_NAME').val()+"님의 아이디는  "+data+"  입니다");
			}

		}
	});
}  

</script>
</html>