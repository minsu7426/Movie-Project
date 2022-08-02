<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.topmenu{
	position: relative;
	z-index: 100;
}

.clearfix:before, .clearfix:after {
	display: table;
	content: ' ';
}

.clearfix:after {
	clear: both;
}

body {
	background: #f0f0f0 !important;
}

.page-404 .outer {
	position: absolute;
	top: 0;
	display: table;
	width: 100%;
	height: 100%;
}

.page-404 .outer .middle {
	display: table-cell;
	vertical-align: middle;
}

.page-404 .outer .middle .inner {
	width: 300px;
	margin-right: auto;
	margin-left: auto;
	text-align: center;
}

.page-404 .outer .middle .inner .inner-circle {
	height: 300px;
	border-radius: 50%;
	background-color: #ffffff;
}

.page-404 .outer .middle .inner .inner-circle:hover i {
	color: #39bbdb !important;
	background-color: #f5f5f5;
	box-shadow: 0 0 0 15px #39bbdb;
}

.page-404 .outer .middle .inner .inner-circle:hover span {
	color: #39bbdb;
}

.page-404 .outer .middle .inner .inner-circle i {
	font-size: 5em;
	line-height: 1em;
	float: right;
	width: 1.6em;
	height: 1.6em;
	margin-top: -.7em;
	margin-right: -.5em;
	padding: 20px;
	-webkit-transition: all .4s;
	transition: all .4s;
	text-align: center;
	color: #f5f5f5 !important;
	border-radius: 50%;
	background-color: #39bbdb;
	box-shadow: 0 0 0 15px #f0f0f0;
}

.page-404 .outer .middle .inner .inner-circle span {
	font-size: 11em;
	font-weight: 700;
	line-height: 1.2em;
	display: block;
	-webkit-transition: all .4s;
	transition: all .4s;
	text-align: center;
	color: #e0e0e0;
}

.page-404 .outer .middle .inner .inner-status {
	font-size: 20px;
	display: block;
	margin-top: 20px;
	margin-bottom: 5px;
	text-align: center;
	color: #39bbdb;
}

.page-404 .outer .middle .inner .inner-detail {
	line-height: 1.4em;
	display: block;
	margin-bottom: 10px;
	text-align: center;
	color: #999999;
}
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<body>
	<div class="topmenu">
	<c:choose>
		<c:when test="${user[0] == 'admin'}">
			<jsp:include page="/WEB-INF/view/include/admin_menu.jsp" />
		</c:when>
		<c:otherwise>
			<jsp:include page="/WEB-INF/view/include/menu.jsp" />
		</c:otherwise>
	</c:choose>
	</div>
	<div class="page-404">
		<div class="outer">
			<div class="middle">
				<div class="inner">
					<!--BEGIN CONTENT-->
					<div class="inner-circle">
						<i class="fa fa-cogs"></i><span>500</span>
					</div>
					<span class="inner-status">Opps! Internal Server Error!</span> <span
						class="inner-detail">불편을 드려 죄송합니다. 관리자에게 문의 하여 주십시오.</span>
					<!--END CONTENT-->
					<c:choose>
						<c:when test="${user[0] == 'admin'}">
							<a href="/admin/home" class="btn btn-info">Home >></a>
						</c:when>
						<c:otherwise>
							<a href="/home" class="btn btn-info">Home >></a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
</body>
</html>