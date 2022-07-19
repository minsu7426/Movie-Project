<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
	<c:set var="count" value="${cnt}"/>
	<c:choose>
	<c:when test="${empty count}">
		<form action="/login/idCheckdo" method="get">
			<input type="text" name="userId" placeholder="중복 체크할 ID를 입력하세요">
			<input type="submit" value="중복 체크">
		</form>
	</c:when>
	<c:otherwise>
		<form action="/login/idCheckdo" method="get">
			<input type="text" name="userId" value="${id}" placeholder="중복 체크할 ID를 입력하세요">
			<input type="submit" value="중복 체크">
		</form>
		<c:choose>
			<c:when test="${count == 1}">	
				<span style="color:red">해당 ID는 이미 사용 중합니다.</span>
			</c:when>
			<c:otherwise>
				<span style="color:green">해당 ID는 사용이 가능합니다.</span>
				<button onclick="userId()">사용하기</button>
		<script type="text/javascript">
			function userId(){
				window.opener.document.getElementById('userId').value='${id}';
				window.close();
			}
		</script>
			</c:otherwise>			
		</c:choose>
	</c:otherwise>	
	</c:choose>
	</div>
</body>
</html>