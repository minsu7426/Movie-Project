<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

.cinema_manage>.container>.table {
	border-collapse: collapse;
	text-align: center;
	border-top: 3px solid #22499d;
	margin-top: 50px;
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

.cinema_manage>.search_container {
	position: relative;
}

.cinema_manage>.search_container>a {
	position: absolute;
	top: 0;
	right: 0;
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
<jsp:include page="../../include/admin_menu.jsp"/>
	<div class="cinema_manage container">
		<div class="title">
			<h1>상영관 관리</h1>
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
			<a href="/admin/screen/screen_add" class="btn btn-primary">등록</a>
		</div>

		<div class="container">
			<table class="table">
				<tr class="table_header">
					<th>순서</th>
					<th>영화 코드</th>
					<th>영화 제목</th>
					<th>상영 날짜</th>
					<th>상영관</th>
					<th>상영시간</th>
					<th>잔여 좌석수</th>
					<th>수정</th>
				</tr>
				<tr>
					<td>1</td>
					<td>0001</td>
					<td>토르 : 러브 앤 썬더</td>
					<td>2022-06-01</td>
					<td>1관</td>
					<td>09:00</td>
					<td>27석 / 30석</td>
					<td><a href="">수정</a></td>
				</tr>
				<tr>
					<td>1</td>
					<td>0001</td>
					<td>토르 : 러브 앤 썬더</td>
					<td>2022-06-01</td>
					<td>1관</td>
					<td>09:00</td>
					<td>27석 / 30석</td>
					<td><a href="">수정</a></td>
				</tr>
				<tr>
					<td>1</td>
					<td>0001</td>
					<td>토르 : 러브 앤 썬더</td>
					<td>2022-06-01</td>
					<td>1관</td>
					<td>09:00</td>
					<td>27석 / 30석</td>
					<td><a href="">수정</a></td>
				</tr>
				<tr>
					<td>1</td>
					<td>0001</td>
					<td>토르 : 러브 앤 썬더</td>
					<td>2022-06-01</td>
					<td>1관</td>
					<td>09:00</td>
					<td>27석 / 30석</td>
					<td><a href="">수정</a></td>
				</tr>
				<tr>
					<td>1</td>
					<td>0001</td>
					<td>토르 : 러브 앤 썬더</td>
					<td>2022-06-01</td>
					<td>1관</td>
					<td>09:00</td>
					<td>27석 / 30석</td>
					<td><a href="">수정</a></td>
				</tr>

			</table>
		</div>

		<div class="page" align="center">
			<b>[1]</b> [2] [3] [4] [5]
		</div>
	</div>
</body>
</html>