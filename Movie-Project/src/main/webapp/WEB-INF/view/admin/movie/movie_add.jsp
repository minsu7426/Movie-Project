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

.movie_add>.title>h1 {
	margin-left: 20px;
}

/* notice_add start */
.movie_add .title {
	margin-bottom: 50px;
}

.movie_add .add_form>div input {
	width: 600px;
	height: 44px;
	border-radius: 5px;
	border: solid 1px #dadada;
	background-color: #f5f6f7;
	font-size: 15px;
	padding: 10px 14px;
	color: #2b2929;
}

.movie_add .add_form>div select {
	width: 600px;
	height: 44px;
	border-radius: 5px;
	border: solid 1px #dadada;
	background-color: #f5f6f7;
	font-size: 15px;
	padding: 10px 14px;
	color: #2b2929;
}

.movie_add .add_form textarea {
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

.movie_add .add_form .submit button {
	margin-right: 40px;
	font-size: 16px;
	font-weight: 500;
}

.movie_add .add_form .submit a {
	font-size: 16px;
	font-weight: 500;
}

.movie_add>.add_form>div>label {
	font-size: 16px;
}
</style>
<body>
<jsp:include page="/WEB-INF/view/include/admin_menu.jsp"/>
	<div class="movie_add container">
		<div class="title">
			<h1>영화 등록</h1>
			<hr>
		</div>
		 <!-- enctype="multipart/form-data" -->
		<form class="add_form" action="/admin/movie/movie_add" method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2 input-name">영화제목</label> <input
					class="form-input" name="movie_title" type="text" required>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 input-name">개봉일</label> <input
					class="form-input" name="movie_date" type="date" required>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 input-name">장르</label> <input
					class="form-input" name="movie_genre" type="text" required>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 input-name">등급</label> <select
					class="form-input" name="movie_grade" id="movie_grade">
					<option value="0">전체관람가</option>
					<option value="12">12세</option>
					<option value="15">15세</option>
					<option value="19">청소년관람불가</option>
				</select>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 input-name">감독</label> <input
					class="form-input" name="movie_director" type="text" required>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 input-name">출연</label> <input
					class="form-input" name="movie_actor" type="text" required>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 input-name">러닝타임</label> <input
					class="form-input" name="movie_time" type="text" required>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 input-name">소개</label>
				<textarea class="form-input" name="movie_board" required></textarea>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 input-name">이미지</label> <input
					class="form-input" name="movie_img" type="file" required>
			</div>
			<hr>
			<div class="submit" align="end">
				<button class="btn btn-primary" type="submit">등록하기</button>
				<a href="/admin/movie" class="btn btn-primary">되돌아가기</a>
			</div>
		</form>

	</div>
</body>
</html>