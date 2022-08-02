<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>Insert title here</title>
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

/* member_detail start */
.member_detail .title {
	margin-bottom: 50px;
}

.member_detail .info .info_form input, .member_detail .info .info_form select
	{
	width: 400px;
	height: 44px;
	border-radius: 5px;
	border: solid 1px #dadada;
	background-color: #f5f6f7;
	font-size: 15px;
	padding: 10px 14px;
	color: #2b2929;
}

.member_detail .info .info_form .submit button {
	font-size: 16px;
	font-weight: 500;
}

.member_detail .info .submit a {
	font-size: 16px;
	font-weight: 500;
	margin-left: 20px;
}
/* member_detail end */
</style>
<body>
	<%@include file="/WEB-INF/view/include/admin_menu.jsp"%>
	<div class="member_detail container">
		<div class="title">
			<h1>회원 정보</h1>
			<hr>
		</div>
		<div class="info">
			<form class="info_form" action="/admin/member/updatemember"
				method="post">
				<div class="form-group row">
					<label class="col-sm-2 input-name">이름</label> <input
						class="form-input" type="text" value="${member.user_name }"
						readonly="readonly">
				</div>
				<div class="form-group row">
					<label class="col-sm-2 input-name">아이디</label> <input
						class="form-input" name="user_id" type="text"
						value="${member.user_id }" readonly="readonly">
				</div>
				<div class="form-group row">
					<label class="col-sm-2 input-name">연락처</label> <input
						class="form-input" type="text" value="${member.user_phone }"
						readonly="readonly">
				</div>
				<div class="form-group row">
					<label class="col-sm-2 input-name">이메일</label> <input
						class="form-input" type="email" value="${member.user_email }"
						readonly="readonly">
				</div>
				<div class="form-group row">
					<label class="col-sm-2 input-name">생년월일</label> <input
						class="form-input" type="text" value="${member.user_jumin }"
						readonly="readonly">
				</div>

				<div class="form-group row">
					<label class="col-sm-2 input-name">등급</label> <select
						class="form-input" name="user_class" id="user_class">
						<option value="bronze"
							${member.user_class == 'bronze' ? 'selected="selected"' : "" }>bronze</option>
						<option value="silver"
							${member.user_class == 'silver' ? 'selected="selected"' : "" }>silver</option>
						<option value="gold"
							${member.user_class == 'gold' ? 'selected="selected"' : "" }>gold</option>
					</select>
				</div>
				<hr>
				<div class="submit" align="right">
					<button class="btn btn-primary" type="submit">등록하기</button>
					<a href="/admin/member" class="btn btn-primary">되돌아가기</a>
					<a href="/admin/member/deletemember?memberId=${member.user_id }"
						class="btn btn-danger" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
				</div>
			</form>
		</div>
	</div>
</body>
</html>