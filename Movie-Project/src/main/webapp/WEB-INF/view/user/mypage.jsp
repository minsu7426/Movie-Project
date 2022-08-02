<%@page import="dto.UserDto"%>
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
<script type="text/javascript">
	function check_pw() {
		if (document.getElementById('user_pw1').value != ''
				&& document.getElementById('user_pw2').value != '') {
			if (document.getElementById('user_pw1').value == document
					.getElementById('user_pw2').value) {
				document.getElementById('check').innerHTML = '비밀번호가 일치합니다.'
				document.getElementById('check').style.color = 'green';
			} else {
				document.getElementById('check').innerHTML = '비밀번호가 일치하지 않습니다.';
				document.getElementById('check').style.color = 'red';
			}
		}
	}
</script>
<body>
<jsp:include page="/WEB-INF/view/include/menu.jsp"/>
	<div class="signup container">

		<div class="signup_title">
			<h1>회원정보</h1>
			<hr>
		</div>
		<form class="signup_inner" action="update" method="post">
			<div class="signup_id">
				<label>아이디</label>
				<div>
					<input type="text" name="user_id" value="${userDto.getUser_id() }" readonly>
				</div>
			</div>
			<div class="signup_pw">
				<label>비밀번호</label>
				<div>
					<input type="password" onchange="check_pw()" id="user_pw1" name="user_pw" placeholder="비밀번호를 입력해주세요.">
				</div>
			</div>
			<div class="signup_pwcf">
				<label>비밀번호 확인</label>
				<div>
					<input type="password" onchange="check_pw()" id="user_pw2" placeholder="비밀번호를 입력해주세요."><span id="check"></span>
				</div>
			</div>
			<div class="signup_name">
				<label>이름</label>
				<div>
					<input type="text" name="user_name" value="${userDto.getUser_name() }" readonly>
				</div>
			</div>
			<div class="signup_grade">
				<label>등급</label>
				<div>
					<input type="text" name="user_class" value="${userDto.getUser_class() }" readonly>
				</div>
			</div>
			<div class="signup_phone">
				<label>연락처</label>
				<div>
				<%
					String phone = ((UserDto)request.getAttribute("userDto")).getUser_phone();
					String[] user_phone = phone.split("-");
					
				%>
					<input type="text" maxlength="3" name="phone1" placeholder="ex) 010" value="<%=user_phone[0] %>"> - <input
						type="text" maxlength="4" name="phone2" placeholder="ex) xxxx" value="<%=user_phone[1]%>"> - <input
						type="text" maxlength="4" name="phone3" placeholder="ex) xxxx" value="<%=user_phone[2]%>">
				</div>
			</div>
			<div class="signup_email">
				<label>이메일</label>
				<div>
					<input type="email" name="user_email" placeholder="이메일을 입력해주세요." value="${userDto.getUser_email()}">
				</div>
			</div>
			<div class="signup_submit">
				<input type="submit" value="수정"> <a href="/home">돌아가기</a>
			</div>
		</form>
	</div>
</body>
</html>