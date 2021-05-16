<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  

<c:set var='root' value="${pageContext.request.contextPath }/"/>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<c:import url="/WEB-INF/mask/layout/header.jsp"/>

<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<head>
<meta charset="UTF-8">
<title>order_list</title>

</head>






<style>
table.type01 {
  border-collapse: collapse;
  text-align:center;
  line-height: 1.5;
  margin : 20px 10px;
}
table.type01 th {
  width: 150px;
  padding: 10px;
  font-weight: bold;
  text-align:center;
  vertical-align: top;
  border: 1px solid #ccc;
}
table.type01 td {
  width: 350px;
  padding: 10px;
  border: 1px solid #ccc;
  text-align:center;
}
</style>

<style> 
#btn1{ margin-right:-4px; } #btn2{ margin-left:-3px; } #btn_group 
button{ border: 1px solid gray; background-color: rgba(0,0,0,0); color: gray; padding: 5px; }
 </style>



<body>

<div align="center">
   <h3>My Order</h3>
<div class="container" style="width:70%;">

<div align="center">
   <table style="border:1 solid #dbdbdb; margin-left:auto; margin-right:auto;" class="table">
      <tr>
         <th>주문일자</th>
         <td><fmt:formatDate pattern="yyyy/MM/dd" value="${map.ORDER_DATE}" /></td>
         <th>주문번호</th>
         <td>${map.ORDER_NUM}</td>
      </tr>
   </table>
</div>



      <hr>
   <!-- 배송 정보 -->
             <a href="#this" class="btn" id="delete" name="delete" style="width: 10px"><button id="btn1">주문취소</button>
                      <input type="hidden" id="MEM_NUM" name="MEM_NUM" value="${session_MEMBER.MEM_NUM}">
                      <input type="hidden" id="ORDER_NUM" name="ORDER_NUM" value="${row.ORDER_NUM}"></a>
                    
                     <a href="#this" class="btn" name="update" id="update" style="width: 10px"><button id="btn2">반품요청</button>
                      <input type="hidden" id="MEM_NUM" name="MEM_NUM" value="${session_MEMBER.MEM_NUM}">
                      <input type="hidden" id="ORDER_NUM" name="ORDER_NUM" value="${row.ORDER_NUM}"></a>
     <hr>
      <div class="table-responsive">
      
      <table style="width:100%;">
         <colgroup>
               <col width="15%" />
               <col width="*" />
         </colgroup>
          <tr>
                 <th colspan="7">배송정보 <hr></th>
          </tr>

         <tr>
            <td>받는 사람</td>            
            <td>${map.ORDER_USER_NAME}</td>                        
         </tr>
         <tr>
            <td>연락처1</td>
            <td>${map.ORDER_PHONE}</td>
         </tr>
         <tr>
            <td> 주 소</td>
            <td>
               ${map.ORDER_DZIPCODE}<br>
               ${map.ORDER_DADD1} ${map.ORDER_DADD2}
            </td>
         </tr>
         <tr>
            <td>배송 메모</td>
            <td>${map.ORDER_DMEMO}</td>
         </tr>
      </table>
      </div>
      <hr>

    <!-- 결제 정보 -->
      <div class="table-responsive">
      <table style="width:100%;">
         <colgroup>
               <col width="15%" />
               <col width="*" />
         </colgroup>
         <tr>
            <th colspan="7">결제 정보<hr></th>
         </tr>
         <tr>
            <td>결제 금액</td>
            <td>${map.ORDER_TCOST}원</td>
         </tr>
         <tr>
            <td>결제 방법</td>
            <td>무통장입금</td>
         </tr>
         <tr>
            <td>입금자명</td>
            <td>${map.ORDER_PAY_NAME}</td>
         </tr>
         <tr>
         </tr>
         <tr>
            <td>현금영수증 번호</td>
            <td>
            ${map.ORDER_PAY_CASHRE}
            </td>
         </tr>
      </table>
      </div>
      
      
</div></div>
</form>


<%@ include file="/WEB-INF/include/include-body.jspf"%>
 <script type="text/javascript">
 $(document).ready(function() {

   $("#delete").on("click", function(e){ //주문취소
			e.preventDefault();
			fn_deleteo();
	});
	   

	$("#update").on("click", function(e){ //반품요청
		e.preventDefault();
		fn_updateo();
	});
 });


 function fn_deleteo(){ //주문취소
		var comSubmit = new ComSubmit();
		if (confirm("주문을 취소 하시겠습니까?") == true){  
		comSubmit.setUrl("<c:url value='/member/MyOrderUpdate.mk'/>");
		comSubmit.addParam("ORDER_NUM", $("#ORDER_NUM").val());
		comSubmit.addParam("MEM_NUM", $("#MEM_NUM").val());
	    comSubmit.submit();
	    alert("주문취소가 완료되었습니다. 주문목록으로 이동합니다.");

		 }else{   //취소

		     return false;

		 }
		}


 function fn_updateo(){  //반품요청
		var comSubmit = new ComSubmit();
		if (confirm("반품을 요청하시겠습니까?") == true){  
		comSubmit.setUrl("<c:url value='/member/myOrderStatus.mk'/>");
		comSubmit.addParam("ORDER_NUM", $("#ORDER_NUM").val());
		comSubmit.addParam("MEM_NUM", $("#MEM_NUM").val());
		comSubmit.submit();
		alert("반품요청이 완료되었습니다. 주문목록으로 이동합니다.");

		 }else{   //취소

		     return false;

		 }
		 
		}


 
</script>
 

      
</body>
</html>