<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  

<c:set var='root' value="${pageContext.request.contextPath }/"/>
<c:import url="/WEB-INF/mask/layout/header.jsp"/>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="${root}resources/jquery.bxslider.min.js"></script>
    <script src="${root}resources/jquery.bxslider.js"></script>
    <link rel="stylesheet" href="${root}resources/main.css">
    <title>Document</title>
</head>
<style>
/* Google Web Fonts CDN */
@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400,500,700,900&display=swap');

/*header*/

body{
    font-family: 'Noto Sans KR', sans-serif;
    color:#222;
    line-height: 1.5em;
    background: #f4f4f4;
}

a{ 
    color:#222;
    text-decoration:none; 
}


.header{
    position: relative;
    text-align: center;
    height:58px;
    background: white;
    margin-bottom: 10px;
    border-bottom: 1px solid lightgray;
    min-width: 1010px;
}

.logo, .menu,form{
    display: inline-block;
}

.logo{
    position: absolute;
    left:0;
    top:50%;
    transform:translateY(-50%);
    margin-left: 13px;
    font-weight: bold;
}


.menu{
    position: absolute;
    left:50%;
    top:50%;
    transform:translate(-50%,-50%);
    font-size: 0;
    width:415px;
}

.menu a{
    display: inline-block;
    font-size:16px;
    padding:18px 12px;
    transition: .2s;
}

.menu a:hover{
    background: rgb(48, 44, 44);
    color:white;
}


.header-container{
    position: absolute;
    right:0;
    top: 50%;
    transform: translateY(-50%);
    font-size: 10px;
    margin-right: 20px;
}

.header-container a{
    padding:6px;
}

.header-container a:hover {
    color:rgb(136, 131, 131);
} 


/*main.css*/

.box{
    margin-top: 40px;
}

/* 배너사이즈와 위치 */
#s_banner_wrap {
    /* width:300px;  */
    height:300px; 
    position: relative; 
    margin:10px 0
}

.banner_01 {
    height:400px; 
}

.banner_02 {
    /*  */
    height:400px; 
}

.banner_03{
    height:400px; 
}

.banner_01 img, .banner_02 img, .banner_03 img{
    width:inherit;
    height:inherit;
}


.bx-wrapper .bx-controls-direction a {
    position: absolute;top: 50%;	
    margin-top: -16px;
    outline: 0;
    width: 32px;
    height: 32px;
    text-indent: -9999px;
    z-index: 9999;
}

.bx-wrapper .bx-prev {
    left: 10px;	
    background: url(images/controls.png) no-repeat 0 -32px;
}

.bx-wrapper .bx-next {
    right: 10px;	
    background: url(./images/controls.png) no-repeat -43px -32px;
}


.bx-wrapper .bx-pager.bx-default-pager a.active {
    background: #000;
}

.bx-wrapper .bx-pager.bx-default-pager a {
    background: #ccc;
    text-indent: -9999px;
    display: block;	
    width: 10px;
    height: 10px;
    margin: 0 5px;	
    outline: 0;	
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;	
    border-radius: 5px;
}

.bx-wrapper .bx-pager .bx-pager-item,
.bx-wrapper .bx-controls-auto .bx-controls-auto-item {
    display: inline-block;
    *zoom: 1;
    *display: inline;
}

.bx-wrapper .bx-pager {
    text-align: center;
    font-size: .85em;
    font-family: Arial;
    font-weight: bold;
    color: #ccc;
    padding-top: 20px;
}

.bx-wrapper .bx-pager,
.bx-wrapper .bx-controls-auto {
    position: absolute;	
    bottom: 10px;
    width: 100%;
	display: none;
}

.main{
    height:1000px;
}

.main .items{
    position: absolute;
    left:50%;
    transform:translateX(-50%);
    width:1000px;
    margin-top:60px;
    /* border:1px solid red; */
    text-align: center;
    height:500px;
}

/*items*/

.main #center{
    margin:70px;
    margin-bottom: 100px;
}

.main .items{
    z-index: 2;
}


.main .items .center{
    /* border:1px solid dodgerblue; */
    margin:20px;
    margin-bottom: 50px;
    font-weight: bold;
    font-size: 40px;
    

}

