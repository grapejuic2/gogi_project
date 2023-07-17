<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<head>
<style>
.navbar.navbar-inverse { padding: 10px; padding-left: 200px; padding-right: 200px; background:white; border:none; }
.nav.navbar-nav { margin-top: 70px; margin-left: 40px; }
ul.nav.navbar-nav li a:hover{color:#000000;}
 
@import url(https://fonts.googleapis.com/css?family=Roboto:300);

#mem_id, #mem_name, #mem_email, #mem_pw, #mem_pw_confirm{
	width: 200px;
}
#mem_birth_y, #mem_birth_m, #mem_birth_d, #mem_tel1, #mem_tel2, #mem_tel3{
	width: 120px;
}
#checkIdButton,
#sendEmailButton {
  display: inline-block;
  vertical-align: middle;
  margin-left: 5px;
  margin-top: 0px;
  width: 130px;
}
#emailConfirm {
  margin-top: 10px;
  width: 200px;
}
</style>


<link href="${contextPath}/resources/css/memberForm.css" rel="stylesheet" type="text/css">

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
 
<title>회원가입</title>
</head>
<body>
<div class="memberForm-page">
  <div class="memberForm-text">
    <a href="${contextPath}/main/main.do"><img src="${contextPath}/resources/images/logo/logo2.png" alt="logo2" width="150px"></a>
  </div>
  <div class="form">
    <form id="memberForm" class="member-form" action="${contextPath}/member/memberForm.do" method="post">
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
          <label for="mem_pw">비밀번호</label>
        </div>
        <input type="password" placeholder="비밀번호" id="mem_pw" name="mem_pw" style="margin-right: 5px;">
        <input type="password" placeholder="비밀번호 확인" id="mem_pw_confirm" name="mem_pw_confirm" />
      </div>

      <div class="form-group">
        <div class="label-group">
          <label for="mem_name">이름</label>
        </div>
        <input type="text" placeholder="이름" id="mem_name" name="mem_name" />
      </div>

      <div class="form-group">
        <div class="label-group">
          <label for="mem_birth">생년월일</label>
        </div>
        <div class="input-group">
          <input type="text" id="mem_birth_y" name="mem_birth_y" placeholder="년" maxlength="4">
          <input type="text" id="mem_birth_m" name="mem_birth_m" placeholder="월" maxlength="2">
          <input type="text" id="mem_birth_d" name="mem_birth_d" placeholder="일" maxlength="2">
        </div>
      </div>

      <div class="form-group">
        <div class="label-group">
          <label for="mem_tel">연락처</label>
        </div>
        <div class="input-group">
          <input type="text" id="mem_tel1" name="mem_tel1" placeholder="통신사" maxlength="3">
          <input type="text" id="mem_tel2" name="mem_tel2" placeholder="중간 번호" maxlength="4">
          <input type="text" id="mem_tel3" name="mem_tel3" placeholder="마지막 번호" maxlength="4">
        </div>
      </div>

      <div class="form-group">
        <div class="label-group">
          <label for="mem_email">이메일</label>
        </div>
        <input type="text" placeholder="이메일" id="mem_email" name="mem_email" />
        <button type="button" id="sendMail" style="margin-top: 0px;">메일 인증</button>
      </div>

      <div id="emailConfirm" class="hide">
        <input type="text" id="emailCode" name="emailCode" placeholder="인증번호 입력">
        <button type="button" id="verifyBtn">인증 확인</button>
      </div>

      <button type="submit">회원가입</button>
    </form>
  </div>
</div>

<script>
	/* 아이디 중복 체크 */
	$(document).ready(function() {
	  $("#checkIdButton").on("click", function() {
	    var mem_id = $("#mem_id").val();
	    if (mem_id == '') {
	      alert("아이디를 입력하세요.");
	      return;
	    }
	    $.ajax({
	      type: "post",
	      async: false,
	      url: "${contextPath}/member/checkId.do",
	      dataType: "json",
	      data: {
	        mem_id: mem_id
	      },
	      success: function(result) {
	        if (result == 0) {
	          alert("사용할 수 있는 아이디입니다.");
	          $("#checkId").text("사용할 수 있는 아이디입니다.").css("color", "green");
	        } else {
	          alert("사용할 수 없는 아이디입니다.");
	          $("#checkId").text("사용할 수 없는 아이디입니다.").css("color", "red");
	        }
	        $("#mem_id").prop("readonly", false);
	        $("#checkIdButton").prop("disabled", false);
	      },
	      error: function(xhr, status, error) {
	        console.error(error);
	        alert("에러가 발생했습니다.");
	        $("#mem_id").prop("readonly", false);
	        $("#checkIdButton").prop("disabled", false);
	      },
	      complete: function(xhr, status) {
			console.log()	        
	      }
	    });
	  });
	});

	/* 이메일 인증 */
	$(document).ready(function() {
	  $("#sendMail").click(function() {
	    var mem_email = $("#mem_email").val();
	    $.ajax({
	      type: "POST",
	      url: "${contextPath}/member/emailConfirm.do",
	      data: { mem_email: mem_email },
	      dataType: "text",
	    })
	      .done(function(data) {
	        alert("이메일로 인증번호가 발송되었습니다. 확인해주세요.");
	        console.log("서버에서 받은 인증 코드: " + data);
	        $("#emailCode").data("expectedCode", data);
	        $("#emailConfirm").removeClass("hide");
	      })
	      .fail(function(xhr) {
	        var errorMessage = "서버 요청 중 오류가 발생했습니다.";
	        if (xhr.status === 500) {
	          errorMessage = "서버 내부 오류가 발생했습니다.";
	        } else if (xhr.status === 404) {
	          errorMessage = "서버 URL을 찾을 수 없습니다.";
	        }
	        alert(errorMessage);
	      });
	  });
	
	  $("#verifyBtn").click(function() {
	    var verificationCode = $("#emailCode").val();
	    var expectedCode = $("#emailCode").data("expectedCode");
	
	    console.log("입력된 인증 코드: " + verificationCode);
	    console.log("예상 인증 코드: " + expectedCode);
	
	    if (verificationCode === "") {
	      alert("인증 코드를 입력해주세요.");
	      return;
	    }
	
	    if (verificationCode === expectedCode) {
	      alert("이메일 인증이 완료되었습니다!");
	    } else {
	      alert("올바른 인증 코드를 입력해주세요.");
	    }
	  });
	});
	
</script>

</body>
</html>
