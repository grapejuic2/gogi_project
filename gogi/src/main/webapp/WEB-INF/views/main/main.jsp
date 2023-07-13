<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>		
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	/* 브라우저 마진과 패딩 리셋 */
	* {margin:0;padding:0;}

	/* INPUT 가리기 */
	.section [id*="slide"] {display:none;}
	
	/* 슬라이드 영역 - max-width 크기를 조절해주면 됩니다*/
	.section .slidewrap {width:100%;margin:0 auto;overflow:hidden;position:relative;}
	.section .slidelist {width:100%;white-space:nowrap;font-size:0;}
	.section .slidelist > li {display:inline-block;vertical-align:middle;width:100%;overflow:hidden;transition:all .5s;}
	.section .slidelist > li > a > img {width:100%;height:530px;display:block;object-fit: cover;}

	/* 좌우로 넘기는 LABEL버튼에 대한 스타일 */
	.section .slide-control {position:absolute;top:0;left:0;z-index:10;width:100%;height:100%;}
	.section .slide-control label {position:absolute;z-index:1;top:50%;transform:translateY(-50%);padding:50px;cursor:pointer;}
	.section .slide-control .left {left:5px;background:url('${contextPath}/resources/images/main/left.png') center center / 100% no-repeat;}
	.section .slide-control .right {right:5px;background:url('${contextPath}/resources/images/main/right.png') center center / 100% no-repeat;}
	.section .slide-control [class*="control"] {display:none;}

	/* INPUT이 체크되면 변화값이 li까지 전달되는 스타일 */
	.section [id="slide01"]:checked ~ .slidewrap .slidelist > li {transform:translateX(0%);}
	.section [id="slide02"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-100%);}
	.section [id="slide03"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-200%);}
	
	/*  INPUT이 체크되면 변화값이 좌우 슬라이드 버튼을 담고 있는 div 까지 전달되는 스타일 */
	.section [id="slide01"]:checked ~ .slidewrap .control01 {display:block;}
	.section [id="slide02"]:checked ~ .slidewrap .control02 {display:block;}
	.section [id="slide03"]:checked ~ .slidewrap .control03 {display:block;}
	
	/* 베스트상품, 할인상품 스타일 */
	.main{width: 100%;margin:0 ; padding: 10px; padding-left: 200px; padding-right: 200px;}
	</style>
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