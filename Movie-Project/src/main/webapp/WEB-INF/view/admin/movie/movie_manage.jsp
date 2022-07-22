<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
/* menu start */
* {
	margin: 0;
	padding: 0;
	text-decoration: none;
	list-style: none;
	box-sizing: border-box;
}

.movie_list>.container>.table {
	border-collapse: collapse;
	text-align: center;
	border-top: 3px solid #22499d;
	margin-top: 50px;
}

.movie_list>.container>.table th:nth-child(2) {
	width: 30%;
}

.movie_list>.container>.table th {
	font-size: 16px;
	text-align: center;
	color: #555555;
	font-weight: bold;
	background-color: #f8fafc;
	color: #091f46;
}

.movie_list>.container>.table td {
	font-size: 16px;
	text-align: center;
	color: #555555;
	border-right: none;
	border-left: none;
	padding: 20px 0;
}

.movie_list>.container>.table tr:hover {
	background-color: #f7f7f7;
}

.movie_list>.search_container {
	margin-top: 10px;
	height: 30px;
}

.movie_list>.search_container .search_content {
	width: 300px;
	height: 40px;
}

.movie_list>.search_container .search_select {
	height: 40px;
}

.movie_list>.search_container .search .search_btn {
	height: 40px;
	width: 60px;
	background-color: #394b61;
	color: white;
}

.movie_list td {
	border: 1px solid #c8d1db
}

.movie_list>.search_container {
	position: relative;
}

.movie_list>.search_container>a {
	position: absolute;
	top: 0;
	right: 0;
	width: 60px;
	height: 40px;
	font-size: 16px;
	line-height: 28px;
}

.movie_list h1 {
	margin-left: 20px;
}
</style>
<body>
	<jsp:include page="../../include/admin_menu.jsp"></jsp:include>
	<div class="movie_list container">
		<div class="title">
			<h1>영화 관리</h1>
		</div>
		<hr>

		<div align="center" class="search_container">
			<form method="post" action="#">
				<table>
					<tr>
						<td><select class="search_select" name="search_item">
								<option value="title">제목</option>
								<option value="content">본문 내용</option>
								<option value="name">글쓴이</option>
						</select></td>
						<td class="search"><input class="search_content" type="text"
							name="text" /> <input type="submit" class="search_btn"
							value="검색" /></td>
					</tr>
				</table>
			</form>
			<a href="/admin/movie/movie_add" class="btn btn-primary">등록</a>
		</div>

		<div class="container">
			<table class="table">
				<tr class="table_header">
					<th>순서</th>
					<th>영화 제목</th>
					<th>개봉일</th>
					<th>장르</th>
					<th>감독</th>
					<th>러닝타임</th>
					<th>등급</th>
					<th>상영여부</th>
				</tr>
				<c:forEach var="dto" items="${list}">
					<fmt:parseDate value="${dto.movie_date}" pattern="yyyy-MM-dd"
						var="date" />
					<tr>
						<td>${dto.movie_code}</td>
						<td><a
							href="/admin/movie/movie_update?movie_code=${dto.movie_code}">${dto.movie_title}</a></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${date}" /></td>
						<td>${dto.movie_genre}</td>
						<td>${dto.movie_director}</td>
						<td>${dto.movie_time}분</td>
						<td>${dto.movie_grade}</td>
						<td ${dto.movie_flag == false ? 'style="color:red"' : 'style="color:blue"'}>${dto.movie_flag == true ? "상영중" : "상영종료"}</td>
					</tr>
				</c:forEach>
			</table>
		</div>

		<div class="page" align="center">
			<b>[1]</b> [2] [3] [4] [5]
		</div>
	</div>
</body>
</html>