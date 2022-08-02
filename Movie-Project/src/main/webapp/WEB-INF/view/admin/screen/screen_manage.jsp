<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
* {
	margin: 0;
	padding: 0;
	text-decoration: none;
	list-style: none;
	box-sizing: border-box;
}

.cinema_manage>.container {
	text-align: right;
}

.cinema_manage>.container {
	text-align: right;
}

.cinema_manage>.container>.table {
	border-collapse: collapse;
	text-align: center;
	border-top: 3px solid #22499d;
	margin-top: 20px;
}

.cinema_manage>.container>.table th:nth-child(3) {
	width: 40%;
}

.cinema_manage>.container>.table th {
	font-size: 16px;
	text-align: center;
	color: #555555;
	font-weight: bold;
	background-color: #f8fafc;
	color: #091f46;
}

.cinema_manage>.container>.table td {
	font-size: 16px;
	text-align: center;
	color: #555555;
}

.cinema_manage>.container>.table tr:hover {
	background-color: #f7f7f7;
}

.cinema_manage>.search_container {
	margin-top: 10px;
	height: 30px;
}

.cinema_manage>.search_container .search_content {
	width: 300px;
	height: 40px;
}

.cinema_manage>.search_container .search_select {
	height: 40px;
}

.cinema_manage>.search_container .search .search_btn {
	height: 40px;
	width: 60px;
	background-color: #394b61;
	color: white;
}

.board_search td {
	border: 1px solid #c8d1db
}

.cinema_manage>.container>a {
	width: 60px;
	height: 40px;
	font-size: 16px;
	line-height: 28px;
}

.cinema_manage h1 {
	margin-left: 20px;
}
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/view/include/admin_menu.jsp" />
	<div class="cinema_manage container">
		<div class="title">
			<h1>상영관 관리</h1>
		</div>
		<hr>

		<div align="center" class="search_container">
			<form method="post" action="/admin/screen">
				<table>
					<tr>
						<td><select class="search_select" name="search_item">
								<option value="movie_title">영화 제목</option>
								<option value="scr_screen">상영관</option>
						</select></td>
						<td class="search"><input class="search_content" type="text"
							name="text" /> <input type="submit" class="search_btn"
							value="검색" /></td>
					</tr>
				</table>
			</form>
		</div>

		<div class="container">
			<a href="/admin/screen/screen_add" class="btn btn-primary">등록</a>
			<table class="table">
				<tr class="table_header">
					<th>순서</th>
					<th>상영 코드</th>
					<th>영화 제목</th>
					<th>상영관</th>
					<th>상영 날짜</th>
					<th>상영시간</th>
					<th>잔여 좌석수</th>
					<th>상영 여부</th>
					<th>수정</th>
				</tr>
				<c:forEach items="${list}" var="dto" varStatus="status">
					<tr>
						<td>
							${pageDto.displayCount - status.index}
						</td>
						<td>${dto.scr_code}</td>
						<c:forEach items="${title}" var="title">
							<c:if test="${title.movie_code eq dto.scr_movie}">
								<td>${title.movie_title}</td>
							</c:if>
						</c:forEach>
						<td>${dto.scr_screen }관</td>
						<td>${dto.scr_date }</td>
						<td>${dto.scr_time }</td>
						<c:set var="set" value="${dto.scr_seat }" />
						<c:set var="seat" value="${fn:split(set, ',')}" />
						<c:set var="size" value="${fn:length(seat) }" />
						<td>${size }/30석</td>
						<td ${dto.scr_flag == false ? 'style="color:red"' : 'style="color:blue"'}>${dto.scr_flag == true ? "상영중" : "상영종료"}</td>
						<td><a href="/admin/screen/update?scr_code=${dto.scr_code}">수정</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>

		<div aria-label="Contacts Page Navigation" align="center">
			<ul class="page pagination justify-content-center m-0">
				<c:if test="${pageDto.prev}">
					<li class="page-item"><a class="page-link"
						href="/admin/screen?page=${pageDto.startPage - 1}">이전</a></li>
				</c:if>
				<c:forEach begin="${pageDto.startPage}" end="${pageDto.endPage}"
					var="index">
					<li class="page-item"><c:choose>
							<c:when test="${pageDto.cri.page == index}">
								<a class="page-link" style="background-color: #ddd"
									href="/admin/screen?page=${index}&search_item=${pageDto.cri.search_item}&text=${pageDto.cri.text}">${index}</a>
							</c:when>
							<c:otherwise>
								<a class="page-link"
									href="/admin/screen?page=${index}&search_item=${pageDto.cri.search_item}&text=${pageDto.cri.text}">${index}</a>
							</c:otherwise>
						</c:choose></li>
				</c:forEach>
				<c:if test="${pageDto.next && pageDto.endPage > 0}">
					<li class="page-item"><a class="page-link"
						href="/admin/screen?page=${pageDto.endPage + 1}">다음</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</body>
</html>