<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 조회</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link href="${contextPath}/resources/css/noticeRead.css" rel="stylesheet" type="text/css">

</head>
<body>

	<h1  >상세보기</h2>
	<div role="main" class="container">
		<div class="row row1">
			<table class="table">
				<tr>
					<th width=15% class="text-center   fg lb fw">작성자</th>
					<td width=35% class="text-center fgl">${noticeRead.mem_id}</td>
					<th width=15% class="text-center lb  fg fw">조회수</th>
					<td width=35% class="text-center  bbu fgl">${noticeRead.notice_hits}</td>
				</tr>
				<tr>
					<th width=15% class="text-center lb fg fw">제목</th>
					<td colspan="2" class="fgl">${noticeRead.notice_title}</td>
					 
				</tr>
				<tr>
					<td colspan="4" class="text-left fg" valign="top" height="200">
					<pre class="fgl" style="white-space: pre-wrap; border: none; background-color: white;"> ${noticeRead.notice_content}</pre>
					</td>
				</tr>
				<tr>
					<td td colspan="4" class="text-right">
						<div>
							<button type="submit" class="bbtn btn-sm btn-primary greylist">
								<a class="atw" href="${contextPath}/notice/modify.do?notice_no=${noticeRead.notice_no}">수정</a>
							</button>
							<button type="submit" class="btn btn-sm btn-primary greylist">
								<a  class="atw" href="${contextPath}/notice/delete.do?notice_no=${noticeRead.notice_no}">삭제</a>
							</button>
							<button type="button" class="btn btn-sm btn-primary greylist">
								<a class="atw" href="${contextPath}/notice/list.do">목록</a>
							</button>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>