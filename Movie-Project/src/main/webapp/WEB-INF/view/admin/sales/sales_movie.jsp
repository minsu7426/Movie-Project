<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

/* sales_movie start */
.sales_movie>.container>.table {
	border-collapse: collapse;
	text-align: center;
	margin: 50px 0 20px 0;
}

.sales_movie>.container>.table th {
	font-size: 16px;
	text-align: center;
	font-weight: bold;
	background-color: #75b0c5;
	color: #091f46;
	border: 2px solid lightslategrey;
}

.sales_movie>.container>.table td {
	font-size: 16px;
	text-align: center;
	color: #555555;
	border: 2px solid lightslategrey;
}

.sales_movie>.container>.table tr:hover {
	background-color: #f7f7f7;
}

.sales_movie>.search_container {
	margin-top: 10px;
	height: 30px;
	margin-bottom: 50px;
}

.sales_movie>.search_container .search_content {
	width: 300px;
	height: 40px;
}

.sales_movie>.search_container .search_select {
	height: 40px;
}

.sales_movie>.search_container .search .search_btn {
	height: 40px;
	width: 60px;
	background-color: #394b61 !important;
	color: white;
}

.sales_movie .search_container td {
	border: 1px solid #c8d1db
}

.sales_movie .title {
	margin-left: 20px;
}
.btn_title {
	font-size: 18px;
	padding: 0 10px;
}
</style>
<body>
	<jsp:include page="/WEB-INF/view/include/admin_menu.jsp" />
	<!-- sales_movie start -->
	<div class="sales_movie container">

		<div class="title">
			<h1>영화별 수익 관리</h1>
		</div>
		<hr>

		<div align="center" class="search_container">
			<form method="post" action="#">
				<table>
					<tr>
						<td class="search_select">
							<div class="btn_title">영화 제목</div>
						<!-- <select class="search_select" name="search_item">
								<option value="title">제목</option>
								<option value="content">본문 내용</option>
								<option value="name">글쓴이</option>
						</select> -->
						</td>
						<td class="search"><input class="search_content" type="text"
							name="search_title" value="${movie_title }"/> <input type="submit" class="search_btn"
							value="검색" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="title">
			<h1>${movie_title}</h1>
		</div>
		<div class="container">
			<table class="table">
				<tr class="table_header">
					<th>금일 매출</th>
					<th>전일 매출</th>
					<th>주간 매출</th>
					<th>월간 매출</th>
					<th>전체 매출</th>
				</tr>
				<tr>
					<td>${dto.sales_today}원</td>
					<td>${dto.sales_yesday}원</td>
					<td>${dto.sales_week}원</td>
					<td>${dto.sales_month}원</td>
					<td>${dto.sales_total}원</td>
				</tr>
			</table>
			<table class="table">
				<tr class="table_header">
					<th>금일 관람율</th>
					<th>전체 관람율</th>
					<th>남성 비율</th>
					<th>여성 비율</th>
					<th>평균 연령</th>
				</tr>
				<tr>
				
					<td><fmt:formatNumber value="${dto.sales_viewing_today}" pattern="#.#"/>%</td>
					<td><fmt:formatNumber value="${dto.sales_viewing_total}" pattern="#.#"/>%</td>
					<td><fmt:formatNumber value="${dto.sales_man}" pattern="#.#"/>%</td>
					<td><fmt:formatNumber value="${dto.sales_woman}" pattern="#.#"/>%</td>
					<td><fmt:formatNumber value="${dto.sales_avg}" pattern="#.#"/>세</td>
				</tr>
			</table>
		</div>


	</div>
</body>
</html>