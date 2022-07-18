<%@page import="dto.NoticeDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<%
	List<NoticeDto> list = (List<NoticeDto>)request.getAttribute("list");
%>
<jsp:include page="../include/menu.jsp"/>
	<div class="notice_user container">

		<div class="title">
			<h1>공지사항</h1>
		</div>
		<hr>

		<div align="center" class="search_container">
			<form action="search">
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
				<%
					for(int i = 0; i < list.size(); i++){
						NoticeDto dto = list.get(i);
				%>
				
				<tr>
					<td><%=dto.getNotice_code() %></td>
					<td><a href=""><%=dto.getNotice_title() %></a></td>
					<td><%=dto.getNotice_date().substring(0, 10) %></td>
					<td>admin</td>
					<td><%=dto.getNotice_hit() %></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>

		<div class="page" align="center">
			<b>[1]</b> [2] [3] [4] [5]
		</div>
	</div>
</body>
</html>