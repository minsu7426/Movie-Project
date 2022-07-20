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


    .one_on_one_admin_detail .add p {
        width: 600px;
        font-size: 15px;
        color: #2b2929;
        resize: none;
    }
    .one_on_one_admin_detail .add label{
    	font-size: 18px;
    }
    
    .one_on_one_admin_detail .add .date{
    	padding: 0 15px;
    	color: gray
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
            <h1>${askDto.ask_title }</h1>
            <div class="title_items">
                <div class="title_item">
                    <span class="title">작성일자</span> <span>${askDto.ask_date }</span>
                </div>
                <div class="title_item">
                    <span class="title">조회수</span><span>${askDto.ask_hit }</span>
                </div>
            </div>
            <hr>
            <div class="content">
                <span>${askDto.ask_content}</span>
            </div>
        </div>
        <hr>
        <div class="res_title">
            <h1>답변</h1>
            <hr>
        </div>
        <div class="add">
			<div class="form-group row">
				<p class="date">${askDto.ask_re_date}</p>
				<label class="col-sm-2 input-name">내용</label>
				<p>${askDto.ask_re_content}</p>
			</div>
			<div class="submit" align="end">
				<a href="/ask/one-on-one-detail?askid=${askDto.ask_id }" class="btn btn-primary">되돌아가기</a>
			</div>
		</div>
    </div>


    <!-- one_on_one_admin_detail end -->
</body>
</html>