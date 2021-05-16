<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<html lang="ko">
<%@ include file="/WEB-INF/mask/layout/admin/layout.jsp"%>
<script src="//cdn.ckeditor.com/4.4.4/standard/ckeditor.js"></script>
<script type="text/javascript" src="${root}resources/common2.js"></script>  


<head>
</head>
<div align="center">
      <h3>상품상세</h3> 
</div>
<br>
<div align="center" class="container" style="width:60%;">
<form name="frm" id="frm" enctype="multipart/form-data" method="post">
	

  <textarea readonly="readonly" id="GOODS_CONTENT" name="GOODS_CONTENT">
   ${map.GOODS_CONTENT}
  </textarea>
         
     	<table
								class="table table-striped table-bordered table-hover dataTable no-footer"
								id="dataTables-example" role="grid"
								aria-describedby="dataTables-example_info">
								
								
			   <tr>
               <th>상품번호&nbsp;&nbsp;</th>
               
               <td>
                ${map.GOODS_NUM}
               </td>
            </tr>
            					
           <tr>
               <th style="width: 20%">이름</th>
               
               <td>
              ${map.GOODS_NAME}
               </td>
            </tr>
            
            
       
            <tr>
               <th>카테고리&nbsp;&nbsp;</th>
               
               <td>
                ${map.GOODS_CATEGORY}
               </td>
            </tr>
            
              <tr>
               <th>원가&nbsp;&nbsp;</th>
               <td>
                ${map.GOODS_CPRICE}
               </td>
            </tr>
            
            
            <tr>
               <th>등록가&nbsp;&nbsp;</th>
               <td>
               ${map.GOODS_PRICE}
               </td>
            </tr>
       <tr>
               <th>상태&nbsp;&nbsp;</th>
               <td>
              ${map.GOODS_STATUS}
               </td>
            </tr>
   <tr>
               <th>상품수량 </th>
               <td>
       ${map.GOODS_STOCK}
              <input type="hidden" id="GOODS_NUM" name="GOODS_NUM" value="${map.GOODS_NUM}"> 
               </td>
            </tr>
            
      </table>
     
       <div align="center">
     <a href="#this" class="btn" id="goodsupdate" >수정하기
    	<input type="hidden" name="GOODS_NUM" id="GOODS_NUM" value="${map.GOODS_NUM}">
    </a>
   </div> 
   
   </form>
 <%@ include file="/WEB-INF/include/include-body.jspf" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript">
CKEDITOR.replace('GOODS_CONTENT',{
	   filebrowserUploadUrl:"${pageContext.request.contextPath}/ckeditor/fileupload.mk",     height : 300 });

var gfv_count = 1;

$(document).ready(function() {

	    $("#goodsupdate").on("click", function(e){ //수정하기 버튼
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
		var goods_num = "${map.GOODS_NUM}";
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/admin/goodsUpdateForm.mk'/>");
		comSubmit.addParam("GOODS_NUM", goods_num);
		comSubmit.submit();
	}

 

 </script>



</html>