<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var='root' value="${pageContext.request.contextPath }/" />

<!DOCTYPE html>
<html lang="en">
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<c:import url="/WEB-INF/mask/layout/header.jsp"/>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
</head>
<body>
	<div class="mypage2">
		<div class="body">

			<label>마이페이지</label>
			<div class="box">
				<div>안녕하세요.${map.MEM_NAME}님</div>
				<div>
					<span>배송중 : </span><span>${map1.DELIVERING}건</span>
				</div>
				<div>
					<span>배송완료 :</span><span>${map1.DELIVERED}건</span>
				</div>
			</div>
			<div class="join">
					<div class="wrap wd668">
						<div class="container">
							<div class="form_txtInput">
					
								<div class="join_form">
									<table>
									
									<colgroup>
											<col width="30%" />
											<col width="auto" />
										</colgroup>
										<tbody>
											
											<input type="hidden" id="MEM_NUM" name="MEM_NUM" value="${session_MEMBER.MEM_NUM}">
			    <input type="hidden" id="MEM_ID" name="MEM_ID" value="${session_MEMBER.MEM_ID}">
											<tr>
										
				
												<th><span>이름</span>
											<td><input type="text" value="${map.MEM_NAME}" disabled></td>
												</th>
											</tr>
											<tr>
												<th><span>아이디</span>
												<td><input type="text" value="${map.MEM_ID}" disabled></td>
												</th>
											</tr>
											<tr>
												<th><span>성별</span></th>
												<td><input type="radio" name="gen" checked disabled>남자
													<input type="radio" name="gen" disabled>여자</td>
											</tr>
											<tr class="email">
												<th><span>이메일</span></th>
												<td><input type="text" class="email"
													value="${map.MEM_EMAIL}" disabled></td>
											</tr>
											<tr>
												<th><span>주소</span></th>
												<td><input type="text" class="address" name="address1"
													size="10" value="${map.MEM_ADDRESS1}" disabled>-<input type="text"
													class="address" name="address2" size="10" value="${map.MEM_ADDRESS2}" disabled>
													<br> <input type="text" class="address" name="ZIPCODE"
													size="31" value="${map.MEM_ZIPCODE}" disabled></td>
											</tr>
											<tr>
												<th><span>휴대폰</span></th>
												<td><input type="text" value="${map.MEM_PHONE}" disabled></td>
											</tr>
										</tbody>
								
									</table>
								</div>
								<!-- join_form E  -->

								<div class="btn_wrap">
                					<a href="#this" class="btn" id="update"><button>정보 수정</button></a>
                  			</div>
							</div>
							<!-- form_txtInput E -->
						</div>
						<!-- content E-->
					</div>
					<!-- container E -->
			</div>
		
		</div>
	</div>
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
		/*	$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();                   <!--id="list" 호출 -->
				fn_openBoardList();                  
			});*/
			
			$("#update").on("click", function(e){ //수정하기 버튼
				e.preventDefault();             <!--id="update" 호출 -->
				fn_openBoardUpdate();
			});
		});
		
	/*	function fn_openBoardList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/sample/openBoardList.do' />");
			comSubmit.submit();
		}*/
		
		function fn_openBoardUpdate(){
			var MEM_NUM = "${map.MEM_NUM}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/member/updateMyInfoForm.mk' />");
			comSubmit.addParam("MEM_NUM", MEM_NUM);
			comSubmit.submit();
		}
	</script>
	
</body>
</html>