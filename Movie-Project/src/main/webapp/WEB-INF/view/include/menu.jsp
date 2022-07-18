<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
/* setting start */
* {
	margin: 0;
	padding: 0;
	text-decoration: none;
	list-style: none;
	box-sizing: border-box;
}
/* setting end */

/* menu start */
a {
	color: black;
}

.menu {
	height: 160px;
	background-color: gray;
	z-index: 100;
}

.menu>.menu-top {
	width: 1200px;
	margin: 0 auto;
	height: 40px;
}

.menu>.menu-top>ul {
	display: flex;
	justify-content: end;
	line-height: 40px;
}

.menu>.menu-top>ul>li {
	margin-left: 1rem;
}

.menu>.menu-bottom {
	display: flex;
	width: 1200px;
	margin: 0 auto;
	justify-content: space-between;
}

.menu>.menu-bottom>div>ul {
	display: flex;
	line-height: 100px;
}

.menu>.menu-bottom>div>ul>li {
	position: relative;
	margin-left: 20px;
	padding: 10px 20px;
	font-size: 22px;
	font-weight: 700;
}

.menu>.menu-bottom>div>ul>li>ul {
	display: none;
	top: 120px;
	left: 0px;
	text-align: center;
	font-size: 14px;
	position: absolute;
	background-color: red;
	width: 100px;
}

.menu>.menu-bottom>div>ul>li:hover>ul {
	display: block;
}

.menu>.menu-bottom>div>ul>li>ul>li>a {
	display: block;
	width: 100%;
}

.title {
	margin-left: 20px;
}
/* menu end */
</style>
<body>
	<!--  menu start -->
	<nav class="menu">
		<div class="menu-top">
			<ul>
			<c:if test="${empty user}">
				<li><a href="/login/login">로그인</a></li>
				<li><a href="/login/signup">회원가입</a></li>
			
			</c:if>
			
			<c:if test="${!empty user}">
				<li>${user.user_id }님 </li>
				<li><a href="/login/logout">로그아웃</a></li>
			
			</c:if>
			</ul>
		</div>
		<div class="menu-bottom">
			<div>
				<a href="/home"><img src="../resources/images/logo_transparent.png" alt="로고"
					width="100px"></a>
			</div>
			<div>
				<ul>
					<li><a href="">예매</a>
						<ul>
							<li><a href="">예매</a></li>
							<li><a href="">예매 내역</a></li>
							<li><a href="">상영 시간표</a></li>
						</ul></li>
					<li><a href="">영화</a>
						<ul>
							<li><a href="/movie/current_screen">현재 상영작</a></li>
							<li><a href="/movie/shown_screen">상영 예정작</a></li>
						</ul></li>
					<li><a href="">이벤트</a></li>
					<li><a href="">마이페이지</a>
						<ul>
							<li><a href="/user/mypage">회원 정보</a></li>
							<li><a href="/user/viewing_detail">관람 내역</a></li>
							<li><a href="">쿠폰 관리</a></li>
						</ul></li>
					<li><a href="">고객센터</a>
						<ul>
							<li><a href="">공지 사항</a></li>
							<li><a href="">1:1 문의</a></li>
							<li><a href="">혜택 안내</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<!--  menu start -->

</body>
</html>