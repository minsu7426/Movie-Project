<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

.movie_update>.title>h1 {
	margin-left: 20px;
}

/* notice_add start */
.movie_update .title {
	margin-bottom: 50px;
}

.movie_update .add_form>div input {
	width: 600px;
	height: 44px;
	border-radius: 5px;
	border: solid 1px #dadada;
	background-color: #f5f6f7;
	font-size: 15px;
	padding: 10px 14px;
	color: #2b2929;
}

.movie_update .add_form>div select {
	width: 600px;
	height: 44px;
	border-radius: 5px;
	border: solid 1px #dadada;
	background-color: #f5f6f7;
	font-size: 15px;
	padding: 10px 14px;
	color: #2b2929;
}

.movie_update .add_form textarea {
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

.movie_update .add_form .submit button {
	font-size: 16px;
	font-weight: 500;
}

.movie_update .add_form .submit a {
	font-size: 16px;
	font-weight: 500;
	margin-left: 20px;
}

.movie_update>.add_form>div>label {
	font-size: 16px;
}
</style>
<body>
	<jsp:include page="/WEB-INF/view/include/admin_menu.jsp" />
	<div class="movie_update container">
		<div class="title">
			<h1>영화 수정</h1>
			<hr>
		</div>
		<form class="add_form" action="/admin/movie/movie_update" method="post">
			<div class="form-group row">
				<label class="col-sm-2 input-name">영화코드</label> <input
					class="form-input" name="movie_code" type="text"
					value="${dto.movie_code }" required readonly="readonly">
			</div>
			<div class="form-group row">
				<label class="col-sm-2 input-name">영화제목</label> <input
					class="form-input" name="movie_title" type="text"
					value="${dto.movie_title }" required>
			</div>
			<fmt:parseDate pattern="yyyy-MM-dd" value="${dto.movie_date}"
				var="date" />
			<div class="form-group row">
				<label class="col-sm-2 input-name">개봉일</label> <input
					class="form-input" name="movie_date" type="date" id="movie_date"
					value="<fmt:formatDate pattern="yyyy-MM-dd" value="${date}" />"
					required>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 input-name">장르</label> <input
					class="form-input" name="movie_genre" type="text"
					value="${dto.movie_genre}" required>
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
					class="form-input" name="movie_director" value="${dto.movie_director }" type="text" required>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 input-name">출연</label> <input
					class="form-input" name="movie_actor" value="${dto.movie_actor }" type="text" required>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 input-name">러닝타임</label> <input
					class="form-input" name="movie_time" type="text" value="${dto.movie_time}" required>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 input-name">소개</label>
				<textarea class="form-input" name="movie_board" required>${dto.movie_board}</textarea>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 input-name">상영여부</label> <select
					class="form-input" name="movie_flag" id="movie_grade">
					<option value="true">상영중</option>
					<option value="false">상영종료</option>
				</select>
			</div>
			<hr>
			<div class="submit" align="end">
				<button class="btn btn-primary" type="submit">등록하기</button>
				<a href="" class="btn btn-primary">되돌아가기</a> <a href="/admin/movie/movie_delete?code=${dto.movie_code}"
					class="btn btn-danger">삭제</a>
			</div>
		</form>
	</div>
</body>
</html>