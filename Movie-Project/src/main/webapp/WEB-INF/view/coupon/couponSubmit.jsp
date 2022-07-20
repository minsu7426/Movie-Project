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
		display: flex;
	}
	
	.modal > form > div > input{
		width: 200px
	}
	
	.modal > form > input{
		margin-left: 20px;
	}
</style>
<body>
	<div class="modal" id="modal">
		<div>
			<h2>쿠폰등록</h2>
		</div>
		<form action="/coupon/couponpostsub" method="post">
			<div class="form-group row">
                <label class="col-sm-2 input-name">쿠폰코드</label>
                <input class="form-input" name="coupon_code" type="text">
                <input name="coupon_id" value="${user[0]}" type="hidden">
            </div>
            <input type="submit" value="등록하기" onclick="">
		</form>
	</div>
	<script type="text/javascript">

	</script>
</body>
</html>