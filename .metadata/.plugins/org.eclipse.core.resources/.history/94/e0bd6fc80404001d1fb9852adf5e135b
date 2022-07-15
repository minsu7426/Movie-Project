<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>

<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script><meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<style>
	body { font-family:'맑은 고딕', verdana; padding-bottom:70px; margin:0; }
   
	header#header { font-size:20px; padding:5px 0; }
   	header#header a { color:#000; font-weight:bold; font-size:14px;text-align: right }
   	header#header img {width: 40px; height: 44px; margin-left: 10px; margin-bottom: 3px;}
   	header#header .title{ border-bottom: 1px solid gray;}  
   	#footer { background:#f9f9f9; padding:8px; }
   	#footer ul li { display:inline-block; margin-right:10px; }
</style>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
	<header id="header">
		<div id="header_box">
			<%@include file="../include/header.jsp"%>
		</div>
	</header>
	
	<div class="container-fluid" style="margin-top: 10px;">
	
		
	<aside>
		<%@include file="../include/aside.jsp" %>
	</aside>
	
	
	<div class="col-md-10">
		<div>
			<div class="pull-left">
					<h2>공지사항</h2>
			</div>
		</div>
	</div>


	<div class="col-md-10">
		<table class="table table-hover">
			<tr class="active">
				<th>NO</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>

			<!-- 목록시작 -->
			<c:forEach items="${list }" var="list">
				<tr>
					<td>${list.no_num}</td>
					<td>
						<a href="/notice/read?no_num=${list.no_num}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">${list.no_subject}</a>
					</td>
					<td>${list.userId }</td>
					<td>
						<fmt:formatDate value="${list.no_date}" pattern="yyyy-MM-dd" />
					</td>
					<td>${list.no_readCount }</td>
			</c:forEach>
			<!-- 목록끝 -->
		</table>
	

		<div class="search row">
			<div class="col-xs-2 col-sm-2">
				<select name="searchType" class="form-control">
					<option value="n"
						<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
					<option value="t"
						<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
					<option value="c"
						<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
					<option value="w"
						<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
					<option value="tc"
						<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
				</select>
			</div>

			<div class="col-xs-10 col-sm-10">
				<div class="input-group">
					<input type="text" name="keyword" id="keywordInput"
						value="${scri.keyword}" class="form-control" /> <span
						class="input-group-btn">
						<button id="searchBtn" class="btn btn-default">검색</button>
					</span>
				</div>
			</div>

			<script>
				$(function() {
					$('#searchBtn').click(
							function() {
								self.location = "list"
										+ '${pageMaker.makeQuery(1)}'
										+ "&searchType="
										+ $("select option:selected").val()
										+ "&keyword="
										+ encodeURIComponent($('#keywordInput')
												.val());
							});
				});
			</script>
		</div>


		<div class="col-md-offset-3">
			<ul class="pagination">
				<c:if test="${pageMaker.prev}">
					<li><a
						href="listSearch${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
				</c:if>

				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
					var="idx">
					<li
						<c:out value="${pageMaker.cri.page == idx ? 'class=active' : ''}"/>>
						<a href="listSearch${pageMaker.makeSearch(idx)}">${idx}</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a
						href="listSearch${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
				</c:if>
			</ul>
		</div>
	</div>
	
	</div>
		
	<footer class="navbar navbar-default navbar-fixed-bottom">
		<div id="footer" class="container-fluid">
			<%@include file="../include/footer.jsp"%>
		</div>
	</footer>
</body>
</html>