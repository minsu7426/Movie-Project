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

.cinema_update>.title>h1 {
	margin-left: 20px;
}

/* notice_add start */
.cinema_update .title {
	margin-bottom: 50px;
}

.cinema_update .add_form>div input {
	width: 600px;
	height: 44px;
	border-radius: 5px;
	border: solid 1px #dadada;
	background-color: #f5f6f7;
	font-size: 15px;
	padding: 10px 14px;
	color: #2b2929;
}

.cinema_update .add_form>div select {
	width: 600px;
	height: 44px;
	border-radius: 5px;
	border: solid 1px #dadada;
	background-color: #f5f6f7;
	font-size: 15px;
	padding: 10px 14px;
	color: #2b2929;
}

.cinema_update .add_form>div .cinema_date {
	width: 292px;
}

.cinema_update .add_form>div .cinema_checkbox {
	width: auto;
	height: auto;
}

.cinema_update .add_form textarea {
	width: 600px;
	height: 100px;
	border-radius: 5px;
	border: solid 1px #dadada;
	background-color: #f5f6f7;
	font-size: 15px;
	padding: 10px 14px;
	color: #2b2929;
	resize: none;
}

.cinema_update .add_form .submit button {
	font-size: 16px;
	font-weight: 500;
}

.cinema_update .add_form .submit a {
	font-size: 16px;
	font-weight: 500;
}

.cinema_update>.add_form>div>label {
	font-size: 16px;
}

.cinema_update .add_form .submit a {
	margin-left: 20px;
}
</style>
<body>
<jsp:include page="../../include/admin_menu.jsp"/>
	<div class="cinema_update container">
		<div class="title">
			<h1>상영관 수정</h1>
			<hr>
		</div>
		<form class="add_form" action="" method="post">
			<div class="form-group row">
				<label class="col-sm-2 input-name">영화제목</label>
					<input type="text" name="scr_title" value="" readonly>
				<select
					class="form-input" name="" id="">
					<option value="">전체관람가</option>
					<option value="">12세</option>
					<option value="">15세</option>
					<option value="">청소년관람불가</option>
				</select>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 input-name">영화코드</label> <input
					class="form-input" name="title" type="text" required>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 input-name">상영기간</label>
				<input class="cinema_date" name="title" type="date" value="${dto.scr_date }" required readonly>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 input-name">상영관</label> <select
					class="form-input" name="" id="">
					<option value="">1관</option>
					<option value="">2관</option>
					<option value="">3관</option>
				</select>
			</div>
			<div class="form-group row div4">
				<label class="col-sm-2 input-name">상영시간</label> <input
					class="form-input" name="title" type="text" required>
			</div>
			<hr>
			<div class="submit" align="end">
				<button class="btn btn-primary" type="submit">수정하기</button>
				<a href="" class="btn btn-primary">되돌아가기</a> <a href=""
					class="btn btn-danger">삭제</a>
			</div>
		</form>

	</div>
</body>
</html>