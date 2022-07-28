<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<style>
* {
	margin: 0;
	padding: 0;
	text-decoration: none;
	list-style: none;
	box-sizing: border-box;
}

.topmenu{
	position: relative;
	z-index: 100;
}

.ticketing>.ticketing_title>h1 {
	margin-left: 20px;
}

.ticketing>.ticketing_movie {
	position: relative;
	margin-top: 50px;
	background-color: white;
	display: flex;
}

.ticketing>.ticketing_movie>.ticketing_menu {
	background-color: white;
	min-width: 14%;
	text-align: center;
	border-right: 1px solid rgb(233, 224, 224);
}

.ticketing>.ticketing_movie>.ticketing_menu>p {
	font-size: 18px;
	font-weight: 700;
	padding: 30px 0;
	height: 160px;
	line-height: 100px;
	margin: 0;
}

.ticketing>.ticketing_movie>.ticketing_menu>p:not(:first-child) {
	border-top: 1px solid rgb(233, 224, 224);
}

.ticketing>.ticketing_movie>.ticketing_menu>p:nth-child(1) {
	background-color: skyblue;
	color: darkslategrey;
}

.ticketing>.ticketing_movie>.ticketing_select {
	vertical-align: text-top;
	overflow-y: scroll;
	max-height: 640px;
	width: 980px;
}

.ticketing>.ticketing_movie>.ticketing_select>div>input {
	display: none;
}

.ticketing>.ticketing_movie>.ticketing_select>div>label {
	margin: 0;
	cursor: pointer;
}

.ticketing>.ticketing_movie>.ticketing_select>.ticketing_item {
	float: left;
	width: 160px;
	height: 240px;
	margin: 20px 40px;
}

.ticketing>.ticketing_movie>form>button {
	position: absolute;
	display: inline-block;
	right: 100px;
	font-weight: 700;
	bottom: 60px;
	color: white;
	padding: 10px 25px;
	border-radius: 20px;
	background-color: #393b39;
	border: 3px solid transparent;
	text-decoration: none;
	opacity: 0.9;
	transition: all 0.3s;
}

.ticketing>.ticketing_movie>form>button:hover {
	background-color: white;
	border: 3px solid #393b39;
	color: black;
}

.ticketing>.ticketing_movie>.ticketing_select>div>input:checked ~ label
	{
	box-shadow: 1px 3px 9px 1px;
	transform: scale(1.1);
	transition: all 0.3s;
}
</style>

<body>
	<div class="topmenu">
	<%@include file="/WEB-INF/view/include/menu.jsp"%>
	</div>	
	<div class="ticketing container">

		<div class="ticketing_title">
			<h1>예매</h1>
			<hr>
		</div>
		<div class="ticketing_movie">
			<div class="ticketing_menu">
				<p>영화선택</p>
				<p>상영시간</p>
				<p>좌석</p>
				<p>결제</p>
			</div>
			<form class="ticketing_select" method="post" action="/ticketing/secondreserve">
			<c:forEach items="${movieList }" var="movie">
				<div class="ticketing_item">
					<input type="radio" name="movie_code" id="${movie.movie_code }" value="${movie.movie_code }"> <label
						for="${movie.movie_code }"><img src="<c:url value="/resources/images/movie/${movie.movie_img }"/>"
						alt="" width="160px" height="240px"></label>
				</div>
			</c:forEach>				
				<button type="submit">다음단계 >></button>
			</form>
		</div>
	</div>
</body>
</html>