<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/d777ad58b4.js" crossorigin="anonymous"></script>
</head>
<style>
    footer {
    	position: fixed;
    	bottom: 0;
        background-color: #292c2f;
        width: 100%;
    }

    .footer-distributed {
        background-color: #292c2f;
        box-shadow: 0 1px 1px 0 rgba(0, 0, 0, 0.12);
        box-sizing: border-box;
        text-align: left;
        font: normal 16px sans-serif;
        padding: 30px 50px;
    }

    .footer-distributed .footer-left p {
        color: #8f9296;
        font-size: 14px;
        margin: 0;
    }

    /* Footer links */

    .footer-distributed p.footer-links {
        font-size: 18px;
        font-weight: bold;
        color: #ffffff;
        margin: 0 0 10px;
        padding: 0;
        transition: ease .25s;
    }

    .footer-distributed p.footer-links a {
        display: inline-block;
        line-height: 1.8;
        text-decoration: none;
        color: inherit;
        transition: ease .25s;
    }

    .footer-distributed .footer-links a:before {
        content: "·";
        font-size: 20px;
        left: 0;
        color: #fff;
        display: inline-block;
        padding-right: 5px;
    }

    .footer-distributed .footer-links .link-1:before {
        content: none;
    }

    .footer-distributed .footer-right {
        float: right;
        margin-top: 6px;
        text-align: right;
        max-width: 500px;
    }

    .footer-distributed .footer-right p {
        margin-top: 10px;
        color: #8f9296;
        font-size: 14px;
    }

    .footer-distributed .footer-right a {
        display: inline-block;
        width: 35px;
        height: 35px;
        background-color: #33383b;
        border-radius: 2px;
        font-size: 20px;
        color: #ffffff;
        text-align: center;
        line-height: 35px;
        margin-left: 3px;
        transition: all .25s;
    }

    .footer-distributed .footer-right a:hover {
        transform: scale(1.1);
        -webkit-transform: scale(1.1);
    }

    .footer-distributed p.footer-links a:hover {
        text-decoration: underline;
    }
</style>

<body>
    <footer class="footer-distributed">
        <div class="container">
            <div class="footer-right">
                <a href="#"><i class="fa fa-facebook"></i></a>
                <a href="#"><i class="fa fa-instagram"></i></a>
                <a><i class="fa fa-github"></i></a>
                <p>Movie-Project &copy; All Rights Reserved 2022</p>
            </div>
            <div class="footer-left">
                <p class="footer-links">
                    <a class="link-1" href="/home">홈</a>
                    <a href="/ticketing/reserve">예매</a>
                    <a href="/movie/current_screen">영화</a>
                    <a href="/ask">고객센터</a>
                </p>
                <p>경상남도 창원시 마산회원구 양덕북12길 113 (양덕동, 경민 인터빌) 4층</p>
                <p>055-000-000</p>
                <p>대표이사 김민수, 박승현</p>
               
            </div>
        </div>
    </footer>
</body>