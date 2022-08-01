<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<style>
    /* one_on_one start */
    .one_on_one .title>h1 {
        margin-left: 20px;
    }

    .one_on_one> .one_on_one_nav > .end{
        background-color: whitesmoke;
        border: 1px solid black;
    }


    .one_on_one .one_on_one_nav {
        display: flex;
        justify-content: center;
        margin: 50px 0;
    }

    .one_on_one .one_on_one_nav a {
        background-color: white;
        padding: 20px;
        width: 500px;
        cursor: pointer;
        margin: 0;
    }

    .one_on_one .asking,
    .one_on_one .ask_history {
        width: 800px;
        margin: 0 auto;
    }


    /* one_on_one end */

    .one_on_one .asking button{
        width: 300px;
        margin: 0 auto;
        border-radius: 5px;
        border: solid 1px #dadada;
        background-color: whitesmoke;
        font-size: 15px;
        padding: 10px 14px;
        color: #2b2929;
        
    }
    .one_on_one .login_form input, .one_on_one .asking input {
        width: 400px;
        height: 44px;
        border-radius: 5px;
        border: solid 1px #dadada;
        background-color: #f5f6f7;
        font-size: 15px;
        padding: 10px 14px;
        color: #2b2929;
    }
    .one_on_one .asking textarea{
        width: 600px;
        height: 270px;
        border-radius: 5px;
        border: solid 1px #dadada;
        background-color: #f5f6f7;
        font-size: 15px;
        padding: 10px 14px;
        color: #2b2929;
    }
    .one_on_one .login_form>.submit>button {
        margin-top: 50px;
        height: 50px;
        border: 0;
        outline: none;
        border-radius: 40px;
        background-color: #393b39;
        color: white;
        font-size: 1.2em;
        letter-spacing: 2px;
        font-weight: bold;
        border: 3px solid transparent;
        width: 400px;
    }

    .one_on_one .login_form>.submit>button:hover{
        background-color: white;
        color: black;
        border: 3px solid black;
        transition: all 0.3s;
    }
	
	.one_on_one >.container>.table {
        border-collapse: collapse;
        text-align: center;
        border-top: 3px solid #22499d;
    }

    .one_on_one >.container>.table th {
        font-size: 16px;
        text-align: center;
        color: #555555;
        font-weight: bold;
        background-color: #f8fafc;
        color: #091f46;
    }

    .one_on_one >.container>.table td {
        font-size: 16px;
        text-align: center;
        color: #555555;
    }

    .one_on_one>.container >.table tr:hover {
        background-color: #f7f7f7;
    }
	
</style>
<body>
	<%@include file="/WEB-INF/view/include/menu.jsp"%>
    <div class="one_on_one container">
        <div class="title">
            <h1>1:1 문의내역</h1>
            <hr>
        </div>

        <nav class="one_on_one_nav">
            <a href="/ask" class="ing" align="center">문의하기</a>
            <a class="end" align="center">나의 문의 내역</a>
        </nav>

        <div class="container">
            <table class="table">
            
                <tr class="table_header">
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성일자</th>
                    <th>답변여부</th>
                </tr>
                <c:forEach var="ask" items="${askList}" varStatus="status">
                <tr>
                    <td>${pageDto.displayCount - status.index}</td>
                    <td><a href="/ask/oneonone-user?askcode=${ask.ask_code }">${ask.ask_title }</a></td>
                    <td>${ask.ask_date }</td>
                    <c:if test="${ask.ask_re_content == null}">
                    <td style="color:red;">미완료</td>
                    </c:if>
                    <c:if test="${!empty ask.ask_re_content}">
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
						href="/ask/one-on-one-detail?page=${pageDto.startPage - 1}&askid=${user[0]}">이전</a></li>
				</c:if>
				<c:forEach begin="${pageDto.startPage}" end="${pageDto.endPage}"
					var="index">
					<li class="page-item">
						<c:choose>
							<c:when test="${pageDto.cri.page == index}">
								<a class="page-link" style="background-color: #ddd" href="/ask/one-on-one-detail?page=${index}&askid=${user[0]}">${index}</a>
							</c:when>
							<c:otherwise>
								<a class="page-link" href="/ask/one-on-one-detail?page=${index}&askid=${user[0]}">${index}</a>
							</c:otherwise>
						</c:choose>
					</li>
				</c:forEach>
				<c:if test="${pageDto.next && pageDto.endPage > 0}">
					<li class="page-item"><a class="page-link"
						href="/ask/one-on-one-detail?page=${pageDto.endPage + 1}&askid=${user[0]}">다음</a></li>
				</c:if>
			</ul>
		</div>

    </div>
</body>
</html>