.main .item{
    display:inline-block;
    /* border:1px solid; */
    border-radius: 5px;
    overflow: hidden;
    position: relative;
    margin-left:30px;
    
}

.main .item:hover .detail {
    bottom: 0;
}

.main .detail{
    background-color:#f8f8f8;
    position: absolute;
    bottom: -210px;
    left:0;
    width:100%;
    height:250px;
    transition: 0.5s;
}

.main .item:hover  .detail{
    bottom:-100px;
}



.main .item:hover  img{
    filter: blur(1.5px);
}

.main input[type=radio]{
    display: none;
}

.main .title{
    border-bottom:1px solid #ddd;
    overflow: hidden;
}

.main .title h2{
    font-size:16px;
    color:#888;
    line-height: 1.2em;
    float:left;
    /* border:1px solid dodgerblue; */
    margin-left: 10px;
}

.main .title span{
    font:right;
    margin-top:10px;
    font-size:13px;
    /* color:crimson; */
    float:right;
    /* border:1px solid green; */
    margin-right:10px;
}

.main .info{
    /* border: 1px solid rebeccapurple; */
}

.main .size{
    /* border:1px solid salmon;
    background: khaki; */
    position: relative;
    
}

.main .size label{
    
}
.main .size label:nth-child(1){
    position: absolute;
    left:0;
    top:0;
    margin-left:10px;
}

.main .amount label,input {
    display: inline-block;
}

.main .amount{
    /* position: absolute;
    left:0; */
    text-align: left;
    margin: 10px;
}
.main input[type=text]{
    size:5px;
    outline: none;
    margin-left:10px;
}

.main .add-cart{
    display: block;
    position: absolute;
    left:50%;
    transform:translateX(-50%);
    outline: none;
    cursor:pointer;
    width:100%;
    border: 1px solid #ddd;
    padding:7px;
}

.main .size label:nth-child(2),
.main .size label:nth-child(3),
.main .size label:nth-child(4){
    display: inline-block;
    width:20px;
    height:20px;
    font-size: 10px;
    cursor: pointer;
    border-radius: 3px;
    text-align: center;
    line-height: 20px;
}

.main .size label:nth-child(2):hover,
.main .size label:nth-child(3):hover,
.main .size label:nth-child(4):hover,
.main input[id=S1]:checked ~ .size label[for=S1],
.main input[id=M1]:checked ~ .size label[for=M1],
.main input[id=L1]:checked ~ .size label[for=L1],
.main input[id=S2]:checked ~ .size label[for=S2],
.main input[id=M2]:checked ~ .size label[for=M2],
.main input[id=L2]:checked ~ .size label[for=L2],
.main input[id=S3]:checked ~ .size label[for=S3],
.main input[id=M3]:checked ~ .size label[for=M3],
.main input[id=L3]:checked ~ .size label[for=L3],
.main input[id=S4]:checked ~ .size label[for=S4],
.main input[id=M4]:checked ~ .size label[for=M4],
.main input[id=L4]:checked ~ .size label[for=L4]
{
    background: rgb(104, 101, 101);
    color:white;
}

.main .add-cart:hover{
    background-color: rgb(104, 101, 101);
    color:#fff;
    
}


.bx-wrapper .bx-viewport {	/*fix other elements on the page moving (on Chrome)*/-webkit-transform: translatez(0);-moz-transform: translatez(0);-ms-transform: translatez(0);-o-transform:translatez(0);transform: translatez(0);}
.bx-wrapper .bx-viewport ul {margin:0px; padding:0px;}



</style>


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

<script>
    $(document).ready(function(){
        var slider = $('.bxslider').bxSlider({
                auto: true, mode:'fade',
            });
    });


    function price_change(id){

        const idv='#'+id.replace('GOODS_AMOUNT','');

        console.log(idv);

        const amount=document.querySelector(id).value;

        console.log(amount);
        document.querySelector('#GOODS_PRICE').innerHTML=` `;
    }

  function price_change(id,GOODS_BASKET_NUM){
		
        const idv='#'+id;
            /* const idv='#'+id.replace('GOODS_AMOUNT',''); */
      
        const goods_price=id.replace('GOODS_AMOUNT','');
            console.log("GOODS_BASKET_NUM :" + GOODS_BASKET_NUM);
        console.log(idv);
        console.log(goods_price);
      
        const amount=document.querySelector(idv).value;
        console.log(amount);
  
        const goods_price_value='#GOODS_PRICE'+GOODS_BASKET_NUM
  
        document.querySelector(goods_price_value).innerHTML=amount*goods_price;
    }


    </script>
