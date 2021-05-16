<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var='root' value="${pageContext.request.contextPath }" />
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<c:import url="/WEB-INF/mask/layout/header.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
   <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
</script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
   function DaumAddressAPI() {
      new daum.Postcode(
            {
               oncomplete : function(data) {
                  
                  var addr = ''; // 
                  var extraAddr = ''; 

                  
                  if (data.userSelectedType === 'R') { 
                     addr = data.roadAddress;
                  } else { 
                     addr = data.jibunAddress;
                  }

                  
                  if (data.userSelectedType === 'R') {
                     if (data.bname !== ''
                           && /[동|로|가]$/g
                                 .test(data.bname)) {
                        extraAddr += data.bname;
                     }
                     
                     if (data.buildingName !== ''
                           && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', '
                              + data.buildingName
                              : data.buildingName);
                     }
                     
                     if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr
                              + ')';
                     }
                     /* 
                     document
                           .getElementById("MEM_ADDRESS3").value = extraAddr; */

                  } /* else {
                     document
                           .getElementById("MEM_ADDRESS3").value = '';
                  } */

                  
                  document
                        .getElementById('MEM_ZIPCODE').value = data.zonecode;
                  document
                        .getElementById("MEM_ADDRESS1").value = addr;
                  
                  document.getElementById(
                        "MEM_ADDRESS2")
                        .focus();
               }
            }).open();
   }
</script>


<style type="text/css">
	input[type=password]{
	 border: 1px solid lightgray;
    height: 40px;
    width: inherit;
    border-radius: 5px;
    padding: 10px;
    box-sizing: border-box;
    outline: none;
    transition: 0.3s;
}
</style>
</head>
<body>

	<div class="mypage3">
		<div class="join">
<form id="frm" name="frm" method="post" enctype="multipart/form-data">
				<div class="wrap wd668">
					<div class="container">
						<div class="form_txtInput">
							<h2 class="sub_tit_txt">내 정보</h2>
							<div class="join_form">
								<table>
								 <input type="hidden" id="MEM_ID" name="MEM_ID" value="${session_MEM_ID}">
								<input type="hidden" id="MEM_NUM" name="MEM_NUM" value="${session_MEMBER.MEM_NUM}">
									<colgroup>
										<col width="30%" />
										<col width="auto" />
									</colgroup>
										
									<tbody>
									   <tr>
											<th><span>회원번호</span>
											<td><input type="text" id="MEM_NUM" name="MEM_NUM" value="${map.MEM_NUM}" disabled></td>
											</th>
										</tr>
 									
										<tr>
											<th><span>이름</span>
											<td><input type="text" id="MEM_NAME" name="MEM_NAME" value="${map.MEM_NAME}" disabled></td>
											</th>
										</tr>
										<tr>
											<th><span>아이디</span>
											<td><input type="text" id="MEM_ID" name="MEM_ID" value="${map.MEM_ID}" disabled></td>
											</th>
										</tr>
										<tr>
											<th><span>비밀번호</span>
											<td><input type="password" id="MEM_PW" name="MEM_PW" placeholder="비밀번호" style="margin: 5px; padding: 10px;"><br>
                             			    </td></th>
										</tr>
										<tr>
											<th><span>비밀번호 확인</span>
											<td><input type="password" id="MEM_PW2" name="MEM_PW2"  placeholder="비밀번호 확인" style="margin: 5px; padding: 10px;"><br>
                                			</td></th>
										</tr>
									
							
										<tr class="email">
											<th><span>이메일</span></th>
											<td>
												<input type="text" id="MEM_EMAIL" name="MEM_EMAIL" class="Eemail" size="30"  value="${map.MEM_EMAIL}"><br>
                                		    	<span class="checkEmail" style="font-size:9px; color:crimson;"></span>
                                		    </td>
										</tr>
										<tr>
											<th><span>주소</span></th>
											<td>
      			                  	        	<input type="text" id="MEM_ZIPCODE" class="address" name="MEM_ZIPCODE" size="10" value="${map.MEM_ZIPCODE}">
                             				   	<input type="button" onclick="DaumAddressAPI()" value="우편번호 찾기" style="margin-left: 13px; padding: 7px; border: 1px solid lightgray; outline-style: none; transition: .5s; border-radius: 5px;  display: inline-block;" ><br>
                               			        <div class="height"></div>
                               			        <input type="text" id="MEM_ADDRESS1" size="30" name="MEM_ADDRESS1" value="${map.MEM_ADDRESS1}"><br>
                              			        <div class="height"></div>
                              				    <input type="text" id="MEM_ADDRESS2" class="address" name="MEM_ADDRESS2" size="30" value="${map.MEM_ADDRESS2}">
                               				 </td>
										</tr>
										<tr>
											<th><span>휴대폰</span></th>
											<td><input type="text" class="Ephone" id="MEM_PHONE" name="MEM_PHONE" value="${map.MEM_PHONE}" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"  placeholder="PHONE"><br>
                                				<span class="checkPhone" style="font-size:9px; color:crimson;"></span>
                                		    </td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- join_form E  -->
							
							<div class="agree_wrap">
							
                          <div class="checkbox_wrap">
 [선택]뉴스레터 이메일 수신동의
                          <label for="news_letter">
                          
                             <input type="radio" id="news_letter" name="MEM_EMAILCK" class="agree_chk" id="email1" value="Y" checked="checked">동의 
                        
                          </label>  
                            <label for="news_letter">
                          
                             <input type="radio" id="news_letter" name="MEM_EMAILCK" class="agree_chk" id="email2" value="N">동의 안함 
                        
                          </label>  
                          
                         </div>
                          
                          
  <div class="checkbox_wrap">
