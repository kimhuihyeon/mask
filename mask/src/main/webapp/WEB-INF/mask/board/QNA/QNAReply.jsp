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

<c:set var='root' value="${pageContext.request.contextPath }"/>
<script type="text/javascript" src="${root}resources/js/common.js"></script>  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>


</head>
<body>

<c:choose>
 <c:when test="${ MEM_ID eq 'admin'}">  <!-- 글작성폼 관리자가 아니면 안보인다 -->

   <form name="frm" id="frm" method="post" >
      <input type="hidden" name="BOARD_COUNT" id="BOARD_COUNT" value="${BOARD_NUM}">
      <input type="hidden" name="GOODS_NUM" id="GOODS_NUM" value="${GOODS_NUM}">
 	  <input type="hidden" id="MEM_ID" name="MEM_ID" value="${session_MEM_ID}"/>
<textarea name="BOARD_TITLE" id="BOARD_TITLE" class="form-control"  placeholder="답변을 입력해주세요" style="width:50%;height:80;border:1;overflow:visible;text-overflow:ellipsis;"></textarea>
   <a href="#this" id="commentWrite"><input type="button" value="등록" class="btn btn-primary" style="width:10%; height:59px;"></a> 
   
</form>
</c:when>
</c:choose>








<div class="container" width="60%">
<c:choose>
         <c:when test="${fn:length(list) > 0}">
            <c:forEach items="${list}" var="map">
   <div>
      <hr>
      <span style="font-size:9pt; color:gray;">${map.MEM_ID}</span>
      
      <c:if test="${session_MEM_ID != null}">
      
      <input type="hidden" name="BOARD_NUM" id="BOARD_NUM" value="${map.BOARD_NUM}">
      <a href="#this" id="BOARD_DELETE"><span style="font-size:9pt; color:gray; padding-right:10px; float:right;">삭제</span></a>
<!--       <a href="#this" id="modifyComment"><span style="font-size:9pt; color:gray; padding-right:10px; float:right;">수정</span></a> -->
      </c:if>
      
     
      <br>
      
      
      

                   <c:out value="${map.BOARD_TITLE}"/>
                    
					<input type="hidden" name="BOARD_NUM" id="BOARD_NUM" value=${map.BOARD_NUM }>
        
      
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
          $("#commentWrite").on("click", function(e){
              e.preventDefault();
              commentWrite();
           });
      });


      

      function commentWrite(){
          var comSubmit = new ComSubmit("frm");
             comSubmit.setUrl("<c:url value='/board/QNAReplyInsert.mk' />");
    
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