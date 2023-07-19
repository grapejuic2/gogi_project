<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>작성자</th>
				<th>조회수</th>
			</tr>
		</thead>
 
			<tbody>
			<c:forEach items="${noticeList}" var="noticeList">
				<tr>
					<td>${noticeList.notice_no}</td>
					<td><a
						href="${contextPath}/notice/read.do?notice_no=${noticeList.notice_no}">${noticeList.notice_title}</a>
					</td>
					<td>${noticeList.notice_date}</td>
					<td>${noticeList.mem_id}</td>
					<td>${noticeList.notice_hits}</td>
				</tr>
			</c:forEach>
   
		</tbody>

	</table>
	
	
	<!-- 페이징용 HTML 코드 -->
	<div id="pageHTML">
		<ul>
			<!-- 이전 페이지  -->
			<c:if test="${pageMaker.prev}">
				<li><a class="pagea"
					href="/list.do${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
			</c:if>

			<!-- 페이지 번호들 -->
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
				var="idx">
				<c:choose>
					<c:when test="${idx eq pageMaker.cri.getPage()}">
						<li><a class="pagea " href="/list.do${pageMaker.makeQuery(idx)}"><strong>${idx}</strong></a></li>
					</c:when>
					<c:otherwise>
						<li><a class="pagea" href="/list.do${pageMaker.makeQuery(idx)}">${idx}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<!-- 다음페이지 -->
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li><a class="pagea"
					href="/list.do${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
			</c:if>
		</ul>
	</div>
	
</body>
</html>