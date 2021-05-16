<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var='root' value="${pageContext.request.contextPath}/" />
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
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }/* 
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                } */
                // 조합된 참고항목을 해당 필드에 넣는다.
              
            
            } 

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
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

	<!--회원가입-->
        <div class="join_jsp">
            <div class="join">
                <form action="${root }member/insertJoin.mk" method="post" onSubmit="return joinform_check()">
                <div class="wrap wd668">
                    <div class="container">
                      <div class="form_txtInput">
                        <h2 class="sub_tit_txt">Create Account</h2>
                        <div class="join_form">
                          <table>
                            <colgroup>
                              <col width="30%"/>
                              <col width="auto"/>
                            </colgroup>
                            <tbody>
                              <tr>
                                <th><span>아이디</span></th>
                                <td><input type="text" class="idCheck Eid" name="MEM_ID"><br>
                                	<span id="checkValue" style="font-size:9px; color:crimson;"></span>
                                </td>
                              </tr>
                              <tr>
                                <th><span>비밀번호</span></th>
                                <td><input type="password" class="Epw1" name="MEM_PW"><br>
                                	<span class="checkPw1" style="font-size:9px; color:crimson;"></span>
                                </td>
                              </tr>
                              <tr>
                                <th><span>비밀번호 확인</span></th>
                                <td><input type="password" class="Epw2"><br>
                                	<span class="checkPw2" style="font-size:9px; color:crimson;"></span>
                                </td>
                              </tr>
                              <tr>
                                <th><span>이름</span></th>
                                <td><input type="text" placeholder="" class="Ename" name="MEM_NAME"><br>
                                	<span class="checkEname" style="font-size:9px; color:crimson;"></span>
                                </td>
                              </tr>
                              <tr>
                                <th><span>성별</span></th>
                                <td>
                                    <span class="g"><input type="radio" name="MEM_GEN" id="M" checked="checked" value="M"></span><label for="M">남자</label>
                                    <span class="g"><input type="radio" name="MEM_GEN" id="G" value="F"></span><label for="G">여자</label>
                                </td>
                              </tr>
                              <tr class="email">
                                <th><span>이메일</span></th>
                                <td>
                                  <input type="text"  class="Eemail" size="30" name="MEM_EMAIL"><br>
                                  <span class="checkEmail" style="font-size:9px; color:crimson;"></span>
                                </td>
                              </tr>
                              <tr>
                                <th><span>주소</span></th>
                                <td>
                                	<input type="text" id="sample6_postcode" class="address" name="MEM_ZIPCODE" size="10" placeholder="우편번호" >
                                	<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="margin-left: 13px; padding: 7px; border: 1px solid lightgray; outline-style: none; transition: .5s; border-radius: 5px;  display: inline-block;" ><br>
                                    <div class="height"></div>
                                    <input type="text" id="sample6_address" placeholder="주소" size="30" name="MEM_ADDRESS1"><br>
                                    <div class="height"></div>
                                    <input type="text" id="sample6_detailAddress" class="address" name="MEM_ADDRESS2" size="30" placeholder="상세주소" >
                                    
                                </td>
                              </tr>
                              <tr>
                                <th><span>휴대폰</span></th>
                                <td><input type="text" class="Ephone" name="MEM_PHONE"><br>
                                	<span class="checkPhone" style="font-size:9px; color:crimson;"></span>
                                </td>
                              </tr>
                            </tbody>
                          </table>
                        </div><!-- join_form E  -->
                        
                        <div class="agree_wrap">
                          <div class="checkbox_wrap">
                            <input type="checkbox" id="news_letter" name="MEM_EMAILCK" class="agree_chk" value="Y">
                            <label for="news_letter">[선택]뉴스레터 이메일 수신동의</label>
                          </div>
                          <div class="checkbox_wrap mar27">
                            <input type="checkbox" id="marketing" name="MEM_SNSCK" class="agree_chk" value="Y">
                            <label for="marketing">[선택]마케팅 목적 개인정보 수집 및 이용에 대한 동의</label>
                            <ul class="explan_txt">
                              <li><span class="red_txt">항목 : 성별, 생년월일, 휴대폰, SNS</span></li>
                              <li>고객님께서는 위의 개인정보 및 회원정보 수정 등을 통해 추가로 수집하는 개인정보에<br/>
                                대해 동의하지 않거나 개인정보를 기재하지 않음으로써 거부하실 수 있습니다.<br/>
                                다만 이때 회원 대상 서비스가 제한될 수 있습니다.
                              </li>
                            </ul>
                          </div>
                        </div>
                        <div class="btn_wrap">
                          <button type="submit" onSubmit="return joinform_check()">확인</button>
                        </div>
                      </div> <!-- form_txtInput E -->
                    </div><!-- content E-->
                  </div> <!-- container E -->
                </form>
            </div>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
          </div>  
