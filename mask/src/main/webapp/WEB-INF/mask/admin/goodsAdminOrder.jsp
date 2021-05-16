<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var='root' value="${pageContext.request.contextPath}/" />
<!DOCTYPE html>
<html lang="ko">
<%@ include file="/WEB-INF/mask/layout/admin/layout.jsp"%>
<head>
<script type="text/javascript">
//주문번호 같은 열 합치는 Jquery
$( document ).ready(function() {
	$('#dataTables-example').rowspan(0);
});

$.fn.rowspan = function(colIdx, isStats) {       
	return this.each(function(){      
		var that;     
		$('tr', this).each(function(row) {      
			$('td:eq('+colIdx+')', this).filter(':visible').each(function(col) {
				
				if ($(this).html() == $(that).html()
					&& (!isStats 
							|| isStats && $(this).prev().html() == $(that).prev().html()
							)
					) {            
					rowspan = $(that).attr("rowspan") || 1;
					rowspan = Number(rowspan)+1;

					$(that).attr("rowspan",rowspan);
					
					// do your action for the colspan cell here            
					$(this).hide();
					
					//$(this).remove(); 
					// do your action for the old cell here
					
				} else {            
					that = this;         
				}          
				
				// set the that if not already set
				that = (that == null) ? this : that;      
			});     
		});    
	});  
}; 

    
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

					
		@import url("https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap");				
#but
{
   margin:0 auto;

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

   width:30pt;

   font-size: 13px;
}

</style>
</head>

<body>
<div id="load_fn">	
<div id="page-wrapper">
<div class="row" style="padding-left:15px;width:900px;">    
	<h1 class="page-header">주문목록</h1>
