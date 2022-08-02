<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
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

    /* member_manager start */
    .member_manager>.container>.table {
        border-collapse: collapse;
        text-align: center;
        border-top: 3px solid #22499d;
    }

    .member_manager>.container>.table th {
        font-size: 16px;
        text-align: center;
        color: #555555;
        font-weight: bold;
        background-color: #f8fafc;
        color: #091f46;
    }

    .member_manager>.container>.table td {
        font-size: 16px;
        text-align: center;
        color: #555555;
    }

    .member_manager>.container>.table tr:hover {
        background-color: #f7f7f7;
    }

    .member_manager>.search_container {
        margin-top: 10px;
        height: 30px;
        margin-bottom: 50px;
    }

    .member_manager>.search_container .search_content {
        width: 300px;
        height: 40px;
    }

    .member_manager>.search_container .search_select {
        height: 40px;
    }

    .member_manager>.search_container .search .search_btn {
        height: 40px;
        width: 60px;
        background-color: #394b61 !important;
        color: white;
    }

    .member_manager .search_container td {
        border: 1px solid #c8d1db
    }
    .member_manager .title {
        margin-left: 20px;
    }
</style>
<body>
	<%@include file="/WEB-INF/view/include/admin_menu.jsp" %>
	 <!-- member_manager start -->
    <div class="member_manager container">

        <div class="title">
            <h1>회원 정보</h1>
        </div>
        <hr>

        <div align="center" class="search_container">
            <form method="post" action="/admin/member">
                <table>
                    <tr>
                        <td><select class="search_select" name="search_item">
                                <option value="user_id">ID</option>
                                <option value="user_class">등급</option>
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
                    <th>회원 이메일</th>
                    <th>생년 월일</th>
                    <th>회원 등급</th>
                    <th>회원 정보</th>
                </tr>
                <c:forEach var="member" items="${userList}" varStatus="status">
                <tr>
                    <td>${pageDto.displayCount - status.index}</td>
                    <td>${member.user_id }</td>
                    <td>${member.user_email }</td>
                    <td>${member.user_jumin }</td>
                    <td>${member.user_class }</td>
                    <td><a href="/admin/member/memberdetail?memberId=${member.user_id}">수정</a></td>
                </tr>
                
				</c:forEach>
            </table>
        </div>

        <div aria-label="Contacts Page Navigation" align="center">
			<ul class="page pagination justify-content-center m-0">
				<c:if test="${pageDto.prev}">
					<li class="page-item"><a class="page-link"
						href="/admin/member?page=${pageDto.startPage - 1}">이전</a></li>
				</c:if>
				<c:forEach begin="${pageDto.startPage}" end="${pageDto.endPage}"
					var="index">
					<li class="page-item">
						<c:choose>
							<c:when test="${pageDto.cri.page == index}">
								<a class="page-link" style="background-color: #ddd" href="/admin/member?page=${index}&search_item=${search_item}&text=${text}">${index}</a>
							</c:when>
							<c:otherwise>
								<a class="page-link" href="/admin/member?page=${index}&search_item=${search_item}&text=${text}">${index}</a>
							</c:otherwise>
						</c:choose>
					</li>
				</c:forEach>
				<c:if test="${pageDto.next && pageDto.endPage > 0}">
					<li class="page-item"><a class="page-link"
						href="/admin/member?page=${pageDto.endPage + 1}">다음</a></li>
				</c:if>
			</ul>
		</div>
    </div>
</body>
</html>