<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
</head>
<style>
/* menu start */
* {
	margin: 0;
	padding: 0;
	text-decoration: none;
	list-style: none;
	box-sizing: border-box;
}

.topmenu {
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
	height: 640px;
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

.ticketing>.ticketing_movie>.ticketing_menu>p:nth-child(2) {
	background-color: skyblue;
	color: darkslategrey;
}

.ticketing>.ticketing_movie>.ticketing_date {
	border-right: 1px solid rgb(233, 224, 224);
	overflow-y: scroll;
	max-height: 640px;
}

.ticketing>.ticketing_movie>.ticketing_date>li {
	font-size: 16px;
	font-weight: 700;
	display: block;
	padding: 40px 20px;
}

.ticketing>.ticketing_movie>.ticketing_date>li:not(:first-child) {
	border-top: 1px solid rgb(233, 224, 224);
}

.ticketing>.ticketing_movie>.ticketing_date>li:hover {
	background-color: rgb(229, 243, 248);
	color: darkslategrey;
	text-decoration: none;
}

.ticketing>.ticketing_movie>form>.ticketing_conta>.ticketing_date_kwan {
	margin: 20px 0 0 50px;
	height: 200px;
}

.ticketing>.ticketing_movie>form>.ticketing_conta>.ticketing_date_kwan>.ticketing_kwan
	{
	font-size: 26px;
	font-weight: 600;
}

.ticketing>.ticketing_movie>form>.ticketing_conta>.ticketing_date_kwan>.ticketing_kwan>span
	{
	position: relative;
	font-weight: 300;
	margin-left: 10px;
	padding-left: 12px;
	position: relative;
}

.ticketing>.ticketing_movie>form>.ticketing_conta>.ticketing_date_kwan>.ticketing_kwan>span::before
	{
	content: "";
	display: block;
	position: absolute;
	top: 55%;
	left: 0;
	transform: translateY(-50%);
	width: 1px;
	height: 26px;
	background: #e4e4e4;
}

.ticketing>.ticketing_movie>form>.ticketing_conta>.ticketing_date_kwan>.ticketing_seat
	{
	display: inline-block;
}

.ticketing>.ticketing_movie>form>.ticketing_conta>.ticketing_date_kwan>.ticketing_seat>input
	{
	display: none;
}

.ticketing>.ticketing_movie>form>.ticketing_conta>.ticketing_date_kwan>.ticketing_seat>label
	{
	width: 130px;
	border: 1px solid hsla(0, 0%, 67.8%, .5);
	box-sizing: border-box;
	padding: 8px 0 8px;
	border-radius: 4px;
	margin: 20px 36px 0 0;
	text-align: center;
	cursor: pointer;
}

.ticketing>.ticketing_movie>form>.ticketing_conta>.ticketing_date_kwan>.ticketing_seat>label>.movie_time
	{
	display: inline-block;
	vertical-align: middle;
	font-size: 18px;
	font-weight: 500;
}

.ticketing>.ticketing_movie>form>.ticketing_conta>.ticketing_date_kwan>.ticketing_seat>label>.movie_time::after
	{
	content: "";
	width: 2px;
	height: 18px;
	background: hsla(0, 0%, 43.9%, .13);
	margin: 0 10px;
	display: inline-block;
	vertical-align: middle;
}

.ticketing>.ticketing_movie>form>.ticketing_conta>.ticketing_date_kwan>.ticketing_seat>label>.movie_seat
	{
	display: inline-block;
	font-size: 16px;
	font-weight: 700;
	color: #adadad;
	margin-top: 4px;
	vertical-align: middle;
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

.ticketing>.ticketing_movie>form>.ticketing_conta>.ticketing_date_kwan>.ticketing_seat>input:checked
	~label {
	box-shadow: 1px 3px 9px 1px grey;
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
			<ul class="ticketing_date tabnav">
			<jsp:useBean id="now1" class="java.util.Date" />
			<fmt:formatDate value="${now1}" pattern="yyyy-MM-dd" var="nowDate" /> 
			<c:forEach var="date" items="${dateList}">
				<c:if test="${nowDate <= date}">
				<li><a href="/ticketing/secondreserve?moviecode=${movie_code}&date=${date}">${date}</a></li>
				</c:if>
			</c:forEach>
			</ul>
			
			<form class="tabcontent" method="post" action="/ticketing/thirdreserve">
				<div class="ticketing_conta">
				<c:forEach var="cnt" items="${screencnt}">
					<div class="ticketing_date_kwan">
						<p class="ticketing_kwan">
							${cnt}관<span>30석</span>
						</p>
						<c:forEach var="screen" items="${screenList}">
						<c:if test="${cnt == screen.scr_screen}">
						<div class="ticketing_seat">
							<input type="hidden" name="movie_code" value="${movie_code }">
							<input type="radio" name="scr_code" id="${screen.scr_code }" value="${screen.scr_code }"/> <label for="${screen.scr_code }">
								<div class="movie_time">${screen.scr_time }</div>
								<c:set var="set" value="${screen.scr_seat }" />
								<c:set var="seat" value="${fn:split(set, ',')}" />
								<c:set var="size" value="${fn:length(seat) }" />
								<div class="movie_seat">${size}석</div>
							</label>
						</div>
						</c:if>
						</c:forEach>
					</div>
				</c:forEach>
				</div>
				<button type="submit">다음단계 >></button>
			</form>
		</div>
	</div>
</body>
	
</html>