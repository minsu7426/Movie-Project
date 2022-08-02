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

    /* notice_update start */
    .notice_update .title {
        margin-bottom: 50px;
    }

    .notice_update .update .update_form input {
        width: 400px;
        height: 44px;
        border-radius: 5px;
        border: solid 1px #dadada;
        background-color: #f5f6f7;
        font-size: 15px;
        padding: 10px 14px;
        color: #2b2929;
    }

    .notice_update .update .update_form textarea {
        width: 600px;
        border-radius: 5px;
        border: solid 1px #dadada;
        background-color: #f5f6f7;
        font-size: 15px;
        padding: 10px 14px;
        color: #2b2929;
        resize: none;
    }

    .notice_update .update .update_form .submit a {
        margin-left: 40px;
    }

    /* notice_update end */
</style>

<body>
	<%@include file="/WEB-INF/view/include/admin_menu.jsp"%>
    <!-- notice_update start -->
    <div class="notice_update container">
        <div class="title">
            <h1>공지사항 수정</h1>
            <hr>
        </div>
        <div class="update">
            <form class="update_form" action="/admin/notice/noticeupdate" method="post">
                <div class="form-group row">
                    <label class="col-sm-2 input-name">제목</label>
                    <input class="form-input" name="notice_title" type="text" required value="${notice.notice_title }">
                    <input type="hidden" name="notice_code" value="${notice.notice_code }">
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 input-name">내용</label>
                    <textarea name="notice_content" cols="50" rows="8"  required>${notice.notice_content }</textarea>
                </div>
                <hr>
                <div class="submit" align="end">
                    <button class="btn btn-primary" type="submit">수정</button>
                    <a href="/admin/notice/noticedelete?noticecode=${notice.notice_code}" class="btn btn-primary" onclick="return confirm('게시물을 삭제 하시겠습니까?');">삭제</a>
                    <a href="/admin/notice?page=${cri.page}" class="btn btn-primary">되돌아가기</a>
                </div>
            </form>
        </div>
    </div>


    <!-- notice_add end -->
</body>
</html>