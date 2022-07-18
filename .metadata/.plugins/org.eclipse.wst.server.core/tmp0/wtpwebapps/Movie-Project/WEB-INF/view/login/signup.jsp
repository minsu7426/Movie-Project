<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<style>
    /* menu start */
    * {
        margin: 0;
        padding: 0;
        text-decoration: none;
        list-style: none;
        box-sizing: border-box;
    }

    .signup_inner {
        width: 500px;
        margin: 0 auto;
    }

    .signup_title>h1 {
        margin-left: 20px;
    }

    .signup > form > div{
        margin-bottom: 10px;
    }

    .signup_inner>div>label {
        margin: 8px 0;
        font-size: 16px;
        font-weight: 700;
    }

    .signup_inner>div>div>input {
        width: 100%;
        height: 48px;
        border-radius: 5px;
        border: solid 1px #dadada;
        background-color: #f5f6f7;
        font-size: 15px;
        padding: 10px 14px;
        color: #2b2929;
    }

    .signup_inner>.signup_num>div>input {
        width: 241px;
    }

    .signup_inner>.signup_phone>div>input {
        width: 154px;
    }

    .signup_inner>.signup_submit>input {
        margin-top: 50px;
        width: 100%;
        padding: 17px 0;
        border: 0;
        cursor: pointer;
        color: #fff;
        background-color: #393b39;
        font-size: 20px;
        font-weight: 400;
        border: solid 3px transparent;
    }

    .signup_inner>.signup_submit>input:hover {
        color: black;
        background-color: white;
        border: solid 3px black;
        transition: all 0.3s;
    }

</style>
<body>
	<%@include file="/WEB-INF/view/include/menu.jsp"%>
    <div class="signup container">

        <div class="signup_title">
            <h1>회원가입</h1>
            <hr>
        </div>
        <form class="signup_inner" action="signup" method="post">
            <div class="signup_id">
                <label>아이디</label>
                <div>
                    <input type="text" name="user_Id" placeholder="아이디를 입력해주세요." required="required">
                </div>
            </div>
            <div class="signup_pw">
                <label>비밀번호</label>
                <div>
                    <input type="password" name="user_Pw" placeholder="비밀번호를 입력해주세요." required="required">
                </div>
            </div>
            <div class="signup_pwcf">
                <label>비밀번호 확인</label>
                <div>
                    <input type="password" placeholder="비밀번호를 입력해주세요." required="required">
                </div>
            </div>
            <div class="signup_name">
                <label>이름</label>
                <div>
                    <input type="text" name="user_Name" placeholder="이름을 입력해주세요." required="required">
                </div>
            </div>
            <div class="signup_num">
                <label>주민번호</label>
                <div>
                    <input type="text" name="jumin1" placeholder="주민번호 앞6자리" required="required"> - <input type="text" name="jumin2" placeholder="주민번호 뒷7자리" required="required">
                </div>
            </div>
            <div class="signup_phone">
                <label>연락처</label>
                <div>
                    <input type="text" maxlength="3" name="phone1" placeholder="ex) 010"> - <input type="text" maxlength="4" name="phone2"
                        placeholder="ex) xxxx" required="required"> - <input type="text" maxlength="4" placeholder="ex) xxxx" required="required" name="phone3">
                </div>
            </div>
            <div class="signup_email">
                <label>이메일</label>
                <div>
                    <input type="email" name="user_Email" placeholder="이메일을 입력해주세요." required="required">
                </div>
            </div>
            <div class="signup_submit">
                <input type="submit" value="가입하기">
            </div>
        </form>
    </div>
</body>
</html>