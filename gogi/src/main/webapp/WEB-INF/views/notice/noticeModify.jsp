<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<style>
body {
  padding-top: 70px;
  padding-bottom: 30px;
}
</style>
<title>게시물 수정</title>
</head>
<body>
<article> 
<div class="container" role="main">
         <h2>게시물 수정</h2>

<form method="post"><!-- POST 방식은 폼 데이터를 별도로 첨부하여 서버로 전달하는 방식 -->
<!--주의! 입력 엘리먼트인 <input> 과 <textarea>의 이름(name) 속성의 값이 BoardVO와 동일해야함  -->
<div class="mb-3">
<label  style="width:70px;">제목</label>
<input type="text" name="notice_title" value="${noticeRead.notice_title}"/><br />
</div>

<div class="mb-3">
<label style="width:70px;">작성자</label>
<input type="text" name="mem)id" value="${noticeRead.mem_id}" /><br />
</div>
 

<div class="mb-3">
<label style="width:70px;">내용</label>
<textarea cols="50" rows="5" name="notice_content" >${noticeRead.notice_content</textarea><br />
</div>
<button type="submit" class="btn btn-sm btn-primary" >완료</button>

</form>
</body>
</html>

