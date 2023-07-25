<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
 
</style>
<title>게시물 작성</title>
</head>
<body>
<section>
  
<div  role="main">
         <h2>게시물 작성</h2>
<form method="post" name="form" id="form" role="form"> 

<div class="mb-3">
<label style="width:70px;">제목</label>
<input type="text" name="notice_title_faq" placeholder="제목을 입력해 주세요" /><br />
</div>
<div class="mb-3">
<label style="width:70px;">작성자</label>
<input type="text" name="mem_id"  placeholder="이름을 입력해 주세요"  /><br />
</div>
 
<div class="mb-3">
<label style="width:70px;">내용</label>
<textarea cols="50" rows="5" name="notice_content_faq" placeholder="내용을 입력해 주세요" ></textarea><br />
</div>
<button type="submit" class="btn btn-sm btn-primary" id="btnSave">작성</button>

</form>
</div>
 
</section>
</body>
</html>