<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    .one_on_one> .one_on_one_nav > .ing{
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

</style>
<body>
	<%@include file="/WEB-INF/view/include/menu.jsp"%>
    <div class="one_on_one container">
        <div class="title">
            <h1>1:1 문의하기</h1>
            <hr>
        </div>

        <nav class="one_on_one_nav">
            <a class="ing" align="center">문의하기</a>
            <a href="/ask/one-on-one-detail?askid=${user[0]}" class="end" align="center">나의 문의 내역</a>
       
        </nav>

        <div class="asking" >
            <form class="ask_form" action="/ask/one-on-one" method="post">
                <hr>
                <div class="form-group row">
                    <label class="col-sm-2 input-name">문의 제목</label>
                    <input class="form-input" type="text" name="ask_title" required placeholder="문의 제목을 입력하세요.">
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 input-name">문의 내용</label>
                    <textarea class="form-input" cols="50" rows="5" name="ask_content" required placeholder="문의 내용을 자세하게 작성해 주세요.&#13;&#10;자세한 내용을 함께 보내주시면 더욱 신속히 답변드릴 수 있습니다."></textarea>
                </div>
                <hr>
                <div class="submit">
                    <button class="btn-block" type="submit"><b>작성하기</b></button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>