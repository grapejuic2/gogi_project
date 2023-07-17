<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
  <style>
    .navbar.navbar-inverse { padding: 10px; padding-left: 200px; padding-right: 200px; background:white; border:none; }
    .nav.navbar-nav { margin-top: 70px; margin-left: 40px; }
    ul.nav.navbar-nav li a:hover{color:#000000;}
    .hidden { display: none; }
  </style>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script>
    $(document).ready(function() {
      var isLogOn = false; // 로그인 여부를 확인하는 변수, 실제 값에 따라 변경되어야 합니다.

      function toggleForm() {
        if (isLogOn) {
          $('.logged-in').removeClass('hidden');
          $('.logged-out').addClass('hidden');
        } else {
          $('.logged-in').addClass('hidden');
          $('.logged-out').removeClass('hidden');
        }
      }

      // 로그인 상태 변경 시 폼 변경
      toggleForm();

      // 로그인 버튼 클릭 시 로그인 상태 변경
      $('#loginBtn').click(function() {
        isLogOn = true; // 로그인 상태로 변경되어야 합니다.
        toggleForm();
      });

      // 로그아웃 버튼 클릭 시 로그인 상태 변경
      $('#logoutBtn').click(function() {
        isLogOn = false; // 로그아웃 상태로 변경되어야 합니다.
        toggleForm();
      });
    });
  </script>
</head>
<body>
  <nav class="navbar navbar-inverse">
    <div class="container-fluid">
      <div class="navbar-header">
        <a href="${contextPath}/main/main.do"><img src="${contextPath}/resources/images/logo/logo.png" width="100px"></a>
      </div>
      <ul class="nav navbar-nav" style="font-size: 18px;">
        <li><a href="${contextPath}/goods/shop.do">쇼핑하기</a></li>
        <li><a href="#">배송안내</a></li>
        <li><a href="#">공지사항</a></li>
        <li><a href="#">고객센터</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li class="logged-out"><a href="${contextPath}/member/memberForm.do"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
        <li class="logged-out"><a href="${contextPath}/member/loginForm.do"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
        <li class="logged-in hidden"><a href="#"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
        <li class="logged-in hidden"><a href="#"><span class="glyphicon glyphicon-user"></span> 마이페이지</a></li>
        <li class="logged-in hidden"><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> 장바구니</a></li>
      </ul>
    </div>
  </nav>
</body>
</html>

<!-- <script type="text/javascript">

	var loopSearch=true; // 제시된 키워드를 클릭하면 keywordSearch() 함수의 실행을 중지시킵니다.
	function keywordSearch(){
		if(loopSearch==false)
			return;
	var value=document.frmSearch.searchWord.value;
		$.ajax({
			type : "get",
			async : true, // false인 경우 동기식으로 처리합니다.
			url : "${contextPath}/goods/keywordSearch.do",
			data : {keyword:value},
			success : function(data, textStatus) {
				if(data != null && data != "")
			    var jsonInfo = JSON.parse(data); // 전송된 데이터를 JSON으로 파싱합니다.
				displayResult(jsonInfo); // 전송된 JSON 데이터를 표시합니다.
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			},
			complete : function(data, textStatus) {
				//alert("작업을완료 했습니다");
				
			}
		}); //end ajax	
	}
	
	function displayResult(jsonInfo){
		if(jsonInfo != null && jsonInfo != "")
		var count = jsonInfo.keyword.length; // JSON 데이터 개수를 구합니다.
		if(count > 0) {
		    var html = '';
		    // JSON 데이터를 차례대로 <a> 태그를 이용해 키워드 목록을 만듭니다.
		    for(var i in jsonInfo.keyword){
			   html += "<a href=\"javascript:select('"+jsonInfo.keyword[i]+"')\">"+jsonInfo.keyword[i]+"</a><br/>";
		    }
		    // <a> 태그로 만든 키워드 목록을 <div> 태그에 차례대로 표시합니다.
		    var listView = document.getElementById("search-box-list");
		    listView.innerHTML = html;
		    show('search-box');
		    
		}else{
		    hide('search-box');
		} 
	}
	
	function select(selectedKeyword) {
		 document.frmSearch.searchWord.value=selectedKeyword;
		 loopSearch = false;
		 hide('search-box');
	}
	
	function show(elementId) {
		var element = document.getElementById(elementId);
		if(element) {
			element.style.display = 'block';
		}
	}
	
	function hide(elementId){
	   var element = document.getElementById(elementId);
	   if(element){
		  element.style.display = 'none';
	   }
	}
	
</script> -->



	
<%-- 	<nav class="navbar navbar-expand-lg fixed-top" style="background:#00BFFE; margin-top:-10px;">
	
	    <div class="container-fluid">
	    
		    <a class="navbar-brand" href="${contextPath}/main/main.do">
		    	<img src="${contextPath}/resources/image/title1.jpg" style="width:120;height:30px;"/>
		    </a>
		    
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
		        <span class="navbar-toggler-icon"></span>
		    </button>
		    
		    <div class="collapse navbar-collapse justify-content-between" id="collapsibleNavbar">
		    
		        <ul class="navbar-nav">
		        	
		        	<c:choose>
		            
						<c:when test="${isLogOn==true and not empty memberInfo}">
						
							<li class="nav-item">
								<a class="nav-link" href="${contextPath}/member/logout.do">로그아웃</a>
							</li>
							
							<c:if test="${isLogOn==true and memberInfo.member_id =='admin' }">
						        <li class="nav-item dropdown">
						        <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							    관리자메뉴
							    </a>
									<ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
										<li><a class="dropdown-item" href="${contextPath}/admin/goods/adminGoodsMain.do">상품관리</a></li>
							            <li><a class="dropdown-item" href="${contextPath}/admin/order/adminOrderMain.do">주문관리</a></li>
							            <li><a class="dropdown-item" href="${contextPath}/admin/member/adminMemberMain.do">회원관리</a></li>
									</ul>
								</li>
							</c:if>
							
						</c:when>
						
						<c:otherwise>
						
							<li class="nav-item">
								<a class="nav-link" href="${contextPath}/member/loginForm.do">로그인</a>
							</li>
							
							<li class="nav-item">
			         			<a class="nav-link" href="${contextPath}/member/memberForm.do">회원가입</a>
			     	   		</li>
							
						</c:otherwise>
						
					</c:choose>
		            
		        </ul> --%>
		        
		        
 		<%-- 		<ul class="navbar-nav" id="navbar-nav-2">
		            
		            <li class="nav-item">
		                <a class="nav-link" href="${contextPath}/main/main.do">홈</a>
		            </li>
		            
		            <li class="nav-item">
		                <a class="nav-link" href="${contextPath}/admin/notice/listNotice.do">공지사항</a>
		            </li>
		            
		            <li class="nav-item">
		                <a class="nav-link" href="${contextPath}/board/qna/listQna.do">질문과답변</a>
		            </li>
		            
		            <li class="nav-item">
		                <a class="nav-link" href="${contextPath}/board/review/listReview.do">후기</a>
		            </li>
		            
		            <c:choose>
		            	<c:when test="${isLogOn==true and not empty memberInfo}">
		            
				            <li class="nav-item">
								<a class="nav-link" href="${contextPath}/cart/myCartList.do">장바구니</a>
							</li>
									
							<li class="nav-item">
								<a class="nav-link" href="${contextPath}/mypage/myPageMain.do">마이페이지</a>
							</li>
							
						</c:when>
					</c:choose>
		            
		            <form class="d-flex align-items-center justify-content-center" role="search" name="frmSearch" action="${contextPath}/goods/searchGoods.do" style="margin-top:17px">
						<input class="form-control me-2" name="searchWord" type="search" placeholder="제품 검색" aria-label="Search" style="height:30px" onKeyUp="keywordSearch()">
						<button class="btn btn-outline-light btn-sm" type="submit" style="width:100px;">검&nbsp;색</button>
					</form>
					<div id="search-box">
				        <div id="search-box-list"></div>
				   </div>
					
		        </ul>
</nav> 

</body>
</html> --%>