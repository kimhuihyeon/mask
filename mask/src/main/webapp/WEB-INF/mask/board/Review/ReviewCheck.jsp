<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/ui.css'/>"/>

<meta charset="UTF-8">
<c:set var='root' value="${pageContext.request.contextPath }"/>
<script type="text/javascript" src="${root}resources/js/common.js"></script>  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<style type="text/css">
.blind {
  position: absolute;
  overflow: hidden;
  margin: -1px;
  padding: 0;
  width: 1px;
  height: 1px;
  border: none;
  clip: rect(0, 0, 0, 0);
}

.startRadio {
  display: inline-block;
  overflow: hidden;
  height: 40px;
}
.startRadio:after {
  content: "";
  display: block;
  position: relative;
  z-index: 10;
  height: 40px;
  background: url("data:image/png;base64,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") repeat-x 0 0;
  background-size: contain;
  pointer-events: none;
}
.startRadio__box {
  position: relative;
  z-index: 1;
  float: left;
  width: 20px;
  height: 40px;
  cursor: pointer;
}
.startRadio__box input {
  opacity: 0 !important;
  height: 0 !important;
  width: 0 !important;
  position: absolute !important;
}
.startRadio__box input:checked + .startRadio__img {
  background-color: #0084ff;
}
.startRadio__img {
  display: block;
  position: absolute;
  right: 0;
  width: 500px;
  height: 40px;
  pointer-events: none;
}

</style>
</head>
<body>
<c:if test="${session_MEM_ID !=null}"> <!-- 글작성 로그인만 보인다 -->
	<div id="form-commentInfo" style="margin-bottom: 30px;">
  <form name="frm" id="frm" method="post" enctype="multipart/form-data">
			<div id="comment-count">
				<h5>후기를 남겨주세요</h5>
			</div>
			
			
			<!-- 별 -->
			  <div class="startRadio">
	<label class="startRadio__box">
		<input type="radio" name="BOARD_STAR" id="BOARD_STAR"value="1">
		<span class="startRadio__img"><span class="blind">별 1개</span></span>
	</label>
	<label class="startRadio__box">
		<input type="radio" name="BOARD_STAR" id="BOARD_STAR"value="1.5">
		<span class="startRadio__img"><span class="blind">별 1.5개</span></span>
	</label>
	<label class="startRadio__box">
		<input type="radio" name="BOARD_STAR" id="BOARD_STAR"value="2">
		<span class="startRadio__img"><span class="blind">별 2개</span></span>
	</label>
	<label class="startRadio__box">
		<input type="radio" name="BOARD_STAR" id="BOARD_STAR"value="2.5">
		<span class="startRadio__img"><span class="blind">별 2.5개</span></span>
	</label>
	<label class="startRadio__box">
		<input type="radio" name="BOARD_STAR" id="BOARD_STAR"value="3">
		<span class="startRadio__img"><span class="blind">별 3개</span></span>
	</label>
	<label class="startRadio__box">
		<input type="radio" name="BOARD_STAR" id="BOARD_STAR"value="3.5">
		<span class="startRadio__img"><span class="blind">별 3.5개</span></span>
	</label>
	<label class="startRadio__box">
		<input type="radio" name="BOARD_STAR" id="BOARD_STAR"value="4">
		<span class="startRadio__img"><span class="blind">별 4개</span></span>
	</label>
	<label class="startRadio__box">
		<input type="radio" name="BOARD_STAR" id="BOARD_STAR"value="4.5">
		<span class="startRadio__img"><span class="blind">별 4.5개</span></span>
	</label>
	<label class="startRadio__box">
		<input type="radio" name="BOARD_STAR" id="BOARD_STAR"value="5">
		<span class="startRadio__img"><span class="blind">별 5개</span></span>
	</label>
	<label class="startRadio__box">
		<input type="radio" name="BOARD_STAR" id="BOARD_STAR" value="5.5">
		<span class="startRadio__img"><span class="blind">별 5.5개</span></span>
	</label>
</div><br>
			
			<div>
			   <input type="hidden" name="BOARD_NUM" id="BOARD_NUM" value="${BOARD_NUM}">
			  <%--  <input type="hidden" name="GOODS_NUM" id="GOODS_NUM" value="${GOODS_NUM}"> --%>
			   <input type="hidden" id="MEM_ID" name="MEM_ID" value="${session_MEM_ID}"/>
			   
				<textarea name="BOARD_TITLE" id="BOARD_TITLE" class="form-control"  placeholder="후기입력해주세요" style="width:50%;height:80;border:1;overflow:visible;text-overflow:ellipsis;"></textarea>
				 <a href="#this" id="commentWrite"><input type="button" value="등록"></a>
			</div>
			<div id=comments></div>
		</form>
	</div></c:if>
	
	
	
	<!--반복문-->
	<div class="coment">
		<table class="board_list">
		<colgroup>
			<col width="10%"/>
			<col width="*"/>
			<col width="15%"/>
			<col width="20%"/>
			<col width="10%"/>
		</colgroup>
		<thead>
			<tr>
				<th scope="col">아이디</th>
				<th scope="col">내용</th>
				<th scope="col">점수</th>
				<th scope="col">작성일</th>
				<th scope="col">삭제</th>
			</tr>
		</thead>
			<tbody>

			</tbody>
		</table>
	</div>
