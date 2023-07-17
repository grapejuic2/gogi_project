<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- header -->
	<tiles:insertAttribute name="header"/>
	<hr style="color=gray; margin: 0;" />
	
	<!-- 계속 바뀌는 내용부 -->
	<tiles:insertAttribute name="body"/>
	<hr style="color=gray; margin: 0;"/>
	
	<!-- foot -->
	<tiles:insertAttribute name="footer"/>
</body>
</html>