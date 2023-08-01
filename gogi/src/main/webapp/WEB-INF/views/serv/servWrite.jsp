<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="servVO"  value="${servMap.servVO}"  />
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
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 700;
	font-size: 45px;
	margin-bottom: 20px;
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
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 500;
	display: block;
	font-size: 20px;
	width:80px;
	height:40px;
}

.writeButton {
	float: right;
}

.fg {
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 400;
	font-size: 20px;
	font-weight: bold;
}

.fgl {
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 400;
	font-size: 20px;
	padding:5px;
	margin: 0;
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

.bordered-input {
  border: 1px solid #ccc;
  margin-left:5px;
}

.text-center{
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 500;
	font-size: 20px;
}

::-webkit-input-placeholder { /* Chrome, Safari, Opera */
    font-size: 15px;
}
</style>

</head>
<body>


	<h1>1:1 문의</h1>
	<form action="${contextPath}/serv/write.do" method="post" enctype="multipart/form-data">
		<div role="main" class="container" style="padding-bottom: 100px">
			<div class="row row1">
				<table class="table">
					<tr>
						<th width=10% class="text-center fg lb fw">작성자</th>
						<td width=90% class="text-left fgl">
						<input style="width: 350px;border:none;" type="text" name="mem_id" placeholder="이름을 입력해 주세요" class="bordered-input" value="${mem_id}" readonly/></td>
					</tr>

					<tr>
						<th width="10%" class="text-center lb fg fw">제목</th>
						<td colspan="2" class="fgl">
						<input style="width: 700px;" type="text" name="cust_serv_title" placeholder="제목을 입력해 주세요" class="bordered-input" /></td>
					</tr>


					<tr>
						<th width="10%" class="text-center fg lb fw" style="vertical-align: middle;">문의 내용</th>
						<td colspan="4" class="text-left fg" valign="top" height="200">
							<pre class="fgl" style="white-space: pre-wrap; border: none; background-color: white;">
								<textarea cols="80" rows="8" name="cust_serv_content" placeholder="내용을 입력해 주세요" class="bordered-input" style="width: 100%; height: 100%; padding: 0; margin: 0;"></textarea>
							</pre>
						</td>
					</tr>
					<tr>
						<th width="10%" class="text-center   fg lb fw">파일 추가</th>
						<td width="90%" class="text-left fgl">
							<input type="button" value="파일추가" onclick="fn_addFile()" class="bordered-input" style="font-size: 15px;">
							<div id="d_file" style="font-size: 15px;"></div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="form-check form-check-inline mt-3">
							    <input class="form-check-input" type="checkbox" name="secret" id="secret">
							    <label class="form-check-label">비밀글 설정</label>
							</div>
						</td>
					</tr>
					<tr>
					<tr>
						<th width="10%" class="text-center   fg lb fw">공지사항</th>
						<td width="90%" class="text-left fgl" style="font-size: 15px;">
							<input type="radio" value="1" name="cust_serv_notice" class="bordered-input"/>공지글 <!-- 0727 오동림 수정 비밀글로 하는건 어떤지? -->
							<input type="radio" value="0" name="cust_serv_notice" class="bordered-input"/>일반글
						</td>
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
						<td colspan="2" class="fgl"><input style="width: 350px;" type="text" name="cust_serv_pw" placeholder="비밀번호를 입력해 주세요" class="bordered-input"/></td>
					</tr>
					<tr>
						<td td colspan="4" class="text-right">
							<div>
								<input type="submit" class="btn btn-sm btn-primary greylist atw" style="float: right;" value="작성">
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