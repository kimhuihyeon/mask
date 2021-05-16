<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<html lang="ko">
<%@ include file="/WEB-INF/mask/layout/admin/layout.jsp"%>

<head>

</head>
  <h3>${title }</h3> 
<div align="center">
      <h3>상품등록</h3> 
</div>
<br>
<div align="center" class="container" style="width:60%;">
<form name="frm" id="frm" enctype="multipart/form-data" method="post" action="/admin/goodsUpdate.mk" >
	
	
      <table align="center" style="border:none; cellpadding:10px; cellspacing:10px; width:100%;">
            
            <tr>
               <th>이름</th>
               
               <td>
                  <input type="text" id="GOODS_NAME" name="GOODS_NAME" placeholder="상품이름입력" size="40" class="form-control"
                  style="padding:auto;" value=<c:if test="${type eq 'modify'}">"${map.GOODS_NAME}"</c:if>>
               </td>
            </tr>
            
            
            <tr>
               <th>내용</th>
               <td>
  <textarea id="GOODS_CONTENT" name="GOODS_CONTENT">
   <c:if test="${type eq 'modify'}">${map.GOODS_CONTENT}</c:if>
  </textarea>
  
  
               </td>
               
            </tr>
         
      
       
            <tr>
               <th>카테고리&nbsp;&nbsp;</th>
               
               <td>
                  <select name="GOODS_CATEGORY" style="width:200px;">
                     <option value="s">s</option>
                     <option value="m">m</option>
                     <option value="l">l</option>
                     <option value="200ml">200ml</option>
                     <option value="200ml">500ml</option>
                      <option value="선택없음">선택없음</option>
                  </select>
               </td>
            </tr>
            
              <tr>
               <th>원가&nbsp;&nbsp;</th>
               <td>
                  <input type="text" name="GOODS_CPRICE" id="GOODS_CPRICE" placeholder="상품회원가" size="40"  class="form-control"
                  style="padding:10px; width:70%;" value=<c:if test="${type eq 'modify'}">"${map.GOODS_CPRICE}"</c:if>> 
               </td>
            </tr>
            
            
            <tr>
               <th>등록가&nbsp;&nbsp;</th>
               <td>
                  <input type="text" name="GOODS_PRICE" id="GOODS_PRICE" placeholder="상품회원가" size="40"  class="form-control"
                  style="padding:10px; width:70%;" value=<c:if test="${type eq 'modify'}">"${map.GOODS_PRICE}"</c:if>>
               </td>
            </tr>
       <tr>
               <th>상태&nbsp;&nbsp;</th>
               <td>
                  <input type="checkbox" name="STATUS" id="STATUS" value="신상" style="padding:10px;"> 신상
                  <input type="checkbox" name="STATUS" id="STATUS" value="품절" style="padding:10px;"> 품절
                  <input type="checkbox" name="STATUS" id="STATUS" value="할인" style="padding:10px;"> 할인
                  <input type="checkbox" name="STATUS" id="STATUS" value="비활" style="padding:10px;"> 비활
                  <input type="hidden" name="GOODS_STATUS" id="GOODS_STATUS" value="">
               </td>
            </tr>
   <tr>
               <th>상품수량 </th>
               <td>
               <input type="text" name="GOODS_STOCK" id="GOODS_STOCK" placeholder="상품수량" size="40"  class="form-control"
               style="padding:10px; width:70%;" value=<c:if test="${type eq 'modify'}">${map.GOODS_STOCK}</c:if>>
               <%-- <input type="hidden" id="IDX" name="IDX" value="${map.GOODS_NUM}">  --%>
               </td>
            </tr>
            
      </table>
     
       <div align="center">
   <c:if test="${type eq 'write'}"><a href="#this" class="btn btn-primary" id="write" onClick="fn_chk()">작성하기</a></c:if>
    <c:if test="${type eq 'modify'}"><a href="#this" class="btn btn-primary" id="update" onClick="fn_chk()">수정하기
    	<input type="hidden" name="IDX" id="IDX" value="${map.GOODS_NUM}">
    </a></c:if> 
   <input type="button" value="목록으로" class="btn btn-outline-primary" onclick="location.href='http://localhost:8011/mask/admin/goodsList.mk'">
   </div> 
   
   </form>
 <%@ include file="/WEB-INF/include/include-body.jspf" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript">
