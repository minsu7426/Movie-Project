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

.cinema_add>.title>h1 {
	margin-left: 20px;
}

/* notice_add start */
.cinema_add .title {
	margin-bottom: 50px;
}

.cinema_add .add_form>div input {
	width: 600px;
	height: 44px;
	border-radius: 5px;
	border: solid 1px #dadada;
	background-color: #f5f6f7;
	font-size: 15px;
	padding: 10px 14px;
	color: #2b2929;
}

.cinema_add .add_form>div select {
	width: 600px;
	height: 44px;
	border-radius: 5px;
	border: solid 1px #dadada;
	background-color: #f5f6f7;
	font-size: 15px;
	padding: 10px 14px;
	color: #2b2929;
}

.cinema_add .add_form>div .cinema_date {
	width: 292px;
}

.cinema_add .add_form>div .cinema_checkbox {
	width: auto;
	height: auto;
}

.cinema_add .add_form textarea {
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

.cinema_add .add_form .submit button {
	margin-right: 40px;
	font-size: 16px;
	font-weight: 500;
}

.cinema_add .add_form .submit a {
	font-size: 16px;
	font-weight: 500;
}

.cinema_add>.add_form>div>label {
	font-size: 16px;
}

.cinema_add>.add_form>.div4>div {
	display: flex;
}

.cinema_add>.add_form>.div4>div>div>input {
	margin: 0;
}

.cinema_add>.add_form>.div4>div>div>label {
	margin: 0;
	font-size: 16px;
}

.cinema_add>.add_form>.div4>div>div {
	margin-right: 40px;
}
</style>
<body>
	<jsp:include page="../../include/admin_menu.jsp" />
	<div class="cinema_add container">
		<div class="title">
			<h1>상영관 등록</h1>
			<hr>
		</div>
		<form class="add_form" action="" method="post">
			<div class="form-group row">
				<label class="col-sm-2 input-name">영화코드</label> <select
					class="form-input" name="scr_code" id="scr_code">
					<option value="0">전체관람가</option>
					<option value="12">12세</option>
					<option value="15">15세</option>
					<option value="19">청소년관람불가</option>
				</select>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 input-name">관람연령</label> <input type="text"
					class="form-input" value="" readonly>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 input-name">상영기간</label> <input
					class="cinema_date" name="title" type="date" required> ~ <input
					class="cinema_date" name="title" type="date" required>
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
				<label class="col-sm-2 input-name">상영시간</label>
				<div>
					<div>
						<input class="cinema_checkbox" name="title" type="checkbox"
							value="09:00"> <label>09:00</label>
					</div>
					<div>
						<input class="cinema_checkbox" name="title" type="checkbox"
							value="12:00"> <label>12:00</label>
					</div>
					<div>
						<input class="cinema_checkbox" name="title" type="checkbox"
							value="15:00"> <label>15:00</label>
					</div>
					<div>
						<input class="cinema_checkbox" name="title" type="checkbox"
							value="18:00"> <label>18:00</label>
					</div>
					<div>
						<input class="cinema_checkbox" name="title" type="checkbox"
							value="21:00"> <label>21:00</label>
					</div>
				</div>
			</div>
			<hr>
			<div class="submit" align="end">
				<button class="btn btn-primary" type="submit">등록하기</button>
				<a href="" class="btn btn-primary">되돌아가기</a>
			</div>
		</form>

	</div>
</body>
</html>