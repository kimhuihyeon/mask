<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var='root' value="${pageContext.request.contextPath}/" />

<c:import url="/WEB-INF/mask/layout/header.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}resources/orderDetail.css">
<style type="text/css">
	td{
	text-align: center;
	}
</style>

</head>
<body onload="init();">
<script language="JavaScript">

var sell_price;
var amount;

function init () {
	sell_price = document.frm.sell_price.value;
	amount = document.frm.amount.value;
	document.frm.sum.value = sell_price;
	change();
}

function add () {
	hm = document.frm.amount;
	sum = document.frm.sum;
	hm.value ++ ;

	sum.value = parseInt(hm.value) * sell_price;
}

function del () {
	hm = document.frm.amount;
	sum = document.frm.sum;
		if (hm.value > 1) {
			hm.value -- ;
			sum.value = parseInt(hm.value) * sell_price;
		}
}

function change () {
	hm = document.frm.amount;
	sum = document.frm.sum;

		if (hm.value < 0) {
			hm.value = 0;
		}
	sum.value = parseInt(hm.value) * sell_price;
}  

</script>





	    <div class="goodsDetail_jsp2">
   <div class="goodsDetail_jsp">

        <div class="goods-info">

            <div class="goods_img">
                <img src="/mask/img/goods_upload/${goodsInfo.GOODS_IMAGE}" alt="">
            </div>
            <div class="goods_option">
               <div class="goods_name">${goodsInfo.GOODS_NAME}</div>
               <table class="info1">
                   <tr>
                       <th>판매가</th>
                       <td style="color: crimson;" id="GOODS_NAME">${goodsInfo.GOODS_PRICE}</td>
                   </tr>
                   <tr>
                       <th>국내·해외배송</th>
                       <td>국내배송</td>
                   </tr>
                   <tr>
                       <th>배송방법</th>
                       <td>택배</td>
                   </tr>
                   <tr>
                       <th>배송비</th>
                       <td>3,000원</td>
                   </tr>
               </table>
              
                <table class="info2">
                        <tr>
                            <th>상품명</th>
                            <c:if test="${not empty list2}">
                            	<th>옵션</th>
                            </c:if>
                            <th>상품수</th>
                            <th>가격</th>
                        </tr>
                        <tr>
                            <td>${goodsInfo.GOODS_NAME}</td>
                            <c:if test="${not empty list2}">
                            <td>
                                <select id="CATEGORY">
                                    <c:forEach items="${list2}" var="row">
                                    	<option id=""${row.GOODS_CATEGORY}">${row.GOODS_CATEGORY}</option>
                                    </c:forEach>
                                </select>
                            </td>
                            </c:if>
                            <td>
                                <input type="number" min="1" class="number" value="1" id="GOODS_AMOUNT">
                            </td>
                            <td class="price" id="GOODS_PRICE">
                                <span>${goodsInfo.GOODS_PRICE}</span> <!-- 상품 가격 입력-->
                                <script>
                                    document.querySelector(".number").addEventListener("change",(event)=>{
                                        price=document.querySelector('.price > span')
                                        document.querySelector('.price > span').innerHTML=(event.target.value)*${goodsInfo.GOODS_PRICE} /*상품 각격 입력*/
                                    })
                                </script>
                            </td>
                        </tr>
                   </table>
                 	<c:if test="${session_MEMBER.MEM_NUM != null}">
                   <button onclick="insertCart();">장바구니</button>
                   <button style="width : 120px;" id="memberOrder">바로 구매하기</button>
               </c:if>
               	<c:if test="${session_MEMBER.MEM_NUM == null}">
         로그인 후 결제가 가능합니다
               </c:if>
            </div>
            
        </div>
    </div>
   
    <div class="box" >
           <c:if test="${session_MEMBER.MEM_NUM != null}">
        <div class="check-box" style="margin-bottom: 20px;"><br><br>
            <input type="button" value="상세정보" class="a">
        
            <input type="button" value="구매후기" class="b">
            <input type="button" value="상품문의" class="c">
            
        </div>
</c:if>


 <BR>
  <BR>
   <BR>
 <c:if test="${goodsInfo.GOODS_NAME =='비말차단마스크' || goodsInfo.GOODS_NAME =='미세먼지마스크'}">
        <div class="detail"> 
            <img src="${root }/img/goods_upload/design-147.jpg" alt="">
        </div>
