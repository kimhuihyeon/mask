<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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


   <form name="frm" id="frm" method="post" enctype="multipart/form-data">
   
   
   
   <div class="startRadio">
	<label class="startRadio__box">
		<input type="radio" name="star" id="BOARD_STAR">
		<span class="startRadio__img"><span class="blind">별 1개</span></span>
	</label>
	<label class="startRadio__box">
		<input type="radio" name="star" id="BOARD_STAR">
		<span class="startRadio__img"><span class="blind">별 1.5개</span></span>
	</label>
	<label class="startRadio__box">
		<input type="radio" name="star" id="BOARD_STAR">
		<span class="startRadio__img"><span class="blind">별 2개</span></span>
	</label>
	<label class="startRadio__box">
		<input type="radio" name="star" id="BOARD_STAR">
		<span class="startRadio__img"><span class="blind">별 2.5개</span></span>
	</label>
	<label class="startRadio__box">
		<input type="radio" name="star" id="BOARD_STAR">
		<span class="startRadio__img"><span class="blind">별 3개</span></span>
	</label>
	<label class="startRadio__box">
		<input type="radio" name="star" id="BOARD_STAR">
		<span class="startRadio__img"><span class="blind">별 3.5개</span></span>
	</label>
	<label class="startRadio__box">
		<input type="radio" name="star" id="BOARD_STAR">
		<span class="startRadio__img"><span class="blind">별 4개</span></span>
	</label>
	<label class="startRadio__box">
		<input type="radio" name="star" id="BOARD_STAR">
		<span class="startRadio__img"><span class="blind">별 4.5개</span></span>
	</label>
	<label class="startRadio__box">
		<input type="radio" name="star" id="BOARD_STAR">
		<span class="startRadio__img"><span class="blind">별 5개</span></span>
	</label>
	<label class="startRadio__box">
		<input type="radio" name="star" id="BOARD_STAR">
		<span class="startRadio__img"><span class="blind">별 5.5개</span></span>
	</label>
</div><br>
   
   
   
   
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