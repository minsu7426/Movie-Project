<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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

.signup_inner>.signup_num>div>input {
	width: 241px;
}

.signup_inner>.signup_phone>div>input {
	width: 154px;
}

.signup_inner>.signup_submit>input {
	margin-top: 20px;
	width: 100%;
	padding: 17px 0;
	border: 0;
	cursor: pointer;
	color: #fff;
	background-color: #393b39;
	font-size: 20px;
	font-weight: 400;
	border: solid 3px transparent;
}

.signup_inner>.signup_submit>input:hover {
	color: black;
	background-color: white;
	border: solid 3px black;
	transition: all 0.3s;
}

#id_check{
	cursor: pointer;
	color: #fff;
	background-color: #393b39;
	font-size: 12px;
	font-weight: 400;
	border: solid 3px transparent;
	width: 20%;
	text-align: center;
}

#id_check:hover{
	color: black;
	background-color: white;
	border: solid 3px black;
	transition: all 0.3s;
}


.idchkchk{
	display: flex;
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
	
	function idCheck(){
		window.open("/login/idCheck","_blank","width=300px height=100px");
	}

</script>
<body>
	<jsp:include page="/WEB-INF/view/include/menu.jsp"/>
	<div class="signup container">

		<div class="signup_title">
			<h1>회원가입</h1>
			<hr>
		</div>
		<form class="signup_inner" action="signup" method="post">
			<div class="signup_id">
				<label>아이디</label>
				<div class="idchkchk">
					<input type="text" id="userId" name="user_id"
						placeholder="아이디를 입력해주세요." class="idchk" required="required">
						<input type="button" id="id_check" onclick="idCheck();" value="ID 중복확인" class="btn btn-success">
				</div>
			</div>
			<div class="signup_pw">
				<label>비밀번호</label>
				<div>
					<input type="password" id="user_pw1" name="user_pw"
						placeholder="비밀번호를 입력해주세요." onchange="check_pw()"
						required="required">
				</div>
			</div>
			<div class="signup_pwcf">
				<label>비밀번호 확인</label>
				<div>
					<input type="password" id="user_pw2" placeholder="비밀번호를 입력해주세요."
						onchange="check_pw()" required="required"><span id="check"></span>
				</div>
			</div>
			<div class="signup_name">
				<label>이름</label>
				<div>
					<input type="text" name="user_name" placeholder="이름을 입력해주세요."
						required="required">
				</div>
			</div>
			<div class="signup_num">
				<label>주민번호</label>
				<div>
					<input type="text" name="jumin1" placeholder="주민번호 앞6자리"
						maxlength="6" required="required"> - <input type="text"
						name="jumin2" maxlength="7" placeholder="주민번호 뒷7자리"
						required="required">
				</div>
			</div>
			<div class="signup_phone">
				<label>연락처</label>
				<div>
					<input type="text" maxlength="3" name="phone1"
						placeholder="ex) 010"> - <input type="text" maxlength="4"
						name="phone2" placeholder="ex) xxxx" required="required">
					- <input type="text" maxlength="4" placeholder="ex) xxxx"
						required="required" name="phone3">
				</div>
			</div>
			<div class="signup_email">
				<label>이메일</label>
				<div>
					<input type="email" name="user_email" placeholder="이메일을 입력해주세요."
						required="required">
				</div>
			</div>
			<div class="signup_submit">
				<input type="submit" value="가입하기">
			</div>
		</form>
	</div>
</body>
</html>