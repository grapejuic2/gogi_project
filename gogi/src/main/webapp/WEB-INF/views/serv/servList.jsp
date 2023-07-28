<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
    // 특정 아이디를 변수에 저장 (예: "admin"이 특정 아이디라고 가정)
    String admin = "admin";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${contextPath}/resources/css/noticeList.css" rel="stylesheet" type="text/css">
<!-- 폰트:나눔산스 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700;800&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<title>Insert title here</title>
<style>
.serv_title{
	font-family: 'Noto Sans KR', sans-serif; 
	cursor: pointer;
	font-size: 30px;
	font-weight: 700;
	margin-bottom: 50px;
}

  
</style>
</head>
<body>

	<div id="Notice" class="tabcontent container1" style="display: block; margin-top: 20px;">
		<h3 class="serv_title" style="text-align: center;">고객센터</h3>
		<div id="Cust_serv_page">
			<div class="table-responsive">
				<table class="table table-striped table-sm">				
					<colgroup>
						<col style="width: 10%;" />
						<col style="width: auto;" />
						<col style="width: 15%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
					</colgroup>
					<thead>
						<tr style="height:45px;">
							<th class="center tw fg" style="vertical-align: middle;">번호</th>
							<th class="center tw fg" style="vertical-align: middle;">제목</th>
							<th class="center tw fg" style="vertical-align: middle;">작성일</th>
							<th class="center tw fg" style="vertical-align: middle;">작성자</th>
							<th class="center tw fg" style="vertical-align: middle;">조회수</th>
						</tr>
					</thead>

					<tbody>					
					<c:choose>
						<c:when test="${empty servList }">
							<tr style="height:50px;">
								<td colspan="5" class="fixed" style="align-content: center"><strong style="margin-top: 5px; ">작성된 글이 없습니다.</strong></td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${servList}" var="servList">
								<tr style="height:40px;">
									<td class="center fgl" style="font-weight: 500; font-size: 16px;">${servList.cust_serv_no}</td>
									<td class="left fgl">
									<c:if test="${servList.cust_serv_notice eq 1}">
												<img src="${contextPath}/resources/images/serv/hit.png" width="30px" alt="new" />
											</c:if>
									<a href="${contextPath}/serv/read.do?cust_serv_no=${servList.cust_serv_no}">${servList.cust_serv_title}
									</a></td>
									<td class="center fgl"><fmt:formatDate
											value="${servList.cust_serv_date}" /></td>
									<td class="center fgl">${servList.mem_id}</td>
									<td class="center fgl">${servList.cust_serv_hits}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					</tbody>

 
				</table>
				<!--글쓰기 버튼  -->
				<div class="writeButton">
					<button type="button" class="btn btn-sm btn-primary greylist  "
						id="btnWriteForm">
						<a class="atw" href="${contextPath}/serv/write.do">글쓰기</a>
					</button>
				</div>

			</div>

			<!-- 페이징 -->
			<div class="pageHTML">
				<ul class="pagingul">
					<c:if test="${pageMaker3.prev}">
						<li><div class="pagingbtncolor">
								<a class="pagea fg "
									href="${contextPath}/serv/list.do?page=${pageMaker3.startPage - 1}">이전</a>
							</div></li>
					</c:if>

					<c:forEach begin="${pageMaker3.startPage}"
						end="${pageMaker3.endPage}" var="idx">
						<li><div class="pagingbtncolor">
								<a class="pagea fg"
									href="${contextPath}/serv/list.do?page=${idx}">${idx}</a>
							</div></li>
					</c:forEach>

					<c:if test="${pageMaker3.next && pageMaker3.endPage > 0}">
						<li><div class="pagingbtncolor">
								<a class="pagea fg "
									href="${contextPath}/serv/list.do?page=${pageMaker3.endPage + 1}">다음</a>
							</div></li>
					</c:if>
				</ul>
			</div>

		</div>

	</div>







</body>
</html>