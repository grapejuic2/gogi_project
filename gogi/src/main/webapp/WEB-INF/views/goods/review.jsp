<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<head>
<style>
.required {
    color: #DB0000; /* 원하는 색상으로 변경하세요 */
  }
button{
font-family: 'Noto Sans KR', sans-serif;
font-size:15px;
cursor: pointer;
border: 0;
width: 70px;
font-weight:500;
height: 35px;
margin-top: 10px;
background: #1D1D1D;
color: #FFFFFF;
}

.button{
text-align: right;
margin-right: 35px;
}

.label-group {
  width: 150px;
  text-align: left;
  margin-right: 10px;
}

.category {
	display: flex;
	justify-content: center;
}

 .title{
  font-family: 'Noto Sans KR', sans-serif;
  text-align: center;
  font-size: 30px;
  font-weight: 700;
  margin-bottom: 40px;
 }
 
 input[type="text"] {
    width: 60%; /* 원하는 길이로 설정 (예: 300px) */
    border: 1px solid #E8E8E8;
    padding-left:10px;
  }
 input[type="password"] {
    width: 60%; /* 원하는 길이로 설정 (예: 300px) */
    border: 1px solid #E8E8E8;
    padding-left:10px;
  }
  .frm_mod_member{
  width: 800px;
  padding:30px;
  padding-left:35px;
  padding-right:35px;
  margin: 0 auto; 
  font-family: 'Noto Sans KR', sans-serif;
  border: 1px solid #E8E8E8;
  margin-top: 40px;
  margin-bottom: 40px;
  
   }
   
   table{
   width:100%;
   align-items: center;
   }
   .form{
   align-items: center;
   margin-left: 27px;
   }
   
   .form input {
  font-family: 'Noto Sans KR', sans-serif;
  outline: 0;
  width: 500px;
  height: 40px;
  border: 1px solid #E8E8E8;
  margin: 5px 0; 
  padding-right:5px;
  box-sizing: border-box;
  font-size: 14px;
}

#mem_birth_y, #mem_birth_m, #mem_birth_d, #mem_tel1, #mem_tel2, #mem_tel3{
	width: 160px;
	margin-right: 10px;
}
</style>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>리뷰 페이지</title>
</head>

<body>
	<div class="frm_mod_member">
	  <div class="title">개인정보수정</div>
        <div class="form">
		<div class="tab_container">
		
			<div class="tab_content" id="tab1">
				<c:forEach var="image" items="${imageList }">
					<img src="${contextPath}/download.do?goods_id=${goods.goods_id}&fileName=${image.fileName}">
				</c:forEach>
			</div>
			
			<div class="tab_content" id="tab2">
			<table class="table table-striped table-hover">
  				<tr height="10" align="center" style="background:#00BFFE">
     				 <td width="7%"><b>번호</b></td>
    				 <td width="59%"><b>내용</b></td>
    				 <td width="10%"><b>별점</b></td>
    				 <td width="10%"><b>작성자</b></td>              
     				 <td width="14%" align="left">&nbsp;&nbsp;<b>작성일</b></td>
  				</tr>
			
					<c:choose>
						<c:when test="${reviewList == null}">
							<tr height="10">
				     			<td colspan="4">
					         		<p align="center">
					            		<b><span style="font-size:9pt;">등록된 리뷰가 없습니다.</span></b>
					        		</p>
				      			</td>  
			      			</tr>
			  			</c:when>
					
						<c:when test="${reviewList != null }">
							<c:forEach var="review" items="${reviewList }" varStatus="reviewNum">
							 	<tr align="center">
									<td>${reviewNum.count}</td>
									<td>${review.content}</td>
									<c:if test="${review.star == 5}"><td><img src="${contextPath}/resources/image/star1.jpg"><img src="${contextPath}/resources/image/star1.jpg"><img src="${contextPath}/resources/image/star1.jpg"><img src="${contextPath}/resources/image/star1.jpg"><img src="${contextPath}/resources/image/star1.jpg"></td></c:if>
									<c:if test="${review.star == 4}"><td><img src="${contextPath}/resources/image/star1.jpg"><img src="${contextPath}/resources/image/star1.jpg"><img src="${contextPath}/resources/image/star1.jpg"><img src="${contextPath}/resources/image/star1.jpg"></td></c:if>
									<c:if test="${review.star == 3}"><td><img src="${contextPath}/resources/image/star1.jpg"><img src="${contextPath}/resources/image/star1.jpg"><img src="${contextPath}/resources/image/star1.jpg"></td></c:if>
									<c:if test="${review.star == 2}"><td><img src="${contextPath}/resources/image/star1.jpg"><img src="${contextPath}/resources/image/star1.jpg"></td></c:if>
									<c:if test="${review.star == 1}"><td><img src="${contextPath}/resources/image/star1.jpg"></td></c:if>
									<td>${review.member_id}</td>
									<td align="left">
										${review.write_date}
										<c:if test="${isLogOn == true and review.member_id == memberInfo.member_id || isLogOn == true and memberInfo.member_id == 'admin'}">
											&nbsp;<input type=button value="X" onClick="deleteReview('${review.review_id}')" />
										</c:if>
									</td>
										
							 	</tr>
							 </c:forEach>
						</c:when>
		   			</c:choose>
				</table>
				<!-- 리뷰쓰기 버튼 -->
				<input type=button class="btn btn-secondary btn-sm" value="후기 작성" onClick="fn_review_Form('${isLogOn}', '${contextPath}/board/review/reviewForm.do', '${goods.goods_id}')"   />
			</div>
			
			<script>
			  // 리뷰글 총 갯수를 출력하는 함수
			  function showReviewCount(count) {
			    var reviewCount = document.getElementById("review_count");
			    reviewCount.innerHTML =  + count + "개";
			  }
		
			  // 리뷰글 총 갯수를 표시할 span 요소에 데이터 바인딩
			  showReviewCount(${fn:length(reviewList)});
			</script>
			</div>
		</div>
	</div>
</body>
</html>