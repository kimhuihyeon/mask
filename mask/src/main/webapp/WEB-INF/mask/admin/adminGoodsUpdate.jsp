<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@ include file="/WEB-INF/mask/layout/admin/layout.jsp"%>
<head>
<script src="//cdn.ckeditor.com/4.4.4/standard/ckeditor.js"></script>
</head>
<body>
<div align="center">
      <h3>상품수정</h3> 
</div>
<br>
<div align="center" class="container" style="width:60%;">
<form name="frm" id="frm" enctype="multipart/form-data" method="post" action="/mask/admin/goodsUpdate.mk">
	
      <table align="center" style="border:none; cellpadding:10px; cellspacing:10px; width:100%;">
            
            <tr>
               <th>이름</th>
               
               <td>
                  <input type="text" id="GOODS_NAME" name="GOODS_NAME" placeholder="상품이름입력" size="40" class="form-control"
                  style="padding:auto;" value="${map.GOODS_NAME}" >
               </td>
            </tr>
            
            
            <tr>
               <th>내용</th>
               <td>
  <textarea id="GOODS_CONTENT" name="GOODS_CONTENT">
   ${map.GOODS_CONTENT}
  </textarea>
  
  
               </td>
               
            </tr>
         
           
       
            <tr>
               <th>카테고리&nbsp;&nbsp;</th>
               
               <td>
                  <select name="GOODS_CATEGORY" style="width:200px;" value="${map.GOODS_CATEGORY }" id="GOODS_CATEGORY">
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
                  style="padding:10px; width:70%;" value="${map.GOODS_CPRICE}">
               </td>
            </tr>
            
            
            <tr>
               <th>등록가&nbsp;&nbsp;</th>
               <td>
                  <input type="text" name="GOODS_PRICE" id="GOODS_PRICE" placeholder="상품회원가" size="40"  class="form-control"
                  style="padding:10px; width:70%;" value="${map.GOODS_PRICE}">
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
               <th>상품수량&nbsp;&nbsp;</th> 
               <td>
               <input type="text" name="GOODS_STOCK" id="GOODS_STOCK" placeholder="상품수량" size="40"  class="form-control"
               style="padding:10px; width:70%;" value="${map.GOODS_STOCK}">
               <input type="hidden" id="GOODS_NUM" name="GOODS_NUM" value="${map.GOODS_NUM}"> 
               </td>
            </tr>
            
      </table>
     
    <a href="#this" class="btn btn-primary" id="update" name="update" onClick="fn_chk()">수정하기</a>
	<button type="button" onclick="goodsList();" class="btn btn-default">목록</button>

   </form>
</div>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript">
CKEDITOR.replace('GOODS_CONTENT',{
	   filebrowserUploadUrl:"${pageContext.request.contextPath}/ckeditor/fileupload.mk",     height : 300 });

$(document).ready(function() {
	
	    $("#update").on("click", function(e){ //수정하기 버튼
			e.preventDefault();
			fn_updateGoods();
		}); 
	});

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
	comSubmit.setUrl("<c:url value='/admin/goodsUpdate.mk' />");


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


    alert("수정이 완료 되었습니다.");
	comSubmit.submit();
}  



</script>

</body>
</html>