[선택]마케팅 목적 개인정보 수집 및 이용에 대한 동의
                          <label for="marketing">
                          
                             <input type="radio" id="marketing" name="MEM_SNSCK" class="agree_chk" id="email1" value="Y" checked="checked">동의 
                        
                          </label>  
                            <label for="news_letter">
                          
                             <input type="radio" id="marketing" name="MEM_SNSCK" class="agree_chk" id="email2" value="N">동의 안함 
                        
                          </label>  
                          
                         </div>  
                
                          </div>
                        </div>
                     
<BR>
	                            <a href="#this" class="btn" id="update"><button>저장하기</button></a>
	                            <input type="hidden" id="MEM_NUM" name="MEM_NUM" value="${session_MEMBER.MEM_NUM}">
	                            <input type="hidden" id="MEM_ID" name="MEM_ID" value="${session_MEM_ID}">
								
	                        
	                            <a href="#this" class="btn" id="dlete"><button>탈퇴하기</button></a>
	                            <input type="hidden" id="MEM_NUM" name="MEM_NUM" value="${session_MEMBER.MEM_NUM}">
	                            <input type="hidden" id="MEM_ID" name="MEM_ID" value="${session_MEM_ID}">
						
						
							
						
						<!-- form_txtInput E -->
					</div>
					<!-- content E-->
				</div>
				<!-- container E -->
		</div>

</form>
	</div>
</body>


<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});
			
			$("#update").on("click", function(e){ //저장하기 버튼
				e.preventDefault();
				fn_updateBoard();
			});
			
		});
		
		function fn_openBoardList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/sample/openBoardList.do' />");
			comSubmit.submit();
		}

		
		function fn_updateBoard(){
			var MEM_NUM = "${map.MEM_NUM}";
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/member/updateMyInfo.mk' />");
			comSubmit.addParam("MEM_NUM", MEM_NUM);
			
			 if(!$("#MEM_PW").val()){
	             alert("비밀번호를 입력하세요");
	             $("#MEM_PW").focus();
	             return false;
	          }

	          if(!$("#MEM_PW2").val()){
	             alert("비밀번호를 확인하세요");
	             $("#MEM_PW2").focus();
	             return false;
	          }

	          if($("#MEM_PW").val() != $("#MEM_PW2").val()){
	             alert("비밀번호가 일치하지 않습니다.");
	             $("#MEM_PW2").focus();
	             return false;
	          }            

	          if(!$("#MEM_PHONE").val()){
		             alert("연락처를 입력하세요");
		             $("#MEM_PHONE").focus();
		             return false;
		          }

	          if(!$("#MEM_ZIPCODE").val()){
	             alert("우편번호를 입력하세요");
	             $("#MEM_ZIPCODE").focus();
	             return false;
	          }

	          if(!$("#MEM_ADDRESS1").val()){
	             alert("주소를 입력하세요");
	             $("#MEM_ADDRESS1").focus();
	             return false;
	          }

	          if(!$("#MEM_ADDRESS2").val()){
	             alert("상세주소를 입력하세요");
	             $("#MEM_ADDRESS2").focus();
	             return false;
	          }

	          alert("수정이 완료 되었습니다.");
	          comSubmit.submit();
	      }
		
		function fn_deleteBoard(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/member/deleteMyInfo.mk' />");
			comSubmit.addParam("MEM_NUM", $("#MEM_NUM").val());
			comSubmit.submit();
			
		}


		  $("#dlete").on("click", function(e) {
	          e.preventDefault();
	            fn_delete();
	         });

	      function fn_delete(){
	        var del;
	        del = confirm("정말로 탈퇴 하시겠습니까?");
	        var comSubmit = new ComSubmit("frm");
	        if(del){
	         alert("그동안 이용해 주셔서 감사합니다.");
	         comSubmit.setUrl("<c:url value='/member/deleteMyInfo.mk' />");         
	         comSubmit.submit();     
	        }
	        else{
	          history.go(-1);
	          }  
	      }  
	</script>
	
</html>