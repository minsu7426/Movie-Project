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

.benefit>.benefit_title>h1 {
	margin-left: 20px;
}

.benefit>.benefit_inner {
	text-align: center;
	font-size: 24px;
	font-weight: 700;
}

.benefit>.benefit_inner>table {
	margin-top: 70px;
	width: 100%;
}

.benefit>.benefit_inner>table td:not(:last-child) {
	border-right: 1px solid gainsboro;
}

.benefit>.benefit_inner>table td img {
	margin-top: 60px;
}

.benefit>.benefit_inner>table td .benefit_content {
	margin-top: 50px;
}

.benefit>.benefit_inner>table td .benefit_grade {
	margin-top: 50px;
}

.benefit>.benefit_inner>table td .benefit_content>h4 {
	border-top: 1px solid gainsboro;
	font-size: 24px;
	font-weight: 700;
	margin-bottom: 60px;
	padding-top: 60px;
}

.benefit>.benefit_inner>table td .benefit_content>p {
	font-size: 18px;
	margin-top: 20px;
}
</style>
<body>
<jsp:include page="/WEB-INF/view/include/menu.jsp"/>
	<div class="benefit container">
		<div class="benefit_title">
			<h1>등급별 혜택</h1>
			<hr>
		</div>
		<div class="benefit_inner">
			<table>
				<td>
					<div class="benefit_grade">
						일반 회원<br> <img src="/resources/images/bronze.png" alt="일반회원"
							width="80px">
					</div>
					<div class="benefit_content">
						<h4>회원가입시 적용되는 회원</h4>
						<p>생일 무료관람 쿠폰 1장 지급</p>
						<p>결제시 1% 할인</p>
					</div>
				</td>
				<td>
					<div class="benefit_grade">
						실버 회원<br> <img src="/resources/images/silver.png" alt="일반회원"
							width="80px">
					</div>
					<div class="benefit_content">
						<h4>연간 예매 횟수 7회 이상</h4>
						<p>생일 무료관람 쿠폰 2장 지급</p>
						<p>결제시 3% 할인</p>
					</div>
				</td>
				<td>
					<div class="benefit_grade">
						골드 회원<br> <img src="/resources/images/gold.png" alt="일반회원"
							width="80px">
					</div>
					<div class="benefit_content">
						<h4>연간 예매 횟수 15회 이상</h4>
						<p>생일 무료관람 쿠폰 3장 지금</p>
						<p>결제시 7% 할인</p>
					</div>
				</td>
			</table>
		</div>
	</div>
</body>
</html>