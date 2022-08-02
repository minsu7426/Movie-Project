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
	background-color: black;
	z-index: 100;
	opacity: 0.8;
	border-radius: 0 0 25px 25px;
}

.menu>.menu-top {
	width: 1200px;
	margin: 0 auto;
	height: 40px;
	color: white;
	
}

.menu>.menu-top>ul {
	display: flex;
	justify-content: end;
	line-height: 40px;
}

.menu>.menu-top>ul>li {
	margin-left: 1rem;
}

.menu>.menu-top>ul>li>a{
	color: white;
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
	text-align: center;
}

.menu>.menu-bottom>div>ul>li {
	z-index: 100;
	position: relative;
	padding: 10px 20px;
	font-size: 18px;
	font-weight: 700;
	width: 140px;
	vertical-align: center;
}

.menu>.menu-bottom>div>ul>li>a{
	color: white;
}

.menu>.menu-bottom>div>ul>li>ul {
	display: none;
	top: 120px;
	left: 0px;
	text-align: center;
	font-size: 14px;
	position: absolute;
	background-color: black;
	opacity: 0.8;
	width: 150px;
	z-index: 100;
	border-radius: 0px 0px 10px 10px;
}

.menu>.menu-bottom>div>ul>li:hover>ul {
	display: block;
}

.menu>.menu-bottom>div>ul>li>ul>li>a {
	display: block;
	width: 100%;
	color: white;
}

.title {
	margin-left: 20px;
}
/* menu end */
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
				<a href="/admin/home"><img src="/resources/images/logo_transparent.png" alt="로고"
					width="100px"></a>
			</div>
			<div>
				<ul>
					<li><a href="/admin/member">회원 관리</a></li>
					<li><a href="/admin/screen">극장 관리</a>
						<ul>
							<li><a href="/admin/screen">상영관 관리</a></li>
							<li><a href="/admin/movie">영화 관리</a></li>
						</ul>
					</li>
					<li><a href="/admin/ticket">예매 관리</a></li>
					<li><a href="/admin/review">리뷰 관리</a></li>
					<li><a href="/admin/ask">고객센터</a>
						<ul>
							<li><a href="/admin/notice">공지 사항</a></li>
							<li><a href="/admin/ask">1:1 문의</a></li>
						</ul></li>
					<li><a href="/admin/coupon">쿠폰 관리</a></li>
					<li><a href="">수익관리</a>
						<ul>
							<li><a href="/admin/sales/sales_movie">영화별 수익</a></li>
							<li><a href="/admin/sales/sales_total">전체 수익</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>