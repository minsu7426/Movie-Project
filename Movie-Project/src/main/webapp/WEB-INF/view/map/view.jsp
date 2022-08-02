<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
.map .map_content {
	display: flex;
}

.a {
	position: relative;
	z-index: 100;
}

.map .map_content .map {
	width: 600px;
	height: 500px;
	z-index: 0;
}

.map .map_content .map:hover {
	box-shadow: 1px 3px 4px 0px;
	transform: scale(1.02);
	transition: all 0.3s;
}

.map .map_content .map_text {
	margin-left: 50px;
}

.map .map_content .area .title_area {
	margin-bottom: 10px;
}

.map .map_content .area .title_area>span {
	margin-left: 16px;
	font-size: 20px;
}

.map .map_content .area .car ul>li>span {
	display: inline-block;
	font-weight: bold;
	font-size: 18px;
	width: 80px;
}

.map .map_content .area .bus ul>li:nth-child(2), .map .map_content .area .bus ul>li:nth-child(3)
	{
	margin-bottom: 30px;
}

.map .map_content .area .bus .content_title {
	display: inline-block;
	font-weight: bold;
	font-size: 20px;
	width: 200px;
	margin-bottom: 5px;
}

.map .map_content .area .bus ul li ul li span {
	display: inline-block;
	font-size: 18px;
	width: 200px;
}
</style>
<body>
	<div class="a">
		<jsp:include page="/WEB-INF/view/include/menu.jsp" />
	</div>
	<script type="text/javascript"
		src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=n7yw3r4itk&callback=initMap"></script>
	<script type="text/javascript">
		var map = null;
		function initMap() {
			map = new naver.maps.Map('map', {
				center : new naver.maps.LatLng(${x},${y}),zoom : 18
			});
			var marker = new naver.maps.Marker({
				position : new naver.maps.LatLng(${x},${y}),map : map
			});
		}
	</script>
	<div class="map container">
		<div class="title">
			<h1>찾아오는 길</h1>
			<hr>
		</div>
		<div class="map_content">
			<div class="map" id="map"></div>
			<div class="map_text">

				<div class="area">

					<div class="title_area">
						<img alt="car"
							src="https://seoul.chamc.co.kr/asset/images/intro/bg_car.png"><span>자가용</span>
					</div>
					<div class="content_area car">
						<ul>
							<li><span>도로명</span>경상남도 창원시 마산회원구 양덕북12길 113 경민인터빌 407호</li>
							<li><span>지번</span>경상남도 창원시 마산회원구 양덕동 15-27 경민인터빌 407호</li>
						</ul>
					</div>
					<div class="title_area">
						<img alt="bus"
							src="https://seoul.chamc.co.kr/asset/images/intro/bg_bus.png"><span>버스</span>
					</div>
					<div class="content_area bus">
						<ul>
							<li><span class="content_title">창원역</span>
								<ul>
									<li><span>양덕 주민센터</span> 71, 80</li>
									<li><span>한일 타운</span> 42, 109, 703</li>
								</ul></li>
							<li><span class="content_title">마산 터미널</span>
								<ul>
									<li><span>양덕 주민센터</span> 102, 109, 108, 162</li>
									<li><span>한일 타운</span> 23, 102, 21, 65, 45, 20, 44, 42,
										63, 41, 40</li>
								</ul></li>
							<li><span class="content_title">창원 터미널</span>
								<ul>
									<li><span>양덕 주민센터</span> 106, 801</li>
									<li><span>한일 타운</span> 108</li>
								</ul></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/view/include/footer.jsp" />
</body>
</html>