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
		
		<div class="form-group" style="margin-top: 20px;">
			<button type="button" id="showDummyDataButton">더미 데이터 표시</button>
		</div>

		<div class="form">
			<form id="memberForm" class="member-form"
				action="${contextPath}/member/memberForm.do" method="post">
				<div class="form-group" style="margin-bottom: 0px;">
					<!-- ... (아이디 입력 폼과 중복 체크 버튼) ... -->
				</div>
				<font id="checkId" size="2" style="margin-right: 100px;"></font>
				<div class="form-group">
					<!-- ... (생년월일 입력 폼) ... -->
				</div>
				<div class="form-group">
					<!-- ... (연락처 입력 폼) ... -->
				</div>
			</form>
		</div>
		<!-- 더미 데이터를 출력할 요소입니다. 클릭 이벤트로 표시/숨김 처리됩니다. -->
		<div class="dummy-data"
			style="display: none; background-color: #f2f2f2; padding: 10px;">
			<p>이름: John Doe</p>
			<p>이메일: johndoe@example.com</p>
			<p>성별: 남성</p>
			<p>주소: 서울시 강남구</p>
		</div>
	</div>

	<script>
		document
				.getElementById("showDummyDataButton")
				.addEventListener(
						"click",
						function() {
							var dummyDataElement = document
									.querySelector(".dummy-data");
							dummyDataElement.style.display = dummyDataElement.style.display === "none" ? "block"
									: "none";
						});
	</script>
</body>
</html>