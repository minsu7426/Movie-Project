<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

/* ticket_manage start */
.ticket_manage>.container>.table {
	border-collapse: collapse;
	text-align: center;
	border-top: 3px solid #22499d;
}

.ticket_manage>.container>.table th {
	font-size: 16px;
	text-align: center;
	color: #555555;
	font-weight: bold;
	background-color: #f8fafc;
	color: #091f46;
}

.ticket_manage>.container>.table td {
	font-size: 16px;
	text-align: center;
	color: #555555;
}

.ticket_manage>.container>.table tr:hover {
	background-color: #f7f7f7;
}

.ticket_manage>.search_container {
	margin-top: 10px;
	height: 30px;
	margin-bottom: 50px;
}

.ticket_manage>.search_container .search_content {
	width: 300px;
	height: 40px;
}

.ticket_manage>.search_container .search_select {
	height: 40px;
}

.ticket_manage>.search_container .search .search_btn {
	height: 40px;
	width: 60px;
	background-color: #394b61 !important;
	color: white;
}

.ticket_manage .search_container td {
	border: 1px solid #c8d1db
}

.ticket_manage .title {
	margin-left: 20px;
}
</style>
<body>
	<jsp:include page="/WEB-INF/view/include/admin_menu.jsp" />
	<!-- ticket_manage start -->
	<div class="ticket_manage container">

		<div class="title">
			<h1>예매 내역 관리</h1>
		</div>
		<hr>

		<div align="center" class="search_container">
			<form method="post" action="/admin/ticket">
				<table>
					<tr>
						<td><select class="search_select" name="search_item">
								<option value="movie_title">영화 제목</option>
								<option value="tic_id">아이디</option>
						</select></td>
						<td class="search"><input class="search_content" type="text"
							name="text" /> <input type="submit" class="search_btn"
							value="검색" /></td>
					</tr>
				</table>
			</form>
		</div>

		<div class="container">
			<table class="table">
				<tr class="table_header">
					<th>번호</th>
					<th>티켓 번호</th>
					<th>영화 이름</th>
					<th>아이디</th>
					<th>결제 일자</th>
					<th>좌석</th>
					<th>금액</th>
					<th>비고</th>
				</tr>
				<c:forEach var="dto" items="${list}" varStatus="status">
					<tr>
						<td>${pageDto.displayCount - status.index}</td>
						<td>${dto.tic_num}</td>
						<td>${dto.movie_title}</td>
						<td>${dto.tic_id}</td>
						<fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss" var="date" value="${dto.tic_paytime }"/>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${date}"/></td>
						<td>${dto.tic_seat}</td>
						<td>${dto.tic_payment}</td>
						<td><a href="/admin/ticket/ticket_delete?tic_num=${dto.tic_num}" onclick="return confirm('정말로 삭제 하시겠습니까?');">삭제</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div aria-label="Contacts Page Navigation" align="center">
			<ul class="page pagination justify-content-center m-0">
				<c:if test="${pageDto.prev}">
					<li class="page-item"><a class="page-link"
						href="/admin/ticket?page=${pageDto.startPage - 1}">이전</a></li>
				</c:if>
				<c:forEach begin="${pageDto.startPage}" end="${pageDto.endPage}"
					var="index">
					<li class="page-item"><c:choose>
							<c:when test="${pageDto.cri.page == index}">
								<a class="page-link" style="background-color: #ddd"
									href="/admin/ticket?page=${index}&search_item=${pageDto.cri.search_item}&text=${pageDto.cri.text}">${index}</a>
							</c:when>
							<c:otherwise>
								<a class="page-link"
									href="/admin/ticket?page=${index}&search_item=${pageDto.cri.search_item}&text=${pageDto.cri.text}">${index}</a>
							</c:otherwise>
						</c:choose></li>
				</c:forEach>
				<c:if test="${pageDto.next && pageDto.endPage > 0}">
					<li class="page-item"><a class="page-link"
						href="/admin/ticket?page=${pageDto.endPage + 1}">다음</a></li>
				</c:if>
			</ul>
		</div>
	</div>

</body>
</html>