</body>

<!-- id중복확인  -->
<script>

	const element=document.querySelector('.idCheck');
	
	element.addEventListener('keyup',(event)=>{
		
		let id= event.target.value;
		let idv="MEM_ID="+id;
		console.log("idv : " +idv);
		$.ajax({
			
			type:"post",
			url:${root}+"member/idCheck.mk",
			data : idv,
			success : function(data){
				console.log(data);
				idCheckfn(data);
			},
			error : function(){
				alert('통신실패!!');
			}
		})
		
	})
	
	element.addEventListener('keydown',(event)=>{
		
		let id= event.target.value;
		let idv="MEM_ID="+id;
		console.log("idv : " +idv);
		$.ajax({
			
			type:"post",
			url:${root}+"member/idCheck.mk",
			data : idv,
			success : function(data){
				console.log(data);
				idCheckfn(data);
			},
			error : function(){
				alert('통신실패!!');
			}
		})
		
	})
	
	function idCheckfn(idV){
		if(idV===element.value && idV!==''){
			document.querySelector("#checkValue").innerHTML=`이미 사용중인 아이디입니다.`;
			element.focus();
		}else if(element.value.length<4||/^[a-zA-z0-9]{4,12}$/.test(element.value)===false){
			document.querySelector("#checkValue").innerHTML=`아이디는 영문 대/소문자와 숫자 4~12자리로 입력해야합니다.`;
		}else {
			document.querySelector("#checkValue").innerHTML=` `;
		}
	}
	
	<!--유효성검사-->
	
	const Epw1=document.querySelector('.Epw1');
	
	Epw1.addEventListener('keyup',()=>{
	      if(Epw1.value==""){
		        document.querySelector('.checkPw1').innerHTML=`비밀번호를 입력해주세요`;
		        Epw1.focus();
		        return false;
		      }else if(/^[a-zA-z0-9]{8,20}$/.test(Epw1.value)===false){
		        document.querySelector('.checkPw1').innerHTML=`비밀번호는 영문 대소문자,숫자 포함 8~20자리를 사용해야 합니다.`;
		        Epw1.focus();
		        return false;
		      }else{
	          document.querySelector('.checkPw1').innerHTML='';
	        }
	     })
			 
	Epw1.addEventListener('keydown',()=>{

	      if(Epw1.value==""){
		        document.querySelector('.checkPw1').innerHTML=`비밀번호를 입력해주세요`;
		        Epw1.focus();
		        return false;
		      }else if(/^[a-zA-z0-9]{8,20}$/.test(Epw1.value)===false){
		        document.querySelector('.checkPw1').innerHTML=`비밀번호는 영문 대소문자,숫자 포함 8~20자리를 사용해야 합니다.`;
		        Epw1.focus();
		        return false;
		      }else{
	          document.querySelector('.checkPw1').innerHTML='';
	        }
	      
		 })
	  
	const Epw2=document.querySelector('.Epw2');
    
    Epw2.addEventListener('keyup',()=>{
      if(Epw2.value!==Epw1.value){
	        document.querySelector('.checkPw2').innerHTML=`비밀번호가 일치하지않습니다.`;
	        Epw2.focus();
	        return false;
	    }else{
        document.querySelector('.checkPw2').innerHTML=` `;
      }
    })
    
    Epw2.addEventListener('keydown',()=>{
      if(Epw2.value!==Epw1.value){
	        document.querySelector('.checkPw2').innerHTML=`비밀번호가 일치하지않습니다.`;
	        Epw2.focus();
	        return false;
	    }else{
        document.querySelector('.checkPw2').innerHTML=` `;
      }
    })	 
	
    
    const Eemail=document.querySelector('.Eemail');
    
    Eemail.addEventListener('keyup',()=>{
        if(Eemail.value==""){
	        document.querySelector('.checkEmail').innerHTML=`이메일을 입력해주세요`;
	        Eemail.focus();
	        return false;
	      }else if(/^[a-zA-z0-9]+@[a-zA-z0-9]/.test(Eemail.value)===false){
	        document.querySelector('.checkEmail').innerHTML=`이메일 형식이 아닙니다.`;
	        Eemail.focus();
	        return false;
	      }else{
	    	  document.querySelector('.checkEmail').innerHTML=` `;
	      }
    })
    
    
    Eemail.addEventListener('keydown',()=>{
        if(Eemail.value==""){
	        document.querySelector('.checkEmail').innerHTML=`이메일을 입력해주세요`;
	        Eemail.focus();
	        return false;
	      }else if(/^[a-zA-z0-9]+@[a-zA-z0-9]/.test(Eemail.value)===false){
	        document.querySelector('.checkEmail').innerHTML=`이메일 형식이 아닙니다.`;
	        Eemail.focus();
	        return false;
	      }else{
	    	  document.querySelector('.checkEmail').innerHTML=` `;
	      }
    })
    
    
	 
	      const Ephone=document.querySelector('.Ephone');


    	Ephone.addEventListener('keyup',()=>{
      	if(Ephone.value==""){
	        document.querySelector('.checkPhone').innerHTML=`휴대폰 번호를 입력해주세요.`;
	        Ephone.focus();
	        return false;
	      }else if(/^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/.test(Ephone.value)===false){
	        document.querySelector('.checkPhone').innerHTML=`전화번호의 양식에 맞춰 입력해주세요.`;
	        Ephone.focus();
	        return false;
	      }else{
          document.querySelector('.checkPhone').innerHTML=` `;
        }
    })

   	 Ephone.addEventListener('keydown',()=>{
      	if(Ephone.value==""){
	        document.querySelector('.checkPhone').innerHTML=`휴대폰 번호를 입력해주세요.`;
	        Ephone.focus();
	        return false;
	      }else if(/^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/.test(Ephone.value)===false){
	        document.querySelector('.checkPhone').innerHTML=`전화번호의 양식에 맞춰 입력해주세요.`;
	        Ephone.focus();
	        return false;
	      }else{
          document.querySelector('.checkPhone').innerHTML=` `;
        }
    })
    
	 function joinform_check(){
	      const Eid=document.querySelector('.idCheck');
	      const Epw1=document.querySelector('.Epw1');
	      const Epw2=document.querySelector('.Epw2');
	      const Ename=document.querySelector('.Ename');
	      const Eemail=document.querySelector('.Eemail');
	      const Ephone=document.querySelector('.Ephone');

	      if(Eid.value==""){
	        document.querySelector('#checkValue').innerHTML=`아이디를 입력해주세요`;
	        Eid.focus();
	        return false;
	      }

	      if(Epw1.value==""){
	        document.querySelector('.checkPw1').innerHTML=`비밀번호를 입력해주세요`;
	        Epw1.focus();
	        return false;
	      }else if(/^[a-zA-z0-9]{8,20}$/.test(Epw1.value)===false){
	        document.querySelector('.checkPw1').innerHTML=`비밀번호는 영문 대소문자,숫자 포함 8~20자리를 사용해야 합니다.`;
	        Epw1.focus();
	        return false;
	      }

	      if(Epw2.value!==Epw1.value){
	        document.querySelector('.checkPw2').innerHTML=`비밀번호가 일치하지않습니다.`;
	        Epw2.focus();
	        return false;
	      }

	      if(Eename.value==""){
	        document.querySelector('.checkEname').value=`이름을 입력해주세요.`;
	        Ename.focus();
	        return false;
	      }

	      if(Eemail.value==""){
	        document.querySelector('.checkEmail').innerHTML=`이메일을 입력해주세요`;
	        Eemail.focus();
	        return false;
	      }else if(/^[a-zA-z0-9]+@[a-zA-z0-9]/.test(Eemail.value)===false){
	        document.querySelector('.checkEmail').innerHTML=`이메일 형식이 아닙니다.`;
	        Eemail.focus();
	        return false;
	      }
	      
	      
	      return true;
	      
    }


	    </script>


	

</html>