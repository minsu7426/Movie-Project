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

.signup_inner {
	width: 500px;
	margin: 0 auto;
}

.signup_title>h1 {
	margin-left: 20px;
}

.signup>form>div {
	margin-bottom: 10px;
}

.signup_inner>div>label {
	margin: 8px 0;
	font-size: 16px;
	font-weight: 700;
}

.signup_inner>div>div>input {
	width: 100%;
	height: 48px;
	border-radius: 5px;
	border: solid 1px #dadada;
	background-color: #f5f6f7;
	font-size: 15px;
	padding: 10px 14px;
	color: #2b2929;
}

.signup_inner>.signup_phone>div>input {
	width: 154px;
}

.signup_inner>.signup_submit {
	display: flex;
	justify-content: space-between;
}

.signup_inner>.signup_submit>input, .signup_inner>.signup_submit>a {
	text-decoration: none;
	display: inline-block;
	text-align: center;
	margin-top: 50px;
	width: 30%;
	padding: 17px 0;
	border: 0;
	cursor: pointer;
	color: #fff;
	background-color: #393b39;
	font-size: 20px;
	font-weight: 400;
	border: solid 3px transparent;
	transition: all 0.3s;
}

.signup_inner>.signup_submit>input:hover, .signup_inner>.signup_submit>a:hover
	{
	color: black;
	background-color: white;
	border: solid 3px black;
}
</style>
<body>
<jsp:include page="../include/menu.jsp"/>
	<div class="signup container">

		<div class="signup_title">
			<h1>회원정보</h1>
			<hr>
		</div>
		<form class="signup_inner" action="update">
			<div class="signup_id">
				<label>아이디</label>
				<div>
					<input type="text" value="abc123" readonly>
				</div>
			</div>
			<div class="signup_pw">
				<label>비밀번호</label>
				<div>
					<input type="password" placeholder="비밀번호를 입력해주세요.">
				</div>
			</div>
			<div class="signup_pwcf">
				<label>비밀번호 확인</label>
				<div>
					<input type="password" placeholder="비밀번호를 입력해주세요.">
				</div>
			</div>
			<div class="signup_name">
				<label>이름</label>
				<div>
					<input type="text" value="박승현" readonly>
				</div>
			</div>
			<div class="signup_grade">
				<label>등급</label>
				<div>
					<input type="text" value="일반" readonly>
				</div>
			</div>
			<div class="signup_phone">
				<label>연락처</label>
				<div>
					<input type="text" maxlength="3" placeholder="ex) 010"> - <input
						type="text" maxlength="4" placeholder="ex) xxxx"> - <input
						type="text" maxlength="4" placeholder="ex) xxxx">
				</div>
			</div>
			<div class="signup_email">
				<label>이메일</label>
				<div>
					<input type="email" placeholder="이메일을 입력해주세요.">
				</div>
			</div>
			<div class="signup_submit">
				<input type="submit" value="수정"> <a href="/home">돌아가기</a>
			</div>
		</form>
	</div>
</body>
</html>