<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    /* review_manage start */
    .review_manage>.container>.table {
        border-collapse: collapse;
        text-align: center;
        border-top: 3px solid #22499d;
    }

    .review_manage>.container>.table th {
        font-size: 16px;
        text-align: center;
        color: #555555;
        font-weight: bold;
        background-color: #f8fafc;
        color: #091f46;
    }

    .review_manage>.container>.table td {
        font-size: 16px;
        text-align: center;
        color: #555555;
        
    }
    
    .review_manage>.container>.table td:nth-child(5){
    	display: block;
    	white-space: nowrap;
    	overflow: hidden;
        text-overflow: ellipsis;
    }

    .review_manage>.container>.table tr:hover {
        background-color: #f7f7f7;
    }

    .review_manage>.search_container {
        margin-top: 10px;
        height: 30px;
        margin-bottom: 50px;
    }

    .review_manage>.search_container .search_content {
        width: 300px;
        height: 40px;
    }

    .review_manage>.search_container .search_select {
        height: 40px;
    }

    .review_manage>.search_container .search .search_btn {
        height: 40px;
        width: 60px;
        background-color: #394b61 !important;
        color: white;
    }

    .review_manage .search_container td {
        border: 1px solid #c8d1db
    }
    .review_manage .title {
        margin-left: 20px;
    }
    .review_manage .container .table .content{
        width: 400px;
    }
</style>

<body>
	<%@include file="/WEB-INF/view/include/admin_menu.jsp"%>
    <!-- review_manage start -->
    <div class="review_manage container">

        <div class="title">
            <h1>리뷰 관리</h1>
        </div>
        <hr>

        <div align="center" class="search_container">
            <form method="post" action="/admin/review">
                <table>
                    <tr>
                        <td><select class="search_select" name="search_item">
                                <option value="review_content">내용</option>
                                <option value="movie_title">영화이름</option>
                                <option value="review_id">ID</option>
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
                    <th>순서</th>
                    <th>아이디</th>
                    <th>영화이름</th>
                    <th>평점</th>
                    <th style="width: 300px; overflow: hidden;">리뷰 내용</th>
                    <th>등록 일자</th>
                    <th>비고</th>
                </tr>
                <c:forEach var="review" items="${reviewList}" varStatus="status">
                <tr>
                    <td>${pageDto.displayCount - status.index}</td>
                    <td>${review.review_id }</td>
                    <td>${review.movie_title }</td>
                    <td>${review.review_star }</td>
                    <td class="content">${review.review_content }</td>
                    <td>${review.review_date }</td>
                    <td><a href="/admin/review/reviewdelete?reviewcode=${review.review_code }" onclick="return confirm('리뷰를 삭제 하시겠습니까?');">삭제</a></td>
                </tr>
                </c:forEach>
                
            </table>
        </div>
		<div aria-label="Contacts Page Navigation" align="center">
			<ul class="page pagination justify-content-center m-0">
				<c:if test="${pageDto.prev}">
					<li class="page-item"><a class="page-link"
						href="/admin/review?page=${pageDto.startPage - 1}">이전</a></li>
				</c:if>
				<c:forEach begin="${pageDto.startPage}" end="${pageDto.endPage}"
					var="index">
					<li class="page-item">
						<c:choose>
							<c:when test="${pageDto.cri.page == index}">
								<a class="page-link" style="background-color: #ddd" href="/admin/review?page=${index}&search_item=${search_item}&text=${text}">${index}</a>
							</c:when>
							<c:otherwise>
								<a class="page-link" href="/admin/review?page=${index}&search_item=${search_item}&text=${text}">${index}</a>
							</c:otherwise>
						</c:choose>
					</li>
				</c:forEach>
				<c:if test="${pageDto.next && pageDto.endPage > 0}">
					<li class="page-item"><a class="page-link"
						href="/admin/review?page=${pageDto.endPage + 1}">다음</a></li>
				</c:if>
			</ul>
		</div>

    </div>
</body>
</body>
</html>