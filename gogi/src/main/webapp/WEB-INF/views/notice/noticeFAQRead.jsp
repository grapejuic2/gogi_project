<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link href="${contextPath}/resources/css/noticeRead.css" rel="stylesheet" type="text/css">
<title>게시물 조회</title>
</head>
<body>

	<h1 >상세보기</h2>
	<div role="main" class="container">
		<div class="row row1">
			<table class="table">
				<tr>
					<th width=15% class="text-center   fg lb fw">작성자</th>
					<td width=35% class="text-center fgl">${noticeFAQRead.mem_id}</td>
					<th width=15% class="text-center lb  fg fw">조회수</th>
					<td width=35% class="text-center  bbu fgl">${noticeFAQRead.notice_hits_faq}</td>
				</tr>
				<tr>
					<th width=15% class="text-center lb fg fw">제목</th>
					<td colspan="2" class="fgl">${noticeFAQRead.notice_title_faq}</td>
					 
				</tr>
				<tr>
					<td colspan="4" class="text-left fg" valign="top" height="200">
					<pre class="fgl" style="white-space: pre-wrap; border: none; background-color: white;">${noticeFAQRead.notice_content_faq}</pre>
					</td>
				</tr>
				<tr>
					<td td colspan="4" class="text-right">
						<div>
							<button type="submit" class="bbtn btn-sm btn-primary greylist">
								<a class="atw" href="${contextPath}/notice/faqmodify.do?notice_no_faq=${noticeFAQRead.notice_no_faq}">수정</a>
							</button>
							<button type="submit" class="btn btn-sm btn-primary greylist">
								<a  class="atw" href="${contextPath}/notice/faqdelete.do?notice_no_faq=${noticeFAQRead.notice_no_faq}">삭제</a>
							</button>
							<button type="button" class="btn btn-sm btn-primary greylist" onclick="showFaqTab()">
								<a class="atw" href="${contextPath}/notice/list.do">목록</a>
							</button>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
 
 
 
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