<body>
    <!-- 메인 -->
    
     <center>
    <div class="box">
    <div id="s_banner_wrap">
        <ul class="bxslider">
          <li class="banner_01">
              <img src="${root}resources/images/마스크베너2.jpg" alt="이미지">
          </li>
          <li class="banner_02">
              <img src="${root}resources/images/마스크베너3.png" alt="">
          </li>
          <li class="banner_03">
            <img src="${root}resources/images/마스크베너3.png" alt="">
          </li>
        </ul>
    </div>
    </div>
</center>


    <div class="main">
        <div class="items">
            <form> <!--장바구니-->
            <div class="center" id="center" style="padding-top: 70px; padding-bottom: 60px;">BEST ITEMS TOP3</div>
            
            
             <!--      <div class="item">
                <img src="${root}resources/images/마스크3.jpg" style="width: 209" height="250">  
                                   <c:choose>
               <c:when test="${fn:length(list7)>0}">
                <div class="detail">
                    <div class="title">
                        <h2>${list7.get(0).GOODS_NAME}</h2>
                        <span>${list7.get(0).GOODS_PRICE}</span>
                    </div>
                    <div class="info">
                      
                      <div class="amount" style="display: inline-block;">
                            <label>수량</label>
                            <input type="number" min="1"  id="GOODS_AMOUNT" value="1" name="GOODS_AMOUNT" size="2" style="width: 40px">
                        </div>	
                        
                        
                           <span>
                           <select id="CATEGORY">
                                    <c:forEach items="${list8}" var="row5">
                                    	<option value="${row5.GOODS_CATEGORY}">${row5.GOODS_CATEGORY}</option>
                                    </c:forEach>
                           </select>
                       </span>
                    </div>
                    
                    <button class="add-cart" id="btn1_${list7.get(0).GOODS_NUM}" onclick="insertCart1(id);" >Add to Cart</button>
                    
                </div>
                    
				</c:when>

				</c:choose>
                <!--속성
            </div>  -->
            
             <div class="item">
                <img src="${root}resources/images/마스크2.jpg" style="width: 209" height="250">  
                                   <c:choose>
               <c:when test="${fn:length(list5)>0}">
                <div class="detail">
                    <div class="title">
                        <h2>${list5.get(0).GOODS_NAME}</h2>
                        <span>${list5.get(0).GOODS_PRICE}</span>
                    </div>
                    <div class="info">
                      
                      <div class="amount" style="display: inline-block;">
                            <label>수량</label>
                            <input type="number" min="1"  id="GOODS_AMOUNT" value="1" name="GOODS_AMOUNT" size="2" style="width: 40px">
                        </div>	
                      <span>
                           <select id="CATEGORY7">
                                    <c:forEach items="${list6}" var="row3">
                                    	<option value="${row3.GOODS_CATEGORY}">${row3.GOODS_CATEGORY}</option>
                                    </c:forEach>
                           </select>
                       </span>
                    </div>
                    
                    <button class="add-cart" id="btn1_${list5.get(0).GOODS_NUM}" onclick="insertCart1(id);" >Add to Cart</button>
                    
                </div>
                    
				</c:when>

				</c:choose>
                <!--속성-->
            </div> 
  

            <div class="item">
                <img src="${root}resources/images/손소독제.jpg" width=209 height=250>
                 <div class="detail">
          <c:choose>
               <c:when test="${fn:length(list3)>0}">
                <c:forEach items="${list3}" var="row1"> 
             
                    <div class="title">
                    
                    <h2>${row1.GOODS_NAME}</h2>
                      <div class="price" id="GOODS_PRICE">
                        <span>${row1.GOODS_PRICE}</span>
                        
                        </div>
                    </div>
                      <div class="info">
                           
                	  <div class="amount" style="display: inline-block;">
                            <label>수량</label>
                        
                             <input type="number" value="1" min="1"  class="number" size="3" style="width: 40px" min="1"  name="GOODS_AMOUNT" id="GOODS_AMOUNT">
                    
                      
                        </div> 
                    <span>
                                <select id="CATEGORY1">
                                    <c:forEach items="${list4}" var="row5">
                                    	<option id=""${row5.GOODS_CATEGORY}">${row5.GOODS_CATEGORY}</option>
                                    </c:forEach>
                                </select>
                                </span>  
                    </div>
                    
                     <input type="hidden" id="GOODS_NUM" name="GOODS_NUM" value="${row5.GOODS_NUM}">
                     <button class="add-cart" id="btn1_${list3.get(0).GOODS_NUM}" onclick="insertCart2(id);">Add to Cart</button>
                        		</c:forEach>
				</c:when>

				</c:choose>
                </div>
                
                <!--속성-->
            </div>
           
   <div class="item">
             <img src="${root}resources/images/체온계.jpg" width=209 height=250>
               
                        <c:choose>
               <c:when test="${fn:length(list)>0}">
                <c:forEach items="${list}" var="row"> 
                                <div class="detail">
               
                
                    <div class="title">
                        <h2>${row.GOODS_NAME}</h2>
                        <div class="price" id="GOODS_PRICE2">
                        <span>${row.GOODS_PRICE}</span>
                                </div>
                    </div>
                    
                    <div class="info">
                    	
                      <div class="amount" style="display: inline-block;">
         
         
                            <label>수량</label>
                            <input type="number" value="1" min="1" class="number" size="3" style="width: 40px" min="1" id="GOODS_AMOUNT">
                       </div>
                              <span>
                                <select id="CATEGORY2">
                                    <c:forEach items="${list2}" var="row4">
                                    	<option id=""${row4.GOODS_CATEGORY}">${row4.GOODS_CATEGORY}</option>
                                    </c:forEach>
                                </select>
                                </span>
                    </div>
                    
                    <button class="add-cart" id="btn1_${list.get(0).GOODS_NUM}" onclick="insertCart3(id);" >Add to Cart</button>
       				</div> 
                		</c:forEach>
				</c:when>

				</c:choose>
               
                
                <!--속성-->
                 </div>
            </form>           
        </div> 
        </div>
