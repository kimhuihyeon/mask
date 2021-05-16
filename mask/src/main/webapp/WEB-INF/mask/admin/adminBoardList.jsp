<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@ include file="/WEB-INF/mask/layout/admin/layout.jsp"%>

        
        
        
        
    <head>
    
<script type="text/javascript">
function delchk(){
    return confirm("삭제하시겠습니까?");
}
function aboardList() {
	if(confirm("수정하러 이동하시겠습니까?") == true){
		location.href='/c/ezen/admin/adminBoardUpdate.do';
	}else {
		return;
	}
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
	<h1 class="page-header">게시판 목록</h1>
</div>
<div class="row">
	<div class="panel panel-default">
		<div class="panel-heading">
                         게시판 페이지 검색, 수정, 삭제 기능하는 페이지입니다.
        </div>
        <div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row" style="margin-bottom:5px;">
				
						
						<!--  
						<div class="col-sm-6" style="text-align:right;">
							<div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">총 게시글수 : 0</div>
						</div>-->
						
					</div>
					<div class="row">
						<div class="col-sm-12">
						
						
							<table
								class="table table-striped table-bordered table-hover dataTable no-footer"
								id="dataTables-example" role="grid"
								aria-describedby="dataTables-example_info">
								<thead>
									<tr role="row">
										<th style="width: 5%; text-align:center;">TYPE</th>
										<th style="width: 5%; text-align:center;">번호</th>
										<th style="width: 5%; text-align:center;">N/Y</th>
										<th style="width: 30%; text-align:center;">제목</th>
										<th style="width: 5%; text-align:center;">작성자</th>										
										<th style="width: 9%; text-align:center;">날짜</th>
										<th style="width: 4%; text-align:center;">조회수</th>
									</tr>
								</thead>
							
						     	
								
														<STYLE>

				@import url("https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap");				
#BOARD_NUM
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
#BOARD_NUM

{
   padding: 5px;

   width: 100%;

   font-size: 13px;
}
								
							
								
								
								
														</STYLE>			
						
						   	
						    	<TBODY>
						   	<tr class="gradeA even" role="row">
										<td style="text-align:center;vertical-align:middle;">답변</td>
										<td style="text-align:center;vertical-align:middle;">저희 상품을 구매해주셔서 감사합니다.</td>
										<td style="text-align:center;vertical-align:middle;">admin</td>
										<td style="text-align:center;vertical-align:middle;">2021-03-09</td>
										
										<td style="text-align:center;vertical-align:middle;">1</td>	
										<td><input type="checkbox" value="value" checked="checked" onclick="return false"/></td>	
								    	<TD> <button type="button" onclick="sboardList();" id="but" value=submit>수정</button>
											</TD>		
										<TD> <button type="button" onclick="delchk();" id="but" value=submit>삭제</button>
											</TD>		
										</tr>
								
								
								</tbody> 
							
							
							</table>
						</div>
					</div>
					<div id="PAGE_NAVI" class="paging"></div>
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
	
	<!--  
								<div id="dataTables-example_filter" class="dataTables_filter">
							<form id="frm" method="post" action="http://localhost:8007ss/mask/admin/SearchA.mk" > 
										<input class="form-control" type="text"  name="keyword" id="keyword" placeholder="검색어를 입력하세요"/>
							  	<a href='#this' id="search" name="search" type="submit" value="검색" class="btn btn-default">검색 </a>
								 </form> 
								</div>		-->					
							
							
					
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
    
	$(document).ready(function(){
		fn_selectBoardList(1);
         
        });

    $("a[name='search']").on("click", function(e){
        e.preventDefault();
        fn_search();
         });

  function fn_search(){
      var comSubmit = new ComSubmit("frm");
      comSubmit.setUrl("<c:url value='/admin/SearchA.mk'/>");
      comSubmit.addParam("keyword", $("#keyword").val());
      comSubmit.submit();
     }

	
        function fn_openBoardDetail(obj){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/board/openBoardDetail.mk' />");
            comSubmit.addParam("BOARD_NUM", obj.parent().find("#BOARD_NUM").val());
            comSubmit.submit();
        }

        function fn_openBoardUpdate(){
        	var board_num = "${map.BOARD_NUM}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/openBoardUpdate.mk' />");
			comSubmit.addParam("BOARD_NUM", board_num);
			comSubmit.submit();
		}

        function fn_deleteBoard(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/admindeleteBoard.mk' />");
			comSubmit.addParam("BOARD_NUM", $("#BOARD_NUM").val());
			comSubmit.submit();
			
		}
		
        function fn_selectBoardList(pageNo){
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/admin/SelectAdminBoardList.mk' />");
			comAjax.setCallback("fn_selectBoardListCallback");
			comAjax.addParam("PAGE_INDEX",pageNo);
			comAjax.addParam("PAGE_ROW", 10);
			comAjax.ajax();
		}
		
		function fn_selectBoardListCallback(data){
			var total = data.TOTAL;
			var body = $("table>tbody");
			body.empty();
			if(total == 0){
				var str = "<tr>" + 
								"<td colspan='4'>조회된 결과가 없습니다.</td>" + 
							"</tr>";
				body.append(str);
			}
			else{
				var params =  { 
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					eventName : "fn_selectBoardList"
				};
				gfn_renderPaging(params);
				
				var str = "";
				$.each(data.list, function(key, value){
					str += "<tr>" + 
					            "<td>" + value.BOARD_TYPE + "</td>" + 
								"<td>" + value.BOARD_NUM + "</td>" + 
								"<td>" + value.BOARD_DEL_GB + "</td>" + 
								"<td class='title'>" +
									"<a href='#this' name='title'>" + value.BOARD_TITLE + "</a>" +
									"<input type='hidden' name='title' id='BOARD_NUM' value=" + value.BOARD_NUM + ">" +
								"</td>" +
								"<td>" + value.MEM_ID + "</td>" + 
								"<td>" + value.BOARD_DATE + "</td>" + 
 								"<td>" + value.BOARD_COUNT + "</td>" + 
                          
						"</td>"

						 
							
							
				});
				body.append(str);



				

				

				$("a[name='search']").on("click", function(e){ //제목 
					e.preventDefault();
					fn_selectBoardList($(this));
				});     
				
				
				$("a[name='title']").on("click", function(e){ //제목 
					e.preventDefault();
					fn_openBoardDetail($(this));
				});

				$("a[name='update']").on("click", function(e){ //제목 
					e.preventDefault();
					fn_openBoardUpdate($(this));
				});

				$("a[name='delete']").on("click", function(e){ //삭제하기 버튼
					e.preventDefault();
					fn_deleteBoard();
				});
			}
		}
    </script> 
    

</script>

</body>

</html>