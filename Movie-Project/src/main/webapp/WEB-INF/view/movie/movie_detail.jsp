<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://kit.fontawesome.com/d777ad58b4.js" crossorigin="anonymous"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
    /* menu start */
    * {
        margin: 0;
        padding: 0;
        text-decoration: none;
        list-style: none;
        box-sizing: border-box;
    }

    .movie_detail>.movie_detail_title>h1 {
        margin-left: 20px;
    }

    .movie_detail>.movie_detail_inner>.movie_content {
        display: flex;
        padding-bottom: 30px;
    }

    .movie_detail>.movie_detail_inner>.movie_content>div>h1 {
        display: inline-block;
        margin: 0;
    }

    .movie_detail>.movie_detail_inner>.movie_content>.movie_poster>div {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 10px;
    }

    .movie_detail>.movie_detail_inner>.movie_content>div>div>input {
        display: none;
    }

    .movie_detail>.movie_detail_inner>.movie_content>div>div>input:checked~label>i {
        color: red;
    }

    .movie_detail>.movie_detail_inner>.movie_content>div>div>label {
        margin: 0;
    }

    .movie_detail>.movie_detail_inner>.movie_content>div>div>label>i {
        font-size: 28px;
        color: gray;
        transition: all 0.3s;
        cursor: pointer;
    }

    .movie_detail>.movie_detail_inner>.movie_content>div>div>label>i:hover {
        transform: scale(1.2);
    }

    .movie_detail>.movie_detail_inner>.movie_content>.movie_detail_content>.movie_subject {
        display: flex;
        align-items: center;
        margin-left: 30px;
    }

    .movie_detail>.movie_detail_inner>.movie_content>.movie_detail_content>.movie_subject>h1 {
        margin: 0;
        margin-left: 15px;
        font-weight: 700;
    }

    .movie_detail>.movie_detail_inner>.movie_content>.movie_detail_content>.movie_desc>table {
        margin: 30px 0 0 30px;
    }


    .movie_detail>.movie_detail_inner>.movie_content>.movie_detail_content>.movie_desc>table th {
        width: 100px;
        text-align: left;
        vertical-align: top;
        font-size: 18px;
        padding-bottom: 10px;
        color: gray;
    }

    .movie_detail>.movie_detail_inner>.movie_content>.movie_detail_content>.movie_desc>table td {
        text-align: left;
        vertical-align: top;
        font-size: 18px;
        padding-bottom: 10px;
    }

    .movie_detail>.movie_detail_inner>.movie_review {
        padding-top: 30px;
    }

    .movie_detail>.movie_detail_inner>.movie_review>form {
        display: flex;
        flex-direction: column;
        width: 100%;
    }

    .movie_detail>.movie_detail_inner>.movie_review> form > div > .review {
        width: 100%;
        height: 100px;
        padding: 20px;
        margin-right: 20px;
        border-radius: 20px;
        border: 2px solid rgb(212, 210, 210);
    }

    .movie_detail>.movie_detail_inner>.movie_review > form > .review_content{
        display: flex;
    }

    .movie_detail>.movie_detail_inner>.movie_review>.review_detail {
        margin: 20px 0;
    }

    .movie_detail>.movie_detail_inner>.movie_review>.review_detail>div {
        position: relative;
    }

    .movie_detail>.movie_detail_inner>.movie_review>.review_detail>div>a {
        position: absolute;
        right: 0;
        bottom: 0;
    }

    .movie_detail>.movie_detail_inner>.movie_review>.review_detail>div>.review_date {
        font-size: 12px;
        color: gray;
    }

    .movie_detail>.movie_detail_inner>.movie_review>.review_detail>div>.review_id {
        font-size: 16px;
        font-weight: 700;
    }

    .movie_detail>.movie_detail_inner>.movie_review>.review_detail>div>p:nth-child(3) {
        padding: 20px 0 30px;
        width: 80%;
    }

    #myform fieldset {
        display: inline-block;
        direction: rtl;
        border: 0;
    }

    #myform fieldset legend {
        text-align: right;
    }

    #myform input[type=radio] {
        display: none;
    }

    #myform label {
        font-size: 3em;
        color: transparent;
        text-shadow: 0 0 0 #f0f0f0;
    }

    #myform label:hover {
        text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
    }

    #myform label:hover~label {
        text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
    }

    #myform input[type=radio]:checked~label {
        text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
    }

    #reviewContents {
        width: 100%;
        height: 150px;
        padding: 10px;
        box-sizing: border-box;
        border: solid 1.5px #D3D3D3;
        border-radius: 5px;
        font-size: 16px;
        resize: none;
    }
