<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

   <form name="frm" id="frm" method="post" enctype="multipart/form-data">
      <input type="hidden" name="BOARD_NUM" id="BOARD_NUM" value="${map.BOARD_NUM}">
   <input type="hidden" name="GOODS_NUM" id="GOODS_NUM" value="${map.GOODS_NUM}">
<%--    <input type="hidden" id="MEM_NUM" name="MEM_NUM" value="${session_MEMBER.MEM_NUM}"/> --%>
   <input type="hidden" id="MEM_ID" name="MEM_ID" value="${MEM_ID}"/>
<textarea name="BOARD_TITLE" id="BOARD_TITLE" class="form-control"  placeholder="후기입력해주세요" style="width:50%;height:80;border:1;overflow:visible;text-overflow:ellipsis;"></textarea>
   <a href="#this" id="commentWrite"><input type="button" value="쓰기" class="btn btn-primary" style="width:10%; height:59px;"></a> 
   
</form>

</body>
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
             comSubmit.setUrl("reviewInsert.mk?>");
    
             if (!$("#BOARD_TITLE").val()) {
                alert("내용을 입력하세요.");
                $("#BOARD_TITLE").focus();
                return false;
             }
           alert("정상적으로 등록 되었습니다.");
          comSubmit.submit();
          }
   </script>
</html>




</body>
</html>