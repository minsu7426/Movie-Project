<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
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

    /* notice_add start */
    .notice_add .title {
        margin-bottom: 50px;
    }

    .notice_add .add .add_form input {
        width: 400px;
        height: 44px;
        border-radius: 5px;
        border: solid 1px #dadada;
        background-color: #f5f6f7;
        font-size: 15px;
        padding: 10px 14px;
        color: #2b2929;
    }

    .notice_add .add .add_form textarea {
        width: 600px;
        border-radius: 5px;
        border: solid 1px #dadada;
        background-color: #f5f6f7;
        font-size: 15px;
        padding: 10px 14px;
        color: #2b2929;
        resize: none;
    }

    .notice_add .add .add_form .submit button {
        margin-right: 40px;
    }

    /* notice_add end */
</style>

<body>
	<%@include file="/WEB-INF/view/include/admin_menu.jsp"%>
    <!-- notice_add start -->
    <div class="notice_add container">
        <div class="title">
            <h1>공지사항 등록</h1>
            <hr>
        </div>
        <div class="add">
            <form class="add_form" action="/admin/notice/noticeadd" method="post">
                <div class="form-group row">
                    <label class="col-sm-2 input-name">제목</label>
                    <input class="form-input" name="notice_title" type="text" required placeholder="제목을 입력하세요.">
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 input-name">내용</label>
                    <textarea name="notice_content" cols="50" rows="8" placeholder="내용을 입력하세요." required></textarea>
                </div>
                <hr>
                <div class="submit" align="end">
                    <button class="btn btn-primary" type="submit">작성하기</button>
                    <a href="/admin/notice" class="btn btn-primary">되돌아가기</a>
                </div>
            </form>
        </div>
    </div>


    <!-- notice_add end -->
</body>

</html>