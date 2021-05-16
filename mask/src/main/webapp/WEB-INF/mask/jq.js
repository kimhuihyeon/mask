$(function(){ 
	$('#apibtn').click(function(){ 
	$.ajax({ 
		url:'/mask/jq/kakaopay.mk' ,
		dataType:'json' ,
		success:function(data) { 
			alert(data.tid);
		} ,
		error:function(error){ 
			alert(error);
		}
	});
	});
});