</body>


<script type="text/javascript">
    <c:choose>
    <c:when test="${fn:length(list7)>0}">
     <c:forEach items="${list7}" var="row1"> 
     
     var obj = $("[name=CATEGORY]");
     var chkArray = new Array(); //배열 선언

     $('input:checkbox[name=CATEGORY]:checked').each(function() { //체크된 값을 가져옴
        chkArray.push(this.value);
     });
     $('#GOODS_CATEGORY').val(chkArray);

     
	  function insertCart4(id){
   		event.preventDefault();
   		const idv="#"+id;
   		console.log("idv : "+idv);
   		const GOODS_NUM=`${row1.GOODS_NUM}`;
   		const GOODS_CATEGORY=document.querySelector('#CATEGORY').value;
   		const GOODS_AMOUNT=$(idv).parent('div').find('#GOODS_AMOUNT').val();
   		const ORDER_TCOST=$(idv).parent('div').find('.title').find('span').text();
          
   		

   		
   		console.log(GOODS_CATEGORY);
        console.log("GOODS_AMOUNT : "+GOODS_AMOUNT);
   		console.log(GOODS_NUM);
   		console.log(ORDER_TCOST);
   		
         $.ajax({

 	         type:"GET",
 	        url: "${root}shop/mainaddCart.mk?GOODS_NUM="+GOODS_NUM+"&&GOODS_CATEGORY="+GOODS_CATEGORY+"&&GOODS_AMOUNT="+GOODS_AMOUNT,
 	 	            success:function(data){
 	        	 alert('추가되었습니다.');
 	         }

 	  }); 
          
   }
		</c:forEach>
		</c:when>

		</c:choose>
	</script>


	<script type="text/javascript">
	
	
    <c:choose>
    <c:when test="${fn:length(list5)>0}">
     <c:forEach items="${list5}" var="row1"> 
     
     var obj = $("[name=CATEGORY]");
     var chkArray = new Array(); //배열 선언

     $('input:checkbox[name=CATEGORY]:checked').each(function() { //체크된 값을 가져옴
        chkArray.push(this.value);
     });
     $('#GOODS_CATEGORY').val(chkArray);

     
     
     
	  function insertCart1(id){
   		event.preventDefault();
   		const idv="#"+id;
   		console.log("idv : "+idv);
   		const GOODS_NUM=`${row1.GOODS_NUM}`;
   		const GOODS_CATEGORY=document.querySelector('#CATEGORY7').value;
   		const GOODS_AMOUNT=$(idv).parent('div').find('#GOODS_AMOUNT').val();
   		const ORDER_TCOST=$(idv).parent('div').find('.title').find('span').text();
          
   		
   		console.log(GOODS_NUM);
   		console.log(GOODS_CATEGORY);
        console.log(GOODS_AMOUNT);
   		console.log(GOODS_NUM);
   		
         $.ajax({

 	         type:"GET",
 	        url: "${root}shop/mainaddCart.mk?GOODS_NUM="+GOODS_NUM+"&&GOODS_CATEGORY="+GOODS_CATEGORY+"&&GOODS_AMOUNT="+GOODS_AMOUNT,
 	 	         success:function(data){
 	        	 alert('추가되었습니다.');
 	         }

 	  }); 
          
   }
		</c:forEach>
		</c:when>

		</c:choose>
	</script>




	<script type="text/javascript">
    <c:choose>
    <c:when test="${fn:length(list3)>0}">
     <c:forEach items="${list3}" var="row1"> 
     
     var obj = $("[name=CATEGORY]");
     var chkArray = new Array(); //배열 선언

     $('input:checkbox[name=CATEGORY]:checked').each(function() { //체크된 값을 가져옴
        chkArray.push(this.value);
     });
     $('#GOODS_CATEGORY').val(chkArray);

     
	  function insertCart2(id){
   		event.preventDefault();
   		const idv="#"+id;
   		console.log("idv : "+idv);
   		const GOODS_NUM=`${row1.GOODS_NUM}`;
   		const GOODS_CATEGORY=document.querySelector('#CATEGORY1').value;
   		const GOODS_AMOUNT=$(idv).parent('div').find('#GOODS_AMOUNT').val();
   		const ORDER_TCOST=$(idv).parent('div').find('.title').find('span').text();
          
   		console.log(GOODS_CATEGORY);
        console.log(GOODS_AMOUNT);
   		console.log(GOODS_NUM);
   		
         $.ajax({

 	         type:"GET",
 	         url: "${root}shop/mainaddCart.mk?GOODS_NUM="+GOODS_NUM+"&&GOODS_CATEGORY="+GOODS_CATEGORY+"&&GOODS_AMOUNT="+GOODS_AMOUNT,
 	         success:function(data){
 	        	 alert('추가되었습니다.');
 	         }

 	  }); 
          
   }
		</c:forEach>
		</c:when>

		</c:choose>
	</script>



