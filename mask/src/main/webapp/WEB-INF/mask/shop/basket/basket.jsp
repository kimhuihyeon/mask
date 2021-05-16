<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<c:set var='root' value="${pageContext.request.contextPath}/" />
<c:import url="/WEB-INF/mask/layout/header.jsp"/>
<%@ include file="/WEB-INF/include/include-body.jspf"%>

<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.order:hover{
		opacity: .8;
	}
</style>
</head>
<body>
   <div class="cart">
     <div class="container">
     <label>장바구니 <i class="fas fa-shopping-cart"></i> </label>
            <div class="all-select"><button onclick="delete_basket_num(id)">전체삭제</button></div>
            
              
            <table>
            <thead>
                <tr>
                    <th style="width:200px;">이미지</th>
                    <th>상품명</th>
                    <th>옵션</th>
                    <th>수량</th>
                    <th>가격</th>
                    <th>수정/삭제</th>
                </tr>
             </thead>
                <!--for문-->
             <tbody>
             		<c:forEach items="${list}" var="row" varStatus="status">
             			<%-- <input type="hidden" name="GOODS_BASKET_NUM" value="${row.GOODS_BASKET_NUM}">
             			<input type="hidden" name="MEM_NUM" value="${session_MEMBER.MEM_NUM}">
                        <input type="hidden" name="GOODS_NUM" value="${row.GOODS_NUM}">
                        <input type="hidden" name="GOODS_NAME" value="${row.GOODS_NAME}">
                        <input type="hidden" name="GOODS_PRICE" value="${row.GOODS_PRICE}">
                        <input type="hidden" name="GOODS_CATEGORY" value="${row.GOODS_CATEGORY}">
                        <input type="hidden" name="GOODS_IMAGE" value="${row.GOODS_IMAGE}">
                        <input type="hidden" name="GOODS_AMOUNT" value="${row.GOODS_AMOUNT}">
                        <input type="hidden" name="TCOST" value="${row.TCOST}"> --%>
                        <tr>
                        	<td>
                        		<img src="/mask/img/goods_upload/${row.GOODS_IMAGE}" width="200" height="200" alt="X">
                        	</td>
                        	<td>${row.GOODS_NAME}&nbsp;&nbsp;&nbsp;</td>
                        	<td>
                     		<!--if문 구매한 옵션에 check : selected-->
                      		  <div>
                       			 ${row.GOODS_CATEGORY}
                      		  </div>
                		    </td>
                        	<td style="text-align: center">
                        		<input type="number" id="GOODS_AMOUNT${row.GOODS_BASKET_NUM }" onchange="GOODS_AMOUNT_CHANGE(id);" class="number" name="GOODS_AMOUNT" value="${row.GOODS_AMOUNT}" min="1" style="width:40px; text-align:right">
                        	</td>
                        	<td style="text-align: center">
                        		<span class='price'>${row.GOODS_PRICE * row.GOODS_AMOUNT}</span>
                        		<input type="hidden" value="${row.GOODS_PRICE}" id="GOODS_PRICE2">
                        		<script type="text/javascript">
                        			
                        		</script>
                        	</td>
                        	<td>
                       			 <button class="btn" id="btn1_${row.GOODS_BASKET_NUM}" onclick="update_goods_amount(id)">수정</button>
                       			 <button class="btn" id="btn2_${row.GOODS_BASKET_NUM}" onclick="delete_basket_num(id)">삭제</button>
                   			</td>
                        </tr>
                       </c:forEach>	
            </tbody>
    
            </table>
            <!-- <script type="text/javascript">
            	 var price1 = document.getElementsByName("row.GOODS_PRICE");
            	 var price2 = Number(price1);
                 document.querySelector(".number").addEventListener("change",(event)=>{
                 price=document.querySelector('.price')
                 document.querySelector('.price').innerHTML=(event.target.value)*price2/*상품 각격 입력*/
           		 })
          </script> -->
        
        </div>
       <button onclick="location.href='${root}order/basketOrder.mk?MEM_NUM=${MEM_NUM}'"
       class="btn" style="float: right; transform:translateX(-180px); margin-top: 20px; padding:10px; border: 1px solid lightgray; border-radius: 4px;">주문하기</button>
       <input type="hidden" id="ORDER_NUM" name="ORDER_NUM" value="${row.ORDER_NUM}"zz></a>
    </div>
   <!--  <script>
        let price=0;
        document.querySelectorAll('.price').forEach((element)=>{
            element.
        })
    </script> -->
    
    <script>
