<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>		
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
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

<link href="${contextPath}/resources/css/member/login.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.2/css/bootstrap.min.css" integrity="sha512-/Dmo1NVtQ05uS0vOI5qEZZn7mWaswFJzDa4RRRF29phxNQqkUkRk5xpyRUpekzoiO7CbdWXFbMHaapzVnNP2ZQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

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
			<form id="loginform" class="login-form" action="${contextPath}/member/loginForm.do" method="post">
				<input type="text" placeholder="아이디" id="mem_id" name="mem_id" /> 
				<input type="password" placeholder="비밀번호" id="mem_pw" name="mem_pw" />
				<button type="submit">로그인</button>
				
				<p class="message">
					<a href="${contextPath}/member/memberForm.do">회원가입</a>
				</p>
				
				<div class="login-icon">
					<a href="${contextPath}/social/kakao_login.do"><img 
						src="${contextPath}/resources/images/login/kakao-icon.png" alt="kakao-icon"></a> 
						
				<!-- 카카오 스크립트 -->
				<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
				<script>
				Kakao.init('4fb1697c90371b19154002a41beb7e3d'); //발급받은 키 중 javascript키를 사용해준다.
				console.log(Kakao.isInitialized()); // sdk초기화여부판단
				//카카오로그인
				function kakaoLogin() {
				    Kakao.Auth.login({
				      success: function (response) {
				        Kakao.API.request({
				          url: '/v2/user/me',
				          success: function (response) {
				        	  console.log(response)
				          },
				          fail: function (error) {
				            console.log(error)
				          },
				        })
				      },
				      fail: function (error) {
				        console.log(error)
				      },
				    })
				  }
				</script>
					<%-- <a href="#"><img src="${contextPath}/resources/images/login//naver-icon.png" alt="naver-icon"></a> --%>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
