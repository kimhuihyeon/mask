<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/ui.css'/>"/>
<c:set var='root' value="${pageContext.request.contextPath }"/>
<script type="text/javascript" src="${root}resources/js/common.js"></script>  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>


</head>
<body>
<h5>상품에 대한 질문을 입력해주세요</h5>
 <!--글작성폼 로그인만 보인다  -->
   <form name="frm" id="frm" method="post" enctype="multipart/form-data">
      <input type="hidden" name="BOARD_NUM" id="BOARD_NUM" value="${BOARD_NUM}">
  <%--  <input type="hidden" name="GOODS_NUM" id="GOODS_NUM" value="${GOODS_NUM}"> --%>
<%--    <input type="hidden" id="MEM_NUM" name="MEM_NUM" value="${session_MEMBER.MEM_NUM}"/> --%>
   <input type="hidden" id="MEM_ID" name="MEM_ID" value="${session_MEM_ID}"/>
<textarea name="BOARD_TITLE" id="BOARD_TITLE" class="form-control"  placeholder="질문을 입력해주세요" style="width:55%;height:150;border:1;overflow:visible;text-overflow:ellipsis;"></textarea>
   <a href="#this" id="commentWrite"><input type="button" value="등록" class="btn btn-primary" ></a> 
   
</form>








<div class="container" width="60%">
<c:choose>
         <c:when test="${fn:length(list) > 0}">
            <c:forEach items="${list}" var="map">
   <div>
      <hr>
      <span style="font-size:9pt; color:gray;">${map.MEM_ID}</span>
      
   <c:if test="${session_MEM_ID != null}">
    	 <p>
      <input type="hidden" id="BOARD_NUM" value="${map.BOARD_NUM}">
      <a href="#this" name="BOARD_DELETE"><span style="font-size:9pt; color:gray; padding-right:10px; float:right;">삭제</span></a>
<!--       <a href="#this" id="modifyComment"><span style="font-size:9pt; color:gray; padding-right:10px; float:right;">수정</span></a> -->
		</p>
  </c:if> 
      
     
      <br>
      
      
      
         <form name="frm2" id="frm2" method="post" enctype="multipart/form-data">
      		<c:if test="${map.BOARD_SECRET eq 'N'}" >
      		
            <img src="${pageContext.request.contextPath}/img/pngegg.png" alt="비밀글" />
             <c:choose>
                <c:when test="${ session_MEM_ID != null  || admincode eq 'admin'}"> 
                

                <p>
                    <input type="hidden" id="BOARD_NUM" value="${map.BOARD_NUM}">
                    <a href="#this" name="read" ><c:out value="${map.BOARD_TITLE}"/></a>
                </p>
  
       </c:when>
                <c:otherwise>비밀글 입니다.</c:otherwise>
            </c:choose> 
        </c:if>
        
        <c:if test="${map.BOARD_SECRET eq 'Y'}" >
        
                  <p>
                    <input type="hidden" id="BOARD_NUM" value="${map.BOARD_NUM}">
                    <a href="#this" name="read" ><c:out value="${map.BOARD_TITLE}"/></a>
                </p>
        </c:if>
        </form>

      
      
   </div>
   </c:forEach>
         </c:when>
      <c:otherwise>
      <span style="color:gray;">글이 없습니다.</span>
</c:otherwise>   
      </c:choose>
</div>
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
		this.submit = function submit(){
			var frm2 = $("#"+this.formId)[0];
			frm2.action = this.url;
			frm2.method = "post";
			frm2.submit();	
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



   
   
      $(document).ready(function(){
          $("#commentWrite").on("click", function(e){ //작성
              e.preventDefault();
              commentWrite();
           });
			$("a[name='read']").on("click", function(e){ //관리자답글
				e.preventDefault();
				button1_click($(this));
			});

			$("a[name='BOARD_DELETE']").on("click", function(e){ //삭제
				e.preventDefault();
				BOARD_DELETE($(this));
			});
		});





		function BOARD_DELETE(obj){ //삭제
			var comSubmit = new ComSubmit();
			var CONFIRM = confirm("정말로 삭제하시겠습니까?");
			   if(CONFIRM==true){
			comSubmit.setUrl("<c:url value='/board/QNADelete.mk' />");
			comSubmit.addParam("BOARD_NUM", obj.parent().find("#BOARD_NUM").val());
			comSubmit.submit();
			alert("삭제가 완료되었습니다.");
			}
		}

		
		function button1_click(obj){ //관리자 답글
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/QNAReplyList.mk' />");
			comSubmit.addParam("BOARD_NUM", obj.parent().find("#BOARD_NUM").val());
			comSubmit.submit();
		}

      

      function commentWrite(){ //작성
          var comSubmit = new ComSubmit("frm");
             comSubmit.setUrl("<c:url value='/board/QNAInsert.mk' />");
    
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
</html>