/* 
function fn_amount(index){
	   var array1 = document.getElementsByName("GOODS_AMOUNT"); //수량
	   var array2 = document.getElementsByName("chk");
       var mem_num = document.getElementsByName("MEM_NUM");
	   var amount = Number(array1[index].value);
	   var basket_num = array2[index].value;
	   var result = (amount>=1);
	   
	   if(amount=!null && amount>0){
	    	  var comSubmit = new ComSubmit();
	    	  comSubmit.setUrl("<c:url value='/shop/basketModify.mk'/>");
	    	  comSubmit.addParam("MEM_NUM", MEM_NUM)
	    	  comSubmit.addParam("GOODS_AMOUNT", array1[index].value);
	    	  comSubmit.addParam("GOODS_BASKET_NUM", GOODS_BASKET_NUM);
	    	  comSubmit.submit();
	   }else{
	      alert("유효한 숫자가 아닙니다.");   
	      return false;
	   }
	}
function delchk(){
    return confirm("삭제하시겠습니까?");
}

function fn_delete(index){
	   var array4 = document.getElementsByName("chk");
	   var basket_num = array4[index].value;

	   if(confirm("삭제하시겠습니까?")){
	      var comSubmit = new ComSubmit();
	      comSubmit.setUrl("<c:url value='/shop/basketDelete.mk' />");
	      comSubmit.addParam("GOODS_BASKET_NUM", GOODS_BASKET_NUM);
	      comSubmit.submit();
	   }
	   return false;
	}
function fn_order(){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/order/basketOrder.mk' />");
	conSubmit.addParam("MEM_NUM", obj.parent().find("#MEM_NUM").val());
	comSubmit.submit();
}

$(document).ready(function() {

	$("a[name='update']").on("click", function(e){
		e.preventDefault();
		fn_amount($(this));
		});

	$("a[name='delete']").on("click", function(e){
		e.preventDefault();
		fn_delete($(this));
		});

	$("a[name='order']").on("click", function(e){
		fn_order();
		});
)};


console.log()
 */

 
 function delete_basket_num(id){

     console.log(id);

     const GOODS_BASKET_NUM=id.replace("btn2_","");
     console.log("GOODS_BASKET_NUM : "+GOODS_BASKET_NUM);
	
     if(id!=""){
     $.ajax({

         type:"GET",
         url: "${root}shop/basket_num_delete.mk?GOODS_BASKET_NUM="+GOODS_BASKET_NUM,
         success:function(data){
            $('body').load("${root}shop/basket.mk"); 
         }

      });
     }else{
    	 $.ajax({

             type:"GET",
             url: "${root}shop/basket_num_delete.mk",
             success:function(data){
                $('body').load("${root}shop/basket.mk"); 
             }

          });
     }
     
  }
 	
  function update_goods_amount(id){
	  
	  console.log(id);
	  
	  
	  const idv="#"+id;
	  
	  const GOODS_BASKET_NUM=id.replace("btn1_","");
	  
	  const amount="#GOODS_AMOUNT"+GOODS_BASKET_NUM;
	  console.log("amount: "+amount);
	  console.log("GOODS_BASKET_NUM : "+GOODS_BASKET_NUM);
	  
	  const GOODS_AMOUNT=$(idv).parent('td').parent('tr').find(amount).val();
	  
	  const TCOST=$(idv).parent('td').parent('tr').find('.price').text();
	  console.log("TCOST : "+TCOST);
	  console.log(GOODS_AMOUNT);
	  
	  $.ajax({

	         type:"GET",
	         url: "${root}shop/update_goods_amount.mk?GOODS_BASKET_NUM="+GOODS_BASKET_NUM+"&&GOODS_AMOUNT="+GOODS_AMOUNT+"&&TCOST="+TCOST,
	         success:function(data){
	        	 alert('변경되었습니다.');
	            $('body').load("${root}shop/basket.mk"); 
	         }

	  });
	  
	  
	  
	  
  }
  function GOODS_AMOUNT_CHANGE(id) {
	  
		console.log(id);
		
		const idv='#'+id;
		
		console.log(idv);
		
		const amount=document.getElementById(id).value;
		
		console.log(amount);
		
		const price=$(idv).parent('td').parent('tr').find('#GOODS_PRICE2').val();
		
		console.log(price);
		
		const value=amount*price;
      	
		$(idv).parent('td').parent('tr').find('.price').text(value);
		
	}
 
</script>



</script>
</body>
</html>