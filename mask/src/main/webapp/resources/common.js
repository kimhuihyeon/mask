function gfn_isNull(str) {
	if (str == null) return true; //문자열이 null이면 true
	if (str == "NaN") return true; // not a number 면 true
	if (new String(str).valueOf() == "undefined") return true; //undefinded여도 true    
    var chkStr = new String(str);                  
    if( chkStr.valueOf() == "undefined" ) return true;
    if (chkStr == null) return true;    
    if (chkStr.toString().length == 0 ) return true;   
    return false; 
}

function ComSubmit(opt_formId) {
	this.formId = gfn_isNull(opt_formId) == true ? "commonForm" : opt_formId;
	this.url = "";
	
	 if(this.formId == "commonForm") {//아이디가 commonForm이면
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
}