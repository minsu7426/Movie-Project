<%@page import="dto.MovieDto"%>
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
* {
	margin: 0;
	padding: 0;
	text-decoration: none;
	list-style: none;
	box-sizing: border-box;
}

a {
	color: black;
}

.shown_screen_title>h1 {
	margin-left: 20px;
}

.shown_screen>.shown_screen_items>.shown_item {
	float: left;
	margin: 0 22px 30px;
}

.shown_screen>.current_screen_items>.current_item {
	float: left;
	margin: 0 22px 30px;
}

.shown_screen>.shown_screen_items, .shown_screen>.current_screen_items {
	display: none;
}

.shown_screen>#current:checked ~ .current_screen_items {
	display: block;
}

.shown_screen>#current:checked ~ nav>label:first-child, .shown_screen>#shown:checked 
	 ~ nav>label:nth-child(2) {
	text-decoration: underline;
}

.shown_screen>#shown:checked ~ .shown_screen_items {
	display: block;
}

.shown_screen>input {
	display: none;
}

.shown_screen>nav {
	margin: 0 0 20px 20px;
}

.shown_screen>nav>label {
	font-size: 20px;
	margin-right: 20px;
	cursor: pointer;
}
</style>
<body>
	<%
	List<MovieDto> shownList = (List<MovieDto>) request.getAttribute("shownList");
	List<MovieDto> currentList = (List<MovieDto>) request.getAttribute("currentList");
	%>
	<jsp:include page="../include/menu.jsp" />
	<div class="shown_screen container">
		<div class="shown_screen_title">
			<h1>영화</h1>
			<hr>
		</div>

		<input type="radio" name="check" id="current"> <input
			type="radio" name="check" id="shown" checked>

		<nav class="shown_screen_nav">
			<label for="current">현재 상영작</label> <label for="shown">상영 예정작</label>
		</nav>
		<div class="current_screen_items">
			<%
			for (int i = 0; i < currentList.size(); i++) {
				MovieDto dto = currentList.get(i);
			%>
			<div class="current_item">
				<a href=""> <img
					src="../resources/images/movie/<%=dto.getMovie_img()%>.jpg" alt=""
					width="240px" height="340px">
				</a>
			</div>
			<%
			}
			%>
		</div>
		<div class="shown_screen_items">
			<%
			for (int i = 0; i < shownList.size(); i++) {
				MovieDto dto = shownList.get(i);
			%>
			<div class="shown_item">
				<a href=""> <img
					src="../resources/images/movie/<%=dto.getMovie_img()%>.jpg" alt=""
					width="240px" height="340px">
				</a>
			</div>
			<%
			}
			%>
		</div>
	</div>
</body>
</html>