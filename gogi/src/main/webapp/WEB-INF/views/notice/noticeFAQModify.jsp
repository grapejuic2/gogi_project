<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="${contextPath}/resources/css/noticeRead.css"
	rel="stylesheet" type="text/css">
<title>게시물 조회</title>
</head>
<body>



	<h1>
		게시물 수정
		</h1>
		<form method="post">
			<div role="main" class="container">
				<div class="row row1">
					<table class="table">
						<tr>
							<th width=15% class="text-center   fg lb fw">작성자</th>
							<td width=35% class="text-left fgl">
							<input type="text" name="mem_id_faq" value="${noticeFAQRead.mem_id}" /></td>
							<th width=15% class="text-center lb  fg fw">조회수</th>
							<td width=35% class="text-center  bbu fgl">${noticFAQeRead.notice_hits}</td>
						</tr>
						<tr>
							<th width=15% class="text-center lb fg fw">제목</th>
							<td colspan="2" class="fgl" > 
							<input style="width:350px;  
							type="text" name="notice_title_faq" 
							value="${noticeFAQRead.notice_title_faq}"/>
							</td>
						</tr>
						<tr>
							<td colspan="4" class="text-left fg" valign="top" height="200">
								<pre class="fgl" 	style="white-space: pre-wrap; border: none; background-color: white;">
								<textarea cols="100" rows="12" name="notice_content_faq" >${noticeFAQRead.notice_content_faq}</textarea>
								</pre>
							</td>
						</tr>
						<tr>
							<td td colspan="4" class="text-right  ">
							<div> 
									<button type="submit" class="btn btn-sm btn-primary greylist atw" style="float: right;"  >완료</button>
							</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</form>
 
</body>
</html>
</body>
</html>