<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
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

a {
	color: black;
}

.menu {
	height: 160px;
	background-color: gray;
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
	z-index:100;
	position: relative;
	margin-left: 20px;
	padding: 10px 20px;
	font-size: 20px;
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
</style>
	<nav class="menu">
		<div class="menu-top">
			<ul>
				<c:if test="${empty user}">
					<li><a href="/login/login">로그인</a></li>
					<li><a href="/login/signup">회원가입</a></li>

				</c:if>

				<c:if test="${!empty user}">
					<li>${user[0]}님</li>
					<li><a href="/login/logout" onclick="return confirm('로그아웃 하시겠습니까?');">로그아웃</a></li>

				</c:if>
			</ul>
		</div>
		<div class="menu-bottom">
			<div>
				<img src="/resources/images/logo_transparent.png" alt="로고"
					width="100px">
			</div>
			<div>
				<ul>
					<li><a href="/admin/member/membermanage">회원 관리</a></li>
					<li><a href="">극장 관리</a>
						<ul>
							<li><a href="/admin/screen/screen_manage">상영관 관리</a></li>
							<li><a href="/admin/movie/movie_manage">영화 관리</a></li>
						</ul>
					</li>
					<li><a href="">예매 관리</a></li>
					<li><a href="">리뷰 관리</a></li>
					<li><a href="/admin/ask/askmanage">고객센터</a>
						<ul>
							<li><a href="">공지 사항</a></li>
							<li><a href="/admin/ask/askmanage">1:1 문의</a></li>
						</ul></li>
					<li><a href="">이벤트 관리</a>
						<ul>
							<li><a href="">이벤트</a></li>
							<li><a href="/admin/coupon/couponadmin">쿠폰</a></li>
						</ul></li>
					<li><a href="">수익관리</a>
						<ul>
							<li><a href="">영화별 수익</a></li>
							<li><a href="">월간 수익</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>