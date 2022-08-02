<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
    /* setting */
    * {
        margin: 0;
        padding: 0;
        text-decoration: none;
        list-style: none;
        box-sizing: border-box;
    }
    /* setting */

    /* notice_admin start */
    .notice_admin>.container>.table {
        border-collapse: collapse;
        text-align: center;
        border-top: 3px solid #22499d;
    }

    .notice_admin>.container>.table th {
        font-size: 16px;
        text-align: center;
        color: #555555;
        font-weight: bold;
        background-color: #f8fafc;
        color: #091f46;
    }

    .notice_admin>.container>.table td {
        font-size: 16px;
        text-align: center;
        color: #555555;
    }

    .notice_admin>.container>.table tr:hover {
        background-color: #f7f7f7;
    }

    .notice_admin>.search_container {
        margin-top: 10px;
        height: 30px;
        margin-bottom: 50px;
    }

    .notice_admin>.search_container .search_content {
        width: 300px;
        height: 40px;
    }

    .notice_admin>.search_container .search_select {
        height: 40px;
    }

    .notice_admin>.search_container .search .search_btn {
        height: 40px;
        width: 60px;
        background-color: #394b61 !important;
        color: white;
    }

    .notice_admin .search_container td {
        border: 1px solid #c8d1db
    }
    .notice_admin .add_btn{
        margin: 20px;
    }
    .notice_admin .title {
        margin-left: 20px;
        
    }
</style>

<body>
	<%@include file="/WEB-INF/view/include/admin_menu.jsp"%>
    <!-- notice_admin start -->
    <div class="notice_admin container">

        <div class="title">
            <h1>공지사항</h1>
        </div>
        <hr>

        <div align="center" class="search_container">
            <form method="post" action="/admin/notice">
                <table>
                    <tr>
                        <td><select class="search_select" name="search_item">
                                <option value="notice_title">제목</option>
                                <option value="notice_content">본문 내용</option>
                            </select></td>
                        <td class="search"><input class="search_content" type="text" name="text" /> <input type="submit"
                                class="search_btn" value="검색" />
                        </td>
                    </tr>
                </table>
            </form>
        </div>

        <div class="container">
            <table class="table">
                <tr class="table_header">
                    <th>번호</th>
                    <th>제목</th>
                    <th>등록일</th>
                    <th>조회수</th>
                </tr>
                <c:forEach var="notice" items="${list}">
                <tr>
                    <td>${notice.notice_code }</td>
                    <td><a href="/admin/notice/detail?notice_code=${notice.notice_code}&page=${pageDto.cri.page}">${notice.notice_title }</a></td>
                    <fmt:parseDate value="${notice.notice_date }" pattern="yyyy-MM-dd HH:mm:ss" var="date" />
                    <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${date}" /></td>
                    <td>${notice.notice_hit }</td>
                </tr>
                </c:forEach>
            </table>
        </div>
		<div class="add_btn" align="right">
			<a href="/admin/notice/noticeadd" class="btn btn-primary">등록</a>
		</div>
		
		<div aria-label="Contacts Page Navigation" align="center">
			<ul class="page pagination justify-content-center m-0">
				<c:if test="${pageDto.prev}">
					<li class="page-item"><a class="page-link"
						href="/admin/notice?page=${pageDto.startPage - 1}">이전</a></li>
				</c:if>
				<c:forEach begin="${pageDto.startPage}" end="${pageDto.endPage}"
					var="index">
					<li class="page-item">
						<c:choose>
							<c:when test="${pageDto.cri.page == index}">
								<a class="page-link" style="background-color: #ddd" href="/admin/notice?page=${index}&search_item=${search_item}&text=${text}">${index}</a>
							</c:when>
							<c:otherwise>
								<a class="page-link" href="/admin/notice?page=${index}&search_item=${search_item}&text=${text}">${index}</a>
							</c:otherwise>
						</c:choose>
					</li>
				</c:forEach>
				<c:if test="${pageDto.next && pageDto.endPage > 0}">
					<li class="page-item"><a class="page-link"
						href="/admin/notice?page=${pageDto.endPage + 1}">다음</a></li>
				</c:if>
			</ul>
		</div>
    </div>
</body>
</html>