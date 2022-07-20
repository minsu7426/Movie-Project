<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<style>
	.modal > div > h2{
		text-align: center;
	}
	
	.modal > form > div > label{
		margin-right: 20px
	}
	
	.modal > form {
		margin: 40px 20px;

	}
	
	.modal > form > div > input{
		margin-bottom: 20px;
		width: 400px;
        height: 20px;
        border-radius: 5px;
        border: solid 1px #dadada;
        background-color: #f5f6f7;
        font-size: 15px;
        padding: 10px 14px;
        color: #2b2929;
	}
	
	.modal > form > input{
		
		
	}
	.modal > form > div > .date{
		width: 173px;
	}
</style>
<body>
	<div class="modal" id="modal">
		<div>
			<h2>쿠폰등록</h2>
		</div>
		<form action="/admin/coupon/couponpostadd" method="post">
            <label class="col-sm-3 input-name">쿠폰이름</label>
			<div class="form-group row">
                <input class="col-sm-3 form-input" name="coupon_form" type="text" required="required">
            </div>
            <label class="col-sm-3 input-name">받을 ID</label>
			<div class="form-group row">
                <input class="form-input" name="coupon_id" type="text">
            </div>
            <label class="col-sm-3 input-name">유효기간</label>
			<div class="form-group row">
                <input class="form-input date" name="coupon_give" type="date" required="required"> ~ <input class="form-input date" name="coupon_end" type="date" required="required">
            </div>
            <input type="submit" value="등록하기">
		</form>
	</div>
</body>
</html>