<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

.menu>.menu-top>ul>li>a {
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
	margin-left: 20px;
	padding: 10px 20px;
	font-size: 22px;
	font-weight: 700;
	width: 150px;
	vertical-align: center;
}

.menu>.menu-bottom>div>ul>li>a {
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
<body>
	<!--  menu start -->
	<nav class="menu">
		<div class="menu-top">
			<ul>
				<c:if test="${empty user}">
					<li><a href="/login">로그인</a></li>
					<li><a href="/login/signup">회원가입</a></li>

				</c:if>

				<c:if test="${!empty user}">
					<li><b>${user[0] }님</b></li>
					<li><a href="/login/logout"
						onclick="return confirm('로그아웃 하시겠습니까?');">로그아웃</a></li>

				</c:if>
			</ul>
		</div>
		<div class="menu-bottom">
			<div>
				<a href="/home"><img
					src="../resources/images/logo_transparent.png" alt="로고"
					width="100px"></a>
			</div>
			<div>
				<ul>
					<li><a href="/ticketing/reserve">예매</a>
						<ul>
							<jsp:useBean id="now" class="java.util.Date" />
							<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="nowDate" />
							<li><a href="/ticketing/reserve">예매</a></li>
							<li><a href="/ticketing/ticketlist">예매 내역</a></li>
							<li><a href="/ticketing/movieschedule?date=${nowDate}">상영
									시간표</a></li>
						</ul></li>
					<li><a href="/movie/current_screen">영화</a>
						<ul>
							<li><a href="/movie/current_screen">현재 상영작</a></li>
							<li><a href="/movie/shown_screen">상영 예정작</a></li>
						</ul></li>
					<li><a href="/user/mypage">마이페이지</a>
						<ul>
							<li><a href="/user/mypage">회원 정보</a></li>
							<li><a href="/user/viewing_detail">관람 내역</a></li>
							<li><a href="/coupon">쿠폰 관리</a></li>
						</ul></li>
					<li><a href="/ask">고객센터</a>
						<ul>
							<li><a href="/ask">1:1 문의</a></li>
							<li><a href="/notice/list">공지 사항</a></li>

							<li><a href="/benefit">혜택 안내</a></li>
						</ul></li>
						<li><a href="/map/view">찾아오는길</a></li>
						

				</ul>
			</div>
		</div>
	</nav>
	<!--  menu start -->

</body>
</html>