<div id="PAGE_NAVI"></div>
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
	
	<br/>
	
<form id="commonForm" name="commonForm"></form>

	<script type="text/javascript">
	function gfn_isNull(str) {
		if (str == null) return true;
		if (str == "NaN") return true;
		if (new String(str).valueOf() == "undefined") return true;    
	    var chkStr = new String(str);
	    if( chkStr.valueOf() == "undefined" ) return true;
	    if (chkStr == null) return true;    
	    if (chkStr.toString().length == 0 ) return true;   
	    return false; 
	}

	function ComSubmit(opt_formId) {
		this.formId = gfn_isNull(opt_formId) == true ? "commonForm" : opt_formId;
		this.url = "";
		
		if(this.formId == "commonForm"){
			$("#commonForm")[0].reset();
			$("#commonForm").empty();
		}
		
		this.setUrl = function setUrl(url){
			this.url = url;
		};
		
		this.addParam = function addParam(key, value){
			$("#"+this.formId).append($("<input type='hidden' name='"+key+"' id='"+key+"' value='"+value+"' >"));
		};
		
		this.submit = function submit(){
			var frm = $("#"+this.formId)[0];
			frm.action = this.url;
			frm.method = "post";
			frm.submit();	
		};
	}

	var gfv_ajaxCallback = "";
	function ComAjax(opt_formId){
		this.url = "";		
		this.formId = gfn_isNull(opt_formId) == true ? "commonForm" : opt_formId;
		this.param = "";
		
		if(this.formId == "commonForm"){
			$("#commonForm")[0].reset();
			$("#commonForm").empty();
		}
		
		this.setUrl = function setUrl(url){
			this.url = url;
		};
		
		this.setCallback = function setCallback(callBack){
			fv_ajaxCallback = callBack;
		};

		this.addParam = function addParam(key,value){ 
			this.param = this.param + "&" + key + "=" + value; 
		};
		
		this.ajax = function ajax(){
			if(this.formId != "commonForm"){
				this.param += "&" + $("#" + this.formId).serialize();
			}
			$.ajax({
				url : this.url,    
				type : "POST",   
				data : this.param,
				async : false, 
				success : function(data, status) {
					if(typeof(fv_ajaxCallback) == "function"){
						fv_ajaxCallback(data);
					}
					else {
						eval(fv_ajaxCallback + "(data);");
					}
				}
			});
		};
	}

	/*
	divId : 페이징 태그가 그려질 div
	pageIndx : 현재 페이지 위치가 저장될 input 태그 id
	recordCount : 페이지당 레코드 수
	totalCount : 전체 조회 건수 
	eventName : 페이징 하단의 숫자 등의 버튼이 클릭되었을 때 호출될 함수 이름
	*/
	var gfv_pageIndex = null;
	var gfv_eventName = null;
	function gfn_renderPaging(params){
		var divId = params.divId; //페이징이 그려질 div id
		gfv_pageIndex = params.pageIndex; //현재 위치가 저장될 input 태그
		var totalCount = params.totalCount; //전체 조회 건수
		var currentIndex = $("#"+params.pageIndex).val(); //현재 위치
		if($("#"+params.pageIndex).length == 0 || gfn_isNull(currentIndex) == true){
			currentIndex = 1;
		}
		
		var recordCount = params.recordCount; //페이지당 레코드 수
		if(gfn_isNull(recordCount) == true){
			recordCount = 15;
		}
		var totalIndexCount = Math.ceil(totalCount / recordCount); // 전체 인덱스 수
		gfv_eventName = params.eventName;
		
		$("#"+divId).empty();
		var preStr = "";
		var postStr = "";
		var str = "";
		
		var first = (parseInt((currentIndex-1) / 10) * 10) + 1;
		var last = (parseInt(totalIndexCount/10) == parseInt(currentIndex/10)) ? totalIndexCount%10 : 10;
		var prev = (parseInt((currentIndex-1)/10)*10) - 9 > 0 ? (parseInt((currentIndex-1)/10)*10) - 9 : 1; 
		var next = (parseInt((currentIndex-1)/10)+1) * 10 + 1 < totalIndexCount ? (parseInt((currentIndex-1)/10)+1) * 10 + 1 : totalIndexCount;
		
		if(totalIndexCount > 10){ //전체 인덱스가 10이 넘을 경우, 맨앞, 앞 태그 작성
			preStr += "<a href='#this' class='pad_5' onclick='_movePage(1)'>[<<]</a>" +
					"<a href='#this' class='pad_5' onclick='_movePage("+prev+")'>[<]</a>";
		}
		else if(totalIndexCount <=10 && totalIndexCount > 1){ //전체 인덱스가 10보다 작을경우, 맨앞 태그 작성
			preStr += "<a href='#this' class='pad_5' onclick='_movePage(1)'>[<<]</a>";
		}
		
		if(totalIndexCount > 10){ //전체 인덱스가 10이 넘을 경우, 맨뒤, 뒤 태그 작성
			postStr += "<a href='#this' class='pad_5' onclick='_movePage("+next+")'>[>]</a>" +
						"<a href='#this' class='pad_5' onclick='_movePage("+totalIndexCount+")'>[>>]</a>";
		}
		else if(totalIndexCount <=10 && totalIndexCount > 1){ //전체 인덱스가 10보다 작을경우, 맨뒤 태그 작성
			postStr += "<a href='#this' class='pad_5' onclick='_movePage("+totalIndexCount+")'>[>>]</a>";
		}
		
		for(var i=first; i<(first+last); i++){
			if(i != currentIndex){
				str += "<a href='#this' class='pad_5' onclick='_movePage("+i+")'>"+i+"</a>";
			}
			else{
				str += "<strong><a href='#this' class='pad_5' onclick='_movePage("+i+")'>"+i+"</a></strong>";
			}
		}
		$("#"+divId).append(preStr + str + postStr);
	}

	function _movePage(value){
		$("#"+gfv_pageIndex).val(value);
		if(typeof(gfv_eventName) == "function"){
			gfv_eventName(value);
		}
		else {
			eval(gfv_eventName + "(value);");
		}
	}

	
		$(document).ready(function(){
			fn_selectBoardList(1);
			
			$("#write").on("click", function(e){ //글쓰기 버튼
				e.preventDefault();
				fn_openBoardWrite();
			});	
			
			$("a[name='title']").on("click", function(e){ //제목 
				e.preventDefault();
				fn_openBoardDetail($(this));
			});
		});
		
		
		function fn_openBoardWrite(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/sample/openBoardWrite.do' />");
			comSubmit.submit();
		}
		
		function fn_openBoardDetail(obj){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/reviewDelete.mk' />");
			comSubmit.addParam("BOARD_NUM", obj.parent().find("#BOARD_NUM").val());
			comSubmit.submit();
		}
		
		function fn_selectBoardList(pageNo){
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/board/selectReviewBoardList.mk' />");
			comAjax.setCallback("fn_selectBoardListCallback");
			comAjax.addParam("PAGE_INDEX",pageNo);
			comAjax.addParam("PAGE_ROW", 15);
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
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					eventName : "fn_selectBoardList"
				};
				gfn_renderPaging(params);
				
				var str = "";
				$.each(data.list, function(key, value){
					str += "<tr>" + 
								"<td>" + value.MEM_ID + "</td>" + 
								"<td class='title'>" +
									/* "<a href='#this' name='title'>" + */ value.BOARD_TITLE + "</a>" +
									"<input type='hidden' name='BOARD_NUM' id='BOARD_NUM' value=" + value.BOARD_NUM + ">" + 
								"</td>" +
								"<td>" + value.BOARD_STAR + "</td>" + 
								"<td>" + value.BOARD_DATE + "</td>" +


								"<c:if test='${session_MEMBER != null}'>"+
								"<td>" +
								"<a href='#this' name='delete'>" + '삭제' + "</a>" +
								"<input type='hidden' name='BOARD_NUM' id='BOARD_NUM' value=" + value.BOARD_NUM + ">" + 
							"</td>" +
							"</c:if>"+

								 
							"</tr>";
				});
				body.append(str);
				
				$("a[name='title']").on("click", function(e){ //제목 
					e.preventDefault();
					fn_openBoardDetail($(this));
				});

				
				$("a[name='delete']").on("click", function(e){ //삭제하기 버튼
					   e.preventDefault();
					   fn_delete($(this));
					});
			}
		}


	


		/* 삭제 */
		
		function fn_delete(obj){
			var comSubmit = new ComSubmit();

			   var CONFIRM = confirm("정말로 삭제하시겠습니까?");
			   if(CONFIRM==true){
			comSubmit.setUrl("<c:url value='/board/reviewDelete.mk' />");
			comSubmit.addParam("BOARD_NUM", obj.parent().find("#BOARD_NUM").val());
			comSubmit.submit();
			alert("삭제가 완료되었습니다.");
			}
		}

		/* 글쓰기 */
	      $(document).ready(function(){
	          $("#commentWrite").on("click", function(e){
	              e.preventDefault();
	              commentWrite();
	           });
	      });


	      function commentWrite(){
	          var comSubmit = new ComSubmit("frm");
	             comSubmit.setUrl("<c:url value='/board/reviewInsert.mk' />");
	    
	             if (!$("#BOARD_TITLE").val()) {
	                alert("내용을 입력하세요.");
	                $("#BOARD_TITLE").focus();
	                return false;
	             }
	           alert("정상적으로 등록 되었습니다.");
	          comSubmit.submit();
	          }
	</script>	
</body>
