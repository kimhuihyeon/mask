<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<%@ include file="/WEB-INF/mask/layout/admin/layout.jsp"%>
<head>
<script type="text/javascript">
function delchk(){
    return confirm("삭제하시겠습니까?");
}
</script>
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
	<h1 class="page-header">매출관리</h1>
</div>

<!-- 조회기간&nbsp;<input type="date" id="tx"/>~<input type="date" id="tx"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->

<div style="margin-bottom:15px;">
	결제수단 :&nbsp;&nbsp;
	<button  class="btn btn-outline btn-default" style=" margin-right: 5px;" id="fff">전체</button>
	<button  class="btn btn-outline btn-default" style=" margin-right: 5px;" id="ccc">카드</button>
	<button  class="btn btn-outline btn-default" id="ddd">현금</button>
</div>
<div class="row">
	<div class="panel panel-default">
		<div class="panel-heading">
                         정산내역 및 목록
        </div>
        <div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row" style="margin-bottom:5px;">
						<div class="col-sm-6" style="text-align:right;">
			
						</div>
						
					</div>
					<div class="row">
						<div class="col-sm-12">
							<table
								class="table table-striped table-bordered table-hover dataTable no-footer"
								id="salTables-example" role="grid"
								aria-describedby="dataTables-example_info">
								<thead>
									<tr role="row">
										<th style="width: 6%; text-align:center;">상품명</th>
										<th style="width: 6%; text-align:center;">판매량</th>
										<th style="width: 10%; text-align:center;">판매금액</th>								
										<th style="width: 10%; text-align:center;">택배비</th>
										<th style="width: 10%; text-align:center;">원가</th>
										<th style="width: 25%; text-align:center;">최종정산지급액</th>
									</tr>
								</thead>
							
						     	<tbody>
								
<style>

				@import url("https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap");				
#but
{
   margin: auto;

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
#but

{
   padding: 5px;

   width: 100%;

   font-size: 13px;
}
</style>							<c:choose>
									<c:when test="${fn:length(list)> 0 }">
									<c:forEach items="${list}" var="row"> 		
									<tr class="gradeA even" role="row">
										<td style="text-align:center;vertical-align:middle;">${row.GOODS_NAME}</td>
										<td style="text-align:center;vertical-align:middle;">${row.CNT}</td>
										<td style="text-align:center;vertical-align:middle;">${row.TOT_ORDER_PRICE}</td>
										<td style="text-align:center;vertical-align:middle;">${row.TOT_ORDER_DCOST}</td>
										<td style="text-align:center;vertical-align:middle;">${row.TOT_GOODS_CPRICE}</td>	
										<td style="text-align:center;vertical-align:middle;">${row.TOT_SUM}</td>	
									</tr>
									</c:forEach>
									</c:when>
									</c:choose>
								<!--  등록된 상품이 없을때 -->
									 
								</tbody>
						     
						   	
						   	
							</table>
						</div>
					</div>
					<div class="paging">
						<strong>1</strong>
					</div>
				</div>
			</div>
			<!-- /.table-responsive -->							
		</div>
	</div>
        <!-- /.panel -->   
</div>

            <!-- // container -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
	
	<script type="text/javascript">
		
		document.querySelector('#ccc').addEventListener('click',()=>{
        
        	const value='카드';

        	$.ajax({
        		type: "get",
        		url:"${root}admin/adminSalList.mk?ORDER_PAY"+value,
        		success:function(data){
        			console.log('성공');
        			$('body').load("${root}admin/adminSalList.mk","ORDER_PAY="+value);
        		}
       	 	})

   	 	})
		
   	 	document.querySelector('#ddd').addEventListener('click',()=>{
        
        	const value='현금';

        	$.ajax({
        		type: "get",
        		url:"${root}admin/adminSalList.mk?ORDER_PAY"+value,
        		success:function(data){
        			console.log('성공');
        			$('body').load("${root}admin/adminSalList.mk","ORDER_PAY="+value);
        		}
       	 	})

   	 	})
   	 	
   	 	document.querySelector('#fff').addEventListener('click',()=>{
        

        	$.ajax({
        		type: "get",
        		url:"${root}admin/adminSalList.mk",
        		success:function(data){
        			console.log('성공');
        			$('body').load("${root}admin/adminSalList.mk");
        		}
       	 	})

   	 	})
   	 	
	</script>
    

</body>

</html>