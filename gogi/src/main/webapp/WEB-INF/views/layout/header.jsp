<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
  <style>
    .navbar.navbar-inverse { padding: 10px; padding-left: 200px; padding-right: 200px; background:white; border:none; }
    .nav.navbar-nav { margin-top: 70px; margin-left: 40px; }
    ul.nav.navbar-nav li a:hover{color:#000000;}
    .hidden { display: none; }
  </style>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  <script>
    $(document).ready(function() {
      var isLogOn = false; // 로그인 여부를 확인하는 변수, 실제 값에 따라 변경되어야 합니다.

      function toggleForm() {
        if (isLogOn) {
          $('.logged-in').removeClass('hidden');
          $('.logged-out').addClass('hidden');
        } else {
          $('.logged-in').addClass('hidden');
          $('.logged-out').removeClass('hidden');
        }
      }

      // 로그인 상태 변경 시 폼 변경
      toggleForm();

      // 세션에서 isLogon 값을 가져와서 로그인 상태 변경
      var isLogonValue = '<c:out value="${sessionScope.isLogon}" />';
      if (isLogonValue === 'true') {
        isLogOn = true;
      }
      toggleForm();

      // 로그인 버튼 클릭 시 로그인 상태 변경
      $('#loginBtn').click(function() {
        isLogOn = true; // 로그인 상태로 변경되어야 합니다.
        toggleForm();
      });

      // 로그아웃 버튼 클릭 시 로그인 상태 변경
      $('#logoutBtn').click(function() {
        isLogOn = false; // 로그아웃 상태로 변경되어야 합니다.
        toggleForm();
      });
    });
  </script>
</head>

<body>
  <nav class="navbar navbar-inverse">
    <div class="container-fluid">
      <div class="navbar-header">
        <a href="${contextPath}/main/main.do"><img src="${contextPath}/resources/images/logo/logo.png" width="100px"></a>
      </div>
      <ul class="nav navbar-nav" style="font-size: 18px;">
        <li><a href="#">쇼핑하기</a></li>
        <li><a href="#">배송안내</a></li>
        <li><a href="#">공지사항</a></li>
        <li><a href="#">고객센터</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li class="logged-out"><a href="${contextPath}/member/memberForm.do"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
        <li class="logged-out"><a href="${contextPath}/member/loginForm.do" id="loginBtn"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
        
        <li class="logged-in hidden"><a href="${contextPath}/member/logout.do" id="logoutBtn"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
        <li class="logged-in hidden"><a href="#"><span class="glyphicon glyphicon-user"></span> 마이페이지</a></li>
        <li class="logged-in hidden"><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> 장바구니</a></li>
      </ul>
    </div>
  </nav>
</body>
</html>
