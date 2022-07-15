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
.shown_screen_title>h1 {
	margin-left: 20px;
}

.shown_screen>.shown_screen_items>.shown_item {
	float: left;
	margin: 0 22px 30px;
}

.shown_screen>.current_screen_items>.current_item {
	float: left;
	margin: 0 22px 30px;
}

.shown_screen>.shown_screen_items, .shown_screen>.current_screen_items {
	display: none;
}

.shown_screen>#current:checked ~ .current_screen_items {
	display: block;
}

.shown_screen>#current:checked ~ nav>label:first-child, .shown_screen>#shown:checked 
	~ nav>label:nth-child(2) {
	text-decoration: underline;
}

.shown_screen>#shown:checked ~ .shown_screen_items {
	display: block;
}

.shown_screen>input {
	display: none;
}

.shown_screen>nav {
	margin: 0 0 20px 20px;
}

.shown_screen>nav>label {
	font-size: 20px;
	margin-right: 20px;
	cursor: pointer;
}
</style>
<body>
	<div class="shown_screen container">
		<div class="shown_screen_title">
			<h1>영화</h1>
			<hr>
		</div>

		<input type="radio" name="check" id="current"> <input
			type="radio" name="check" id="shown" checked>

		<nav class="shown_screen_nav">
			<label for="current">현재 상영작</label> <label for="shown">상영 예정작</label>
		</nav>
		<div class="current_screen_items">
			<div class="current_item">
				<a href=""> <img src="/resources/images/thor.jpg" alt=""
					width="240px" height="340px">
				</a>
			</div>
			<div class="current_item">
				<a href=""> <img src="/resources/images/thor.jpg" alt=""
					width="240px" height="340px">
				</a>
			</div>
			<div class="current_item">
				<a href=""> <img src="/resources/images/thor.jpg" alt=""
					width="240px" height="340px">
				</a>
			</div>
			<div class="current_item">
				<a href=""> <img src="/resources/images/thor.jpg" alt=""
					width="240px" height="340px">
				</a>
			</div>
			<div class="current_item">
				<a href=""> <img src="/resources/images/thor.jpg" alt=""
					width="240px" height="340px">
				</a>
			</div>
			<div class="current_item">
				<a href=""> <img src="/resources/images/thor.jpg" alt=""
					width="240px" height="340px">
				</a>
			</div>
			<div class="current_item">
				<a href=""> <img src="/resources/images/thor.jpg" alt=""
					width="240px" height="340px">
				</a>
			</div>
			<div class="current_item">
				<a href=""> <img src="/resources/images/thor.jpg" alt=""
					width="240px" height="340px">
				</a>
			</div>
			<div class="current_item">
				<a href=""> <img src="/resources/images/thor.jpg" alt=""
					width="240px" height="340px">
				</a>
			</div>
			<div class="current_item">
				<a href=""> <img src="/resources/images/thor.jpg" alt=""
					width="240px" height="340px">
				</a>
			</div>
			<div class="current_item">
				<a href=""> <img src="/resources/images/thor.jpg" alt=""
					width="240px" height="340px">
				</a>
			</div>
		</div>
		<div class="shown_screen_items">
			<div class="shown_item">
				<a href=""> <img src="/resources/images/gyulsim.jpg" alt=""
					width="240px" height="340px">
				</a>
			</div>
			<div class="shown_item">
				<a href=""> <img src="/resources/images/gyulsim.jpg" alt=""
					width="240px" height="340px">
				</a>
			</div>
			<div class="shown_item">
				<a href=""> <img src="/resources/images/gyulsim.jpg" alt=""
					width="240px" height="340px">
				</a>
			</div>
			<div class="shown_item">
				<a href=""> <img src="/resources/images/gyulsim.jpg" alt=""
					width="240px" height="340px">
				</a>
			</div>
			<div class="shown_item">
				<a href=""> <img src="/resources/images/gyulsim.jpg" alt=""
					width="240px" height="340px">
				</a>
			</div>
			<div class="shown_item">
				<a href=""> <img src="/resources/images/gyulsim.jpg" alt=""
					width="240px" height="340px">
				</a>
			</div>
			<div class="shown_item">
				<a href=""> <img src="/resources/images/gyulsim.jpg" alt=""
					width="240px" height="340px">
				</a>
			</div>
			<div class="shown_item">
				<a href=""> <img src="/resources/images/gyulsim.jpg" alt=""
					width="240px" height="340px">
				</a>
			</div>
			<div class="shown_item">
				<a href=""> <img src="/resources/images/gyulsim.jpg" alt=""
					width="240px" height="340px">
				</a>
			</div>
			<div class="shown_item">
				<a href=""> <img src="/resources/images/gyulsim.jpg" alt=""
					width="240px" height="340px">
				</a>
			</div>
		</div>
</body>
</html>