<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<style>
.navbar.navbar-inverse {
	padding: 10px;
	padding-left: 200px;
	padding-right: 200px;
	background: white;
	border: none;
	
}

.nav.navbar-nav {
	margin-top: 60px;
	margin-left: 40px;
	font-family: 'Nanum Gothic', sans-serif;
	font-weight: 700;
	display: block;
	font-size: 20px;
	
}
.nav.navbar-nav.navbar-right{
font-size: 16px;}

ul.nav.navbar-nav li a{
	color:black;
}

ul.nav.navbar-nav li a:hover {
	color: #000000;
}

.hidden {
	display: none;
}

.navbar.navbar-inverse.navbar-fixed {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	z-index: 1;
}


</style>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- 폰트:나눔고딕 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">

</head>

<body>
	<nav class="navbar navbar-inverse navbar-fixed" >
	
		<div class="container-fluid">
			<div class="navbar-header">
				<a href="${contextPath}/main/main.do"><img src="${contextPath}/resources/images/logo/logo.png" width="100px"></a>
			</div>
			<ul class="nav navbar-nav" style="color:black;">
				<li><a href="${contextPath}/goods/shop.do">쇼핑하기</a></li>
				<li><a href="${contextPath}/main/delivery.do">배송안내</a></li>
				<li><a href="${contextPath}/notice/list.do">공지사항</a></li>
				<li><a href="${contextPath}/serv/list.do">고객센터</a></li>
			</ul>
		<ul class="nav navbar-nav navbar-right">
		    <li class="logged-out"><a href="${contextPath}/member/memberForm.do"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
		    <li class="logged-out"><a href="${contextPath}/member/loginForm.do" id="loginBtn"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
		    <li class="user-logged-in hidden"><a href="${contextPath}/member/logout.do" id="logoutBtn"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
		    <li class="user-logged-in hidden"><a href="${contextPath}/mypage/modifyMemForm.do"><span class="glyphicon glyphicon-user"></span> 마이페이지</a></li>
		    <li class="user-logged-in hidden"><a href="${contextPath}/cart/myCartList.do"><span class="glyphicon glyphicon-shopping-cart"></span> 장바구니</a></li>
		    <li class="admin-logged-in hidden"><a href="${contextPath}/member/logout.do" id="logoutBtn"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
		    <li class="admin-logged-in hidden"><a href="${contextPath}/admin/goods/adminGoodsMain.do"><span class="glyphicon glyphicon-user"></span> 관리자 페이지</a></li>
		</ul>
	</div>
</nav>

<!-- 헤더 스크립트 -->
	<script>
	$(document).ready(function() {
	    var isLogOn = false;
	    var isAdmin = false;
	    
	    function toggleForm() {
	        if (isAdmin) {
	            $('.admin-logged-in').removeClass('hidden');
	            $('.user-logged-in, .logged-out').addClass('hidden');
	        } else if (isLogOn) {
	            $('.user-logged-in').removeClass('hidden');
	            $('.admin-logged-in, .logged-out').addClass('hidden');
	        } else {
	            $('.logged-out').removeClass('hidden');
	            $('.user-logged-in, .admin-logged-in').addClass('hidden');
	        }
	    }
	
	    // 로그인 상태 변경 시 폼 변경
	    toggleForm();
	
	    var isLogonValue = '<c:out value="${sessionScope.isLogon}" />';
	    if (isLogonValue === 'true') {
	        isLogOn = true;
	    }
	    toggleForm();
	    
	    var isAdminValue = '<c:out value="${sessionScope.isAdmin}" />';
	    if (isAdminValue === 'true') {
	        isAdmin = true;
	    }
	    toggleForm();
	
	    $('#loginBtn').click(function() {
	        isLogOn = true;
	        isAdmin = true;
	        toggleForm();
	    });
	
	    $('#logoutBtn').click(function() {
	        isLogOn = false;
	        isAdmin = false;
	        toggleForm();
	    });
	});
	</script>
</body>
</html>
