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
<body>
<div class="orderList-jsp">
        <div style="text-align: center;">
			<h1>
				주문조회
			</h1>
    </div>
<div style="height: 50px;"></div>
    <div>
        <table>
           <thead>
           <tr>
              <th style="width:5%;">번호</th>
              <th style="width:10%;">주문일자</th>
              <th style="width:15%;">이미지</th>
              <th style="width:10%;">상품명</th>
              <th style="width:10%">수량</th>
              <th style="width:10%;">옵션</th>
              <th style="width:8%;">가격</th>
              <th style="width:10%;">주문상태 확인</th>
              <th style="width:11%;">구매후기작성</th>
              <th style="width:11%;">배송지 수정</th>
            </tr>
             </thead>
            <tbody>
          <c:choose>
               <c:when test="${fn:length(list)>0}">
                <c:forEach items="${list}" var="row">  
             <tr>
               <td>${row.ORDER_NUM}</td>
                <td style="color:gray;"><font style="font-size:10pt;">${row.ORDER_DATE}</font>
                </td>
                  <td><img src="/mask/img/goods_upload/${row.GOODS_IMAGE}" width="70px" height="70px"></td>
                   <td><strong>
  
               <a href="#this" name="detail">${row.GOODS_NAME}  
               <input type="hidden" id="MEM_NUM" name="MEM_NUM" value="${session_MEMBER.MEM_NUM}">
               <input type="hidden" id="ORDER_NUM" name="ORDER_NUM" value="${row.ORDER_NUM}"></a></strong></td>
           
 	 
				   <td>${row.GOODS_AMOUNT }</td>
				   <td>${row.GOODS_CATEGORY}</td>
                   <td>${row.ORDER_TCOST}원</td>
                   <td>${row.AORDER_STATE}</td>
 				<!--  
                <c:if test="${row.AORDER_STATE}">
                입금전
                </c:if>
                <c:if test="">
                배송준비중
                </c:if>
                <c:if test="">
                배송중
                </c:if>
                <c:if test="">
                배송완료
                </c:if>
                               
                   </td>-->
<!-- 
         <td>    
              <form id="frm" name="frm">
                <select name="${map.AORDER_STATE}" id="${map.AORDER_STATE}">
                    <option value="교환요청" >교환요청</option>
                    <option value="반품요청" >반품요청</option>
                    <option value="취소요청" >취소요청</option>
                </select>
                </form>  -->
          

                 <td><a href="#this" name="write"><button class="b-btn">구매후기작성</button></a></td>
                 
                 <td><a href="#this" name="delupdate"><button class="b-btn">배송지변경</button>
                  <input type="hidden" id="ORDER_NUM" name="ORDER_NUM" value="${row.ORDER_NUM}">
                 </a></td> 
             </tr>
             </c:forEach>
             </c:when>
          <c:otherwise>
         <tr>
         <td colspan="10"> 주문 내역이 없습니다.</td>
         </tr>
      </c:otherwise>
             </c:choose>
             </tbody>
 
        </table>
        </div>     
</div>

<%@ include file="/WEB-INF/include/include-body.jspf"%>

 <script type="text/javascript">
$(document).ready(function() {

     $("a[name='detail']").on("click", function(e){
           e.preventDefault();
           fn_det($(this));
           });
       
	

	$("a[name='delupdate']").on("click", function(e){ //반품요청
		e.preventDefault();
		fn_delupdateo($(this));
	});
	
});


function fn_det(obj){
    var comSubmit = new ComSubmit();
    comSubmit.setUrl("/mask/member/openMyOrderDetail.mk");
    comSubmit.addParam("MEM_NUM", obj.parent().find("#MEM_NUM").val());
    comSubmit.addParam("ORDER_NUM", obj.parent().find("#ORDER_NUM").val());
    comSubmit.submit();
 }




function fn_delupdateo(obj){
	var comSubmit = new ComSubmit();
	if (confirm("배송지를 변경 하겠습니까?") == true){  
	comSubmit.setUrl("<c:url value='/member/orderMyDeliver.mk'/>");
	comSubmit.addParam("ORDER_NUM", obj.parent().find("#ORDER_NUM").val());
	comSubmit.submit();
	alert("배송지 변경으로 이동하겠습니다.");
	   }else{   //취소

		     return false;

		 }
	 
	}
 </script>
 

      
</body>
</html>