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

.cinema_update>.add_form>.div4>div {
	display: flex;
}

.cinema_update>.add_form>.div4>div>div>input {
	margin: 0;
}

.cinema_update>.add_form>.div4>div>div>label {
	margin: 0;
	font-size: 16px;
}

.cinema_update>.add_form>.div4>div>div {
	margin-right: 40px;
}
</style>
<body>
	<jsp:include page="/WEB-INF/view/include/admin_menu.jsp" />
	<div class="cinema_update container">
		<div class="title">
			<h1>상영관 수정</h1>
			<hr>
		</div>
		<form class="add_form"
			action="/admin/screen/update?scr_code=${dto.scr_code }" method="post">
			<div class="form-group row">
				<label class="col-sm-2 input-name">영화제목</label> <input type="text"
					name="scr_title" value="${title}" readonly>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 input-name">상영기간</label> <input
					class="cinema_date" name="scr_date" type="date"
					value="${dto.scr_date }" required>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 input-name">상영관</label> <select
					class="form-input" name="scr_screen" id="screen_sel">
					<option value="1"
						${dto.scr_screen == '1' ? 'selected="selected"' : "" }>1관</option>
					<option value="2"
						${dto.scr_screen == '2' ? 'selected="selected"' : "" }>2관</option>
					<option value="3"
						${dto.scr_screen == '3' ? 'selected="selected"' : "" }>3관</option>
				</select>
			</div>
			<div class="form-group row div4">
				<label class="col-sm-2 input-name">상영시간</label>
				<div>
					<div>
						<input class="cinema_checkbox" name="scr_time" type="radio"
							value="09:00"
							${dto.scr_time == '09:00:00' ? 'checked="checked"' : "" }>
						<label>09:00</label>
					</div>
					<div>
						<input class="cinema_checkbox" name="scr_time" type="radio"
							value="12:00"
							${dto.scr_time == '12:00:00' ? 'checked="checked"' : "" }>
						<label>12:00</label>
					</div>
					<div>
						<input class="cinema_checkbox" name="scr_time" type="radio"
							value="15:00"
							${dto.scr_time == '15:00:00' ? 'checked="checked"' : "" }>
						<label>15:00</label>
					</div>
					<div>
						<input class="cinema_checkbox" name="scr_time" type="radio"
							value="18:00"
							${dto.scr_time == '18:00:00' ? 'checked="checked"' : "" }>
						<label>18:00</label>
					</div>
					<div>
						<input class="cinema_checkbox" name="scr_time" type="radio"
							value="21:00"
							${dto.scr_time == '21:00:00' ? 'checked="checked"' : "" }>
						<label>21:00</label>
					</div>
				</div>
			</div>
			<div class="form-group row div4">
				<label class="col-sm-2 input-name">상영 여부</label>
				<div>
					<div>
						<input class="cinema_checkbox" name="scr_flag" type="radio"
							value="true" ${dto.scr_flag == true ? 'checked="checked"' : "" }>
						<label>상영중</label>
					</div>
					<div>
						<input class="cinema_checkbox" name="scr_flag" type="radio"
							value="false" ${dto.scr_flag == false ? 'checked="checked"' : "" }>
						<label>상영종료</label>
					</div>
				</div>
			</div>
			<hr>
			<div class="submit" align="end">
				<button class="btn btn-primary" type="submit">수정하기</button>
				<a href="/admin/screen" class="btn btn-primary">되돌아가기</a>
				<a href="/admin/screen/delete?scr_code=${dto.scr_code }"
					class="btn btn-danger">삭제</a>
			</div>
		</form>

	</div>
</body>
</html>