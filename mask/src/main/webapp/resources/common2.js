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
	
	if(this.formId == "commonForm"){ //다운로드 잘 되도록
		$("#commonForm")[0].reset();
		$("#commonForm").empty();
	}
	
	this.setUrl = function setUrl(url){
		this.url = url; //url 설정
	};
	
this.setCallback = function setCallback(callBack) {  //Callback 처리할 메서드를 지정?
fv_ajaxCallback = callBack;
};

this.addParam = function addParam(key,value){ 
		this.param = this.param + "&" + key + "=" + value; 
	};

this.ajax = function ajax() {  //ajax 함수
if(this.formId != "commonForm") { // formId != "commonForm"면 formId를 다시 가지고 옴
this.param += "&" + $("#" + this.formId).serialize();
} 
$.ajax({
url : this.url, //url 전송
type : "POST", //post 방식 전송
data : this.param, //parammeter로 전송
async : false,
success : function(data, status) {  //success라는 파트에서 전송된 데이트를 받아 처리한다.
if(typeof(fv_ajaxCallback) == "function") { 
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
pageIndex : 현재 페이지 위치가 저장될 저장될 input 태그 id
recordCount : 페이지당 레코드 수
totalCount : 전체 조회 건수
eventName : 페이징 하단의 숫자 등의 버튼이 클릭되었을 때 호출될 함수 이름
*/

//movepaging 페이지 이동

var gfv_pageIndex = null;
var gfv_eventName = null;
function gfn_renderPaging(params){  //gfn_renderPaging 함수 
var divId = params.divId; //페이징이 그려질 div id
gfv_pageIndex = params.pageIndex;
var totalCount = params.totalCount;
var currentIndex = $("#"+params.pageIndex).val();
if($("#"+params.pageIndex).length == 0 || gfn_isNull(currentIndex) == true) { 
currentIndex = 1;
} 

var recordCount = params.recordCount; //페이지당 레코드 수
if(gfn_isNull(recordCount) == true){ 
recordCount = 20;
} 
var totalIndexCount = Math.ceil(totalCount / recordCount); // 전체 인덱스 수
gfv_eventName = params.eventName;

$("#"+divId).empty();
var preStr = "";
var postStr = "";
var str = ""; 

var first = (parseInt((currentIndex-1) / 10) * 10) + 1;
var last = (parseInt(totalIndexCount/10) == parseInt(currentIndex/10)) ? totalIndexCount%10 : 10;
var prev = (parseInt((currentIndex-1)/10)*10) - 9 > 0 ? (parseInt((currentIndex-1)/10)*10) -9 : 1;
var next = (parseInt((currentIndex-1)/10)+1) * 10 + 1 < totalIndexCount ? (parseInt((currentIndex-1)/10)+1) * 10 + 1 : totalIndexCount;



if(totalIndexCount > 10) { //전체 인덱스가 10이 넘을 경우, 맨앞, 앞 태그 작성
preStr += "<a href='#this' class='pad_5' onclick='_movePage(1)'>[<<]</a>" + 
"<a href='#this' class='pad_5' onclick='_movePage("+prev+")'>[<]</a>"; 
} 
else if(totalIndexCount <=10 && totalIndexCount > 1) { 
preStr += "<a href='#this' class='pad_5' onclick='_movePage(1)'>[<<]</a>";
}
if(totalIndexCount > 10) { 
postStr += "<a href='#this' class='pad_5' onclick='_movePage("+next+")'>[>]</a>" +
"<a href='#this' class='pad_5' onclick='_movePage("+totalIndexCount+")'>[>>]</a>";
} 
else if(totalIndexCount <=10 && totalIndexCount > 1) { 
postStr += "<a href='#this' class='pad_5' onclick='_movePage("+totalIndexCount+")'>[>>]</a>";
} 


for(var i=first; i<(first+last); i++) { 
if(i != currentIndex) { 
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
if(typeof(gfv_eventName) == "function") { 
gfv_eventName(value);
}
else {
eval(gfv_eventName + "(value);"); 
}
}