<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/mask/layout/admin/layout.jsp"%>
<style type="text/css">
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
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
   function DaumAddressAPI() {
      new daum.Postcode(
            {
               oncomplete : function(data) {
                  
                  var addr = ''; // 
                  var extraAddr = ''; 

                  
                  if (data.userSelectedType === 'R') { 
                     addr = data.roadAddress;
                  } else { 
                     addr = data.jibunAddress;
                  }

                  
                  if (data.userSelectedType === 'R') {
                     if (data.bname !== ''
                           && /[동|로|가]$/g
                                 .test(data.bname)) {
                        extraAddr += data.bname;
                     }
                     
                     if (data.buildingName !== ''
                           && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', '
                              + data.buildingName
                              : data.buildingName);
                     }
                     
                     if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr
                              + ')';
                     }
                     /* 
                     document
                           .getElementById("MEM_ADDRESS3").value = extraAddr; */

                  } /* else {
                     document
                           .getElementById("MEM_ADDRESS3").value = '';
                  } */

                  
                  document
                        .getElementById('MEM_ZIPCODE').value = data.zonecode;
                  document
                        .getElementById("MEM_ADDRESS1").value = addr;
                  
                  document.getElementById(
                        "MEM_ADDRESS2")
                        .focus();
               }
            }).open();
   }
function openUpdate() {
	var url="/c/ezen/admin/adminDeliveryUpdate.do";
	open(url, "confirm", "toolbar=no,locaion=no,status=no,menubar=no,scrollbars=no,resizable=no,width=450px,height=300");
}
</script>
</head>
 <div id="page-wrapper">
<div class="row" style="padding-left:15px;width:900px;">    
	<h1 class="page-header">주문상세</h1>
</div>
<div class="row">
	<div class="panel panel-default">
		<div class="panel-heading">
                         주문상세 수정, 기능하는 페이지입니다. (삭제 불가능)
        </div>
        <div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap no-footer">

					<div class="row">
						<div class="col-sm-12">
							<table
								class="table  table-bordered table-hover dataTable no-footer"
								id="dataTables-example" role="grid"
								aria-describedby="dataTables-example_info">
							<p>주문정보</p>
								<thead>
									<tr role="row" style="vertical-align:middle;">
										<th style="width: 8%; text-align:center;vertical-align:middle;">주문번호</th>
										<th style="width: 8%; text-align:center;vertical-align:middle;">우편번호  <input type="button" value="수정" onclick="DaumAddressAPI();" id="but"/></th>	
										<th style="width: 10%; text-align:center;vertical-align:middle;">배송주소  <input type="button" value="수정" onclick="DaumAddressAPI();" id="but"/></th>										
										<th style="width: 5%; text-align:center;vertical-align:middle;">주문일자</th>
										<th style="width: 5%; text-align:center;vertical-align:middle;">주문자 <input type="button" value="수정" onclick="openUpdate()" id="but" /></th>
										<th style="width: 7%; text-align:center;vertical-align:middle;">연락처 <input type="button" value="수정" onclick="openUpdate()" id="but" /></th>						
									</tr>
								</thead>
								<tbody>
								
																	
									<tr class="gradeA even" role="row">
										<td style="text-align:center;vertical-align:middle;">1</td>
										<td style="text-align:center;vertical-align:middle;">54282</td>
										<td style="text-align:center;vertical-align:middle;">서울특별시 종로구 미려빌딩 6층</td>
										<td style="text-align:center;vertical-align:middle;">2021-03-09</td>
										<td style="text-align:center;vertical-align:middle;">admin</td>
										<td style="text-align:center;vertical-align:middle;">01012345678</td>									
									</tr>
								
						
						
									 
								</tbody>
							</table>
						
							<br>
							<br>
							<br>
							결제정보
							<table
								class="table  table-bordered table-hover dataTable no-footer"
								id="dataTables-example" role="grid"
								aria-describedby="dataTables-example_info">
								<thead>
									<tr role="row" style="vertical-align:middle;">
										<th style="width: 5%; text-align:center;vertical-align:middle;">상품명</th>
										<th style="width: 5%; text-align:center;vertical-align:middle;">주문금액</th>										
										<th style="width: 5%; text-align:center;vertical-align:middle;">배송비</th>
										<th style="width: 5%; text-align:center;vertical-align:middle;">택배회사</th>		
										</tr>
								</thead>
								
								<tbody>
								
																	
									<tr class="gradeA even" role="row">
										<td style="text-align:center;vertical-align:middle;">마스크</td>
										<td style="text-align:center;vertical-align:middle;">1000만원</td>
										<td style="text-align:center;vertical-align:middle;">2500원</td>
										<td style="text-align:center;vertical-align:middle;">CJ대한통운</td>								
									</tr>
								
								<!--  등록된 상품이 없을때 -->
									 
								</tbody>
							</table>
							<br>
							<br>
							<br>
							결제상태 및 상품정보
							<table
								class="table  table-bordered table-hover dataTable no-footer"
								id="dataTables-example" role="grid"
								aria-describedby="dataTables-example_info">
								<thead>
									<tr role="row" style="vertical-align:middle;">
										<th style="width: 5%; text-align:center;vertical-align:middle;">입금상태</th>								
										<th style="width: 5%; text-align:center;vertical-align:middle;">옵션</th>
										<th style="width: 5%; text-align:center;vertical-align:middle;">수량</th>
										</tr>
								</thead>
								
								<tbody>
								
																	
									<tr class="gradeA even" role="row">
										<td style="text-align:center;vertical-align:middle;">결제완료</td>
										<td style="text-align:center;vertical-align:middle;">S</td>
										<td style="text-align:center;vertical-align:middle;">100개</td>								
									</tr>
								
							
									 
								</tbody>
							</table>
						
						</div>
					</div>
				</div>
			</div>
					
		</div>
	</div>

</div>


        </div>
 

</body>

</html>
             
            
            