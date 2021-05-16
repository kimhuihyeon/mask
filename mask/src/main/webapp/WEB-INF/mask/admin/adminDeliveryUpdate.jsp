<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var='root' value="${pageContext.request.contextPath}/" />
<!DOCTYPE html>
<html lang="ko">



<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>이젠Mask 관리자페이지</title>
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
    <style>
        body{
            background-color: #f4f4f4;
        }

        .container{
            margin: auto;
            width:700px;
            margin-bottom: 100px;
        }

        .box{
            margin-top:50px;
            text-align: center;
            padding:10px;
            margin-bottom: 50px;
            background-color: rgb(224, 223, 223);
        }

        .info{
            
            display: flex;
            justify-content: center;
            align-content: center;
        }

        table{
        }

        input[type=text],input[type=password],textarea{
            margin:3px;
            border: 1px solid lightgray;
            border-radius: 5px;
            padding: 10px;
            height:40px;
            box-sizing: border-box;
            transition: 0.3s;
            outline: none;
        }

        input:focus {
            border: 1px solid rgb(180, 184, 189);
            box-shadow: 0 0 5px rgb(180, 184, 189);
        }
        
        th{
            width:100px;
            text-align: left;
            font-weight: bold;
            font-size: 12px;
        }

        button, input[type=button]{
            cursor: pointer;
        }
        
    </style>
   
</head>

<body>
	 <div class="container">
        <div class="box">
            <label style="display: inline-block; padding:10px; font-weight: bold;">배송 정보 수정</label>
            <div style="font-size: 13px;">수정할 내용을 입력해주세요.</div>
        </div>

        <div class="info">

            <table class="mk_order">
                <tbody>
                   <tr>
                        <th>
                            <span>이름</span>
                            <td><input type="text" value="${map.ORDER_USER_NAME}" name="ORDER_USER_NAME" class="ORDER_USER_NAME"></td>
                        </th>
                      </tr>
                  <tr>
                  <th><span>주소</span></th>
                                <td>
                                	<input type="text" id="sample6_postcode" class="address" name="MEM_DZIPCODE" size="10" value="${map.ORDER_DZIPCODE }" class="ORDER_DZIPCODE">
                                	<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="margin-left: 13px; padding: 7px; border: 1px solid lightgray; outline-style: none; transition: .5s; border-radius: 5px;  display: inline-block;" ><br>
                                    <div class="height"></div>
                                    <input type="text" id="sample6_address" placeholder="주소" size="30" name="ORDER_DADD1" value="${map.ORDER_DADD1 }"  class="ORDER_DADD1"><br>
                                    <div class="height"></div>
                                    <input type="text" id="sample6_detailAddress" class="address" name="ORDER_DADD2" size="30" value="${map.ORDER_DADD2}" class="ORDER_DADD2">
                                    
                                </td>
                  
                  <tr>
                    <th><span>연락처</span></th>
                    <td><input type="text" value="${map.ORDER_PHONE}" name="ORDER_PHONE" class="ORDER_PHONE"></td>
                  </tr>
                  <tr>
                      <td></td>
                      <td style="text-align: center; padding:20px">
                          <button id="updateInfo" style="padding: 7px; border: 1px solid lightgray; outline-style: none; transition: .5s; border-radius: 5px; padding:5px 50px;" >변경</button>
                      </td>
                  </tr>
                  </tbody>
                  </table>
        </div>
    
    </div>
	<script>
	document.querySelector('#updateInfo').addEventListener('click',()=>{
		
		
		
        const ORDER_USER_NAME=document.querySelector('.ORDER_USER_NAME').value;
       	const ORDER_DZIPCODE=document.querySelector('#sample6_postcode').value;
        const ORDER_DADD1=document.querySelector('#sample6_address').value;
        const ORDER_DADD2=document.querySelector('#sample6_detailAddress').value;
        const ORDER_PHONE=document.querySelector('.ORDER_PHONE').value;
		const ORDER_NUM=${map.ORDER_NUM};
        
        console.log(ORDER_USER_NAME);
        console.log(ORDER_DZIPCODE);
        console.log(ORDER_DADD1);
        console.log(ORDER_DADD2);
        console.log(ORDER_PHONE);
        console.log(ORDER_NUM);
		
        
        $.ajax({
        	type:"get",
        	url: "${root}admin/deliverAddressUpdate.mk?ORDER_USER_NAME="+ORDER_USER_NAME+"&&ORDER_DZIPCODE="+ORDER_DZIPCODE+"&&ORDER_DADD1="+ORDER_DADD1+"&&ORDER_DADD2="+ORDER_DADD2+"&&ORDER_PHONE="+ORDER_PHONE+"&&ORDER_NUM="+ORDER_NUM,
        	success:function(){
        		alert('수정되었습니다.');
        		window.close()
        		
          	}
        });
    })
	</script>
	
</body>
</html>