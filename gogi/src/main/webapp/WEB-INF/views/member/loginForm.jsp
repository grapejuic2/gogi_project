<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<c:if test='${not empty message }'>
<script>
window.onload=function()
{
  result();
}

function result(){
   alert("아이디나  비밀번호가 틀립니다. 다시 로그인해주세요");
   window.location.href = "${contextPath}/member/loginForm.do";
}
</script>
</c:if>

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
	margin-top: 70px;
	margin-left: 40px;
}

ul.nav.navbar-nav li a:hover {
	color: #000000;
}

@import url(https://fonts.googleapis.com/css?family=Roboto:300);
</style>

<link href="${contextPath}/resources/css/login.css" rel="stylesheet"
	type="text/css">

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>로그인</title>
</head>
<body>
	<div class="login-page">
		<div class="login-text">
			<a href="${contextPath}/main/main.do"><img
				src="${contextPath}/resources/images/logo/logo2.png" alt="logo2" width="150px"></a>
		</div>
		<div class="form">
			<form id="loginForm" class="login-form" action="${contextPath}/member/loginForm.do" method="post">
				<input type="text" placeholder="아이디" id="mem_id" name="mem_id" /> 
				<input type="password" placeholder="비밀번호" id="mem_pw" name="mem_pw" />
				<button type="submit">로그인</button>
				
				<p class="message">
					<a href="${contextPath}/member/memberForm.do">회원가입</a>
				</p>
				
				<div class="login-icon">
					<a href="#"><img
						src="${contextPath}/resources/images/login/kakao-icon.png" alt="kakao-icon"></a> 
						<a href="#"><img src="${contextPath}/resources/images/login//naver-icon.png" alt="naver-icon"></a>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
