<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@ include file="/WEB-INF/mask/layout/admin/layout.jsp"%>


	
<head>
<script type="text/javascript">

$(document).ready(function() {
	//여기 아래 부분
	$('#summernote').summernote({
		  height: 500,                 // 에디터 높이
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
          
	});
});

$('.summernote').summernote({
	  toolbar: [
		    // [groupName, [list of button]]
		    ['fontname', ['fontname']],
		    ['fontsize', ['fontsize']],
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    ['color', ['forecolor','color']],
		    ['table', ['table']],
		    ['para', ['ul', 'ol', 'paragraph']],
		    ['height', ['height']],
		    ['insert',['picture',]], //'link','video' 
		    ['view', ['fullscreen', 'help']]
		  ],
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
});


//서머노트에 text 쓰기
$('#summernote').summernote('insertText');


// 서머노트 쓰기 비활성화
$('#summernote').summernote('disable');

// 서머노트 쓰기 활성화
$('#summernote').summernote('enable');


// 서머노트 리셋
$('#summernote').summernote('reset');


// 마지막으로 한 행동 취소 ( 뒤로가기 )
$('#summernote').summernote('undo');
// 앞으로가기
$('#summernote').summernote('redo');


function boardList() {
	if(confirm("목록으로 가시겠습니까?") == true){
		location.href='/c/ezen/mask/board.do';
	}else {
		return;
	}
}


</script>

<h2><B>공지사항 수정하기</B></h2>
<br>
<style type="text/css">
#bb{font-size:10;}
#cc{border : 3px solid #A9A9A9;}

#tx
{ border-style: solid; 
border-width: 0 0 0 8px; 
padding: 12px; 
word-break: break-all; } 
#tx 
{ border-color: LightGray; 
background-color:rgba(211, 211, 211, 0.2);
 }

</style>
</head>		

   <div id="page-wrapper">
<div class="row" style="padding-left:15px;width:900px;">    
	<h1 class="page-header">공지사항 수정</h1>  
</div>
<div class="row">
	<div class="panel panel-default">
		<div class="panel-heading">
                         공지사항을 수정하는 페이지입니다.
        </div>
        <div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row" style="margin-bottom:5px;">
						<div class="col-sm-30">

 <p id="bb"><B>제목:</B>    &nbsp;  &nbsp;  &nbsp; <input type="text" id="tx"name="title" style="width: 30%;" placeholder="쇼핑몰 배송지연안내"/>
<br>
<p><B>아이디: &nbsp; <input type="text" id="tx"name="id" style="width: 19%;" placeholder="admin"/>
<br>
<form method="post">
  <textarea id="summernote" name="editordata">
<tbody>
<tr>
<td><img src="/pet/resources/pet_img_upload/1615488125755.jpg"></td></tr></tbody>
  </textarea>
</form>



<button type="submit" class="btn btn-success">수정</button>
<button type="button" onclick="boardList();" class="btn btn-default">목록</button>			

</B></p></div></div></div></div></div></div></div></div>

					
			
					
	

</body>
</html>