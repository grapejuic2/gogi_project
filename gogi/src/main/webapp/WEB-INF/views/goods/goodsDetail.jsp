<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" 	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="goods"  value="${goodsMap.goodsVO}"  />
<c:set var="imageList"  value="${goodsMap.imageList }"  />
<!DOCTYPE html>
<html>
<head>
<style>
.image-background{width:100%; height:500px;background-color: #f1f1f1;}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="image-background">
		<img src="${contextPath}/thumbnails.do?goods_id=${goods.goods_id}&amp;fileName=${goods.file_name}" class="card-img-top" alt="...">
	</div>
</body>
</html>