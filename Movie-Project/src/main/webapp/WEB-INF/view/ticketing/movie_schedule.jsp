<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
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
    /* movie_schedule start */
    .movie_schedule .title {
        margin-left: 20px;
    }

    .movie_schedule .movie_list {
        margin-left: 100px;
        height: 200px;
    }


    .movie_schedule .check_day .check_item {
        margin: 20px;
        font-size: 18px;
    }

    .movie_schedule .movie_list .movie_title {
        display: flex;
    }

    .movie_schedule .movie_room {
        border: 1px solid hsla(0, 0%, 67.8%, .5);
        width: 70px;
        height: 40px;
        display: inline-block;
        margin-right: 20px;
        transition: all 0.2s;
        font-weight: 700;
    }
    
    .movie_schedule .movie_room:hover{
    	background: black;
    	opacity: 0.8;
    	color: white;
    	text-decoration: none;
    	font-weight: 700;
    }
    
	.movie_schedule .movie_room > h4{
		margin: 2px 0 0 0;
		font-size: 14px;
		font-weight: 700;
	}
	
    .movie_schedule .movie_list .movie_title .movie_text .flex {
        display: flex;
        align-items: baseline;
    }

    .movie_schedule .movie_list {
        display: flex;
        height: auto;
    }

    .movie_schedule .movie_list .poster {
    	margin-top: 10px;
        margin-right: 50px;
    }
	.check_day{
		display:flex;
        width: 100%;
        white-space: nowrap;
        overflow-x: scroll;
		justify-content: center;
    }
    .check_day > a{
    	display: block;
    	width: 100px;
    	height: 50px;
    	line-height: 50px;
    	font-weight: 700;
    	border-radius: 20px;
    	transition: all 0.2s;
    }
    
    .check_day > a:hover {
		background-color: black;
		opacity: 0.8;
		color: white;
		text-decoration: none;
	}
	
	.sort > div > div > h3{
		margin: 10px 0;
	}
    /* movie_schedule end */
</style>

<body>
	<div class="topmenu">
	<%@include file="/WEB-INF/view/include/menu.jsp"%>
	</div>	
    <!-- movie_schedule start -->
    <div class="movie_schedule container">
        <div class="title">
            <h1>상영 시간표</h1>
        </div>
        <hr>

        <div class="check_day" align="center">
        <c:forEach var="date" items="${scheduleDate}">
        <fmt:parseDate value="${date.sch_screendate}" var="schdate" pattern="yyyy-MM-dd"/>
            <a href="/ticketing/movieschedule?date=${date.sch_screendate}" class="check_item"><fmt:formatDate value="${schdate}" pattern="yyyy.MM.dd"/></a>
        </c:forEach>
        </div>
        <hr>
        <c:forEach var="movie" items="${scheduleMovie}">
        <div class="movie_lists">
            <div class="movie_list">
                <img class="poster" src="/resources/images/movie/${movie.sch_img }" width="200px" height="300" alt="">
                <div class="sort">
                    <div class="movie_title">
                        <div class="movie_text">
                            <div class="flex">
                            <c:choose>
		                    	<c:when test="${movie.sch_grade ==  0}">
			                        <img style="margin-right: 10px;" class="age" src="/resources/images/mall.png" width="20px" height="20px"
										alt="">
		                    	</c:when>
		                    	<c:when test="${movie.sch_grade == 12}">
			                        <img style="margin-right: 10px;" class="age" src="/resources/images/m12.png" width="20px" height="20px"
										alt="">                   	
		                    	</c:when>
		                    	<c:when test="${movie.sch_grade == 15}">
		                        	<img style="margin-right: 10px;" class="age" src="/resources/images/m15.png" width="20px" height="20px"
										alt="">                  	
		                    	</c:when>
		                    	<c:otherwise>
		                        	<img style="margin-right: 10px;" class="age" src="/resources/images/m19.png" width="20px" height="20px"
										alt="">                   	
		                    	</c:otherwise>
	                    	</c:choose>
                                <h3>${movie.sch_title }</h3>
                            </div>
                            <span>${movie.sch_genre}</span>/ 
                            <span> ${movie.sch_time}분</span>/ 
                            <span> ${movie.sch_date} 개봉</span>
                        </div>
                    </div>
                    <div>
                    <c:forEach var="screen" items="${scheduleScreen}">
                    <c:if test="${movie.sch_code == screen.sch_code }">
	                    <div>
		                    <h3>&raquo; ${screen.sch_screen}관</h3>
							<c:forEach var="seat" items="${scheduleSeat }">
							<c:if test="${movie.sch_code == seat.sch_code && screen.sch_screen == seat.sch_screen }">
		                    <a href="/ticketing/secondreserve?moviecode=${seat.sch_code}&date=${seat.sch_screendate}" class="movie_room" align="center">
		                        <h4>${seat.sch_screentime }</h4>
		                        <c:set var="set" value="${seat.sch_seat}" />
								<c:set var="seat" value="${fn:split(set, ',')}" />
								<c:set var="size" value="${fn:length(seat) }" />
		                        <span>${size }/30석</span>
		                    </a>
							</c:if>
							</c:forEach>
	                    </div>
                    </c:if>
                    </c:forEach>	    
                    </div>
                </div>
            </div>
        </div>
        <hr>
        </c:forEach>
    </div>
    <!-- movie_schedule end -->

</body>
</html>