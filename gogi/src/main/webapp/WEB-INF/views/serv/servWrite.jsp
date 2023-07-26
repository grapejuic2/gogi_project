<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="${contextPath}/resources/css/noticeRead.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	var cnt = 1;
	function fn_addFile() {
		$("#d_file")
				.append("<br>" + "<input type='file' name='file"+cnt+"' />");
		cnt++;
	}
</script>
<style type="text/css">
@charset "UTF-8";

.row1 {
	margin: 0px auto;
	width: 1100px;
	height: 650px;
}

#asas {
	text-align: center;
	justify-content: center;
}

h1 {
	text-align: center;
	margin-top: 50px;
	font-family: 'Nanum Gothic', sans-serif;
	font-weight: 800;
	font-size: 60px;
	margin-bottom: 10px;
}

.bbu {
	border-bottom: 1px solid #ddd;
}

.greylist {
	width: 100px;
	height: 50px;
	font-weight: 900;
	color: white;
	text-align: center;
	background: black;
	border-radius: 5px;
}

.greylist:hover {
	background-color: #6CC148;
	border: solid 2px white;
	color: white;
}

.greylist a {
	text-decoration-line: none;
	text-decoration: none;
	color: white;
}

.atw {
	text-decoration-line: none;
	text-decoration: none;
	color: white;
	font-family: 'Nanum Gothic', sans-serif;
	font-weight: 400;
	display: block;
	font-size: 20px;
	font-weight: bold;
}

.writeButton {
	float: right;
}

.fg {
	font-family: 'Nanum Gothic', sans-serif;
	font-weight: 400;
	font-size: 20px;
	font-weight: bold;
}

.fgl {
	font-family: 'Nanum Gothic', sans-serif;
	font-weight: 400;
	font-size: 20px;
}

.fw {
	color: white;
}

.lb {
	background-color: #292929;
}

.rightbtn {
	float: right;
}
</style>

</head>
<body>


	<h1>게시물 작성</h1>
	<form action="${contextPath}/serv/write.do" method="post" enctype="multipart/form-data">
		<div role="main" class="container" style="padding-bottom: 100px">
			<div class="row row1">
				<table class="table">
					<tr>
						<th width=15% class="text-center   fg lb fw">작성자</th>
						<td width=35% class="text-left fgl">
						<input style="width: 350px;" type="text" name="mem_id" placeholder="이름을 입력해 주세요" /></td>
					</tr>

					<tr>
						<th width=15% class="text-center lb fg fw">제목</th>
						<td colspan="2" class="fgl"><input style="width: 350px;"
							type="text" name="cust_serv_title" placeholder="제목을 입력해 주세요" /></td>
					</tr>
					<tr>
						<th width=15% class="text-center   fg lb fw">글 선택</th>
						<td width=35% class="text-left fgl"><input type="radio"
							value="1" name="cust_serv_notice" />공지사항 <input type="radio"
							value="0" name="cust_serv_notice" />일반글</td>
					</tr>
					<tr>
						<th width=15% class="text-center   fg lb fw">파일 추가</th>
						<td width=35% class="text-left fgl"><input type="button"
							value="파일추가" onclick="fn_addFile()">
							<div id="d_file"></div></td>
					</tr>
					<!-- 	<tr>
						<th width=15% class="text-center   fg lb fw">파일 추가</th>
						<td width=35% class="text-left fgl">
						<input type="button" value="파일추가" onclick="fn_addFile()"></td>
						<div id="d_file">
						</div>
					</tr> -->
					<tr>
						<th width=15% class="text-center lb fg fw">비밀번호</th>
						<td colspan="2" class="fgl"><input style="width: 350px;"
							type="text" name="cust_serv_pw" placeholder="비밀번호를 입력해 주세요" /></td>
					</tr>


					<tr>
						<td colspan="4" class="text-left fg" valign="top" height="200">
							<pre class="fgl"
								style="white-space: pre-wrap; border: none; background-color: white;">
								<textarea cols="100" rows="7" name="cust_serv_content"
									placeholder="내용을 입력해 주세요"></textarea>
								</pre>
						</td>
					</tr>
					<tr>
						<td td colspan="4" class="text-right">
							<div>
								<input type="submit" class="btn btn-sm btn-primary greylist atw"
									style="float: right;" value="작성">
							</div>
						</td>
						<!-- 
						<td td colspan="4" class="text-right  ">
							<div>
								<button type="submit"
									class="btn btn-sm btn-primary greylist atw"
									style="float: right;">작성</button>
							</div>
						</td> -->
					</tr>
				</table>
			</div>
		</div>
	</form>


<c:if test="${not empty message}">
    <script>
        alert("${message}");
    </script>
</c:if>

</body>
</html>