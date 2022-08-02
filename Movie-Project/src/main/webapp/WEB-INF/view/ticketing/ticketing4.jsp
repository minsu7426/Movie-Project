<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
</head>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript"></script>
<style>
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

    .ticketing>.ticketing_movie>button {
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

    .ticketing>.ticketing_movie>button:hover {
        background-color: white;
        border: 3px solid #393b39;
        color: black;
    }

    .ticket_contents {
        margin-left: 40px;
        height: 100%;
    }

    .ticket_contents .pay_container{
        height: 100%;
        display: flex;
        flex-direction: column;
    }

    .ticket_contents .pay_container .pay_contents{
        margin-top: 30px;
        display: flex;
    }

    .ticket_contents .pay_container .pay_contents div > label{
        width: 200px;
        height: 70px;
        border: 2px solid black;
        text-align: center;
        line-height: 70px;
        font-size: 18px;
        display: block;
        margin-right: 20px;
        border-radius: 20px;
        transition: all 0.2s;
        cursor: pointer;
    }
    .ticket_contents .pay_container .pay_contents input:checked ~ label{
        background-color: black;
        opacity: 0.8;
        color: white;
    }
    .ticket_contents .pay_container .pay_contents input{
        display: none;
    }

    .ticket_contents .pay_container > .ticket_coupon{
        display: flex;
        align-items: center;
        margin-top: 50px;
    }

    .ticket_contents .pay_container > .ticket_coupon > p{
        font-size: 18px;
        font-weight: 700;
        margin: 0;
        margin-right: 20px;
    }

    .ticket_contents .pay_container > .ticket_coupon > select{
        width: 200px;
        height: 40px;
        padding: 10px;
    }

    .ticket_contents .pay_container > .ticket_money{
        display: flex;
        align-items: center;
        margin-top: 50px;
    }

    .ticket_contents .pay_container > .ticket_money > p{
        font-size: 18px;
        font-weight: 700;
        margin: 0;
        margin-right: 20px;
    }

    .ticket_contents .pay_container > .ticket_money > input{
        width: 200px;
        height: 40px;
        padding: 10px;
        border: 1px solid transparent;
        color: red;
        font-size: 18px;
        font-weight: 700;
    }
</style>
<script type="text/javascript">
	function calc(){
		var val = Number($("#selectcoupon option:selected").attr('value2'));
		var price = document.getElementById("price").value;
		document.getElementById("price2").value = price - val;
	}
</script>
<body>
	<div class="topmenu">
		<%@include file="/WEB-INF/view/include/menu.jsp"%>
	</div>
    <div class="ticketing container">
        <div class="ticketing_title">
            <h1>예매</h1>
            <hr />
        </div>
        <form class="ticketing_movie" action="/ticketing/fivethreserve" method="post">
            <div class="ticketing_menu">
                <p>영화선택</p>
                <p>상영시간</p>
                <p>좌석</p>
                <p>결제</p>
            </div>
            <div class="ticketing_detail">
                <div class="ticket_contents">
                    <h2>결제 방법을 선택해주세요.</h2>
                    <div class="pay_container">
                        <div class="pay_contents">
                            <div>
                                <input type="radio" name="pay" id="pay1">
                                <label for="pay1">카카오페이</label>
                            </div>
                            <div>
                                <input type="radio" name="pay" id="pay2">
                                <label for="pay2">네이버페이</label>
                            </div>
                            <div>
                                <input type="radio" name="pay" id="pay3">
                                <label for="pay3">카드결제</label>
                            </div>
                            <div>
                                <input type="radio" name="pay" id="pay4">
                                <label for="pay4">휴대폰결제</label>
                            </div>
                        </div>
                        <div class="ticket_coupon">
                            <p>쿠폰사용</p>
                            <select name="coupon" id="selectcoupon" onclick="calc()">
                                <option value="0" value2="0">--쿠폰을 선택해주세요--</option>
                                <c:forEach var="coupon" items="${coupon}">
                                <option value="${coupon.coupon_code}" value2="${coupon.coupon_price}">${coupon.coupon_form}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="ticket_money">
                            <p>결제 금액</p>
                            <input type="text" id="price" name="price" value="${ticket.tic_payment}" readonly>
                            <p>최종 금액</p>
                            <input type="text" id="price2" name="price2" value="${ticket.tic_payment}" readonly>
                            <input type="hidden" name="people" value="${people}">
                            <input type="hidden" name="screen_code" value="${code}">
                            <input type="hidden" name="tic_id" value="${ticket.tic_id }">
                            <input type="hidden" name="tic_seat" value="${ticket.tic_seat }">
                        </div>
                    </div>
                </div>
            </div>
            <button type="submit">결제하기 >></button>
        </form>
    </div>
</body>
</html>