<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	margin-top: 70px;
	margin-left: 40px;
}

ul.nav.navbar-nav li a:hover {
	color: #000000;
}

.sub_title {
	-swiper-theme-color: #007aff;
	-swiper-navigation-size: 44px;
	font-family: Spoqa Han Sans, "Sans-serif";
	outline: 0;
	margin: 0;
	padding: 0;
	text-align: center;
	font-size: 32px;
}

.sub_text1 { -
	-swiper-theme-color: #007aff;
	-swiper-navigation-size: 44px;
	font-family: Spoqa Han Sans, "Sans-serif";
	outline: 0;
	margin: 0;
	padding: 0;
	margin-top: 25px;
	width: 328px;
	margin-left: auto;
	margin-right: auto;
	font-size: 18px;
	line-height: 28px;
	color: #212121;
}

.sub_text2 { -
	-swiper-theme-color: #007aff;
	-swiper-navigation-size: 44px;
	font-family: Spoqa Han Sans, "Sans-serif";
	outline: 0;
	margin: 0;
	padding: 0;
	margin-top: 8px;
	width: 328px;
	margin-left: auto;
	margin-right: auto;
	font-size: 13px;
	color: #9e9e9e;
	letter-spacing: -0.1px;
}

.list_view{
	width: 900px;
	margin-left: 300px;
	margin-right: auto;
	padding-top: 10px;
	border-top: 5px solid rgb(255, 215, 0);
}
.reason {
	margin-top: 10px;
	/* margin-left: 30px; */
	line-height: 2em;
}
.reason input[type=text]{
	width: 300px;
	height: 30px;
	padding: 10px;
}
.info {
	margin-top: 10px;
	margin-left: 30px;
	background: rgb(230,230,230);
}
.deleteInfo {
	margin-top: 10px;
	margin-left: 30px;
	font-size: 0.9em;
	padding: 20px 0px;
}
.reason input[type=button]:disabled{
	float: right;
	width:100px;  
   	height:40px;
   	background: rgb(230,230,230);
   	border: none;
   	border-radius: 5px;
   	font-family: 'TheJamsil';
   	color: #ccc;
   	font-size: 1.1em;
   	font-weight: bold;
   	text-align:center;
}
.reason input[type=button]{
	float: right;
	width:100px;  
   	height:40px;
   	background: rgb(230,230,230);
   	border: none;
   	border-radius: 5px;
   	font-family: 'TheJamsil';
   	color: #000;
   	font-size: 1.1em;
   	font-weight: bold;
   	text-align:center;
}

