
<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">

<%@ include file="/WEB-INF/mask/layout/admin/layout.jsp"%>


    
           
        <!-- 메인container-->
            



<head>
<body>
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


  </style>

<style type="text/css">
.hide{
    display: none;
}

body{
font-size:12px;}

button[type=button]{
	padding:5px; 
	box-sizing: border-box;
	border:lightgray;
	outline: none;
}

button[type=button]:hover {

	background: lightgray;
}


</style>

</head>
<div id="#load_fn">
<div class="row" style="padding-left:15px;width:900px;">    
<h1 class="page-header">배송관리</h1>
</div>
<div class="row">
<div id="page-wrapper">
<div class="panel panel-default">
    <div class="panel-heading">
                     결제완료된 주문건의 택배, 반품, 환불을 처리하는 페이지입니다.
    </div>
    <div class="panel-body">
        <div class="dataTable_wrapper">
            <div id="dataTables-example_wrapper"
                class="dataTables_wrapper form-inline dt-bootstrap no-footer">
                <div class="row" style="margin-bottom:5px;">
                    <div class="col-sm-6">
                        <button type="button" class="btn btn-outline btn-default ABCD" id="btnBBB">전체</button>													
                    </div>
                    <div class="col-sm-6" style="text-align:right;">
                        <div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">총 회원수 : 0</div>
                    </div>
                    
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <table
                            class="table table-striped table-bordered table-hover dataTable no-footer"
                            id="dataTables-example" role="grid"
                            aria-describedby="dataTables-example_info" style="text-align: center;">
                            <thead>
                                <tr role="row">
                                    <th style="width: auto; text-align:center; font-size:10px;" >주문날짜</th>
                                    <th style="width: auto; text-align:center; font-size:10px;">주문번호</th>
                                    <th style="width: auto; text-align:center; font-size:10px;">주문자</th>	
                                    <th style="width: auto; text-align:center; font-size:10px;">주문상태</th>										
                                    <th style="width: auto; text-align:center; font-size:10px;">배송업체</th>
                                    <th style="width: auto; text-align:center; font-size:10px;">운송장번호</th>
                                    <th style="width: auto; text-align:center; font-size:10px;">메모</th>
                                    <th style="width: auto; text-align:center; font-size:10px;">신청날짜</th>
                                    <th style="width: auto; text-align:center; font-size:10px;">완료예정일</th>
                                    <th style="width: auto; text-align:center; font-size:10px;">수정</th>
                                </tr>
                            </thead>
                                <c:choose>
                                <c:when test="${fn:length(list)>0}">
                                <c:forEach items="${list}" var="row">
                                <tr class="gradeA even" role="row">
                                    <td style="text-align:center;vertical-align:middle; font-size:12px;">${row.ORDER_DATE}</td>
                                    <td style="text-align:center;vertical-align:middle; font-size:12px;" id="order_num">${row.ORDER_NUM}</td>
                                    <td style="text-align:center;vertical-align:middle; font-size:12px;">${row.MEM_NAME }</td>
                                    <td style="text-align:center; vertical-align:middle; font-size:12px;" id="AORDER_STATE">${row.AORDER_STATE}</td>
                                    <td style="text-align:center; vertical-align:middle; font-size:12px;">
                        			<input style="width:100px; text-align:center; vertical-align:middle; font-size:12px;"  type="text" class="form-control" value="${row.AORDER_TRA_COM}" disabled id="c1${row.ORDER_NUM}"/>
                        
                                       </td>	
                                       <td style="text-align:center; vertical-align:middle; font-size:12px;">
                        				<input style="width:100px; text-align:center; vertical-align:middle; font-size:12px;"  type="text" class="form-control" value="${row.AORDER_TRACKING}" disabled id="c6${row.ORDER_NUM}"/>
                        
                                       </td>	
                                    <td style="text-align:center; vertical-align:middle; font-size:12px;">
                        <input style="width:100px; text-align:center; font-size:12px; "  type="text" class="form-control" value="${row.ORDER_REPORT_COMMENT}" disabled id="c2${row.ORDER_NUM}" />
                                       </td>	
                                       
                                       <td style="text-align:center; vertical-align:middle; ">
                                           <input  style=" font-size:12px; padding:0" type="date" class="form-control " value="${row.AS_SDATE }" disabled id="c3${row.ORDER_NUM}" />
                                       </td>		
                                    <td style="text-align:center; vertical-align:middle;">
                                    <input  style="font-size:12px;" type="date" class="form-control" value="${row.AS_EDATE }" disabled id="c4${row.ORDER_NUM}"/></td>	
                                    <td style="text-align: center; vertical-align:middle;"> 
                                        <c:if test="${row.AORDER_STATE eq '결제완료'}">
                                        	<button type="button" id="btn1_${row.ORDER_NUM}" class="btnC${row.ORDER_NUM}" onclick="btn1(id)" >배송업체등록</button>
                                        	<button type="button" id="btn2_${row.ORDER_NUM}" class="btnD${row.ORDER_NUM}" onclick="btn2(id)" style="display: none">등록</button>
                                        	<button type="button" id="btn3_${row.ORDER_NUM}" class="btnE${row.ORDER_NUM}" onclick="btn3(id)" style="margin-top:10px;">배송지변경</button>
                                        </c:if>
                                        <c:if test="${row.AORDER_STATE != '결제완료'}">
                                        	<button type="button" id="btn4_${row.ORDER_NUM}" class="btnF${row.ORDER_NUM}" style="padding:5px; box-sizing: border-box;" onclick="btn4(id)">반품신청</button>
                                        	<button type="button" id="btn5_${row.ORDER_NUM}" class="btnG${row.ORDER_NUM}" style="display: none" onclick="btn5(id)">등록</button>
                                        </c:if>
                                    </td>				
                                </tr>
                                </c:forEach>
                                
                            </c:when>	
                            <c:otherwise>
                                 <tr>
                                    <td colspan="10"> 결제완료 건이 없습니다.</td>
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
               
            </div>
        </div>
        <!-- /.table-responsive -->							
    </div>