</c:if>


 <c:if test="${goodsInfo.GOODS_NAME =='체온계'}">
        <div class="detail ">
            <img src="${root }/img/goods_upload/aaa.jpg" alt="">
        </div>
</c:if>


 <c:if test="${goodsInfo.GOODS_NAME =='손소독제'}">
        <div class="detail ">
            <img src="${root }/img/goods_upload/cedc.png" alt="">
        </div>
</c:if>


        <div class="none review2">
        <iframe src="${root }board/reviewList.mk" width="700" height="600"></iframe>
        
            <!-- <div id="form-commentInfo" style="margin-bottom:30px;"> 
                <form action="">
                    <div id="comment-count">후기 글 <span id="count">0</span></div>
                    <div><input id="comment-input" placeholder="댓글을 입력해 주세요.">
                    <button id="submit">등록</button> </div> 
                    <div id=comments> </div>
                </form>
            </div> 
            반복문
            <div class="coment">
                <table>
                    <tr>
                        <th style="width: 20%">작성자</th>
                        <th style="width: 70%">내용</th>
                        <th style="width: 10%">날짜</th>
                    </tr>
                    <tr>
                        <td>홍길동</td>
                        <td>마스크 후기1</td>
                        <td>2021-3-30</td>
                    </tr>
                    <tr>
                     <td>이순신</td>
                     <td>마스크 후기2</td>
                     <td>2021-3-30</td>
                 </tr>
                </table>
             </div> -->
<%-- 	<jsp:include page="/WEB-INF/mask/board/Review/ReviewCheck.jsp"/>  --%>
        </div>
        
        

        <div class="qna none">
            <div id="form-commentInfo" style="margin-bottom:30px;"> 
             <iframe src="${root }board/QNAopenBoardList.mk" width="700" height="600"></iframe>
               <!--  <form action="">
                    <div id="comment-count">문의글 <span id="count">0</span></div>
                    <div><input id="comment-input" placeholder="댓글을 입력해 주세요.">
                    <button id="submit">등록</button> </div> 
                    <div id=comments> </div>
                </form>
            </div> 
            반복문
            <div class="coment">
               <table>
                   <tr>
                       <th style="width: 20%">작성자</th>
                       <th style="width: 70%">내용</th>
                       <th style="width: 10%">날짜</th>
                   </tr>
                   <tr>
                    <td>홍길동</td>
                    <td>마스크 가격문의</td>
                    <td>2021-3-30</td>
                </tr>
                <tr>
                    <td>관리자</td>
                    <td> =>&nbsp;&nbsp;답변</td>
                    <td>2021-3-30</td>
                </tr>
               </table>
            </div>

            <div class="coment">
                <table style="text-align: center">
                    <tr>
                        <th style="width: 20%">작성자</th>
                        <th style="width: 70%">내용</th>
                        <th style="width: 10%">날짜</th>
                    </tr>
                    <tr>
                        <td>홍길동</td>
                        <td>마스크 가격문의</td>
                        <td>2021-3-30</td>
                    </tr>
                    <tr>
                     <td>관리자</td>
                     <td>마스크 가격문의</td>
                     <td>2021-3-30</td>
                 </tr>
                 <tr>
                     <td>홍길동</td>
                     <td>마스크 가격문의</td>
                     <td>2021-3-30</td>
                 </tr>
                </table> -->
             </div>
        
    </div>
    </div>
