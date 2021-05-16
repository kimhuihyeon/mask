<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ include file="/WEB-INF/mask/layout/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
 
</head>
<body>


<style type="text/css">
   @font-face {
  font-family: ff;
  src: url('/c/resources/CookieRunFont/CookieRun Regular.otf');
}

body { 

     font-family: ff;}
  </style>
  <center>
<div class="container-fluid" >
			<h1>
				<kbd style="font-family: ff">배송 조회</kbd>
			</h1>
  <div class="row">
     
    <div class="col-sm-0 col-md-0 col-lg-12 text-info" style="background-color:pink; font-family: ff;">
       <h3> 주문해주셔서 감사합니다 </h3>
    </div>
  </div>
</div>
</center>
<div class="container">
  <div class="jumbotron">
<table class="table" style="font-family: ff;">

      <dl>
               <h4> <dt>택배사 : xxx</dt></h4>
               <h4> <dt>ㅁㅁㅁㅁㅁ</dt></h4>
               
     </dl></table>     
</div>
  </div>
</div>
</div>
  <center><p class="bg-success" style="font-family: ff;">택배는 2-3일 소요</p></center>
       <div>
        <a href="write.do" class="btn btn-primary" value="MYPAGE" style="font-family: ff; margin:0 auto;">
      HOME</a>
      </div> 
      
 <footer >
<%@ include file="/WEB-INF/mask/layout/footer.jsp"%> 
</footer>
      
</body>
</html>