</div>
    <!-- /.panel -->   
</div>

        <!-- // container -->
    
    <!-- /#page-wrapper -->


<!-- /#wrapper -->

<script type="text/javascript">

document.querySelector('.ABCD').addEventListener('click',()=>{
	$.ajax({
 
 	type:"get",
		 url:"${root}admin/deliverList.mk",
		success:function(data){
	
		$('body').load("${root}admin/deliverList.mk");

	}	
   })

})
 
 	/* 배송업체 등록 */
	function btn1(id){

		console.log('클릭');
		
		const ORDER_NUM=id.replace("btn1_","");
		console.log(ORDER_NUM);
		
		const c1="#c1"+ORDER_NUM;
		const c2="#c2"+ORDER_NUM;
		const c3="#c3"+ORDER_NUM;
		const c4="#c4"+ORDER_NUM;
		const c6="#c6"+ORDER_NUM;
		
		const btnC='.btnC'+ORDER_NUM;
		const btnD='.btnD'+ORDER_NUM;
		
		document.querySelector(c1).disabled = false;
   		document.querySelector(c2).disabled = false;
   		document.querySelector(c3).disabled = false;
   		document.querySelector(c4).disabled = false;
   		document.querySelector(c6).disabled = false;

		document.querySelector(btnC).style.display="none";
		document.querySelector(btnD).style.display="inline-block";
	}
 
 
 
	/*배송업체 등록 완료*/
	function btn2(id){

		const idv="#"+id;
		
		console.log('클릭');
	
		const ORDER_NUM=id.replace("btn2_","");
		
		console.log(ORDER_NUM);
	
		const c1="#c1"+ORDER_NUM;
		const c2="#c2"+ORDER_NUM;
		const c3="#c3"+ORDER_NUM;
		const c4="#c4"+ORDER_NUM;
		const c6="#c6"+ORDER_NUM;

		const AORDER_TRA_COM = $(idv).parent('td').parent('tr').find(c1).val();
		const ORDER_REPORT_COMMENT = $(idv).parent('td').parent('tr').find(c2).val();
		const AS_SDATE= $(idv).parent('td').parent('tr').find(c3).val();
		const AS_EDATE= $(idv).parent('td').parent('tr').find(c4).val();
      	const AORDER_TRACKING = $(idv).parent('td').parent('tr').find(c6).val();
		
   		const AORDER_STATE='배송중';
   			
		console.log(AORDER_TRA_COM);
		console.log(ORDER_REPORT_COMMENT);
		console.log(AS_SDATE);
		console.log(AS_EDATE);
		console.log(AORDER_TRACKING);

		const btnC='.btnC'+ORDER_NUM;
		const btnD='.btnD'+ORDER_NUM;

		$.ajax({
       
       	type:"post",
             url:"${root}admin/deliverUpdate.mk?AORDER_TRA_COM="+AORDER_TRA_COM+"&&ORDER_REPORT_COMMENT="+ORDER_REPORT_COMMENT+"&&AS_SDATE="+AS_SDATE+"&&AS_EDATE="+AS_EDATE+"&&ORDER_NUM="+ORDER_NUM+"&&AORDER_TRACKING="+AORDER_TRACKING+"&&AORDER_STATE="+AORDER_STATE,
             success:function(data){
               alert('등록되었습니다.');
             
			   document.querySelector(c1).disabled = true;
               document.querySelector(c2).disabled = true;
               document.querySelector(c3).disabled = true;
               document.querySelector(c4).disabled = true;
               document.querySelector(c6).disabled = true;
               
               document.querySelector(btnD).style.display="none";
               document.querySelector(btnC).style.display="inline-block";
               
               
               $('body').load("${root}admin/deliverList.mk");
       
           }
       
   		});

	}

  
  function btn3(id){

		const idv="#"+id;
		
		console.log('클릭');
	
		const ORDER_NUM=id.replace("btn3_","");

		console.log("ORDER_NUM : "+ORDER_NUM);

		var _width = '650';
	 	var _height = '400';

		 var popupX = (window.screen.width / 2) - (650 / 2);
		// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

		var popupY= (window.screen.height / 2) - (400 / 2);
		// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
	
		window.open("${root}admin/addressUpdate.mk?ORDER_NUM="+ORDER_NUM, 'popup-test', 'width='+ _width +', height='+ _height +', left=' + popupX + ', top='+ popupY);

  }
  
  /*반품신청 등록 버튼*/
  function btn4(id){
	  
	  const ORDER_NUM=id.replace("btn4_","");
	  console.log(ORDER_NUM);
	  
	  const c1="#c1"+ORDER_NUM;
	  const c2="#c2"+ORDER_NUM;
	  const c3="#c3"+ORDER_NUM;
	  const c4="#c4"+ORDER_NUM;
	  const c6="#c6"+ORDER_NUM;
		
	  document.querySelector(c1).disabled = false;
 	  document.querySelector(c2).disabled = false;
 	  document.querySelector(c3).disabled = false;
 	  document.querySelector(c4).disabled = false;
 	  document.querySelector(c6).disabled = false;
	  
 	  const btnF='.btnF'+ORDER_NUM;
	  const btnG='.btnG'+ORDER_NUM;
	  
	  document.querySelector(btnF).style.display="none";
      document.querySelector(btnG).style.display="inline-block";
	  
  }

  function btn5(id){

		const ORDER_NUM=id.replace("btn5_","");
		const idv="#"+id;
		const c1="#c1"+ORDER_NUM;
		const c2="#c2"+ORDER_NUM;
		const c3="#c3"+ORDER_NUM;
		const c4="#c4"+ORDER_NUM;
		const c6="#c6"+ORDER_NUM;
			
		
	  	console.log(ORDER_NUM);
		
		const btnF='.btnF'+ORDER_NUM;
		const btnG='.btnG'+ORDER_NUM;

		const AORDER_TRA_COM = $(idv).parent('td').parent('tr').find(c1).val();
		const ORDER_REPORT_COMMENT = $(idv).parent('td').parent('tr').find(c2).val();
		const AS_SDATE= $(idv).parent('td').parent('tr').find(c3).val();
		const AS_EDATE= $(idv).parent('td').parent('tr').find(c4).val();
    	const AORDER_TRACKING = $(idv).parent('td').parent('tr').find(c6).val();
		const AORDER_STATE='반품진행중';

		$.ajax({
     
	   		type:"post",
		 	url:"${root}admin/deliverUpdate.mk?AORDER_TRA_COM="+AORDER_TRA_COM+"&&ORDER_REPORT_COMMENT="+ORDER_REPORT_COMMENT+"&&AS_SDATE="+AS_SDATE+"&&AS_EDATE="+AS_EDATE+"&&ORDER_NUM="+ORDER_NUM+"&&AORDER_TRACKING="+AORDER_TRACKING+"&&AORDER_STATE="+AORDER_STATE,
		 	success:function(data){
		   		alert('등록되었습니다.');
		 
		   		document.querySelector(c1).disabled = true;
		   		document.querySelector(c2).disabled = true;
		   		document.querySelector(c3).disabled = true;
		   		document.querySelector(c4).disabled = true;
		   		document.querySelector(c6).disabled = true;
		   
		   		document.querySelector(btnG).style.display="none";
		   		document.querySelector(btnF).style.display="inline-block";
		   
		   
		   $('body').load("${root}admin/deliverList.mk");
 
	   }
 
	   });


	   }
  
  
  
  /* 
  if(document.querySelector('.btnG')){
	   document.querySelector('.btnG').addEventListener('click',()=>{
				
		  		
	          const AORDER_TRA_COM = document.querySelector('#c1').value;
	          const ORDER_REPORT_COMMENT=document.querySelector('#c2').value;
	          const AS_SDATE=document.querySelector('#c3').value;
	          const AS_EDATE=document.querySelector('#c4').value;
	          const AORDER_TRACKING=document.querySelector('#c6').value;
	          
	          const ORDER_NUM=$('.btnG').parent('td').parent('tr').children("#order_num").text();
	          const AORDER_STATE='반품진행중';
	          console.log(AORDER_TRA_COM);
	          console.log(ORDER_REPORT_COMMENT);
	          console.log(AS_SDATE);
	          console.log(AS_EDATE);
	          console.log(ORDER_NUM);
	        
	         
	          $.ajax({
	              
	              type:"post",
	                    url:"${root}admin/deliverUpdate.mk?AORDER_TRA_COM="+AORDER_TRA_COM+"&&ORDER_REPORT_COMMENT="+ORDER_REPORT_COMMENT+"&&AS_SDATE="+AS_SDATE+"&&AS_EDATE="+AS_EDATE+"&&ORDER_NUM="+ORDER_NUM+"&&AORDER_TRACKING="+AORDER_TRACKING+"&&AORDER_STATE="+AORDER_STATE,
	                    success:function(data){
	                    	
	                      alert('등록되었습니다.');
	                      
	                      document.querySelector('#c1').disabled = true;
	                      document.querySelector('#c2').disabled = true;
	                      document.querySelector('#c3').disabled = true;
	                      document.querySelector('#c4').disabled = true;
	                      document.querySelector('#c6').disabled = true;
	                      
	                      document.querySelector('.btnG').style.display="none";
	                      document.querySelector('.btnF').style.display="inline-block";
	                      
	                      
	                      $('body').load("${root}admin/deliverList.mk");
	              
	                  }
	              
	          });     
	   })
	  } */
  
</script>
</div>
</div>
</body>
</html>