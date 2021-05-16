<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>       
    
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
	<h1 class="page-header">회원목록</h1>
</div>
<div class="row">
	<div class="panel panel-default">
		<div class="panel-heading">
                         회원목록페이지 검색, 탈퇴 기능하는 페이지입니다.
        </div>
        <div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row" style="margin-bottom:5px;">
			
						
					</div>
					
					<div class="row">
						<div class="col-sm-12">
							<table name='memList'
								class="table table-striped table-bordered table-hover dataTable no-footer"
								id="dataTables-example" role="grid"
								aria-describedby="dataTables-example_info">
								<thead>
									<tr role="row">
										<th style="width: 5%; text-align:center;">번호</th>
										<th style="width: 8%; text-align:center;">ID</th>
										<th style="width: 7%; text-align:center;">이름</th>										
										<th style="width: 9%; text-align:center;">전화번호</th>
										<th style="width: 14%; text-align:center;">E-Mail</th>
										<th style="width: 6%; text-align:center;">우편번호</th>
										<th style="width: 20%; text-align:center;">주소</th>
										<th style="width: 19%; text-align:center;">가입일자</th>
										<th style="width: 3%; text-align:center;">관리</th>
									</tr>
								</thead>
					 	<tbody>							
									
							
								</tbody>
							
							</table>
							
						</div>
					</div>
					<center>
					
					   <div id="PAGE_NAVI" class="paging" >
                  <input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
               </div>
               </center>
               
					<div class="row">
							<div style="text-align:center;">
								<div id="dataTables-example_filter" class="dataTables_filter">
		  <form>
         <input type="text"  name="words" id="words" class="form-control"  placeholder="">
        <input type="submit" name="search" id="search" class="btn btn-default" value="search"/>
    </form>
    

									
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

    </div>
    <!-- /#wrapper -->

    <%@ include file="/WEB-INF/include/include-body.jspf" %>
<script type="text/javascript">


   $(document).ready(function() {
      fn_memList(1);

      $("a[name='search']").on("click", function(e){
         e.preventDefault();
         fn_search();
          });

      $("a[name='delete']").on("click", function(e){
          e.preventDefault();
          fn_delete($(this));
           });
   });

   function fn_delete(obj) {
	   if (confirm("정말 해당 회원을 탈퇴시키겠습니까??") == true){    //확인
		     var comSubmit = new ComSubmit();
	         comSubmit.setUrl("<c:url value='/admin/memberDelete.mk'/>");
	         comSubmit.addParam("MEM_NUM", obj.parent().find("#MEM_NUM").val());
	         comSubmit.submit();

		 }else{   //취소

		     return false;

		 }

   }

   /*
     function fn_delete(obj) {
     var comSubmit = new ComSubmit();
         comSubmit.setUrl("<c:url value='/admin/memberDelete.mk'/>");
         comSubmit.addParam("MEM_NUM", obj.parent().find("#MEM_NUM").val());
         comSubmit.submit();
   }
   */
  
   function fn_search(){
       var comSubmit = new ComSubmit("frm");
       comSubmit.setUrl("<c:url value='/admin/searchMemberSearchList.mk'/>");
       comSubmit.addParam("keyword", $("#keyword").val());
       comSubmit.submit();
      }
   
   function fn_memList(pageNo) { //페이징 함수
      var comAjax = new ComAjax();
      comAjax.setUrl("<c:url value='/admin/selectMemberList.mk' />");
      comAjax.setCallback("fn_memListCallback"); //ajax요청 후 호출될 함수의 이름 지정
      comAjax.addParam("PAGE_INDEX", pageNo);
      comAjax.addParam("PAGE_ROW", 10);
      comAjax.ajax(); //실질적인 ajax기능 수행
   }

   function fn_memListCallback(data) { //콜백함수
      var total = data.TOTAL;    
      var body = $("table[name='memList']>tbody");
      //alert(body);
      body.empty();
      if (total == 0) {
         var str = "<tr>" + "<td colspan='8'>조회된 결과가 없습니다.</td>" + "</tr>";
         body.append(str);
      } else {
         var params = {
            divId : "PAGE_NAVI",
            pageIndex : "PAGE_INDEX",
            totalCount : total,
            eventName : "fn_memList",
          
         };
         gfn_renderPaging(params);

         var str = "";
         $.each(data.list,function(key, value) {
            
            str += "<tr>"
            	 + "<td align='center'>"
                 + value.RNUM
                 + "</td>"
                  + "<td align='center'>"
                  + value.MEM_ID
                  + "</td>"
                  + "<td align='center'>"
                  + value.MEM_NAME
                  + "</td>" 
                  + "<td align='center'>" 
                  + value.MEM_PHONE
                  + "</td>" 
                  + "<td align='center'>"
                  + value.MEM_EMAIL 
                  + "</td>"
                  + "<td align='center'>" 
                  + value.MEM_ZIPCODE
                  + "</td>" 
                  + "<td align='center'>" 
                  + value.MEM_ADDRESS1
                  + "</td>" 
                  + "<td align='center'>" 
                  + value.MEM_JOINDATE
                  + "</td>" 
                  + "<td align='center'>" 
                  + "<a href='#this' name='delete' id='delete'>"
                  + value.MEM_DEL_GB
                  + "</a>"
                  + "<input type='HIDDEN' id='MEM_NUM' name='MEM_NUM' value=" + value.MEM_NUM + ">"
                  + "</td>" 
                  + "</tr>";
         }); 
    
         body.append(str);
      }
   }
   </script>



</body>

</html>