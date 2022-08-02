<%@page import="dto.NoticeDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sfmt" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
/* setting */
* {
	margin: 0;
	padding: 0;
	text-decoration: none;
	list-style: none;
	box-sizing: border-box;
}
/* setting */
.notice_user>.container>.table {
	border-collapse: collapse;
	text-align: center;
	border-top: 3px solid #22499d;
}

.notice_user>.container>.table th {
	font-size: 16px;
	text-align: center;
	color: #555555;
	font-weight: bold;
	background-color: #f8fafc;
	color: #091f46;
}

.notice_user>.container>.table td {
	font-size: 16px;
	text-align: center;
	color: #555555;
}

.notice_user>.container>.table tr:hover {
	background-color: #f7f7f7;
}

.notice_user>.search_container {
	margin-top: 10px;
	height: 30px;
	margin-bottom: 50px;
}

.notice_user>.search_container .search_content {
	width: 300px;
	height: 40px;
}

.notice_user>.search_container .search_select {
	height: 40px;
}

.notice_user>.search_container .search .search_btn {
	height: 40px;
	width: 60px;
	background-color: #394b61 !important;
	color: white;
}

.notice_user .search_container td {
	border: 1px solid #c8d1db
}

.notice_user .add_btn {
	margin: 20px;
}

.notice_user .title {
	margin-left: 20px;
}
</style>
<body>
	<jsp:include page="/WEB-INF/view/include/menu.jsp" />
	<div class="notice_user container">

		<div class="title">
			<h1>공지사항</h1>
		</div>
		<hr>

		<div align="center" class="search_container">
			<form action="/notice/list">
				<table>
					<tr>
						<td>
							<select class="search_select" name="search_item">
								<option value="notice_title">제목</option>
								<option value="notice_content">본문 내용</option>
							</select>
						</td>
						<td class="search">
							<input class="search_content" type="text" name="text" />
							<input type="submit" class="search_btn" value="검색" />
						</td>
					</tr>
				</table>
			</form>
		</div>

		<div class="container">
			<table class="table">
				<tr class="table_header">
					<th>번호</th>
					<th width="500px">제목</th>
					<th>작성일</th>
					<th>작성자</th>
					<th>조회수</th>
				</tr>
				<c:forEach var="dto" items="${list}">
					<tr>
						<td>${dto.notice_code}</td>
						<td><a href="/notice/detail?notice_code=${dto.notice_code}&page=${pageDto.cri.page}&search_item=${pageDto.cri.search_item}&text=${pageDto.cri.text}">${dto.notice_title }</a></td>
						<fmt:parseDate value="${dto.notice_date }" pattern="yyyy-MM-dd" var="date" />
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${date}" /></td>
						<td>admin</td>
						<td>${dto.notice_hit}</td>
					</tr>
				</c:forEach>
			</table>
		</div>

		<div aria-label="Contacts Page Navigation" align="center">
			<ul class="page pagination justify-content-center m-0">
				<c:if test="${pageDto.prev}">
					<li class="page-item"><a class="page-link"
						href="/notice/list?page=${pageDto.startPage - 1}&search_item=${search_item}&text=${text}">이전</a></li>
				</c:if>
				<c:forEach begin="${pageDto.startPage}" end="${pageDto.endPage}"
					var="index">
					<li class="page-item">
						<c:choose>
							<c:when test="${pageDto.cri.page == index}">
								<a class="page-link" style="background-color: #ddd" href="/notice/list?page=${index}&search_item=${search_item}&text=${text}">${index}</a>
							</c:when>
							<c:otherwise>
								<a class="page-link" href="/notice/list?page=${index}&search_item=${search_item}&text=${text}">${index}</a>
							</c:otherwise>
						</c:choose>
					</li>
				</c:forEach>
				<c:if test="${pageDto.next && pageDto.endPage > 0}">
					<li class="page-item"><a class="page-link"
						href="/notice/list?page=${pageDto.endPage + 1}&search_item=${search_item}&text=${text}">다음</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</body>
</html>