CKEDITOR.replace('GOODS_CONTENT',{
	   filebrowserUploadUrl:"${pageContext.request.contextPath}/ckeditor/fileupload.mk",     height : 500 });

var gfv_count = 1;

$(document).ready(function() {
	   $("#write").on("click", function(e){ //작성하기 버튼
	      e.preventDefault();
	      fn_insertBoard();
	   });
	    $("#update").on("click", function(e){ //수정하기 버튼
			e.preventDefault();
			fn_updateGoods();	
			fn_updateGoods2();
		}); 
	});


function fn_insertBoard() { // 유효성체크
	   var comSubmit = new ComSubmit("frm"); // 객체생성
	   comSubmit.setUrl("<c:url value='/admin/goodsInsert.mk'/>"); // url설정
	   comSubmit.set
	   
	    // 게시글 제목 필요
	    if(!$("#GOODS_NAME").val()){
	        alert("제목를 입력해주세요.");
	        $("#GOODS_NAME").focus();
	        return false;
	    }
	       // 게시글 내용 필요
	    if(CKEDITOR.instances.GOODS_CONTENT.getData() =='' 
	            || CKEDITOR.instances.GOODS_CONTENT.getData().length ==0){
	        alert("내용을 입력해주세요.");
	        $("#GOODS_CONTENT").focus();
	        return false;
	    }
	       
	    // 상품원가 
	    if(!$("#GOODS_CPRICE").val()){
	        alert("상품원가를 입력해주세요.");
	        $("#GOODS_CPRICE").focus();
	        return false;
	    }

	    // 판매가
	    if(!$("#GOODS_PRICE").val()){
	        alert("비회원가를 입력해주세요.");
	        $("#GOODS_NMPRICE").focus();
	        return false;
	    }
	      // HASH
	     if(!$("#GOODS_STATUS").val()){
	        alert("STATUS을 선택해주세요.");
	        return false;
	    }
	 /*   // 사이즈
	    if(!$("#GOODS_ATT_SIZE").val()){
	        alert("상품사이즈를 선택해주세요.");
	        return false;
	    }  
	    // 컬러
	    if(!$("#GOODS_COLOR").val()){
	        alert("상품컬러를 입력해주세요.");
	        $("#GOODS_COLOR").focus();
	        return false;
	    }*/ 
	    // 상품 수량
	    if(!$("#GOODS_STOCK").val()){
	        alert("상품수량을 입력해주세요.");
	        $("#GOODS_STOCK").focus();
	        return false;
	    }

	    comSubmit.submit();
	    alert("상품이 등록 되었습니다.");
	}


function fn_chk() {
	
var obj = $("[name=STATUS]");
var chkArray = new Array(); //배열 선언

$('input:checkbox[name=STATUS]:checked').each(function() { //체크된 값을 가져옴
   chkArray.push(this.value);
});
$('#GOODS_STATUS').val(chkArray);

}


 function fn_updateGoods(){
	var comSubmit = new ComSubmit("frm");
	comSubmit.setUrl("<c:url value='/admin/goodsUpdate.mk'/>");
	
	comSubmit.submit();
} 
 function fn_updateGoods2(){
	 var comSubmit = new ComSubmit();
	 comSubmit.setUrl("<c:url value='/admin/goodsUpdate.mk'/>");
	 comSubmit.addParam("GOODS_NUM", $("#GOODS_NUM").val());
	 comSubmit.submint();

	 }

 </script>



</html>