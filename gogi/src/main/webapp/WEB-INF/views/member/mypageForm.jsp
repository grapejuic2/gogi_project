<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

<link href="${contextPath}/resources/css/mypageForm.css"
	rel="stylesheet" type="text/css">

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>마이 페이지</title>
</head>
<body>
	<div class="memberForm-page">
		<div class="memberForm-text" style="margin-bottom: 35px;">
			<h2>마이 페이지</h2>	
			<!-- 로그인 되어 있는 회원의 기본 정보 출력 -->
			
		</div>
		<div class="form" style=>
			<form id="memberForm" class="member-form"
				action="${contextPath}/member/memberForm.do" method="post">
				<h2 style="margin-bottom: 20px; margin-top: 0px;">가입정보 기입</h2>

				<div class="form-group" style="margin-bottom: 0px;">
					<div class="label-group">
						<label for="mem_id">아이디</label>
					</div>
					<input type="text" placeholder="아이디" id="mem_id" name="mem_id" />

					<button type="button" id="checkIdButton">중복 체크</button>
				</div>

				<font id="checkId" size="2" style="margin-right: 100px;"></font>

				<div class="form-group">
					<div class="label-group">
						<label for="mem_birth">생년월일</label>
					</div>
					<div class="input-group">
						<input type="text" id="mem_birth_y" name="mem_birth_y"
							placeholder="년" maxlength="4"> <input type="text"
							id="mem_birth_m" name="mem_birth_m" placeholder="월" maxlength="2">
						<input type="text" id="mem_birth_d" name="mem_birth_d"
							placeholder="일" maxlength="2">
					</div>
				</div>

				<div class="form-group">
					<div class="label-group">
						<label for="mem_tel">연락처</label>
					</div>
					<div class="input-group">
						<input type="text" id="mem_tel1" name="mem_tel1" placeholder="통신사"
							maxlength="3"> <input type="text" id="mem_tel2"
							name="mem_tel2" placeholder="중간 번호" maxlength="4"> <input
							type="text" id="mem_tel3" name="mem_tel3" placeholder="마지막 번호"
							maxlength="4">
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
