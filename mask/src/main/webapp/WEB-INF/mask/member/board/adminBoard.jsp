<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath}/" />
<c:import url="/WEB-INF/mask/layout/header.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
	<div class="admin-board-jsp">
		<div class="container">
			<label>공지사항</label>
			<table>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
					<th>조회수</th>
				</tr>
				<tr>
					<td>1</td>
					<td>코로나</td>
					<td>EZENMASK</td>
					<td>2021-03-02</td>
					<td>1</td>
				</tr>
				<tr>
					<td>2</td>
					<td>공지사항</td>
					<td>EZENMASK</td>
					<td>2021-03-03</td>
					<td>2</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>