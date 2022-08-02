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

/* sales_total start */
.sales_total>.container>.table {
	border-collapse: collapse;
	text-align: center;
	border-top: 3px solid #22499d;
}

.sales_total>.container>.table th {
	font-size: 16px;
	text-align: center;
	color: #555555;
	font-weight: bold;
	background-color: #f8fafc;
	color: #091f46;
}

.sales_total>.container>.table td {
	font-size: 16px;
	text-align: center;
	color: #555555;
}

.sales_total>.container>.table tr:hover {
	background-color: #f7f7f7;
}

.sales_total .title {
	margin-left: 20px;
}

.sales_total>.container {
	margin-top: 50px;
}
</style>
<body>
	<jsp:include page="/WEB-INF/view/include/admin_menu.jsp" />
	<!-- sales_total start -->
	<div class="sales_total container">

		<div class="title">
			<h1>전체 수익</h1>
		</div>
		<hr>

		<div class="container">
			<table class="table">
				<tr class="table_header">
					<th>예매 순위</th>
					<th>영화 이름</th>
					<th>금일 매출</th>
					<th>누적 매출</th>
					<th>누적 관람객</th>
					<th>남성 비율</th>
					<th>여성 비율</th>
					<th>전체 예매율</th>
				</tr>
				<c:forEach items="${list}" var="dto">
					<tr>
					
						<td>${dto.rank }</td>
						<td>${dto.sales_title}</td>
						<td>${dto.sales_today}원</td>
						<td>${dto.sales_total}원</td>
						<td>${dto.sales_viewCount}명</td>
						<td><fmt:formatNumber value="${dto.sales_man}" pattern="#.#"/>%</td>
						<td><fmt:formatNumber value="${dto.sales_woman}" pattern="#.#"/>%</td>
						<td><fmt:formatNumber value="${dto.sales_viewing}" pattern="#.#"/>%</td>
					</tr>
				</c:forEach>
			</table>
		</div>

	</div>
</body>
</html>