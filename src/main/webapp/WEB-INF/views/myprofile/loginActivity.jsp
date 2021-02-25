<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 활동</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	min-width: 630px;
	background-color: #fafafa;
	min-height: 1200px;
}

a {
	color: black;
	text-decoration: none;
}

.material-icons {
	position: absolute;
	left: 37%;
	top: 15%;
	font-size: 15px;
	color: gainsboro;
}


hr {
	background-color: LightGray;
}

main {
	height: 100%;
	margin: 106px 15% 40px;
	background-color: white;
	border: 1px solid gainsboro;
	display: grid;
	grid-template-columns: 1fr 3fr;
}

main>div {
	border: 1px solid gainsboro;
}

.main1>div {
	text-align: center;
	font-size: 17px;
	border-left: white solid 2px;
}

.main1>div>a {
	width: 100%;
	padding: 20px 20px 20px 18px;
	display: inline-block;
}

.main1>div:hover {
	border-left-color: gainsboro;
}

footer {
	display: grid;
	grid-template-columns: repeat(12, 1fr);
	font-size: 12px;
	text-align: center;
	height: 100px;
	margin: 0 15%;
}

input:focus {
	outline: none;
}

input[type=text]:focus {
	text-align: start;
}

.copyright {
	color: gainsboro;
}

.menu3 {
	border-left-color: black !important;
}

.profile {
	grid-column: 1/2 span;
	padding: 10px;
}

.profile p:nth-child(1) {
	font-size: 20px;
}

.profile p:nth-child(2) {
	color: #3897f0;
	font-size: 13px;
}

.liner:nth-child(1n) {
	display: inline-block;
}

.profile div {
	display: inline-block;
	height: 40px;
}

.a_check {
	height: 100%;
}

.table {
	display: inline-block;
}

.login_form {
	margin-top: 16px;
	margin-right: 64px;
	margin-left: 64px;
	margin-bottom: 16px;
}

.login_form2 {
	margin-top: 16px;
	margin-right: 64px;
	margin-left: 64px;
	margin-bottom: 16px;
}

</style>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
</head>
<body>
	<main>
	<div class="main1">
		<div class="menu1">
			<a href="/spring/myprofile/update">프로필 편집</a>
		</div>
		<div class="menu2">
			<a href="/spring/myprofile/updatepw">비밀번호 변경</a>
		</div>
		<div class="menu3">
			<a href="/spring/myprofile/loginActivity">로그인 활동</a>
		</div>
	</div>
	<div class="main2">
	<form action="<c:url value='/myprofile/loginActivity' />" method="POST">
		<div class="login_form">
			<h2 class="">로그인 활동</h2>
		</div>
		<div class="login_form2">
			<h4 id="login_place">로그인한 위치</h4>
			<br>
			<div id="map_canvas" style="width:500px;height:300px;"></div>
			<br>
				<div onclick="test()">
					<c:forEach items="${loginActivity }" var="login" >
						<br>
						<div><i class="fas fa-map-marker"></i></div>
				        ${login.location }
				        <fmt:formatDate value="${login.loginDate}" pattern="yyyy-MM-dd HH:mm:ss"/>   
				        ${login.ip } 
				        <br><br>
				        <hr>
			    	</c:forEach>
				</div>
			  
		</div>
	</form>
	</div>
	</main>
	<footer>
		<div>
			<a href="#">INSTARGRAM 정보</a>
		</div>
		<div>
			<a href="#">지원</a>
		</div>
		<div>
			<a href="#">홍보 센터</a>
		</div>
		<div>
			<a href="#">API</a>
		</div>
		<div>
			<a href="#">채용 정보</a>
		</div>

		<div>
			<a href="#">개인정보처리방침</a>
		</div>
		<div>
			<a href="#">약관</a>
		</div>
		<div>
			<a href="#">디렉터리</a>
		</div>
		<div>
			<a href="#">프로필</a>
		</div>
		<div>
			<a href="#">해시태그</a>
		</div>

		<div>
			<a href="#">언어</a>
		</div>
		<div>
			<p class="copyright">©️2021 INSTARGRAM</p>
		</div>
	</footer>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyC4rw11RhDxupVZthhGLLJnBLsOgHGyKhk"></script>
<script type="text/javascript">
	window.onload = function() {
		if(!navigator.geolocation) {
			document.getElementById('login_place').innerHTML = '위치 정보 지원 안됨';
			return;
		}
		navigator.geolocation.getCurrentPosition(function(position) {
			var lat = position.coords.latitude;
			var lon = position.coords.longitude;
			
			//마장동주소
			//var lat = 37.567986415251;
			//var lon = 127.03721964556;
			
			console.log('위도 : ' + lat);
			console.log('경도 : ' + lon);
			
			var initLoc = new google.maps.LatLng(lat,lon);
			console.log(initLoc);
			
			
			var map = new google.maps.Map(document.getElementById('map_canvas'),{
				zoom:8,
	            mapTypeId : google.maps.MapTypeId.ROADMAP
			});
	         map.setCenter(initLoc);
	         var marker = new google.maps.Marker({position:initLoc,map:map,title:'현재위치'})
		});
	};
	
	
	
	function test() {
		if(!navigator.geolocation) {
			document.getElementById('login_place').innerHTML = '위치 정보 지원 안됨';
			return;
		}
		navigator.geolocation.getCurrentPosition(function(position) {
			//var lat = position.coords.latitude;
			//var lon = position.coords.longitude;
			
			// 실험
			var lat = 37.559667;
			var lon = 126.997199;
			
			console.log('위도 : ' + lat);
			console.log('경도 : ' + lon);
			
			var initLoc = new google.maps.LatLng(lat,lon);
			
			var map = new google.maps.Map(document.getElementById('map_canvas'),{
				zoom:8,
	            mapTypeId : google.maps.MapTypeId.ROADMAP
			});
	         map.setCenter(initLoc);
	         var marker = new google.maps.Marker({position:initLoc,map:map,title:'현재위치'})
		});
	};
</script>
</body>
</html>