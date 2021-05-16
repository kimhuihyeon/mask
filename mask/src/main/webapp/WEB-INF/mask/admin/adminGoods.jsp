<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<!DOCTYPE html>
<html lang="ko">
<%@ include file="/WEB-INF/mask/layout/admin/layout.jsp"%>

<head>

<style type="text/css">
.paging{text-align:center;height:32px;margin-top:5px;margin-bottom:15px;}
.paging a,
.paging strong{display:inline-block;width:36px;height:32px;line-height:28px;font-size:14px;border:1px solid #e0e0e0;margin-left:5px;
-webkit-border-radius:3px;
   -moz-border-radius:3px;
		border-radius:3px;
-webkit-box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
	-moz-box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
		  box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
}
.paging a:first-child{margin-left:0;}
.paging strong{color:#fff;background:#337AB7;border:1px solid #337AB7;}
.paging .page_arw{font-size:11px;line-height:30px;}
</style>
</head>


<div id="page-wrapper">
<div class="row" style="padding-left:15px;width:900px;">    
	<h1 class="page-header">상품목록</h1>
</div>
<div class="row">
	<div class="panel panel-default">
		<div class="panel-heading">
                         상품목록페이지 검색, 수정, 삭제 기능하는 페이지입니다.
        </div>
        <div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row" style="margin-bottom:5px;">
						<div class="col-sm-6">
							<a href="/mask/admin/goodsList.mk"><button type="button" class="btn btn-outline btn-default">전체</button></a>
							<select class="form-control" name="select" onchange="window.open(value,'_self');">
								<option value ="">--카테고리--</option>
								<option value ="/mask/admin/goodsList.mk?searchNum=1&isSearch=0">마스크</option>
								<option value ="/mask/admin/goodsList.mk?searchNum=2&isSearch=1">손소독제</option>
								<option value ="/mask/admin/goodsList.mk?searchNum=2&isSearch=2">체온계</option>
							</select>
							<select class="form-control" name="select" onchange="window.open(value,'_self');">
								<option value ="">--상품구분--</option>
								<option value ="/mask/admin/goodsList.mk?searchNum=3&isSearch=1">품절</option>
								<option value ="/mask/admin/goodsList.mk?searchNum=3&isSearch=2">재고있음</option>
							
							</select>						
						</div>
	             </div>
					<div class="row">
						<div class="col-sm-12">
						<c:forEach items="${list }" var="list">
						
							<table
								class="table table-striped table-bordered table-hover dataTable no-footer"
								id="dataTables-example" role="grid"
								aria-describedby="dataTables-example_info">
								<thead>
									<tr role="row">
										<th style="width: 5%; text-align:center;">상품번호</th>
										<th style="width: 8%; text-align:center;">상품이미지</th>
										<th style="width: 5%; text-align:center;">카테고리</th>								
										<th style="width: 9%; text-align:center;">상품명</th>
										<th style="width: 7%; text-align:center;">가격</th>
									
										<th style="width: 10%; text-align:center;">등록일자</th>
										<th style="width: 10%; text-align:center;">관리</th>
									</tr>
								</thead>
								<tbody>
								
								
																	
									<tr class="gradeA even" role="row">
										<td style="text-align:center;vertical-align:middle;">${list.GOODS_NUM }</td>
										<td style="text-align:center; vertical-align:middle;">
										<a href="#this" name="goodslist">
										<img src="/mask/img/goods_upload/${list.GOODS_IMAGE}" width="70px" height="70px"></a>
										<input type="hidden" id="GOODS_NUM" value="${list.GOODS_NUM}">
										</td>
						
										<td style="text-align:center;vertical-align:middle;">${list.GOODS_CATEGORY }</td>	
										<td style="text-align:center;vertical-align:middle;">${list.GOODS_NAME }</td>		
										<td style="text-align:center;vertical-align:middle;">${list.GOODS_PRICE}</td>
															
										<td style="text-align:center;vertical-align:middle;">${list.GOODS_DATE}</td>
										<td style="text-align:center;vertical-align:middle;">
																	
							<a href="#this" class="btn" id="delete" name="delete" >
							<input type="image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png" >
							<input type="hidden" name="GOODS_NUM" id="GOODS_NUM" value="${list.GOODS_NUM}">
							</a></td>									
										
						</tr>
								
							
									 
								</tbody>
								
								
								<!--  등록된 상품이 없을때
									
										<tr><td colspan="9" style="text-align:center;">등록된 상품이 없습니다</td></tr>
			 -->						 
								</tbody>
							</table>
						
							</c:forEach>
						</div>
					</div>
					<div class="paging">
						<strong>1</strong>
					</div>
					<!-- 
					<div class="row">
							<div style="text-align:center;">
								<div id="dataTables-example_filter" class="dataTables_filter">
									<form action="">
									<select class="form-control" name="searchNum" id="searchNum">
										<option value="0">상품 번호</option>
									</select>
										<input class="form-control" type="text" name="isSearch" id="isSearch"/>
										<span>
										<button type="submit" class="btn btn-default">검색</button>
										</span> 
									</form> -->
								</div>							
							</div>
							
					</div>
				</div>
			</div>
				
		</div>
	</div>
    
</div>
 </div>
 <%@ include file="/WEB-INF/include/include-body.jspf" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
      <script type="text/javascript">
      $(document).ready(function(){
    	  $("a[name='delete']").on("click",function(e){
              e.preventDefault();
              fn_deleteAgoods($(this));
              });

          $("a[name='goodslist']").on("click", function(e){ //제목 
              e.preventDefault();
              fn_openBoardDetail($(this));
          });

    	
   });
      
       function fn_deleteAgoods(obj){
       var comSubmit = new ComSubmit();
       comSubmit.setUrl("<c:url value= '/admin/goodsDelete.mk' />"); 
       comSubmit.addParam("GOODS_NUM", obj.parent().find("#GOODS_NUM").val());
       comSubmit.submit();
       return alert("삭제되었습니다.");
       }

       function fn_openBoardDetail(obj){
           var comSubmit = new ComSubmit();
           comSubmit.setUrl("<c:url value='/admin/goodsDetail.mk' />");
           comSubmit.addParam("GOODS_NUM", obj.parent().find("#GOODS_NUM").val());
           comSubmit.submit();
       }
       
      
      </script>

</body>

</html>