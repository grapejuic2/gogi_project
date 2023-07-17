<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>		
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link href="${contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
<style>
	.section .slide-control .left {left:5px;background:url('${contextPath}/resources/images/main/left.png') center center / 100% no-repeat;}
	.section .slide-control .right {right:5px;background:url('${contextPath}/resources/images/main/right.png') center center / 100% no-repeat;}
</style>
<title>Insert title here</title>
</head>
<body>
		<!-- 메인페이지 배너 -->
		<div class="section">
			<input type="radio" name="slide" id="slide01" checked>
			<input type="radio" name="slide" id="slide02">
			<input type="radio" name="slide" id="slide03">
			<div class="slidewrap">
				<ul class="slidelist">
					<li><a><img src="${contextPath}/resources/images/main/banner1.png" ></a></li>
					<li><a><img src="${contextPath}/resources/images/main/banner2.png"></a></li>
					<li><a><img src="${contextPath}/resources/images/main/banner3.png"></a></li>
				</ul>
		
				<div class="slide-control">
					<div class="control01">
						<label for="slide03" class="left"></label>
						<label for="slide02" class="right"></label>
					</div>
					<div class="control02">
						<label for="slide01" class="left"></label>
						<label for="slide03" class="right"></label>
					</div>
					<div class="control03">
						<label for="slide02" class="left"></label>
						<label for="slide01" class="right"></label>
					</div>
				</div>
			</div>
		</div>

		<!-- 메인페이지 베스트상품 -->
		
		<div class="main title-div" id="new"><h2>육룰 베스트</h2></div>
			
		<div class="main-best_div">
			<c:if test="${goods_status.equals('B')}">
				<c:forEach var="item" items="${goodsMap.bestGoods }">
					<div class="goods">						
						<%--<a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
							<img src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}" style="width:200px; height:200px;">
						</a> --%>
						<div class="title"><b><br>${item.goods_name}</b></div>
						<div class="price">
							<fmt:formatNumber value="${item.goods_price}" type="number" var="goods_price" />
							<b>${goods_price}원</b><br>
							<%-- <c:if test="${item.goods_avg_star == 5}"><td><img src="${contextPath}/resources/image/star1.jpg"><img src="${contextPath}/resources/image/star1.jpg"><img src="${contextPath}/resources/image/star1.jpg"><img src="${contextPath}/resources/image/star1.jpg"><img src="${contextPath}/resources/image/star1.jpg"></td></c:if>
							후기(${item.goods_review_count}) --%>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
		
		<!-- 메인페이지 할인상품 -->
		<div class="main sale-div" id="discount">
			<div class="main-title">
				<h2>반짝 할인</h2>
			</div>
		</div>


</body>
</html>