<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>		
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<link href="${contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.2/css/bootstrap.min.css" integrity="sha512-/Dmo1NVtQ05uS0vOI5qEZZn7mWaswFJzDa4RRRF29phxNQqkUkRk5xpyRUpekzoiO7CbdWXFbMHaapzVnNP2ZQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="script.js"></script>
<script>
$(document).ready(function() {
  $(".category a").click(function(e) {
    e.preventDefault();
    var category = $(this).attr("data-category");
    loadProducts(category);
  });

  function loadProducts(category) {
    $.ajax({
      url: "${contextPath}/goods/shop.do",
      data: { category: category },
      success: function(response) {
        // JSP 파일의 내용 중 #productsContainer 부분만 추출하여 업데이트합니다.
        var html = $(response).find("#productsContainer").html();
        $("#productsContainer").html(html);
      },
      error: function(xhr, status, error) {
        console.log("An error occurred: " + error);
      }
    });
  }
});
</script>
<meta charset="UTF-8">

<title>Insert title here</title>
<style>
.main{width: 100%;margin:0 ; padding: 10px; padding-left: 200px; padding-right: 200px;}
.category img {margin-right: 5px; margin-bottom: 30px;}
.slidewrap {width:100%;margin:0 auto;position:relative; margin-bottom: 60px;}
</style>
</head>
<body>
	<div class="slidewrap">
  		<img id="bannerImage" src="${contextPath}/resources/images/shop/banner_pig.png">
	</div>

	<div class="main title-div" id="new">	
	<div class="category">
		<a href="${contextPath}/goods/shop.do?category=pig" data-category="pig"><img src="${contextPath}/resources/images/shop/1.png" class="card-img-top" alt="..."></a>
		<a href="${contextPath}/goods/shop.do?category=cow" data-category="cow"><img src="${contextPath}/resources/images/shop/2.png" class="card-img-top" alt="..."></a>
		<a href="${contextPath}/goods/shop.do?category=chicken" data-category="chicken"><img src="${contextPath}/resources/images/shop/3.png" class="card-img-top" alt="..."></a>
		<a href="${contextPath}/goods/shop.do?category=mealkit" data-category="mealkit"><img src="${contextPath}/resources/images/shop/4.png" class="card-img-top" alt="..."></a>
	</div>

	<div id="productsContainer" class="main-best_div row row-cols-1 row-cols-md-3 text-center mb-4">
		<!-- goods_sort에 따라 상품 목록 출력 -->
		
		
			<c:forEach var="pig" items="${goodsMap.pig}">
			<c:if test="${pig.goods_sort eq 'PIG'}"> 
				<div class="card h-100 border-light shadow p-3 bg-body rounded-0 col-md-4 d-flex justify-content-center align-items-center mb-4">
					<a href="${contextPath}/goods/goodsDetail.do?goods_id=${pig.goods_id}">
						<img src="${contextPath}/thumbnails.do?goods_id=${pig.goods_id}&amp;fileName=${pig.file_name}" class="card-img-top" alt="...">
					</a>
					<div class="card-body">
						<h5 class="card-title">${pig.goods_name}</h5>
						<fmt:formatNumber value="${pig.goods_price}" type="number" var="goods_price" />
						<p class="card-text pt-2 text-decoration-line-through">${goods_price}원</p>
					</div>
				</div>
			</c:if>
		</c:forEach>
			
		
		<!-- goodsMap.cow에 대한 카테고리 상품 목록 -->
		<c:forEach var="cow" items="${goodsMap.cow}">
			<c:if test="${cow.goods_sort eq 'COW'}"> 
				<div class="card h-100 border-light shadow p-3 bg-body rounded-0 col-md-4 d-flex justify-content-center align-items-center mb-4">
					<a href="${contextPath}/goods/goodsDetail.do?goods_id=${cow.goods_id}">
						<img src="${contextPath}/thumbnails.do?goods_id=${cow.goods_id}&amp;fileName=${cow.file_name}" class="card-img-top" alt="...">
					</a>
					<div class="card-body">
						<h5 class="card-title">${cow.goods_name}</h5>
						<fmt:formatNumber value="${cow.goods_price}" type="number" var="goods_price" />
						<p class="card-text pt-2 text-decoration-line-through">${goods_price}원</p>
					</div>
				</div>
			</c:if>
		</c:forEach>
		
		<!-- goodsMap.chicken에 대한 카테고리 상품 목록 -->
		<c:forEach var="chicken" items="${goodsMap.chicken}">
			<c:if test="${chicken.goods_sort eq 'CHICKEN'}"> 
				<div class="card h-100 border-light shadow p-3 bg-body rounded-0 col-md-4 d-flex justify-content-center align-items-center mb-4">
					<a href="${contextPath}/goods/goodsDetail.do?goods_id=${chicken.goods_id}">
						<img src="${contextPath}/thumbnails.do?goods_id=${chicken.goods_id}&amp;fileName=${chicken.file_name}" class="card-img-top" alt="...">
					</a>
					<div class="card-body">
						<h5 class="card-title">${chicken.goods_name}</h5>
						<fmt:formatNumber value="${chicken.goods_price}" type="number" var="goods_price" />
						<p class="card-text pt-2 text-decoration-line-through">${goods_price}원</p>
					</div>
				</div>
			</c:if>
		</c:forEach>
		
		<!-- goodsMap.mealkit에 대한 카테고리 상품 목록 -->
		<c:forEach var="mealkit" items="${goodsMap.mealkit}">
			<c:if test="${mealkit.goods_sort eq 'MEALKIT'}"> <!-- 카테고리 4의 상품 -->
				<div class="card h-100 border-light shadow p-3 bg-body rounded-0 col-md-4 d-flex justify-content-center align-items-center mb-4">
					<a href="${contextPath}/goods/goodsDetail.do?goods_id=${mealkit.goods_id}">
						<img src="${contextPath}/thumbnails.do?goods_id=${mealkit.goods_id}&amp;fileName=${mealkit.file_name}" class="card-img-top" alt="...">
					</a>
					<div class="card-body">
						<h5 class="card-title">${mealkit.goods_name}</h5>
						<fmt:formatNumber value="${mealkit.goods_price}" type="number" var="goods_price" />
						<p class="card-text pt-2 text-decoration-line-through">${goods_price}원</p>
					</div>
				</div>
			</c:if>
		</c:forEach>
	</div>
</div>

</body>
</html>