@import url(https://fonts.googleapis.com/css?family=Roboto:300);
</style>

<link href="${contextPath}/resources/css/login.css" rel="stylesheet"
	type="text/css">

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>회원탈퇴</title>

<script>
$(function(){
    $("input:radio[name=reason]").attr("checked", false);
    $(".non_etc").click(function(){
        $("#etc_view").css("display","none");
    });
    $("#etc").click(function(){
        $("#etc_view").css("display","block");
    });
});
</script>

</head>
<body>
	<div class="login-page">
		<div class="login-text">
			<a href="${contextPath}/main/main.do"><img
				src="${contextPath}/resources/images/logo/logo2.png" alt="logo2"
				width="150px"></a>
		</div>

		<div class="category" style="margin-left: 35px; margin-bottom: 25px;">
			<a href="${contextPath}/mypage/modifyMemForm.do"
				data-category="개인 정보 수정"
				style="margin-bottom: 20px; margin-right: 10px; margin-left: 10px;">개인정보
				수정</a> <a href="#" data-category="문의 내역"
				style="margin-bottom: 20px; margin-right: 10px; margin-left: 10px;">문의내역</a>
			<a href="#" data-category="포인트 조회"
				style="margin-bottom: 20px; margin-right: 10px; margin-left: 10px;">포인트조회</a>
			<a href="#" data-category="주문 내역"
				style="margin-bottom: 20px; margin-right: 10px; margin-left: 10px;">주문내역</a>
			<a href="#" data-category="장바구니"
				style="margin-bottom: 20px; margin-right: 10px; margin-left: 10px;">장바구니</a>
			<a href="${contextPath}/mypage/deleteMemForm.do" data-category="회원탈퇴"
				style="margin-bottom: 20px; margin-right: 10px; margin-left: 10px;">회원탈퇴</a>
		</div>



		<div class="form">
			<p class="sub_title">회원 탈퇴</p>
			<h6 class="sub_text1">그동안 육룰을 이용해주셔서 감사합니다</h6>
			<p class="sub_text2">
				탈퇴 이유를 말씀해주시면 <br> 참고하여 더 나은 서비스를 만들어 나가겠습니다.
			</p>

			<div class="reason">
				<input type="radio" class="non_etc" name="reason"
					value="상품 종류 부족">상품 종류 부족<br>
					
				<input type="radio" class="non_etc" name="reason"
					value="교환/환불/반품 불만">교환/환불/반품 불만<br>
					 
				<input type="radio" class="non_etc" name="reason" 
					value="잦은 알림/문자">잦은 알림/문자<br> 
					
				<input type="radio" class="non_etc" name="reason"
					value="배송 불만">배송 불만<br>
					
				<input type="radio" class="non_etc" name="reason" 
					value="높은 상품 가격">높은 상품 가격<br>
				
				<input type="radio" class="non_etc"name="reason" 
					value="서비스 이용 불편">서비스 이용 불편<br>
					
				<input type="radio" id="etc" name="reason" value="기타"
					onchange="etc_view()">기타<br>
					
				<div id="etc_view" style="display: none;">
					<input type="text" style="width: 400px;"
						placeholder="기타 사유를 입력해주세요">
				</div>
			</div>
			
			<div class="reason">
				<label for="deleteEmail"><strong>계정 확인</strong></label>
				<input type="text" placeholder="가입하신 이메일을 입력해주세요." id="deleteEmail">
			</div>
			
			<div class="info">
				<ul class="deleteInfo">
					<li>현재 사용중인 계정 정보는 회원 탈퇴 후 복구가 불가능합니다.</li>
					<li>진행 중인 거래건이 있거나 페널티 조치 중인 경우 탈퇴 신청이 불가합니다.</li>
					<li>탈퇴 후 회원님의 정보는 전자상거래 소비자보호법에 의거한 AA 개인정보처리방침에 따라 관리됩니다.</li>
					<li>무상으로 지급된 포인트는 탈퇴와 함께 자동 소멸됩니다. 탈퇴 후 재가입하더라도 이미 소멸되었기 때문에
						양도되지 않습니다.</li>
					<li>구매후기 및 답글은 탈퇴 시 자동 삭제되지 않습니다. 탈퇴 후에는 계정 정보가 삭제되어 본인 확인이
						불가하므로, <br>탈퇴 신청 전에 게시글 삭제를 요청해 주시기 바랍니다.
					</li>
					<li>환불 받지 못한 금액이 있을 경우, 환불 정산이 완료된 이후 탈퇴를 신청하셔야 합니다.</li>
					<li>탈퇴 완료 30일 경과 후 개인정보가 모두 삭제됩니다.</li>
				</ul>
			</div>

		<form name="form">
			<div class="reason">
				<input type="checkbox" name="agree" onClick="agreeCheck(this.form)"><strong>주의 사항을 모두 확인하였습니다.</strong>
			</div>
<%-- 			<div class="reason">
				<input type="button" name="checkButton" value="회원 탈퇴" onclick="javascript:deletemember('${mem_id}')" disabled>
			</div> --%>
		</form>

			<form id="memberDeleteForm" class="login-form" action="${contextPath}/mypage/deleteMember.do" method="post">
				<button type="submit">회원 탈퇴</button>
			</form>
		</div>
	</div>
</body>
</html>
