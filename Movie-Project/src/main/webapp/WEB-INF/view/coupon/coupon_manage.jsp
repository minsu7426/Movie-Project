<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
	<script src="https://kit.fontawesome.com/d777ad58b4.js" crossorigin="anonymous"></script>
<style>
.coupon_manage>.coupon_title>h1 {
	margin-left: 20px;
}

.coupon_manage>.coupon_title {
	position: relative;
	z-index: -10;
}

.coupon_manage>.coupon_title>button {
	
	
}
.coupon_manage>.container{
	text-align: right;
}
.coupon_manage>.container>.table {
	border-collapse: collapse;
	text-align: center;
	border-top: 3px solid #22499d;
	margin-top: 20px;
}

.coupon_manage>.container>.table th {
	font-size: 16px;
	text-align: center;
	color: #555555;
	font-weight: bold;
	background-color: #f8fafc;
	color: #091f46;
}

.coupon_manage>.container>.table td {
	font-size: 16px;
	padding: 18px 0;
	text-align: center;
	color: #555555;
}

.coupon_manage>.container>.table tr:hover {
	background-color: #f7f7f7;
}

.coupon_manage>.container>.table td:nth-child(1) {
	width: 40%;
}

.modal{
	width: 600px;
	height: 300px;
	background: white;
	position: absolute;
	z-index: 100px;
	border: 1px solid black;
}

.btn-info{
	font-size: 18px;
	font-weight: 700;
	height: 50px;
	line-height: 40px;
	top: 0;
	right: 20px;
}

</style>
<script type="text/javascript">
	function couponSubmit(){
		window.open("/coupon/couponsubmit","_blank","width=500px height=200px");
	}
</script>
<body>
	<%@include file="/WEB-INF/view/include/menu.jsp"%>
	<div class="coupon_manage container">
		<div class="coupon_title">
			<h1>쿠폰관리</h1>
			<hr>
		</div>
		<div class="container">
			<button class="btn btn-info"  id="modal_open_btn" onclick="couponSubmit();">쿠폰등록</button>
			<table class="table">
				<tr class="table_header">
					<th>쿠폰이름</th>
					<th>지급일</th>
					<th>유효기간</th>
					<th>사용여부</th>
				</tr>
				<c:forEach var="coupon" items="${couponList}">
				<tr>
					<td>${coupon.coupon_form }</td>
					<td>${coupon.coupon_give }</td>
					<td>${coupon.coupon_end }</td>
					<c:if test="${coupon.coupon_flag == true}">
					<td style="color:green;">사용가능</td>
					</c:if>
					<c:if test="${coupon.coupon_flag == false}">
					<td style="color:red;">사용완료</td>
					</c:if>
				</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>