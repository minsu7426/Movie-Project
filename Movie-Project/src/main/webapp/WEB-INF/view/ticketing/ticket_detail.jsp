<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
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
	.topmenu{
		position: relative;
		z-index: 100;
	}
    /* ticket_detail start */
    .ticket_detail>.container>.table {
        border-collapse: collapse;
        text-align: center;
        border-top: 3px solid #22499d;
    }

    .ticket_detail>.search_container>.search_group {
        position: relative;
        top: 50%;
        transform: translateY(-50%);
    }

    .ticket_detail>.container>.table th {
        font-size: 16px;
        text-align: center;
        color: #555555;
        font-weight: bold;
        background-color: #f8fafc;
        color: #091f46;
    }

    .ticket_detail>.container>.table td {
        font-size: 16px;
        text-align: center;
        color: #555555;
    }

    .ticket_detail>.container>.table tr:hover {
        background-color: #f7f7f7;
    }

    .ticket_detail>.search_container {
        margin: 40px;
        height: 80px;
        border: 1px solid rgb(179, 179, 179);
    }

    .ticket_detail>.search_container .search .search_btn {
        height: 40px;
        width: 60px;
        background-color: #394b61 !important;
        color: white;
        margin-right: 40px;
    }

    .ticket_detail .search_container td {
        border: 1px solid #c8d1db
    }

    .ticket_detail .title {
        margin-left: 20px;
    }

    .ticket_detail .search_container .search_group {
        display: flex;
        justify-content: space-between;
    }

    .ticket_detail .search_container input[type="radio"] {
        display: none;
    }

    .ticket_detail .search_container .time {
        line-height: 40px;
        margin-left: 40px;
        display: flex;
    }

    .ticket_detail .search_container .time .updown {
        border-right: 1px solid grey;
        margin: 0 20px;
    }

    .ticket_detail .search_container .time .time_select {
        margin-left: 50px;
        border: 1px solid grey;
        padding: 10px;
        height: 30px;
        color: black;
    }

    .ticket_detail .search_container .time .time_select:hover {
        cursor: pointer;
    }

    .ticket_detail .search_container .search_group input:nth-child(1):checked~ .time .label label:nth-child(1),
    .ticket_detail .search_container .search_group input:nth-child(2):checked~ .time .label label:nth-child(2),
    .ticket_detail .search_container .search_group input:nth-child(3):checked~ .time .label label:nth-child(3),
    .ticket_detail .search_container .search_group input:nth-child(4):checked~ .time .label label:nth-child(4){
        background-color: skyblue
    }
    /* ticket_detail end */
</style>

<body>
	<div class="topmenu">
	<%@include file="/WEB-INF/view/include/menu.jsp"%>
	</div>	
    <!-- ticket_detail start -->
    <div class="ticket_detail container">

        <div class="title">
            <h1>예매 내역</h1>
        </div>
        <hr>
        <div class="search_container" align="center">
            <form class="search_group" method="post" action="#">
                <input type="radio" name="time" id="7" value="7" checked>
                <input type="radio" name="time" id="15" value="15">
                <input type="radio" name="time" id="30" value="30">
                <input type="radio" name="time" id="90" value="90">
                <div class="time">
                    <span>조회기간 선택</span>
                    <div class="updown"></div>
                    <span>기간별</span>
                    <div class="label">
                        <label class="time_select" for="7">7일</label>
                        <label class="time_select" for="15">15일</label>
                        <label class="time_select" for="30">1개월</label>
                        <label class="time_select" for="90">3개월</label>
                    </div>
                </div>
                <div class="search">
                    <input type="submit" class="search_btn" value="검색" />
                </div>
            </form>
        </div>

        <div class="container">
            <table class="table">
                <tr class="table_header" >
                    <th>예매일</th>
                    <th>티켓 번호</th>
                    <th>상품명</th>
                    <th>이용일</th>
                    <th>좌석번호</th>
                    <th>리뷰</th>
                </tr>
                <tr>
                    <td>2022-07-08</td>
                    <td>C981AZDF11</td>
                    <td>헤어질 결심</td>
                    <td>2022-07-09 20:00</td>
                    <td>A2, A4</td>
                    <td><a href="#">남기기</a></td>
                </tr>
                <tr>
                    <td>2022-07-08</td>
                    <td>C981AZDF11</td>
                    <td>헤어질 결심</td>
                    <td>2022-07-09 20:00</td>
                    <td>A2, A4</td>
                    <td><a href="#">남기기</a></td>
                </tr>
                <tr>
                    <td>2022-07-08</td>
                    <td>C981AZDF11</td>
                    <td>헤어질 결심</td>
                    <td>2022-07-09 20:00</td>
                    <td>A2, A4</td>
                    <td><a href="#">남기기</a></td>
                </tr>
                <tr>
                    <td>2022-07-08</td>
                    <td>C981AZDF11</td>
                    <td>헤어질 결심</td>
                    <td>2022-07-09 20:00</td>
                    <td>A2, A4</td>
                    <td><a href="#">남기기</a></td>
                </tr>
                <tr>
                    <td>2022-07-08</td>
                    <td>C981AZDF11</td>
                    <td>헤어질 결심</td>
                    <td>2022-07-09 20:00</td>
                    <td>A2, A4</td>
                    <td><a href="#">남기기</a></td>
                </tr>
                <tr>
                    <td>2022-07-08</td>
                    <td>C981AZDF11</td>
                    <td>헤어질 결심</td>
                    <td>2022-07-09 20:00</td>
                    <td>A2, A4</td>
                    <td><a href="#">남기기</a></td>
                </tr>
                <tr>
                    <td>2022-07-08</td>
                    <td>C981AZDF11</td>
                    <td>헤어질 결심</td>
                    <td>2022-07-09 20:00</td>
                    <td>A2, A4</td>
                    <td><a href="#">남기기</a></td>
                </tr>
                <tr>
                    <td>2022-07-08</td>
                    <td>C981AZDF11</td>
                    <td>헤어질 결심</td>
                    <td>2022-07-09 20:00</td>
                    <td>A2, A4</td>
                    <td><a href="#">남기기</a></td>
                </tr>
            </table>
        </div>

    </div>

    <!-- ticket_detail end -->
</html>