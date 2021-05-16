<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var='root' value="${pageContext.request.contextPath}/" />

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="${root}resources/common2.js"></script> 
<script type="text/javascript" src="${root}ckeditor/ckeditor.js"></script>  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- jquery 추가 -->

<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${root}resources/header.css">
<link rel="stylesheet" type="text/css" href="${root}resources/header.css">

<link rel="stylesheet" type="text/css" href="${root}resources/header.css">
<link rel="stylesheet" type="text/css" href="${root}resources/member.css">
<link rel="stylesheet" type="text/css" href="${root}resources/board.css">
<link rel="stylesheet" type="text/css" href="${root}resources/order.css">
<link rel="stylesheet" type="text/css" href="${root}resources/footer.css">
<link rel="stylesheet" type="text/css" href="${root}resources/main.css">
<link rel="stylesheet" type="text/css" href="${root}resources/orderDetail.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
</head>
<body>
	<div class="header">
		<div class="logo">
			<a href="#none">EZNMASK</a>
		</div>
		<div class="menu">
			<a href="${root}ezen/mask/goodsDetail.do">미세먼지 마스크</a>
			<a href="${root}ezen/mask/goodsDetail.do">비밀차단 마스크</a> 
			<a href="${root}ezen/mask/goodsDetail.do">손소독제</a> 
			<a href="${root}ezen/mask/goodsDetail.do">체온계</a>
		</div>
		<!-- 메인 헤더 메뉴 로그인 안했을 때--> 
<c:if test="${session_MEM_ID == null }">
		<div class="header-container">
			<a href="${root}member/openLoginForm.mk">로그인</a>
			<a href="${root}member/openJoinForm.mk">회원가입</a>
			<a href="${root}member/openMyInfoForm.mk">마이페이지</a>
			<a href="${root}member/MyOrderList.mk">주문조회</a>
			<a href="${root}shop/basket.mk">장바구니 <i class="fas fa-shopping-cart"></i></a>		
		</div>
		</c:if>
		
		<div class="header-container">	
<c:if test="${session_MEM_ID != null && session_MEM_ID != 'admin' }">
<a href="${root}ezen/member/myPage.do">마이페이지</a>
			<a href="${root}member/MyOrderList.mk">주문조회</a>
			<a href="${root}board/openBoardList.mk">게시판</a>
			<a href="${root}admin/noticeBoardList.mk">공지사항</a>
			<a href="${root}shop/basket.mk">장바구니 
			
			<i class="fas fa-shopping-cart"></i></a>	
${session_MEM_ID}님<font size='2'> </font>

<!-- 
			<a href="${root}board/openBoardList.mk">게시판</a>
			<a href="${root}admin/noticeBoardList.mk">공지사항</a>
<button type="button" onclick="location.href='http://localhost:8083/mask/member/logout.mk'">로그아웃</button> -->

<form name="user_logout" action="/mask/member/logout.mk" method="post">
        <input type="hidden">
 </form>
<li id="logout"><a href="#this">로그아웃</a></li>
</c:if>		
</div>		
		
	</div>
</body>
 <script>
     $(document).ready(function() {
        document.getElementById("logout").onclick = function(){
            document.user_logout.submit();
            //alert("로그아웃 되었습니다.");
            //window.location.href='http://localhost:8083/mask/member/openLoginForm.mk';
            }
        });
  </script>
</html>