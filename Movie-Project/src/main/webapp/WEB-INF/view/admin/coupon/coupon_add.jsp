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
	
	.modal > form > div > select{
		margin-bottom: 20px;
		width: 430px;
        height: 42px;
        border-radius: 5px;
        border: solid 1px #dadada;
        background-color: #f5f6f7;
        font-size: 15px;
        padding: 10px 14px;
        color: #2b2929;
	}
	.modal > form > div > .date{
		width: 173px;
	}
</style>
<script type="text/javascript">
function selfCloseSubmit()
{
    var f= document.forms.popupForm;
    document.domain = "127.0.0.1"; //document.domain 값이 팝업과 부모창 동일해야 합니다.
    opener.name = "parentPage"; //유니크한 이름이어야 합니다.
    f.target = opener.name;
    f.submit();
    self.close();
}
출처: https://tnsgud.tistory.com/579 [Soon Gud Story:티스토리]
</script>
<body>
	<div class="modal" id="modal">
		<div>
			<h2>쿠폰등록</h2>
		</div>
		<form name="popupForm" action="/admin/coupon/couponpostadd" method="post">
            <label class="col-sm-3 input-name">쿠폰이름</label>
			<div class="form-group row">
                <input class="col-sm-3 form-input" name="coupon_form" type="text" required="required">
            </div>
            <label class="col-sm-3 input-name">받을 ID</label>
			<div class="form-group row">
				<select name="coupon_id">
					<option value="">---아이디를 선택하세요---</option>
				<c:forEach var="id" items="${idList }">
					<option value="${id}">${id}</option>
				</c:forEach>
				</select>
            </div>
            <label class="col-sm-3 input-name">유효기간</label>
			<div class="form-group row">
                <input class="form-input date" name="coupon_give" type="date" required="required"> ~ <input class="form-input date" name="coupon_end" type="date" required="required">
            </div>
            <input type="submit" value="등록하기" onclick="selfCloseSubmit()">
		</form>
	</div>
</body>
</html>