</style>
<body>
    
    <%@include file="/WEB-INF/view/include/menu.jsp"%>
    <!--  -->
    <div class="movie_detail container">
        <div class="movie_detail_title">
            <h1>영화 정보</h1>
            <hr>
        </div>
        <div class="movie_detail_inner">
            <div class="movie_content">
                <div class="movie_poster">
                    <img src="/resources/images/movie/${movieDto.movie_img}" alt="영화이미지" width="280px">
                    <div>
                        <a href="/ticketing/secondreserve" class="btn btn-primary">예매하기 >></a>
                        <span style="font-size:22px; color:rgba(250, 208, 0, 0.99);">★ <span style="color: black;"><fmt:formatNumber value="${review_star }" pattern="#.#"/> / 5.0</span></span>
                        <input type="checkbox" id="heart">
                        <label for="heart"><i class="fa-solid fa-heart"></i></label>
                    </div>
                </div>
                <div class="movie_detail_content">
                    <div class="movie_subject">
                    <c:choose>
                    	<c:when test="${movieDto.movie_grade ==  0}">
	                        <img src="/resources/images/mall.png" alt="" width="30px" height="30px">
                    	</c:when>
                    	<c:when test="${movieDto.movie_grade == 12}">
	                        <img src="/resources/images/m12.png" alt="" width="30px" height="30px">                    	
                    	</c:when>
                    	<c:when test="${movieDto.movie_grade == 15}">
                        	<img src="/resources/images/m15.png" alt="" width="30px" height="30px">                    	
                    	</c:when>
                    	<c:otherwise>
                        	<img src="/resources/images/m19.png" alt="" width="30px" height="30px">                    	
                    	</c:otherwise>
                    </c:choose>
                        <h1>${movieDto.movie_title}</h1>
                    </div>
                    <div class="movie_desc">
                        <table>
                            <tr>
                                <th>개봉 </th>
                                <td>${movieDto.movie_date }</td>
                            </tr>
                            <tr>
                                <th>장르 </th>
                                <td>${movieDto.movie_genre }</td>
                            </tr>
                            <tr>
                                <th>감독 </th>
                                <td>${movieDto.movie_director }</td>
                            </tr>
                            <tr>
                                <th>출연 </th>
                                <td>${movieDto.movie_actor }</td>
                            </tr>
                            <tr>
                                <th>러닝타임 </th>
                                <td>${movieDto.movie_time }분</td>
                            </tr>
                            <tr>
                                <th>소개 </th>
                                <td>${movieDto.movie_board }</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <hr>
            <div class="movie_review">
                <h3>리뷰 ${fn:length(reviewList)}</h3>
                <c:if test="${!empty user}">
                <form method="post" action="/review/reviewsubmit">
                    <div class="mb-3" name="myform" id="myform" >
                        <fieldset>
                            <span class="text-bold">별점을 선택해주세요</span>
                            <input type="radio" name="review_star" value="5" id="rate1"><label
                                for="rate1">★</label>
                            <input type="radio" name="review_star" value="4" id="rate2"><label
                                for="rate2">★</label>
                            <input type="radio" name="review_star" value="3" id="rate3"><label
                                for="rate3">★</label>
                            <input type="radio" name="review_star" value="2" id="rate4"><label
                                for="rate4">★</label>
                            <input type="radio" name="review_star" value="1" id="rate5"><label
                                for="rate5">★</label>
                            <input type="hidden" name="review_id" value="${user[0]}">
                            <input type="hidden" name="review_movie" value="${movieDto.movie_code}">
                        </fieldset>
                    </div>   
                    <div class="review_content">
                        <input type="textarea" name="review_content" class="review" placeholder="리뷰를 입력해 주세요.">
                        <input type="submit" class="btn btn-success" value="추가">
                    </div>
                </form>
                </c:if>
                <div class="review_detail">
                    <c:forEach var="review" items="${reviewList}">                    
                    <hr>
                    <div>
                        <span class="review_date">${review.review_date }</span>
                        <p class="review_id">${review.review_id}님 <span style="color: rgba(250, 208, 0, 0.99);">★</span> : ${review.review_star } / 5.0</p>
                        <p>${review.review_content }</p>
                        <c:if test="${review.review_id eq user[0]}">
                        <a href="/review/reviewdelete?reviewcode=${review.review_code}&moviecode=${movieDto.movie_code}" class="btn btn-danger" onclick="return confirm('리뷰를 삭제 하시겠습니까?');">
                        삭제
                        </a>
                        </c:if>
                    </div>
                    </c:forEach>
                </div>
          
            </div>
        </div>
    </div>
</body>

</html>