</div>
	
    <script>


    
        document.querySelector('.a').addEventListener('click',()=>{
            document.querySelector('.detail').classList.remove('none');
            document.querySelector('.review2').classList.add('none');
            document.querySelector('.qna').classList.add('none');
        })

        document.querySelector('.b').addEventListener('click',()=>{
            document.querySelector('.review2').classList.remove('none');
            document.querySelector('.detail').classList.add('none');
            document.querySelector('.qna').classList.add('none');
        })

        document.querySelector('.c').addEventListener('click',()=>{
            document.querySelector('.qna').classList.remove('none');
            document.querySelector('.detail').classList.add('none');
            document.querySelector('.review2').classList.add('none');
        })
        
        
        
        
        
      /*   $(document).ready(function() {

      	   $("#goodsOrder").on("click", function(e){ // 구매 버튼
      		      e.preventDefault(); 
      		      fn_GoodsOrder();   
      		   });
  		   
       		});
 */

	
        /* var doubleSubmitFlag = false;
        function doubleSubmitCheck(){
            if(doubleSubmitFlag){
                return doubleSubmitFlag;
            }else{
                doubleSubmitFlag = true;
                return false;
            }
        }//중복클릭함수
 */
      /*   function fn_GoodsOrder() { // 구매하기
     	   if(doubleSubmitCheck()) return; // 중복클릭 방지

     	   if(${session_MEMBER != null}){
     	      var arraycode = document.getElementById("GOODS_AMOUNT");
     	      var len = arraycode.length;
     	      if(len==0){
     	         alert("상품을 추가해 주세요.");
     	      }else{
     	         var comSubmit = new ComSubmit("frm");
     	         comSubmit.setUrl("<c:url value='/장바구니 주소'/>");
     	         comSubmit.submit();
     	      }
     	   }else {
     	      alert("로그인 후 이용해주세요.");
     	      location.href = "/mask/member/openLoginForm.mk";
     	   }
     	   
     	} */
        
     	document.querySelector('#memberOrder').addEventListener('click',()=>{
     		event.preventDefault();
     		
     		const GOODS_NAME=`${goodsInfo.GOODS_NAME}`;
            const GOODS_CATEGORY=document.querySelector('#CATEGORY').value;
            const GOODS_AMOUNT=document.querySelector('#GOODS_AMOUNT').value;
            const GOODS_IMAGE=`${GOODS_IMAGE}`;
            const GOODS_PRICE=`${goodsInfo.GOODS_PRICE}`;
            const ORDER_TCOST=${goodsInfo.GOODS_PRICE}*GOODS_AMOUNT;
            const MEM_NUM=${goodsInfo.MEM_NUM};
           	const GOODS_NUM=`${goodsInfo.GOODS_NUM}`;

            console.log("GOODS_NAME : "+GOODS_NAME);
            console.log("GOODS_CATEGORY : "+GOODS_CATEGORY);
            console.log("GOODS_AMOUNT : "+GOODS_AMOUNT);
            console.log("ORDER_PRICE : "+GOODS_PRICE);
            console.log("MEM_NUM : "+MEM_NUM);
            
            
            location.href="${root}member/goodsOrder.mk?MEM_NUM="+MEM_NUM+"&&GOODS_NAME="+GOODS_NAME+"&&GOODS_NUM="+GOODS_NUM+"&&GOODS_CATEGORY="+GOODS_CATEGORY+"&&GOODS_AMOUNT="+GOODS_AMOUNT+"&&GOODS_PRICE="+GOODS_PRICE+"&&ORDER_TCOST="+ORDER_TCOST+"&&A=";

            
     	})
       
     function insertCart(){
     		event.preventDefault();
     		const GOODS_NUM=`${goodsInfo.GOODS_NUM}`;
     		const GOODS_CATEGORY=document.querySelector('#CATEGORY').value;
     		const GOODS_AMOUNT=document.querySelector('#GOODS_AMOUNT').value;
     		const GOODS_PRICE=${goodsInfo.GOODS_PRICE};
     		const ORDER_TCOST=document.querySelector('#GOODS_PRICE span').innerHTML;
            
     		
     		console.log(GOODS_CATEGORY);
     		console.log(ORDER_TCOST);
            console.log(GOODS_AMOUNT);
     		console.log(GOODS_NUM);
     		console.log(GOODS_PRICE);
     		
           $.ajax({

   	         type:"GET",
   	         url: "${root}member/addCart.mk?GOODS_NUM="+GOODS_NUM+"&&GOODS_CATEGORY="+GOODS_CATEGORY+"&&GOODS_AMOUNT="+GOODS_AMOUNT+"&&ORDER_TCOST="+ORDER_TCOST+"&&GOODS_PRICE"+GOODS_PRICE,
   	         success:function(data){
   	        	 alert('추가되었습니다.');
   	         }

   	  }); 
            
     }
        	
    </script>

</body>
</html>