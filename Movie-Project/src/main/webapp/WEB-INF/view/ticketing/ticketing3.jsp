<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
</head>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript"></script>
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

.ticketing>.ticketing_movie>.ticketing_menu>p:nth-child(3) {
	background-color: skyblue;
	color: darkslategrey;
}

.ticketing>.ticketing_movie>.ticketing_select>button {
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

.ticketing>.ticketing_movie>.ticketing_select>button:hover {
	background-color: white;
	border: 3px solid #393b39;
	color: black;
}

.ticketing>.ticketing_movie>.ticketing_select>div {
	display: flex;
	width: 100%;
	margin: 20px 50px 20px;
}

.ticketing>.ticketing_movie>.ticketing_select>div>.selecter {
	display: flex;
	height: 50px;
	align-items: center;
	margin-right: 40px;
}

.ticketing>.ticketing_movie>.ticketing_select>div>.selecter>h3 {
	margin: 0 10px 0 0;
	font-size: 18px;
	font-weight: 700;
}

.ticketing>.ticketing_movie>.ticketing_select>div>.selecter>.radio-group
	{
	display: flex;
}

.ticketing>.ticketing_movie>.ticketing_select>div>.selecter>.radio-group>div>label
	{
	width: 40px;
	border: 1px solid hsla(0, 0%, 67.8%, .5);
	padding: 8px 0 8px;
	border-radius: 4px;
	text-align: center;
	cursor: pointer;
	margin: 0;
}

.ticketing>.ticketing_movie>.ticketing_select>div>.selecter>.radio-group>div>input
	{
	display: none;
}

.ticketing>.ticketing_movie>.ticketing_select>div>.selecter>.radio-group>div>input:checked 
	~ label {
	background-color: #393b39;
	color: white;
	font-weight: 700;
	transition: all 0.3s;
}

.ticketing>.ticketing_movie>.ticketing_select>div>.price {
	display: flex;
	align-items: center;
}

.ticketing>.ticketing_movie>.ticketing_select>div>.price>h3 {
	font-size: 18px;
	font-weight: 700;
	margin: 0;
}

.ticketing>.ticketing_movie>.ticketing_select>div>.price>div {
	font-size: 18px;
	font-weight: 700;
}

.ticketing>.ticketing_movie>.ticketing_select>div>.price>div>input {
	border: 0;
	width: 150px;
	height: 50px;
	color: red;
	padding-left: 50px;
}

.ticketing>.ticketing_movie>.ticketing_select>.seat {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.ticketing>.ticketing_movie>.ticketing_select>.seat>h4 {
	font-size: 24px;
	width: 430px;
	line-height: 28px;
	text-align: center;
	height: 40px;
	border: solid 5px black;
}

.ticketing>.ticketing_movie>.ticketing_select>.seat>.seat_container {
	display: flex;
	flex-direction: column;
}

.ticketing>.ticketing_movie>.ticketing_select>.seat>.seat_container>div
	{
	display: flex;
}

.ticketing>.ticketing_movie>.ticketing_select>.seat>.seat_container>.seat_row>div>input
	{
	display: none;
}

.ticketing>.ticketing_movie>.ticketing_select>.seat>.seat_container>.seat_row>div>label
	{
	width: 60px;
	height: 60px;
	border-top-left-radius: 20px;
	border-top-right-radius: 20px;
	border: 3px solid black;
	margin: 7px;
	text-align: center;
	font-size: 20px;
	line-height: 60px;
	transition: all 0.3s;
	cursor: pointer;
}

.ticketing>.ticketing_movie>.ticketing_select>.seat>.seat_container>.seat_row>div>label:hover
	{
	background-color: #aaaaaa;
	transition: all 0.3s;
}

.ticketing>.ticketing_movie>.ticketing_select>.seat>.seat_container>.seat_row>div>input:checked
	~label {
	background-color: #444451;
	color: white;
}
.ticketing>.ticketing_movie>.ticketing_select>.seat>.seat_container>.seat_row>div>input:disabled ~label{
	border: 3px solid gray;
	background-color: #DEDEDE;
	color: #B2B2B2;
}
.selecter>select {
	width: 100px;
	height: 30px;
	text-align: center;
	font-weight: 700;
	font-size: 16px;
	border: 2px #aaaaaa solid;
	border-radius: 10px;
}
</style>
<script>
	$(document).ready(function() {
		$(":checkbox").change(function() {
			var total;
			
			if(document.getElementById('teen')){
				total = Number($("#adult option:selected").val()) + Number($("#teen option:selected").val());
			} else{
				total = Number($("#adult").val());
			}

			if(total == 0){
				$('#seat').attr('disabled', 'disabled');
			}
			else if (total == $(":checkbox:checked").length) {
				$(":checkbox:not(:checked)").attr("disabled", "disabled");
			} 
			else {
				$(":checkbox").not(".seatdis").removeAttr("disabled");
			}
		});
		$("#adult").change(function() {
			$(":checkbox").removeAttr("checked");
		});
		$("#teen").change(function() {
			$(":checkbox").removeAttr("checked");
		});
	});

	function calc() {
		var a;
		if(document.getElementById('teen')){
			a = (Number($("#adult option:selected").val()) * Number($("#adultprice").val()))
					+ (Number($("#teen option:selected").val()) * Number($("#teenprice").val()));
		} else{
			a = Number($("#adult option:selected").val()) * Number($("#adultprice").val());
		}
		document.getElementById("price").value = a;
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
		<div class="ticketing_movie">
			<div class="ticketing_menu">
				<p>영화선택</p>
				<p>상영시간</p>
				<p>좌석</p>
				<p>결제</p>
			</div>
			<form class="ticketing_select" method="post" action="/ticketing/fourthreserve">
				<input type="hidden" value="${screen.scr_code }" name="scr_code">
				<div>
					<div class="selecter">
						<h3>성인</h3>
						<input id="adultprice" value="15000" type="hidden"> 
						<select id="adult" name="adult" class="radio-group" onclick="calc()">
							<option value="0"  selected="selected">0명</option>
							<option value="1">1명</option>
							<option value="2">2명</option>
							<option value="3">3명</option>
							<option value="4">4명</option>
							<option value="5">5명</option>
						</select>
					</div>
					<div class="selecter">
					<c:if test="${movie.movie_grade != 19}">
						<h3>청소년</h3>
						<input id="teenprice" value="10000" type="hidden"> 
						<select id="teen" name="teen" class="radio-group" onclick="calc()">
							<option value="0" selected="selected">0명</option>
							<option value="1">1명</option>
							<option value="2">2명</option>
							<option value="3">3명</option>
							<option value="4">4명</option>
							<option value="5">5명</option>
						</select>
					</c:if>
					</div>
					<div class="price">
						<h3>결제 금액</h3>
						<div>
							<input id="price" name="price" type="text" value="0" readonly>원
						</div>
					</div>
				</div>
				<div class="seat" id="seat">
					<h4>screen</h4>
					<div class="seat_container" >
						<div class="seat_row">
						<c:set var="str" value="${screen.scr_seat }"/>
							<div>
							<c:choose>
								<c:when test="${fn:contains(str, 'A1')}">
								<input type="checkbox" class="seat" name="seat" id="seat1" value="A1">
								</c:when>
								<c:otherwise>
								<input type="checkbox" class="seatdis" name="seat" id="seat1" value="A1" disabled="disabled">
								</c:otherwise>
							</c:choose>
								<label for="seat1">A1</label>
							</div>
							<div>
							<c:choose>
								<c:when test="${fn:contains(str, 'A2')}">
								<input type="checkbox" class="seat" name="seat" id="seat2" value="A2">
								</c:when>
								<c:otherwise>
								<input type="checkbox" class="seatdis" name="seat" id="seat2" value="A2" disabled="disabled">
								</c:otherwise>
							</c:choose>
								<label for="seat2">A2</label>
							</div>
							<div>
							<c:choose>
								<c:when test="${fn:contains(str, 'A3')}">
								<input type="checkbox" class="seat" name="seat" id="seat3" value="A3">
								</c:when>
								<c:otherwise>
								<input type="checkbox" class="seatdis" name="seat" id="seat3" value="A3" disabled="disabled">
								</c:otherwise>
							</c:choose>
								<label for="seat3">A3</label>
							</div>
							<div>
							<c:choose>
								<c:when test="${fn:contains(str, 'A4')}">
								<input type="checkbox" class="seat" name="seat" id="seat4" value="A4">
								</c:when>
								<c:otherwise>
								<input type="checkbox" class="seatdis" name="seat" id="seat4" value="A4" disabled="disabled">
								</c:otherwise>
							</c:choose> 
								<label for="seat4">A4</label>
							</div>
							<div>
							<c:choose>
								<c:when test="${fn:contains(str, 'A5')}">
								<input type="checkbox" class="seat" name="seat" id="seat5" value="A5">
								</c:when>
								<c:otherwise>
								<input type="checkbox" class="seatdis" name="seat" id="seat5" value="A5" disabled="disabled">
								</c:otherwise> 
							</c:choose>
								<label for="seat5">A5</label>
							</div>
							<div>
							<c:choose>
								<c:when test="${fn:contains(str, 'A6')}">
								<input type="checkbox" class="seat" name="seat" id="seat6" value="A6">
								</c:when>
								<c:otherwise>
								<input type="checkbox" class="seatdis" name="seat" id="seat6" value="A6" disabled="disabled">
								</c:otherwise>
							</c:choose>
								<label for="seat6">A6</label>
							</div>
						</div>
						<div class="seat_row">
							<div>
							<c:choose>
								<c:when test="${fn:contains(str, 'B1')}">
								<input type="checkbox" class="seat" name="seat" id="seat7" value="B1">
								</c:when>
								<c:otherwise>
								<input type="checkbox" class="seatdis" name="seat" id="seat7" value="B1" disabled="disabled">
								</c:otherwise> 
							</c:choose>
								<label for="seat7">B1</label>
							</div>
							<div>
							<c:choose>
								<c:when test="${fn:contains(str, 'B2')}">
								<input type="checkbox" class="seat" name="seat" id="seat8" value="B2">
								</c:when>
								<c:otherwise>
								<input type="checkbox" class="seatdis" name="seat" id="seat8" value="B2" disabled="disabled">
								</c:otherwise>  
							</c:choose>
								<label for="seat8">B2</label>
							</div>
							<div>
							<c:choose>
								<c:when test="${fn:contains(str, 'B3')}">
								<input type="checkbox" class="seat" name="seat" id="seat9" value="B3">
								</c:when>
								<c:otherwise>
								<input type="checkbox" class="seatdis" name="seat" id="seat9" value="B3" disabled="disabled">
								</c:otherwise>   
							</c:choose>
								<label for="seat9">B3</label>
							</div>
							<div>
							<c:choose>
								<c:when test="${fn:contains(str, 'B4')}">
								<input type="checkbox" class="seat" name="seat" id="seat10" value="B4">
								</c:when>
								<c:otherwise>
								<input type="checkbox" class="seatdis" name="seat" id="seat10" value="B4" disabled="disabled">
								</c:otherwise>  
							</c:choose>
								<label for="seat10">B4</label>
							</div>
							<div>
							<c:choose>
								<c:when test="${fn:contains(str, 'B5')}">
								<input type="checkbox" class="seat" name="seat" id="seat11" value="B5">
								</c:when>
								<c:otherwise>
								<input type="checkbox" class="seatdis" name="seat" id="seat11" value="B5" disabled="disabled">
								</c:otherwise>  
							</c:choose>
								<label for="seat11">B5</label>
							</div>
							<div>
							<c:choose>
								<c:when test="${fn:contains(str, 'B6')}">
								<input type="checkbox" class="seat" name="seat" id="seat12" value="B6">
								</c:when>
								<c:otherwise>
								<input type="checkbox" class="seatdis" name="seat" id="seat12" value="B6" disabled="disabled">
								</c:otherwise>  
							</c:choose>
								<label for="seat12">B6</label>
							</div>
						</div>
						<div class="seat_row">
							<div>
							<c:choose>
								<c:when test="${fn:contains(str, 'C1')}">
								<input type="checkbox" class="seat" name="seat" id="seat13" value="C1">
								</c:when>
								<c:otherwise>
								<input type="checkbox" class="seatdis" name="seat" id="seat13" value="C1" disabled="disabled">
								</c:otherwise>  
							</c:choose>
								<label for="seat13">C1</label>
							</div>
							<div>
							<c:choose>
								<c:when test="${fn:contains(str, 'C2')}">
								<input type="checkbox" class="seat" name="seat" id="seat14" value="C2">
								</c:when>
								<c:otherwise>
								<input type="checkbox" class="seatdis" name="seat" id="seat14" value="C2" disabled="disabled">
								</c:otherwise>  
							</c:choose>
								<label for="seat14">C2</label>
							</div>
							<div>
							<c:choose>
								<c:when test="${fn:contains(str, 'C3')}">
								<input type="checkbox" class="seat" name="seat" id="seat15" value="C3">
								</c:when>
								<c:otherwise>
								<input type="checkbox" class="seatdis" name="seat" id="seat15" value="C3" disabled="disabled">
								</c:otherwise>  
							</c:choose>
								<label for="seat15">C3</label>
							</div>
							<div>
							<c:choose>
								<c:when test="${fn:contains(str, 'C4')}">
								<input type="checkbox" class="seat" name="seat" id="seat16" value="C4">
								</c:when>
								<c:otherwise>
								<input type="checkbox" class="seatdis" name="seat" id="seat16" value="C4" disabled="disabled">
								</c:otherwise>  
							</c:choose>
								<label for="seat16">C4</label>
							</div>
							<div>
							<c:choose>
								<c:when test="${fn:contains(str, 'C5')}">
								<input type="checkbox" class="seat" name="seat" id="seat17" value="C5">
								</c:when>
								<c:otherwise>
								<input type="checkbox" class="seatdis" name="seat" id="seat17" value="C5" disabled="disabled">
								</c:otherwise>  
							</c:choose>
								<label for="seat17">C5</label>
							</div>
							<div>
							<c:choose>
								<c:when test="${fn:contains(str, 'C6')}">
								<input type="checkbox" class="seat" name="seat" id="seat18" value="C6">
								</c:when>
								<c:otherwise>
								<input type="checkbox" class="seatdis" name="seat" id="seat18" value="C6" disabled="disabled">
								</c:otherwise>  
							</c:choose>
								<label for="seat18">C6</label>
							</div>
						</div>
						<div class="seat_row">
							<div>
							<c:choose>
								<c:when test="${fn:contains(str, 'D1')}">
								<input type="checkbox" class="seat" name="seat" id="seat19" value="D1">
								</c:when>
								<c:otherwise>
								<input type="checkbox" class="seatdis" name="seat" id="seat19" value="D1" disabled="disabled">
								</c:otherwise>  
							</c:choose>
								<label for="seat19">D1</label>
							</div>
							<div>
							<c:choose>
								<c:when test="${fn:contains(str, 'D2')}">
								<input type="checkbox" class="seat" name="seat" id="seat20" value="D2">
								</c:when>
								<c:otherwise>
								<input type="checkbox" class="seatdis" name="seat" id="seat20" value="D2" disabled="disabled">
								</c:otherwise>  
							</c:choose>
								<label for="seat20">D2</label>
							</div>
							<div>
							<c:choose>
								<c:when test="${fn:contains(str, 'D3')}">
								<input type="checkbox" class="seat" name="seat" id="seat21" value="D3">
								</c:when>
								<c:otherwise>
								<input type="checkbox" class="seatdis" name="seat" id="seat21" value="D3" disabled="disabled">
								</c:otherwise>  
							</c:choose>
								<label for="seat21">D3</label>
							</div>
							<div>
							<c:choose>
								<c:when test="${fn:contains(str, 'D4')}">
								<input type="checkbox" class="seat" name="seat" id="seat22" value="D4">
								</c:when>
								<c:otherwise>
								<input type="checkbox" class="seatdis" name="seat" id="seat22" value="D4" disabled="disabled">
								</c:otherwise>  
							</c:choose>
								<label for="seat22">D4</label>
							</div>
							<div>
							<c:choose>
								<c:when test="${fn:contains(str, 'D5')}">
								<input type="checkbox" class="seat" name="seat" id="seat23" value="D5">
								</c:when>
								<c:otherwise>
								<input type="checkbox" class="seatdis" name="seat" id="seat23" value="D5" disabled="disabled">
								</c:otherwise>  
							</c:choose>
								<label for="seat23">D5</label>
							</div>
							<div>
							<c:choose>
								<c:when test="${fn:contains(str, 'D6')}">
								<input type="checkbox" class="seat" name="seat" id="seat24" value="D6">
								</c:when>
								<c:otherwise>
								<input type="checkbox" class="seatdis" name="seat" id="seat24" value="D6" disabled="disabled">
								</c:otherwise>  
							</c:choose>
								<label for="seat24">D6</label>
							</div>
						</div>
						<div class="seat_row">
							<div>
							<c:choose>
								<c:when test="${fn:contains(str, 'E1')}">
								<input type="checkbox" class="seat" name="seat" id="seat25" value="E1">
								</c:when>
								<c:otherwise>
								<input type="checkbox" class="seatdis" name="seat" id="seat25" value="E1" disabled="disabled">
								</c:otherwise>  
							</c:choose>
								<label for="seat25">E1</label>
							</div>
							<div>
							<c:choose>
								<c:when test="${fn:contains(str, 'E2')}">
								<input type="checkbox" class="seat" name="seat" id="seat26" value="E2">
								</c:when>
								<c:otherwise>
								<input type="checkbox" class="seatdis" name="seat" id="seat26" value="E2" disabled="disabled">
								</c:otherwise>  
							</c:choose>
								<label for="seat26">E2</label>
							</div>
							<div>
							<c:choose>
								<c:when test="${fn:contains(str, 'E3')}">
								<input type="checkbox" class="seat" name="seat" id="seat27" value="E3">
								</c:when>
								<c:otherwise>
								<input type="checkbox" class="seatdis" name="seat" id="seat27" value="E3" disabled="disabled">
								</c:otherwise>  
							</c:choose>
								<label for="seat27">E3</label>
							</div>
							<div>
							<c:choose>
								<c:when test="${fn:contains(str, 'E4')}">
								<input type="checkbox" class="seat" name="seat" id="seat28" value="E4">
								</c:when>
								<c:otherwise>
								<input type="checkbox" class="seatdis" name="seat" id="seat28" value="E4" disabled="disabled">
								</c:otherwise>  
							</c:choose>
								<label for="seat28">E4</label>
							</div>
							<div>
							<c:choose>
								<c:when test="${fn:contains(str, 'E5')}">
								<input type="checkbox" class="seat" name="seat" id="seat29" value="E5">
								</c:when>
								<c:otherwise>
								<input type="checkbox" class="seatdis" name="seat" id="seat29" value="E5" disabled="disabled">
								</c:otherwise>  
							</c:choose>
								<label for="seat29">E5</label>
							</div>
							<div>
							<c:choose>
								<c:when test="${fn:contains(str, 'E6')}">
								<input type="checkbox" class="seat" name="seat" id="seat30" value="E6">
								</c:when>
								<c:otherwise>
								<input type="checkbox" class="seatdis" name="seat" id="seat30" value="E6" disabled="disabled">
								</c:otherwise>  
							</c:choose>
								<label for="seat30">E6</label>
							</div>
						</div>

					</div>
				</div>
			<button type="submit">결제하기 >></button>
			</form>
		</div>
	</div>
</body>
</html>