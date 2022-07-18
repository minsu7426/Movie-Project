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

.viewing_detail .viewing_detail_title {
	margin-left: 20px;
}

.viewing_detail .movie_list {
	margin-left: 100px;
	height: 200px;
	display: flex;
	position: relative;
	z-index: -1;
}

.viewing_detail .movie_list .movie_title {
	display: flex;
}

.viewing_detail .movie_list .movie_title .movie_text .movie_flex {
	display: flex;
	align-items: center;
}

.viewing_detail .movie_list .poster {
	margin-right: 20px;
}

.viewing_detail .movie_list .movie_title .movie_text {
	width: 40vw;
}

.viewing_detail .movie_list .movie_title .movie_text .review {
	display: flex;
	justify-content: space-between;
}
</style>
<body>
	<jsp:include page="../include/menu.jsp" />
	<div class="viewing_detail container">
		<div class="viewing_detail_title">
			<h1>관람 내역</h1>
		</div>
		<hr>
		<div class="movie_lists" style="overflow: scroll; height: 700px;">
			<div class="movie_list">
				<img class="poster" src="/resources/images/movie/The_Witch_Part2_The_Other_One.jpg" width="150px"
					alt="">
				<div class="movie_title">
					<div class="movie_text">
						<div class="movie_flex">
							<img class="age" src="/resources/images/m15.png" width="40px" height="40px"
								alt="">
							<h3>헤어질 결심</h3>
						</div>
						<p>
							개봉일 : <span>2022.08.09</span>
						</p>
						<p>
							상영시간 : <span>138분</span>
						</p>
						<p>
							장르 : <span>드라마</span>
						</p>
						<p>
							출연 : <span>박찬호, 이승기</span>
						</p>
						<div class="review">
							<p>
								감독 : <span>정상수</span>
							</p>
							<p>
								리뷰관리 : <a href=""><b>리뷰 작성</b></a>
							</p>
						</div>
					</div>
				</div>
			</div>
			<hr>
			<div class="movie_list">
				<img class="poster" src="/resources/images/2.jpg" width="150px"
					alt="">
				<div class="movie_title">
					<div class="movie_text">
						<div class="movie_flex">
							<img class="age" src="/resources/images/2.jpg" width="40px"
								alt="">
							<h3>헤어질 결심</h3>
						</div>
						<p>
							개봉일 : <span>2022.08.09</span>
						</p>
						<p>
							상영 시간 : <span>138분</span>
						</p>
						<p>
							장르 : <span>드라마</span>
						</p>
						<p>
							출연 : <span>박찬호, 이승기</span>
						</p>
						<div class="review">
							<p>
								감독 : <span>정상수</span>
							</p>
							<p>
								리뷰관리 : <a href=""><b>리뷰 작성</b></a>
							</p>
						</div>
					</div>
				</div>
			</div>
			<hr>
		</div>
	</div>
</body>
</html>