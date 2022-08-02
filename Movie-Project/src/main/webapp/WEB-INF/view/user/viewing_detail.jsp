<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

.topmenu{
	position: relative;
	z-index: 100;
}

.viewing_detail .viewing_detail_title {
	margin-left: 20px;
}

.viewing_detail .movie_list {
	margin-left: 100px;
	height: 200px;
	display: flex;
	position: relative;
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
	<div class="topmenu">
		<jsp:include page="/WEB-INF/view/include/menu.jsp" />
	</div>
	<div class="viewing_detail container">
		<div class="viewing_detail_title">
			<h1>관람 내역</h1>
		</div>
		<c:forEach var="movie" items="${movielist}">
		<hr>
		<div class="movie_lists">
			<div class="movie_list">
				<img class="poster" src="<c:url value="/resources/images/movie/${movie.movie_img }"/>" width="140px" height="200px"
					alt="영화">
				<div class="movie_title">
					<div class="movie_text">
						<div class="movie_flex">
						<c:choose>
	                    	<c:when test="${movie.movie_grade ==  0}">
		                        <img style="margin-right: 10px;" class="age" src="/resources/images/mall.png" width="20px" height="20px"
									alt="">
	                    	</c:when>
	                    	<c:when test="${movie.movie_grade == 12}">
		                        <img style="margin-right: 10px;" class="age" src="/resources/images/m12.png" width="20px" height="20px"
									alt="">                   	
	                    	</c:when>
	                    	<c:when test="${movie.movie_grade == 15}">
	                        	<img style="margin-right: 10px;" class="age" src="/resources/images/m15.png" width="20px" height="20px"
									alt="">                  	
	                    	</c:when>
	                    	<c:otherwise>
	                        	<img style="margin-right: 10px;" class="age" src="/resources/images/m19.png" width="20px" height="20px"
									alt="">                   	
	                    	</c:otherwise>
	                    </c:choose>
							
							<h3>${movie.movie_title }</h3>
						</div>
						<p>
							개봉일 : <span>${movie.movie_date }</span>
						</p>
						<p>
							상영시간 : <span>${movie.movie_time }분</span>
						</p>
						<p>
							장르 : <span>${movie.movie_genre }</span>
						</p>
						<p>
							출연 : <span>${movie.movie_actor }</span>
						</p>
						<div class="review">
							<p>
								감독 : <span>${movie.movie_director }</span>
							</p>
							<p>
								리뷰관리 : <a href="/movie/moviedetail?moviecode=${movie.movie_code }"><b>리뷰 작성</b></a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>
</body>
</html>