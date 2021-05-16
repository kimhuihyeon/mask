<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var='root' value="${pageContext.request.contextPath}/"/>

<c:import url="/WEB-INF/mask/layout/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
   <script type="text/javascript">


   
      function begin(){
         document.myform.MEM_ID.focus();
       }
       function checkId(){
         if(!document.myform.MEM_ID.value){
           alert("아이디를 입력하지 않으셨습니다.");
           document.myform.id.focus();
           return false;
         }
         if(!document.myform.MEM_PW.value){
           alert("비밀번호를 입력하지 않으셨습니다.");
           document.myform.passwd.focus();
           return false;
         }

       }
       
       function fsubmit(){
          var id = $("#MEM_ID")[0].value;
          var pw = $("#MEM_PW")[0].value;
          if(id==null || id==''){
             alert("아이디를 입력하세요.");
             return false;
          }
          if(pw==null || pw==''){
             alert("비밀번호를 입력하세요.");
             return false;
          }
          myform.submit();
       }       
       
       /*       $(document).ready(function(){
          
          // 저장된 쿠키를 로그인화면에 불러오기위함
          var userInputId = getCookie("userInputId");
          $("#MEM_ID").val(userInputId);  
      
          if($("#MEM_ID").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
             $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
          }
          
          $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
             if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
                var userInputId = $("#MEM_ID").val();
                setCookie("userInputId", userInputId, 7); // 7일보관
             }else{ // ID 저장하기 체크 해제 시,
                deleteCookie("userInputId");
             }
          });
          
          // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
          $("#MEM_ID").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
             if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
                var userInputId = $("#MEM_ID").val();
                setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
             }
          });
       });
        */
      
        
       function setCookie(cookieName, value, exdays){ //SET을 사용하여 쿠키저장
           var exdate = new Date();
           exdate.setDate(exdate.getDate() + exdays); //설정 일수만큼 현재시간에 만료값으로 지정
           var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
           document.cookie = cookieName + "=" + cookieValue;
       }
        
       function deleteCookie(cookieName){
           var expireDate = new Date();
           expireDate.setDate(expireDate.getDate() - 1);
           document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
       }
        
       function getCookie(cookieName) {
           cookieName = cookieName + '=';
           var cookieData = document.cookie;
           var start = cookieData.indexOf(cookieName);
           var cookieValue = '';
           if(start != -1){
               start += cookieName.length;
               var end = cookieData.indexOf(';', start);
               if(end == -1)end = cookieData.length;
               cookieValue = cookieData.substring(start, end);
           }
           return unescape(cookieValue);
       }
   </script>
<title>login</title>
</head>
<body >
	<div class="login">
    <div class="container">
        <div class="left-conataier">
            <label>Login Or Create An Account</label>
            <input type="radio" name="check-box" id="mem" checked>
            <input type="radio" name="check-box" id="non-mem">
            <div class="check">
                <label for="mem">회원</label>
                <label for="non-mem">비회원</label>
            </div>
            <div class="mem-login">
                <div class="member">
                
                <!-- 회원로그인 -->
                <form name="myform" action="/mask/member/login.mk" method="post" class="info" onload="begin()">
                    <div class="item">
                    
                      <input type="text" id="MEM_ID" name="MEM_ID" placeholder="아이디">
                      
                      <i class="fa fa-user"></i>
                    </div>
                    <div class="item">
                    
                      <input type="password"id="MEM_PW" name="MEM_PW" placeholder="password">
                      
                      <i class="fa fas fa-unlock"></i>
                    </div>
                    <button type="button" value="로그인" onclick="fsubmit();">Login</button>
                  </form> 
                </div>
                
                <div class="non-member">  
                  <!-- 비회원 로그인 -->
                  <form class="info">
                    <div class="item">
                      <input type="text" placeholder="주문번호">
                      <i class="fa fa-user"></i>
                    </div>
                    <button type="submit">Login</button>
                  </form>
                </div>
                  
                  <div class="find">
                    <a href="${root}member/findId.mk">아이디찾기</a>
                    <a href="${root}member/findPw.mk">비밀번호찾기</a>
                    <a href="${root}member/findOrderNum.mk">주문번호찾기</a>
                  </div>
            </div>
        </div>
        <div class="right-conatiner">
            <label>아직도 회원이 아니십니까?</label>
            <span><em>회원을</em> 위한 <em>다양한 혜택</em>이 준비되어있습니다.</span>
            <button onclick="location.href='${root}ezen/member/join.mk'">SIGN IN</button>
        </div>
    </div>
  </div>
  
  
  

</body>
</html>