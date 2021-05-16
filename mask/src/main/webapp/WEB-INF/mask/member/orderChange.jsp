<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var='root' value="${pageContext.request.contextPath}/" />	
<!DOCTYPE html>
<html lang="utf-8">

<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
 <c:import url="/WEB-INF/mask/layout/header.jsp"/>
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 
      <script>
    
    function DaumAddressAPI() {
        new daum.Postcode(
              {
                 oncomplete : function(data) {
                    
                    var addr = ''; // 
                    var extraAddr = ''; 

                    
                    if (data.userSelectedType === 'R') { 
                       addr = data.roadAddress;
                    } else { 
                       addr = data.jibunAddress;
                    }

                    
                    if (data.userSelectedType === 'R') {
                       if (data.bname !== ''
                             && /[동|로|가]$/g
                                   .test(data.bname)) {
                          extraAddr += data.bname;
                       }
                       
                       if (data.buildingName !== ''
                             && data.apartment === 'Y') {
                          extraAddr += (extraAddr !== '' ? ', '
                                + data.buildingName
                                : data.buildingName);
                       }
                       
                       if (extraAddr !== '') {
                          extraAddr = ' (' + extraAddr
                                + ')';
                       }
                       /* 
                       document
                             .getElementById("MEM_ADDRESS3").value = extraAddr; */

                    } /* else {
                       document
                             .getElementById("MEM_ADDRESS3").value = '';
                    } */

                    
                    document
                          .getElementById('ORDER_DZIPCODE').value = data.zonecode;
                    document
                          .getElementById("ORDER_DADD1").value = addr;
                    
                    document.getElementById(
                          "ORDER_DADD2")
                          .focus();
                 }
              }).open();
     }

 
        

   function main() {
		if(confirm("배송지 변경을 취소하겠습니까?") == true){
			location.href='/member/MyOrderList.mk';
		}else {
			return;
		}
	}


 
</script>

<style>
#update , #but
{
   margin:0 auto;

   width: 100%;
   
  font-family: "Noto Sans KR", sans-serif;
  font-size: 1rem;
  font-weight: 400;
  text-align: center;
  text-decoration: none;

  display: inline-block;
  width: auto;

  border: none;
  border-radius: 4px;
}
#update , #but

{
   padding: 5px;

   width:30pt;

   font-size: 13px;
}
</style>  
</head>
<head>
<title>배송지변경 페이지</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>	



<div class="container-fluid" >
		<center>
			<h3>
				<kbd style="font-family: ff">배송지 변경</kbd>
			</h3>
			<div class="row">
				<div >
					<p>*주의사항 : 배송지 변경은 배송시작 전에 가능하오니 양해 부탁드립니다.</p>
				</div>
			</div>
	</div>
<center>
<form id="frm">
	  <div class="jumbotron">
<table class="table">
<div class="orderArea" >
      <div class="table-responsive">
      <table style="width:100%;" align="center">
         <colgroup>
               <col width="15%" />
               <col width="*" />
         </colgroup>
                  <tr>
            <td>수령인</td>     
            <input type="hidden" id="ORDER_NUM" name="ORDER_NUM" value="${map.ORDER_NUM}">       
            <td><input type="text" id="ORDER_NAME" name="ORDER_NAME" class="form-control"  value="${map.ORDER_NAME }" style="width:20%;"></td>                        
         </tr>
         <tr>
            <td>휴대폰</td>
            <td><input type="text" id="ORDER_PHONE" name="ORDER_PHONE" class="form-control"  value="${map.ORDER_PHONE }"  style="width:40%;"></td>
         </tr>
         <tr>
            <td rowspan="3"> 주소</td>
            <td>
               <input type="text" id="ORDER_DZIPCODE" name="ORDER_DZIPCODE"  class="form-control" value="${map.ORDER_DZIPCODE }" readonly style="display:inline-block; width:40%;">
       <input type="button" value="검색" onclick="DaumAddressAPI();" id="but"/>
            <br>
            </td>
         </tr>
         <tr>
            <td>
               <input type="text" name="ORDER_DADD1" id="ORDER_DADD1"  value="${map.ORDER_DADD1 }" size="40" class="form-control" style="width:55%;">
            <td>
         <tr>
            <td>
               <input type="text" name="ORDER_DADD2" id="ORDER_DADD2"  value="${map.ORDER_DADD2 }" size="40" class="form-control" style="width:55%;">
            </td>
         </tr>
         <tr>
            <td>메모</td>
            <td><textarea id="ORDER_DMEMO" name="ORDER_DMEMO" rows="2" value="${map.ORDER_DMEMO }" style="width:90%;" class="form-control">${map.ORDER_DMEMO }</textarea></td>
         </tr>
         	</center>
			</table>
         	</div>
         	</div>
         	</table>
         	</div>
         	</form>
         	</center>
         	
         	<tr>	
         	<td>	
         	<center>
         	<a href="#this" type="button" class="btn" id="update" name="update" >변경</a>
          <!--   <a href="#this" class="btn" id="modify"><input type="submit" value="변경" id="but"></a>--> 
            <a href="http://localhost:8098/mask/member/MyOrderList.mk" type="button" class="btn" id="but">취소</a>
        <!--    <button type="button" onclick="main();" id="but">취소</button>	-->
            	</center>
         	</td>
			</tr>
	
	<center>
		<p class="bg-success">택배는 결제완료일 기준으로 2-3일 소요됩니다.</p>
	</center>
	
	 	<script type="text/javascript">		
$(document).ready(function(){	 	
	
$("#update").on("click", function(e){
    e.preventDefault();
    fn_orderMyDeliverUpdate($(this));
    
 });
});

function fn_orderMyDeliverUpdate() {
	    var comSubmit = new ComSubmit("frm");
	    
	      if (!$("#ORDER_NAME").val()) { //유효성 검사
	         alert("주문자를 입력하세요.");
	         $("#ORDER_NAME").focus();
	         return false;
	      }

	      if (!$("#ORDER_PHONE").val()) {
		         alert("번호를 입력하세요.");
		         $("#ORDER_PHONE").focus();
		         return false;
		      }
	      if (!$("#ORDER_DZIPCODE").val()) {
		         alert("우편번호를 입력하세요.");
		         $("#ORDER_DZIPCODE").focus();
		         return false;
		      }
	      if (!$("#ORDER_DADD1").val()) {
		         alert("주소1를 입력하세요.");
		         $("#ORDER_DADD1").focus();
		         return false;
		      }
	      if (!$("#ORDER_DADD2").val()) {
		         alert("주소2를 입력하세요.");
		         $("#ORDER_DADD2").focus();
		         return false;
		      }
          	      
	      if (!$("#ORDER_DMEMO").val()) {
		         alert("배송 메시지를 입력하세요.");
		         $("#ORDER_DMEMO").focus();
		         return false;
		      }
	      
	      comSubmit.setUrl("<c:url value='/member/orderMyDeliverUpdate.mk' />");
	      comSubmit.submit();
	      alert("배송지 변경이 완료 되었습니다!");

	   }  
/*
	   function fn_orderMyDeliverUpdate() {
		    var comSubmit = new ComSubmit("frm");
		    comSubmit.setUrl("<c:url value='/member/orderMyDeliverUpdate.mk' />");
		    comSubmit.submit();
	   }*/
   // alert("배송지 변경이 완료 되었습니다!") ;

	</script>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
</body>
</html>