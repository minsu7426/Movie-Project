<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
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
	.topmenu {
		position: relative;
		z-index: 100;
	}
    .ticketing>.ticketing_title>h1 {
        margin-left: 20px;
    }

    .ticketing>.ticketing_movie {
        position: relative;
        margin-top: 50px;
        background-color: white;
        display: flex;
    }

    .ticketing>.ticketing_movie>.ticketing_menu {
        background-color: white;
        min-width: 14%;
        text-align: center;
        border-right: 1px solid rgb(233, 224, 224);
    }

    .ticketing>.ticketing_movie>.ticketing_menu>p {
        font-size: 18px;
        font-weight: 700;
        padding: 30px 0;
        height: 160px;
        line-height: 100px;
        margin: 0;
    }

    .ticketing>.ticketing_movie>.ticketing_menu>p:not(:first-child) {
        border-top: 1px solid rgb(233, 224, 224);
    }

    .ticketing>.ticketing_movie>.ticketing_menu>p:nth-child(4) {
        background-color: skyblue;
        color: darkslategrey;
    }

    .ticketing>.ticketing_movie>a {
        position: absolute;
        display: inline-block;
        right: 100px;
        font-weight: 700;
        bottom: 60px;
        color: white;
        padding: 10px 25px;
        border-radius: 20px;
        background-color: #393b39;
        border: 3px solid transparent;
        text-decoration: none;
        opacity: 0.9;
        transition: all 0.3s;
    }

    .ticketing>.ticketing_movie>a:hover {
        background-color: white;
        border: 3px solid #393b39;
        color: black;
    }

    .ticketing>.ticketing_movie > .ticketing_detail{
        margin: 20px 0 0 60px;
        display: flex;
    }

    .ticketing>.ticketing_movie > .ticketing_detail > .ticket_contents{
        margin-left: 20px;
    }

    .ticketing>.ticketing_movie > .ticketing_detail > .ticket_contents > h2{
        font-size: 32px;
        font-weight: 700;
        margin: 0;
    }
    .ticketing>.ticketing_movie > .ticketing_detail > .ticket_contents > p{
        font-size: 18px;
        margin-top: 24px;
    }
</style>

<body>
	<div class="topmenu">
		<%@include file="/WEB-INF/view/include/menu.jsp"%>
	</div>
    <div class="ticketing container">
        <div class="ticketing_title">
            <h1>예매</h1>
            <hr />
        </div>
        <div class="ticketing_movie">
            <div class="ticketing_menu">
                <p>영화선택</p>
                <p>상영시간</p>
                <p>좌석</p>
                <p>결제</p>
            </div>
            <div class="ticketing_detail">
                <div class="ticket_img">
                    <img src="<c:url value="/resources/images/movie/${rcDto.rc_img}"/>" alt="예매영화" width="300px" height="440px">
                </div>
                <div class="ticket_contents">
                    <h2>예매가 완료되었습니다.</h2>
                    <p><b>예매번호</b> : ${rcDto.rc_num }</p>
                    <p><b>영화제목</b> : ${rcDto.rc_title }</p>
                    <p><b>날짜</b> : ${rcDto.rc_date }</p>
                    <p><b>시간</b> : ${rcDto.rc_time }</p>
                    <p><b>인원</b> : ${people}</p>
                    <p><b>관</b> : ${rcDto.rc_screen }관</p>
                    <p><b>좌석</b> : ${rcDto.rc_seat }</p>
                    <p><b>금액</b> : ${rcDto.rc_pay }원</p>
                </div>
            </div>
            <a href="/home">홈으로 >></a>
        </div>
    </div>
</body>
</html>