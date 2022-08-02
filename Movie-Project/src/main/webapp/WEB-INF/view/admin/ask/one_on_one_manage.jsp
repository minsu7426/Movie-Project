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

    /* one_on_one_manage start */
    .one_on_one_manage>.container>.table {
        border-collapse: collapse;
        text-align: center;
        border-top: 3px solid #22499d;
    }

    .one_on_one_manage>.container>.table th {
        font-size: 16px;
        text-align: center;
        color: #555555;
        font-weight: bold;
        background-color: #f8fafc;
        color: #091f46;
    }

    .one_on_one_manage>.container>.table td {
        font-size: 16px;
        text-align: center;
        color: #555555;
    }

    .one_on_one_manage>.container>.table tr:hover {
        background-color: #f7f7f7;
    }

    .one_on_one_manage .title {
        margin-left: 20px;
    }
    .one_on_one_manage>.search_container {
        margin-top: 10px;
        height: 30px;
        margin-bottom: 50px;
    }

    .one_on_one_manage>.search_container .search_content {
        width: 300px;
        height: 40px;
    }

    .one_on_one_manage>.search_container .search_select {
        height: 40px;
    }

    .one_on_one_manage>.search_container .search .search_btn {
        height: 40px;
        width: 60px;
        background-color: #394b61 !important;
        color: white;
    }

    .one_on_one_manage .search_container td {
        border: 1px solid #c8d1db
    }
    .one_on_one_manage .container .table .content{
        width: 500px;
    }
</style>
<body>
	<%@include file="/WEB-INF/view/include/admin_menu.jsp" %>
    <!-- one_on_one_manage start -->
    <div class="one_on_one_manage container">

        <div class="title">
            <h1>1:1 문의내역</h1>
        </div>
        <hr>
        <div align="center" class="search_container">
            <form method="post" action="/admin/ask">
                <table>
                    <tr>
                        <td><select class="search_select" name="search_item">
                                <option value="ask_title">제목</option>
                                <option value="ask_content">본문 내용</option>
                                <option value="ask_id">글쓴이</option>
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
                    <th>회원 아이디</th>
                    <th class="content">문의 제목</th>
                    <th>등록일</th>
                    <th>답변 여부</th>
                </tr>
                <c:forEach var="asklist" items="${askList}">
                <tr>
                    <td>${asklist.ask_code}</td>
                    <td>${asklist.ask_id}</td>
                    <td class="content">
                    <a href="/admin/ask/askdetail?askcode=${asklist.ask_code}">${asklist.ask_title}</a>
                    </td>
                    <td>${asklist.ask_date}</td>
                     <c:if test="${asklist.ask_re_content == null}">
                    <td style="color:red;">미완료</td>
                    </c:if>
                    <c:if test="${!empty asklist.ask_re_content}">
                    <td style="color:green;">답변완료</td>
                    </c:if>
                </tr>
                </c:forEach>
            </table>
        </div>

       <div aria-label="Contacts Page Navigation" align="center">
			<ul class="page pagination justify-content-center m-0">
				<c:if test="${pageDto.prev}">
					<li class="page-item"><a class="page-link"
						href="/admin/ask?page=${pageDto.startPage - 1}">이전</a></li>
				</c:if>
				<c:forEach begin="${pageDto.startPage}" end="${pageDto.endPage}"
					var="index">
					<li class="page-item">
						<c:choose>
							<c:when test="${pageDto.cri.page == index}">
								<a class="page-link" style="background-color: #ddd" href="/admin/ask?page=${index}&search_item=${search_item}&text=${text}">${index}</a>
							</c:when>
							<c:otherwise>
								<a class="page-link" href="/admin/ask?page=${index}&search_item=${search_item}&text=${text}">${index}</a>
							</c:otherwise>
						</c:choose>
					</li>
				</c:forEach>
				<c:if test="${pageDto.next && pageDto.endPage > 0}">
					<li class="page-item"><a class="page-link"
						href="/admin/ask?page=${pageDto.endPage + 1}">다음</a></li>
				</c:if>
			</ul>
		</div>
    </div>
</body>
</html>