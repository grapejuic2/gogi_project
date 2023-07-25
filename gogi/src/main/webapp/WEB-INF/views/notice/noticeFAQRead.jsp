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
      <div  role="main">
         <h2>게시물  상세보기</h2>
         
<div class="mb-3">
<label style="width:70px;" >제목</label>
${noticeFAQRead.notice_title_faq}<br />
 </div>

<div class="mb-3">
<label style="width:70px;">작성자</label>
 ${noticeFAQRead.mem_id} <br />
  </div>
 
 
<div class="mb-3">
<label style="width:70px;">조회수 :</label>
${noticeFAQRead.notice_hits_faq} <br />
 </div>

<div class="mb-3">
<label style="width:70px;">내용</label>
${noticeFAQRead.notice_content_faq}<br />
 </div>

 <button type="submit" class="btn btn-sm btn-primary" > <a href="${contextPath}/notice/faqmodify.do?notice_no_faq=${noticeFAQRead.notice_no_faq}">수정</a></button>
 <button type="submit" class="btn btn-sm btn-primary" > <a href="${contextPath}/notice/faqdelete.do?notice_no_faq=${noticeFAQRead.notice_no_faq}">삭제</a></button>
 
 
 <button type="button" class="btn btn-sm btn-primary" onclick="showFaqTab()"> <a href="${contextPath}/notice/list.do">목록</a></button>
 </div>
 </article>
 
 <!-- 목록 이동시 faq페이지로 오게 하기 기능x 일단 보류 -->
 <script>
function showFaqTab() {
  // "FAQ" 탭 버튼 요소를 가져옵니다.
  var faqTabButton = document.getElementById("faqTabButton");

  // "FAQ" 탭 버튼의 클릭 이벤트를 트리거합니다.
  faqTabButton.click();
}
</script>
 
 

</body>
</html>