</div>
<div class="row">
	<div class="panel panel-default">
		<div class="panel-heading">
                         주문목록페이지 검색, 수정, 기능하는 페이지입니다. (삭제 불가능)
        </div>
        <div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row" style="margin-bottom:5px;">
						<div class="col-sm-6">
							<a href="/pet/admin/adminOrderAllList.dog?searchNum=0&isSearch=">
							<button class="btn" id="btnAAA">전체</button>
							</a>
							<select class="form-control" name="select" id="order_pay_search">
								<option value ="선택">--결재방식--</option>
								<option value ="무통장"  <c:if test="${not empty list && list.get(0).Select_ORDER_PAY eq '무통장'}">selected</c:if>>무통장입금</option>
								<option value ="카드" <c:if test="${not empty list && list.get(0).Select_ORDER_PAY eq '카드'}">selected</c:if>>카드결제</option>
							</select>
							
							<select class="form-control" name="select" id="Select_AORDER_STATE" >
								<option value ="선택">--주문상태--</option>
								<option value ="무통장입금전" <c:if test="${not empty list && list.get(0).Select_AORDER_STATE eq '무통장입금전'}">selected</c:if>>무통장입금전</option>
								<option value ="결제완료" <c:if test="${not empty list && list.get(0).Select_AORDER_STATE eq '결제완료'}">selected</c:if>>결제완료</option>
								<option value ="배송중" <c:if test="${not empty list && list.get(0).Select_AORDER_STATE eq '배송중'}">selected</c:if>>배송중</option>
								<option value ="배송완료" <c:if test="${not empty list && list.get(0).Select_AORDER_STATE eq '배송완료'}">selected</c:if>>배송완료</option>
								<option value ="반품진행중" <c:if test="${not empty list && list.get(0).Select_AORDER_STATE eq '반품진행중'}">selected</c:if>>반품진행중</option>
								<option value ="구매확정" <c:if test="${not empty list && list.get(0).Select_AORDER_STATE eq '구매확정'}">selected</c:if>>구매확정</option>
							</select>													
						</div>
						<div class="col-sm-6" style="text-align:right;">
							<div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">총 주문수 : 1</div>
						</div>
						
					</div>
					<div class="row">
						<div class="col-sm-12">
							<table
								class="table  table-bordered table-hover dataTable no-footer"
								id="dataTables-example" role="grid"
								aria-describedby="dataTables-example_info">
								<thead>
									<tr role="row" style="vertical-align:middle;">
										<th  style="width: 5%; text-align:center;vertical-align:middle;">주문번호</th>
										<th style="width: 4%; text-align:center;vertical-align:middle;">주문자</th>										
										<th style="width: 5%; text-align:center;vertical-align:middle;">결제방법</th>
										<th style="width: 5%; text-align:center;vertical-align:middle;">상품명</th>
										<th style="width: 2%; text-align:center;vertical-align:middle;">옵션</th>
										<th style="width: 3%; text-align:center;vertical-align:middle;">수량</th>
										<th style="width: 1%; text-align:center;vertical-align:middle;">주문상태</th>
										<th style="width: 10%; text-align:center;vertical-align:middle;">주문일자</th>		
										<th style="width: 1%; text-align:center;vertical-align:middle;">수정</th>								
									</tr>
								</thead>
								
								
									<tbody>			
								<c:choose>
								<c:when test="${fn:length(list)>0 && list.get(0).ORDER_NUM!=null}">
									<c:forEach items="${list}" var="row"> 				
									<tr class="gradeA even" role="row">
										<td id="a1" style="text-align:center;vertical-align:middle;">${row.ORDER_NUM}</td>
										<td style="text-align:center;vertical-align:middle;">${row.MEM_NAME}</td>
										<td style="text-align:center;vertical-align:middle;">${row.ORDER_PAY}</td>
										
										<td style="text-align:center;vertical-align:middle;">${row.GOODS_NAME}</td>
										<td style="text-align:center;vertical-align:middle;">${row.GOODS_CATEGORY}</td>
										<td style="text-align:center;vertical-align:middle;">${row.GOODS_AMOUNT}</td>
										<td style="text-align:center;vertical-align:middle;">
										<select class="form-control" name="select" id="aorder_state">
											<option value ="무통장입금전" <c:if test="${row.AORDER_STATE eq '무통장입금전' && row.ORDER_NUM!=null}"> selected </c:if>>무통장입금전</option>
											<option value ="결제완료" <c:if test="${row.AORDER_STATE eq '결제완료'  && row.ORDER_NUM!=null}"> selected </c:if>>결제완료</option>
											<option value ="배송중" <c:if test="${row.AORDER_STATE eq '배송중'  && row.ORDER_NUM!=null}"> selected="selected" </c:if>>배송중</option>
											<option value ="배송완료" <c:if test="${row.AORDER_STATE eq '배송완료'  && row.ORDER_NUM!=null}"> selected="selected" </c:if>>배송완료</option>
											<option value ="반품진행중" <c:if test="${row.AORDER_STATE eq '반품진행중'  && row.ORDER_NUM!=null}"> selected="selected" </c:if>>반품진행중</option>
											<option value ="구매확정" <c:if test="${row.AORDER_STATE eq '구매확정'  && row.ORDER_NUM!=null}"> selected="selected" </c:if>>구매확정</option>
										</select>
										</td>
										<td style="text-align:center;vertical-align:middle;">${row.ORDER_DATE }</td>	
										<td><!-- <input type="button" value="저장" id="but" /> -->
											<button id="${row.ORDER_NUM}" class="but222" onclick="btn(event,id)">저장</button>
										</td>
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
					<div class="paging">
						<strong>1</strong>
					</div>
					<div class="row">
							<div style="text-align:center;">
								<div id="dataTables-example_filter" class="dataTables_filter">
									<select class="form-control" name="searchNum" id="searchName">
										<option value="MEM_NAME" <c:if test="${list.get(0).name eq 'MEM_NAME'}"> selected </c:if>>주문자</option>
										<option value="ORDER_NUM" <c:if test="${list.get(0).name eq 'ORDER_NUM'}"> selected </c:if>>주문번호</option>
									</select>
										<input class="form-control" type="text" name="isSearch" id="SearchValue" value="${list.get(0).value }"/>
										<span>
										<button class="btn btn-default" id="searchBtn">검색</button>
										</span>
								</div>
							</div>
							
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
 

   
    <!-- /#wrapper -->
   
    
 <script type="text/javascript">

    document.querySelector('#order_pay_search').addEventListener('change',(event)=>{
	
    	console.log(event.target.value);
    	const value=event.target.value;
        $.ajax({
          type: "get",
          url: "${root}/admin/orderList.mk?Select_ORDER_PAY="+value+"&&Select_AORDER_STATE=",
          success : function test(data) {
              $('body').load("${root}admin/orderList.mk ","Select_ORDER_PAY="+value);
      	  }
      	  
        })
        
    })
    
    document.querySelector('#Select_AORDER_STATE').addEventListener('change',(event)=>{
	
    	console.log(event.target.value);
    	const value=event.target.value;
    	
        $.ajax({
          type: "get",
          url: "${root}/admin/orderList.mk?Select_AORDER_STATE="+value,
          success : function test(data) {
              $('body').load("${root}admin/orderList.mk","Select_AORDER_STATE="+value);
      	}
        })
    })
    
    
    
    <!--주문상태 변경-->
    
        function btn(event,id){
		
			console.log("존재");
			console.log(id);

			const idv="#"+id;

			ORDER_NUM=$(idv).parent('td').parent('tr').children().first().text();
			AORDER_STATE=$(idv).parent('td').parent('tr').find('#aorder_state').val();
				
			console.log(ORDER_NUM);
			console.log(AORDER_STATE);
			
			$.ajax({
	   				type:"post",
	   				url:"${root}admin/orderUpdate.mk?AORDER_STATE="+AORDER_STATE+"&&ORDER_NUM="+ORDER_NUM,
	   				success:function(data){
	   					alert('변경되었습니다.');
	   					$('body').load("${root}admin/orderList.mk","Select_AORDER_STATE="+AORDER_STATE);
	   				}
	   			
	   		})
			
		}
        
    
    <!-- 검색 -->
    document.querySelector('#searchBtn').addEventListener('click',()=>{
        const element = document.querySelector('#searchName').value;
        let value=document.querySelector('#SearchValue').value
        
        console.log(element);
        console.log(value);
        
        $.ajax({
        	type: "get",
        	url:"${root}admin/orderList.mk?name="+element+"&&value="+value,
        	success:function(data){
        		console.log('성공');
        		$('body').load("${root}admin/orderList.mk","name="+element+"&&value="+value);
        	}
        })
        
      })

      	
      document.querySelector('#btnAAA').addEventListener('click',(event)=>{
    	  event.preventDefault();
    	  $.ajax({
          	type: "get",
          	url:"${root}admin/orderList.mk",
          	success:function(){
          		$('body').load("${root}admin/orderList.mk");
          	}
          })
      })
    </script> 


</body>
</div>
</div>
  

</html>