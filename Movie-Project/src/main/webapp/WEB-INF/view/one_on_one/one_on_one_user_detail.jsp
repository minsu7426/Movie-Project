<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
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

    /* one_on_one_admin_detail start */
    .one_on_one_admin_detail .title{
        margin-bottom: 50px;
    }
    .one_on_one_admin_detail .span1 {
        border-right: 1px solid black;
    }

    .one_on_one_admin_detail .title_items {
        display: flex;
        justify-content: space-between;
        margin: 20px 0;
    }

    .one_on_one_admin_detail .title_item {
        font-size: 18px;
    }

    .one_on_one_admin_detail .title_item .title {
        font-size: 18px;
        font-weight: bold;
    }

    .one_on_one_admin_detail .title_item span {
        margin-right: 10px;
        padding-right: 10px;
    }

    .one_on_one_admin_detail .btn {
        margin-top: 50px;
    }

    .one_on_one_admin_detail .btn a {
        margin: 0 5px;
    }

    .one_on_one_admin_detail .add .add_form .submit button {
        margin-right: 40px;
    }
    .one_on_one_admin_detail .add .add_form textarea {
        width: 600px;
        border-radius: 5px;
        border: solid 1px #dadada;
        background-color: #f5f6f7;
        font-size: 15px;
        padding: 10px 14px;
        color: #2b2929;
        resize: none;
    }
    .one_on_one_admin_detail .res_title{
        margin-top: 100px;
    }
    /* one_on_one_admin_detail end */
</style>
<body>
	<%@include file="/WEB-INF/view/include/menu.jsp"%>
  <!-- one_on_one_admin_detail start -->
    <div class="one_on_one_admin_detail container">
        <div class="title">
            <h1>1:1 문의</h1>
            <hr>
        </div>
        <div class="title_container">
            <h1>문의 제목입니다</h1>
            <div class="title_items">
                <div class="title_item">
                    <span class="title">작성일자</span> <span>2022-07-07</span>
                </div>
                <div class="title_item">
                    <span class="title">조회수</span><span>5</span>
                </div>
            </div>
            <hr>
            <div class="content">
                <span>내용내용내용내용</span>
            </div>
        </div>
        <hr>
        <div class="res_title">
            <h1>답변</h1>
            <hr>
        </div>
        <div class="add">
            <form class="add_form" action="">
                <div class="form-group row">
                    <label class="col-sm-2 input-name">내용</label>
                    <textarea name="content" cols="50" rows="8" placeholder="내용을 입력하세요." required></textarea>
                </div>
                <div class="submit" align="end">
                    <button class="btn btn-primary" type="submit"><b>작성하기</b></button>
                    <a href="" class="btn btn-primary">되돌아가기</a>
                </div>
            </form>
        </div>
    </div>


    <!-- one_on_one_admin_detail end -->
</body>
</html>