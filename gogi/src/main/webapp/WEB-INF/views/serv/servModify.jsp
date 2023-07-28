<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 조회</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="${contextPath}/resources/css/noticeRead.css"
	rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>
input[type="text"], input[type="password"], textarea{ 
    border: 1px solid #E8E8E8;
  }	
  
.fg {
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 400;
	font-size: 17px;
}

.fgl {
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 400;
	font-size: 17px;
	padding:5px;
	margin: 0;
}  

::-webkit-input-placeholder { /* Chrome, Safari, Opera */
    font-size: 15px;
}
</style>
</head>
<body>
	<h1>
		게시물 수정
		</h1>
		<form method="post"   id="updateForm">
			<div role="main" class="container">
				<div class="row row1">
					<table class="table">
						<tr>
							<th width=15% class="text-center fg lb fw">작성자</th>
							<td width=35% class="text-center fgl">${servRead.mem_id}</td>
							<th width=15% class="text-center lb  fg fw">조회수</th>
							<td width=35%  class="text-center  bbu fgl">${servRead.cust_serv_hits}</td>
						</tr>
						<tr>
							<th width=15% class="text-center lb fg fw">제목</th>
							<td width=35% class="text-center  bbu fgl"> 
								<input style="width:350px;" type="text" name="cust_serv_title" value="${servRead.cust_serv_title}" />
							</td>
							
							 <th width="15%" class="text-center lb fg fw">비밀번호</th>
           					 <td width="35%" class="text-center bbu fgl">
						     <input style="width: 350px;" type="password" name="cust_serv_pw" placeholder="비밀번호를 입력해 주세요">
               				  <!-- <input style="width: 350px;" type="password" name="enteredPassword"  value="${servRead.cust_serv_pw}"/> -->
           					 </td>
						</tr>
						<tr>
						<th width="15%" class="text-center lb fg fw" style="vertical-align: middle;">문의내역</th>
							<td colspan="4" class="text-left fg" valign="top" height="200">							
								<pre class="fgl" style="white-space: pre-wrap; border: none; background-color: white;">
								<textarea cols="100" rows="8" name="serv_content">${servRead.cust_serv_content}</textarea>
								</pre>
							</td>
						</tr>
						<tr>
							<td td colspan="4" class="text-right  ">
							<div> 
									<!-- <button type="submit" class="btn btn-sm btn-primary greylist atw" style="float: right;"  >완료</button> -->
									<button type="button" onclick="submitForm()" class="btn btn-sm btn-primary greylist atw" style="float: right;"  >완료</button>
							</div>
							</td>
						</tr>
					</table>
				</div>
			</div> 
		</form>
		



<script>
    // 폼 제출을 처리하는 함수
    function submitForm() {
        var form = document.getElementById("updateForm");
        var formData = new FormData(form);

        // AJAX 호출을 통해 폼 데이터를 서버로 전송
        $.ajax({
            url: "${contextPath}/serv/modify.do",
            type: "POST",
            data: formData,
            processData: false,
            contentType: false,
            success: function (response) {
                if (response.success) {
                    // 수정이 성공적으로 완료된 경우 성공 메시지 표시
                    alert(response.message);
                    // 수정이 성공하면 상세보기 페이지로 리다이렉트
                    window.location.href = "${contextPath}/serv/read.do?cust_serv_no=" + response.servVO.cust_serv_no;
                } else {
                    // 비밀번호가 일치하지 않는 경우 에러 메시지 표시
                    alert(response.message);
                }
            },
            error: function () {
                alert("게시물 수정 중 오류가 발생했습니다.");
            }
        });
    }
</script>
</body>
</html>