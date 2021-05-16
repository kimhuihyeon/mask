<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath}/" />
<c:import url="/WEB-INF/mask/layout/header.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="orderCom">
        <div class="box">
        <label>ORDER</label>
        <div class="container">
            <div>&nbsp;&nbsp;결제가 완료되었습니다.</div>
            <table class="mk_order">
                <tbody>
                    <tr>
                        <th colspan="2"><label>주문확인서</label></th>
                    </tr>
                   <tr>
                        <th>
                            <span>이름</span>
                            <td>${map.MEM_NAME}</td>
                        </th>
                      </tr>
                  <tr>
                  <tr>
                    <th><span>우편번호</span></th>
                    <td>
                     ${map.MEM_ZIPCODE}
                    </td>
                  </tr>
                  <tr>
                    <th><span>주소</span></th>
                    <td>
                       ${map.MEM_ADDRESS1} ${map.MEM_ADDRESS2}
                    </td>
                  </tr>
                  <tr>
                    <th><span>유선전화</span></th>
                    <td>${map.MEM_PHONE}</td>
                  </tr>
                  <tr>
                    <th><span>휴대전화</span></th>
                    <td>${map.MEM_PHONE}</td>
                  </tr>
                  <tr>
                    <th><span>Email</span></th>
                    <td>${map.MEM_EMAIL}</td>
                  </tr>
                  <tr>
                    <th colspan="2"><label>배송지</label></th>
                  </tr>
                  <tr>
                  	<th><span>이름</span></th>
                  	<td>${map2.ORDER_NAME}</td>
                  </tr>
                  <tr>
                    <th><span>우편번호</span></th>
                    <td>${map2.ORDER_DZIPCODE}</td>
                  </tr>
                  <tr>
                    <th><span>주소</span></th>
                    <td> ${map2.ORDER_DADD1} ${map2.ORDER_DADD2}</td>
                  </tr>
                  <tr>
                    <th><span>유선전화</span></th>
                    <td>${map2.ORDER_PHONE}</td>
                  </tr>
                  <tr>
                    <th><span>휴대전화</span></th>
                    <td>${map2.ORDER_PHONE}</td>
                  </tr>
                  <tr>
                    <th><span>배송메시지</span></th>
                    <td>${map2.ORDER_DMEMO}</td>
                  </tr>
                  <tr>
                    <th><span>결제방식</span></th>
                    <td>${map2.ORDER_PAY}</td>
                  </tr>
                </tbody>
              </table>
                <div class="text" style="margin-bottom: 30px;">
                  입금계좌 : 국민은행 1002-111-11111 이젠마스크
                  <div>결제금액 : ${map2.ORDER_TCOST}원</div>
                </div>
              <button onclick="location.href='main/openMainList.mk'">쇼핑하러가기</button>
        </div>
        </div>
      </div>
</body>
</html>