<!-- 체온계 -->

	<script type="text/javascript">

	  <c:choose>
	    <c:when test="${fn:length(list)>0}">
	     <c:forEach items="${list}" var="row1"> 


	  function insertCart3(id){
   		event.preventDefault();
   		const idv="#"+id;
   		console.log("idv : "+idv);
   		const GOODS_NUM=`${row1.GOODS_NUM}`;
   		const GOODS_CATEGORY=document.querySelector('#CATEGORY2').value;
   		const GOODS_AMOUNT=$(idv).parent('div').find('#GOODS_AMOUNT').val();
   		const ORDER_TCOST=$(idv).parent('div').find('.title').find('span').text();
   		
   		
   		console.log(GOODS_CATEGORY);
        console.log(" GOODS_AMOUNT : "+ GOODS_AMOUNT);
   		console.log(GOODS_NUM);
   		
         $.ajax({

 	         type:"GET",
 	         url: "${root}shop/mainaddCart.mk?GOODS_NUM="+GOODS_NUM+"&&GOODS_CATEGORY="+GOODS_CATEGORY+"&&GOODS_AMOUNT="+GOODS_AMOUNT,
 	         success:function(data){
 	        	 alert('추가되었습니다.');
 	         }

 	  }); 
          
   }

		</c:forEach>
		</c:when>

		</c:choose>
	</script>
	
	
	



</html>