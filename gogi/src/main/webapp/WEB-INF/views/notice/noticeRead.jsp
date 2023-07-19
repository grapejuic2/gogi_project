<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>게시물 조회</title>
</head>
<body>

 <article>
      <div class="container" role="main">
         <h2>게시물  상세보기</h2>
         
<!--주의! 입력 엘리먼트인 <input> 과 <textarea>의 이름(name) 속성의 값이 BoardVO와 동일해야함  -->
<div class="mb-3">
<label style="width:70px;" >제목</label>
${noticeRead.notice_title}<br />
 </div>

<div class="mb-3">
<label style="width:70px;">작성자</label>
 ${noticeRead.mem_id} <br />
  </div>
 
 
<div class="mb-3">
<label style="width:70px;">조회수 :</label>
${noticeRead.notice_hits} <br />
 </div>

<div class="mb-3">
<label style="width:70px;">내용</label>
${noticeRead.notice_content}<br />
 </div>

 <button type="submit" class="btn btn-sm btn-primary" > <a href="${contextPath}/notice/modify.do?notice_no=${noticeRead.notice_no}">수정</a></button>
 <button type="submit" class="btn btn-sm btn-primary" > <a href="${contextPath}/notice/delete.do?notice_no=${noticeRead.notice_no}">삭제</a></button>
 
 
 <button type="button" class="btn btn-sm btn-primary" > <a href="${contextPath}/notice/list.do">목록</a></button>
 </div>
 </article>
 
 
</body>
</html>