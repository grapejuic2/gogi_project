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

#mem_id, #mem_name, #mem_email, #mem_pw {
	width: 200px;
}

#mem_birth_y, #mem_birth_m, #mem_birth_d, #mem_tel1, #mem_tel2, #mem_tel3 {
	width: 120px;
}

.category img {
	margin-right: 15px;
	margin-bottom: 50px;
}

.slidewrap {
	width: 100%;
	margin: 0 auto;
	position: relative;
	margin-bottom: 60px;
}

.category {
	display: flex;
	justify-content: center;
}
</style>

<link href="${contextPath}/resources/css/memberForm.css"
	rel="stylesheet" type="text/css">

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>회원 페이지</title>
</head>

<script> 
function fn_modify_member_info(attribute) {
    var value;

    var frm_mod_member = document.frm_mod_member;
    if (attribute === 'mem_pw') {
        value = frm_mod_member.mem_pw.value;
    } else if (attribute === 'mem_name') {
        value = frm_mod_member.mem_name.value;
    } else if (attribute === 'mem_tel') {
        value = frm_mod_member.member_tel1.value + ',' +
                frm_mod_member.member_tel2.value + ',' +
                frm_mod_member.member_tel3.value;
    } else if (attribute === 'mem_birth') {
        value = frm_mod_member.mem_birth_y.value + ',' +
                frm_mod_member.mem_birth_m.value + ',' +
                frm_mod_member.mem_birth_d.value;
    } else if (attribute === 'mem_email') {
        value = frm_mod_member.mem_email.value;
    }

    console.log(attribute);
    $.ajax({
        type: "post",
        async: false, //false인 경우 동기식으로 처리한다.
        url: "${contextPath}/mypage/modifyMyInfo.do",
        data: {
            attribute: attribute,
            value: value,
        },
        success: function(data, textStatus) {
            if (data.trim() === 'mod_success') {
                alert("회원 정보를 수정했습니다.");
            } else if (data.trim() === 'failed') {
                alert("다시 시도해 주세요.");	
            }
        },
        error: function(data, textStatus) {
            alert("에러가 발생했습니다." + data);
        },
        complete: function(data, textStatus) {
            alert("작업을 완료 했습니다");
        }
    });
}
</script>

<body>
	<div class="memberForm-page">
		<div class="memberForm-text">
			<a href="${contextPath}/main/main.do"><img
				src="${contextPath}/resources/images/logo/logo2.png" alt="logo2"
				width="150px"></a>
		</div>

		<div class="category">
			<a href="${contextPath}/mypage/mypageForm.do"
				data-category="개인 정보 수정"
				style="margin-bottom: 20px; margin-right: 10px; margin-left: 10px;">개인정보 수정</a> 
			<a href="#" data-category="문의 내역"
				style="margin-bottom: 20px; margin-right: 10px; margin-left: 10px;">문의내역</a> 
			<a href="#" data-category="포인트 조회"
				style="margin-bottom: 20px; margin-right: 10px; margin-left: 10px;">포인트조회</a> 
			<a href="#" data-category="주문 내역"
				style="margin-bottom: 20px; margin-right: 10px; margin-left: 10px;">주문내역</a> 
			<a href="#" data-category="장바구니"
				style="margin-bottom: 20px; margin-right: 10px; margin-left: 10px;">장바구니</a>
			<a href="#" data-category="회원탈퇴"
				style="margin-bottom: 20px; margin-right: 10px; margin-left: 10px;">회원
				탈퇴</a>
		</div>

		<div class="form">
			<form name="frm_mod_member" class="configform"
				action="${contextPath}/mypage/modifyMyInfo.do" method="post">
				<h2 style="margin-bottom: 20px; margin-top: 0px;">개인 정보 수정</h2>

				<div class="form-group" style="margin-bottom: 0px;">
                    <div class="label-group">
                        <label for="myp_id">아이디</label>
                    </div>
                    <input type="text" name="mem_id" value="${memberInfo.mem_id}" disabled />
                </div>

                <div class="form-group">
                    <div class="label-group">
                        <label for="mem_pw">비밀번호</label>
                    </div>
                    <input type="password" placeholder="비밀번호" name="mem_pw"
                        style="margin-right: 5px;">
                </div>

                <div class="form-group">
                    <div class="label-group">
                        <label for="mem_name">이름</label>
                    </div>
                    <input type="text" name="mem_name" value="${memberInfo.mem_name}" disabled />
                </div>

                <div class="form-group">
                    <div class="label-group">
                        <label for="mem_birth">생년월일</label>
                    </div>
                    <div class="input-group">
                        <input type="text" id="mem_birth_y" name="mem_birth_y" placeholder="년"
                            maxlength="4">
                        <input type="text" id="mem_birth_m" name="mem_birth_m" placeholder="월"
                            maxlength="2">
                        <input type="text" id="mem_birth_d" name="mem_birth_d" placeholder="일"
                            maxlength="2">
                    </div>
                </div>

                <div class="form-group">
                    <div class="label-group">
                        <label for="mem_tel">연락처</label>
                    </div>
                    <div class="input-group">
                        <input type="text" id="mem_tel1" name="member_tel1" placeholder="통신사"
                            maxlength="3">
                        <input type="text" id="mem_tel2" name="member_tel2" placeholder="중간 번호"
                            maxlength="4">
                        <input type="text" id="mem_tel3" name="member_tel3" placeholder="마지막 번호"
                            maxlength="4">
                    </div>
                </div>

                <div class="form-group">
                    <div class="label-group">
                        <label for="mem_email">이메일</label>
                    </div>
                    <input type="text" placeholder="이메일" id="mem_email" name="mem_email" />
                </div>

                <button type="button">정보 수정</button>
                
            </form>
        </div>
    </div>
</body>
</html>