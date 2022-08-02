<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
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

/* notice_detail start */
.notice_detail .title {
	margin-bottom: 50px;
}

.notice_detail .span1 {
	border-right: 1px solid black;
}

.notice_detail .title_items {
	display: flex;
	justify-content: space-between;
	margin: 20px 0;
}

.notice_detail .title_item {
	font-size: 18px;
}

.notice_detail .title_item .title {
	font-size: 18px;
	font-weight: bold;
}

.notice_detail .title_item span {
	margin-right: 10px;
	padding-right: 10px;
}

.notice_detail .btn {
	margin-top: 50px;
}

.notice_detail .btn a {
	margin: 0 5px;
}

/* notice_detail end */
</style>
<body>
<jsp:include page="/WEB-INF/view/include/menu.jsp"/>
	<!-- notice_detail start -->
	<div class="notice_detail container">
		<div class="title">
			<h1>공지사항</h1>
			<hr>
		</div>
		<div class="title_container">
			<h1>${dto.notice_title }</h1>
			<div class="title_items">
				<div class="title_item">
					<fmt:parseDate value="${dto.notice_date}" pattern="yyyy-MM-dd" var="date"/>
					
					<span class="title">작성일자</span> <span><fmt:formatDate pattern="yyyy-MM-dd" value="${date}"/></span>
				</div>
				<div class="title_item">
					<span class="title">조회수</span><span>${dto.notice_hit }</span>
				</div>
			</div>
			<hr>
			<div>
				<span>${dto.notice_content }</span>
			</div>
		</div>
		<div class="button" align="end">
			<a href="/notice/list?page=${cri.page}&search_item=${cri.search_item}&text=${cri.text}" class="btn btn-primary">되돌아가기</a>
		</div>
	</div>


	<!-- notice_detail end -->
</body>
</html>