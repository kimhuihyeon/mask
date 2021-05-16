<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<c:set var='root' value="${pageContext.request.contextPath}/" />
<c:import url="/WEB-INF/mask/layout/header.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.noticeList-jsp .container {
	margin-top: 40px;
	/* border:1px solid red; */
	text-align: center;
	height: 200vh;
}

.noticeList-jsp .container label {
	display: block;
	font-size: 40px;
	font-weight: bold;
	margin: 10px;
	padding: 20px;
}

.noticeList-jsp .container .item {
	display: inline-block;
	text-align: right;
	padding-right: 24px;
	margin-bottom: 20px;
	font-size: 14px;
	width: 910px;
}

.noticeList-jsp table {
	text-align: center;
	display: inline-block;
	border-collapse: separate;
	border-spacing: 0 7px;
}

.noticeList-jsp td {
	background-color: white;
	text-align: center;
	color : black;
}

.noticeList-jsp tr, .noticeList-jsp td, .noticeList-jsp th {
	padding: 7px 8px;
	width: 200px;
	height: 10px;
	font-size: 12px;
}

.noticeList-jsp tr:nth-child(1) {
	border-bottom: 1px solid lightgray;
	border-top: 1px solid lightgray;
	background: rgb(69, 69, 71);
	color: white;
}

.noticeList-jsp tr>td:nth-child(1), .noticeList-jsp tr>th {
	width: 50px;
}
</style>
</head>
<body>
	<!--테이블-->
	<div class="noticeList-jsp">
		<div class="container">
			<label>COMMUNITY</label>
			<c:if test="${session_MEMBER.MEM_NUM != null}">
			<div class="item">
				<a href="${root}/board/openBoardWrite.mk"><i class="fa fas fa-pencil-alt"> 작성하기</i></a>
			</div>		
			</c:if>
	
			<table class="board_list">
			<thead>
				<tr>
					<th style="width:3%">번호</th>
					<th style="width:30%">제목</th>
					<th style="width:5%">작성자</th>
					<th style="width:10%">날짜</th>
					<th style="width:5%">조회수</th>
					<th style="width:5%">추천수</th>
				</tr>
				</thead>
				  <tbody>
           
				</tbody>
				
			</table>
			
		
			<div id="PAGE_NAVI"></div>
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
	
	
			</div>
	</div>
		
	
	    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
    
	$(document).ready(function(){
		fn_selectBoardList(1);
         
        });
         
        function fn_openBoardDetail(obj){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/board/openBoardDetail.mk' />");
            comSubmit.addParam("BOARD_NUM", obj.parent().find("#BOARD_NUM").val());
            comSubmit.submit();
        }

        function fn_selectBoardList(pageNo){
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/board/selectBoardList.mk' />");
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
					str += 
           

						"<tr>" + 
								"<td>" + value.RNUM + "</td>" + 
								"<td class='title'>" +
									"<a href='#this' name='title'>" + value.BOARD_TITLE + "</a>" + "&nbsp&nbsp" + "[" + value.TOTAL_COMMENTS + "]" +
									"<input type='hidden' name='title' id='BOARD_NUM' value=" + value.BOARD_NUM + ">" +
								"</td>" +
								"<td>" + value.MEM_ID + "</td>" + 
								"<td>" + value.BOARD_DATE + "</td>" + 
 								"<td>" + value.BOARD_COUNT + "</td>" + 
 								"<td>" + value.BOARD_UP + "</td>" + 
							"</tr>"
				});
				body.append(str);
				
				$("a[name='title']").on("click", function(e){ //제목 
					e.preventDefault();
					fn_openBoardDetail($(this));
				});
			}
		}
    </script> 
    
</body>
</html>