<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<style>
.navbar.navbar-inverse { padding: 10px; padding-left: 200px; padding-right: 200px; background:white; border:none; }
.nav.navbar-nav { margin-top: 70px; margin-left: 40px; }
ul.nav.navbar-nav li a:hover{color:#000000;}
 
@import url(https://fonts.googleapis.com/css?family=Roboto:300);
</style>

<link href="${contextPath}/resources/css/memberForm.css" rel="stylesheet" type="text/css">

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
 
<title>육룰 회원가입</title>
</head>
<body>
    <div class="container">
        <h2>회원가입</h2>
        <form action="${contextPath}/member/addMember.do" method="post">
            <label for="mem_id">사용자 ID:</label>
            <input type="text" id="mem_id" name="mem_id" required>

            <label for="mem_pw">비밀번호:</labl>
            <input type="password" id="mem_pw" name="mem_pw" required>

            <label for="mem_name">이름:</label>
            <input type="text" id="mem_name" name="mem_name" required>

            <label for="mem_birth_y">생년:</label>
            <input type="text" id="mem_birth_y" name="mem_birth_y">

            <label for="mem_birth_m">생월:</label>
            <input type="text" id="mem_birth_m" name="mem_birth_m">

            <label for="mem_birth_d">생일:</label>
            <input type="text" id="mem_birth_d" name="mem_birth_d">

            <label for="mem_tel1">전화번호(통신사):</label>
            <input type="text" id="mem_tel1" name="mem_tel1">

            <label for="mem_tel2">전화번호(중간 번호):</label>
            <input type="text" id="mem_tel2" name="mem_tel2">

            <label for="mem_tel3">전화번호(마지막 번호):</label>
            <input type="text" id="mem_tel3" name="mem_tel3">

            <label for="mem_email">이메일:</label>
            <input type="email" id="mem_mail" name="mem_email" required>

            <input type="submit" value="가입">
        </form>
    </div>
</body>
</html>
