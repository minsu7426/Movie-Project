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

.coupon_manage>.container>.table {
	border-collapse: collapse;
	text-align: center;
	border-top: 3px solid #22499d;
	margin-top: 50px;
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



.coupon_manage>.search_container {
	margin-top: 10px;
	height: 30px;
}

.coupon_manage>.search_container .search_content {
	width: 300px;
	height: 40px;
}

.coupon_manage>.search_container .search_select {
	height: 40px;
}

.coupon_manage>.search_container .search .search_btn {
	height: 40px;
	width: 60px;
	background-color: #394b61;
	color: white;
}

.table1{
	text-align: right;
	
}

.table1 > button{
	display: inline-block;
	font-size: 18px;
	font-weight: 700;
	height: 50px;
	line-height: 40px;
}

</style>
<script type="text/javascript">
	function couponSubmit() {
		window.open("/admin/coupon/couponadd", "_blank",
				"width=500px height=500px");
	}
</script>
<body>
	<%@include file="/WEB-INF/view/include/admin_menu.jsp"%>
	<div class="coupon_manage container">
		<div class="coupon_title">
			<h1>쿠폰관리</h1>
			<hr>
		</div>
		<div align="center" class="search_container">
			<form method="post" action="/admin/coupon">
				<table>
					<tr>
						<td><select class="search_select" name="search_item">
								<option value="coupon_form">쿠폰이름</option>
								<option value="coupon_id">받은ID</option>
						</select></td>
						<td class="search"><input class="search_content" type="text"
							name="text" /> <input type="submit" class="search_btn"
							value="검색" /></td>
					</tr>
				</table>
			</form>
			<div align="right">
				<button class="btn btn-primary" id="modal_open_btn" onclick="couponSubmit();">쿠폰등록</button>
			</div>
		</div>
		<div class="container table1">
			<button class="btn btn-primary" id="modal_open_btn"
				onclick="couponSubmit();">쿠폰등록</button>
			<table class="table">
				<tr class="table_header">
					<th>순서</th>
					<th>쿠폰코드</th>
					<th>지급 ID</th>
					<th width="30%">쿠폰 이름</th>
					<th>지급 일시</th>
					<th>유효 기한</th>
					<th>사용 여부</th>
					<th>삭제</th>
				</tr>
				<c:forEach var="coupon" items="${couponList}" varStatus="status">
				<tr>
					<td>${pageDto.displayCount - status.index}</td>
					<td>${coupon.coupon_code }</td>
					<td>${coupon.coupon_id}</td>
					<td>${coupon.coupon_form}</td>
					<td>${coupon.coupon_give}</td>
					<td>${coupon.coupon_end}</td>
					<c:if test="${coupon.coupon_flag == true}">
					<td style="color:green;">사용가능</td>
					</c:if>
					<c:if test="${coupon.coupon_flag == false}">
					<td style="color:red;">사용완료</td>
					</c:if>
					<td><a href="/admin/coupon/coupondelete?couponcode=${coupon.coupon_code}" onclick="return confirm('쿠폰을 삭제 하시겠습니까?');">삭제</a></td>
				</tr>
				</c:forEach>
			</table>
		</div>
		
		<div aria-label="Contacts Page Navigation" align="center">
			<ul class="page pagination justify-content-center m-0">
				<c:if test="${pageDto.prev}">
					<li class="page-item"><a class="page-link"
						href="/admin/coupon?page=${pageDto.startPage - 1}">이전</a></li>
				</c:if>
				<c:forEach begin="${pageDto.startPage}" end="${pageDto.endPage}"
					var="index">
					<li class="page-item">
						<c:choose>
							<c:when test="${pageDto.cri.page == index}">
								<a class="page-link" style="background-color: #ddd" href="/admin/coupon?page=${index}&search_item=${search_item}&text=${text}">${index}</a>
							</c:when>
							<c:otherwise>
								<a class="page-link" href="/admin/coupon?page=${index}&search_item=${search_item}&text=${text}">${index}</a>
							</c:otherwise>
						</c:choose>
					</li>
				</c:forEach>
				<c:if test="${pageDto.next && pageDto.endPage > 0}">
					<li class="page-item"><a class="page-link"
						href="/admin/coupon?page=${pageDto.endPage + 1}">다음</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</body>
</html>