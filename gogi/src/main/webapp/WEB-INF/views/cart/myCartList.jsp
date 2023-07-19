<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <!-- 폰트:나눔고딕 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
 
<title>Insert title here</title>
<style>
.cartList {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-top: 30px;
  font-family: 'Nanum Gothic', sans-serif;
}
.cartList table {
  margin-top: 40px;
  margin-bottom: 70px;
  text-align: center;
  border-collapse: separate; /* 'collapse'에서 'separate'로 변경 */
  width: 50%;
}
.cartList th, .cartList td {
  border-top: 1px solid #ddd; /* 위쪽에 border 추가 */
  padding: 8px;
  vertical-align: middle;
}
.cartList th:nth-child(1) {
  width: 20%; /* 첫 번째 th 요소의 너비를 30%로 지정 */
}
.cartList th:nth-child(2) {
  width: 30%; /* 두 번째 th 요소의 너비를 20%로 지정 */
}
.cartList th:nth-child(3) {
  width: 30%; /* 세 번째 th 요소의 너비를 15%로 지정 */
}
.cartList th:nth-child(4) {
  width: 20%; /* 네 번째 th 요소의 너비를 35%로 지정 */
}
.cartList th {
  border-bottom: 2px solid;
  text-align: center; /* 테이블 헤더에 아래쪽 border 추가 */
  height: 55px;
}
</style>
</head>
<body>
<div class="cartList">
	<span style="font-size: 35px;font-weight: 700;">장바구니</span>
	<table>
		<tr>
			<th>상품 썸네일</th>
			<th>상품정보</th>
			<th>수량</th>
			<th>가격</th>
		</tr>
		<%-- <c:forEach > --%>
		<tr>
			<td>상품 썸네일</td>
			<td>상품정보</td>
			<td>수량</td>
			<td>가격</td>
		</tr>
		<%-- </c:forEach> --%>
	</table>
</div>
</body>
</html>