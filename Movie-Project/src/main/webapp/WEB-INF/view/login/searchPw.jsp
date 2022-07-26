<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<style>
    * {
        margin: 0;
        padding: 0;
        text-decoration: none;
        list-style: none;
        box-sizing: border-box;
    }

    body {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
    }

    .login {

        width: 30%;
        background: white;
        border-radius: 20px;
        display: flex;
        align-items: center;
        flex-direction: column;
    }

    .login>.login_inner {
        text-align: center;
    }

    h1 {
        margin-bottom: 50px;
        font-weight: 700;
        font-size: 40px;
    }

    h4 {
        font-weight: 700;
        margin-bottom: 10px;
        text-align: left;
    }

    .login>.login_inner>.login_form>div>.login_id {
        margin-bottom: 50px;
    }

    .login>.login_inner>.login_form input {
        width: 400px;
        height: 44px;
        border-radius: 5px;
        border: solid 1px #dadada;
        background-color: #f5f6f7;
        font-size: 15px;
        padding: 10px 14px;
        color: #2b2929;
    }

    .login>.login_inner>.login_form>.login_find {
        display: flex;
        justify-content: space-between;
        margin: 5px 0 20px;
        color:#337ab7;;
    }

    .login>.login_inner>.login_form>.submit>button {
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
    }

    .login>.login_inner>.login_form>.submit>button:hover{
        background-color: white;
        color: black;
        border: 3px solid black;
        transition: all 0.3s;
    }
    .error{
    	text-align: center;
    	color: red;
    }
</style>
<body>
    <div class="login">
        <div class="login_inner">
            <img src="../resources/images/logo_transparent.png" alt="" width="200px">
            <h1>PW 찾기</h1>
            <c:if test="${!empty error}">
            <h4 class="error">해당 정보의 비밀번호가 존재하지 않습니다.</h4>
            </c:if>
            <c:if test="${!empty pw}">
            <h4 class="error">PW는 '${pw}' 입니다.</h4>
            </c:if>
            <form class="login_form" action="/login/searchpw" method="post">
                <div class="login_idpw">
                    <div class="login_id">
                        <h4>ID</h4>
                        <input type="text" class="form-control" placeholder="ID를 입력하세요." name="user_id" required
                            autofocus>
                    </div>
                    <div class="login_pw">
                        <h4>이름</h4>
                        <input type="text" class="form-control" placeholder="이름을 입력하세요." name="user_name" required
                        autofocus>
                    </div>
                </div>
                <div class="login_find">
                    <a href="/login/signup">회원가입</a>
                    <a href="/login/login">로그인</a>
                    <a href="/home">홈으로</a>
                    <a href="/login/searchid">ID 찾기</a>
                </div>
                <div class="submit">
                    <button class="btn-block" type="submit">찾기</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>