	<%@ page language="java" contentType="text/html; charset=utf-8"
	    pageEncoding="utf-8" 	isELIgnored="false"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
	<c:set var="goods"  value="${goodsMap.goodsVO}"  />
	<c:set var="imageList"  value="${goodsMap.imageList }"  />
	<c:set var="goods_sort" value="${goods.goods_sort }"/>
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<link href="${contextPath}/resources/css/goodsDetail.css" rel="stylesheet" type="text/css">
	<!-- 폰트:나눔고딕 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<title>Insert title here</title>
	<style>
	#layer {
		z-index: 2;
		position: absolute;
		top: 0px;
		left: 0px;
		width: 100%;
	}
	
	#popup {
		z-index: 3;
		position: fixed;
		text-align: center;
		left: 40%;
		top: 50%;
		width: 300px;
		height: 100px;
		background-color: white;
		border: 4px solid #87CEFA;
		font-family: 'Nanum Gothic', sans-serif' !important;
		border-radius: 10px;
		line-height: 90px;
	}
	
	#close {
		z-index: 4;
		float: right;
		margin-left: 15px;
	}
	
	/* Style the buttons that are used to open the tab content */
	.tab button {
		background-color: inherit;
		float: left;
		border: none;
		outline: none;
		cursor: pointer;
		padding: 14px 16px;
		transition: 0.3s;
	}
	
	/* Change background color of buttons on hover */
	.tab button:hover {
		text-decoration: underline;
	}
	
	/* Create an active/current tablink class */
	.tab button.active {
		color: black;
		text-decoration: underline;
	}
	
	/* Style the tab content */
	.tabcontent {
		display: none;
		padding: 6px 12px;
		border: 1px solid #ccc;
		border-top: none;
	}
	.tab{
	    display: flex;
	    justify-content: center;
	    text-align: center;
	    height: 100px;
	    border-bottom: 1px solid #ccc;
	}
	.tab .tablinks{
	height: 100px;
	width: 200px;
	font-weight: 700;
	font-size: 17px;
	color: #909090;
	}
	.tab-menu{
	font-family: 'Nanum Gothic', sans-serif' !important;
	}
	#goodsDetail .goods_detail{
	   justify-content: center;
	    text-align: center;
	}
	.goods_detail img {
	  display: block; /* 이미지들을 블록 레벨 요소로 설정하여 아래로 배치 */
	  margin: 10px auto; /* 이미지들을 가운데 정렬하기 위해 margin 사용 */
	}
	
	/* 첫 번째 열의 모든 <td> 요소의 너비를 늘립니다. */
	#goodsInfo .goods_info table  {
	   justify-content: center;
	}
	#goodsInfo .goods_info{
		font-family: 'Nanum Gothic', sans-serif' !important;
 		margin-left: 0;
	   	}
	.tab-menu {
	   text-align: center; /* 텍스트를 중앙에 정렬합니다. */
	}
	
	.goods_detail_tab {
	   display: inline-block; /* 테이블을 블록 레벨로 표시하여 중앙에 정렬합니다. */
	   text-align: left; /* 테이블 안의 텍스트는 왼쪽으로 정렬합니다. */
	   width:65%;
	   margin-bottom: 30px;
	}
	
	.goodsInfo_table{
		border-collapse: separate; /* 테이블 경계를 병합하지 않고 개별적으로 표시 */
	    border-spacing: 0; /* 테이블 셀 간격 없음 */
	    border-top: 1px solid #000000; /* 테이블 상단 테두리 설정 */
	    border-bottom: 1px solid #000000; /* 테이블 하단 테두리 설정 */
	    width:90%;
 		padding: 10px 0; /* 행 간격을 조절하기 위해 padding 값을 설정합니다. */
	    border-spacing: 0 10px; /* 상하 여백은 0, 좌우 여백은 10px로 설정 */
	    font-size:15px;
	}
	.goods_info_title{
		font-size:30px;
		font-weight: 800;
		margin-top: 20px;
	}


	</style>
	
	</head>
	<body>
		<div class="goodsDetailContent">
		<div class="image-background">
			<img src="${contextPath}/thumbnails.do?goods_id=${goods.goods_id}&amp;fileName=${goods.file_name}" class="card-img-top" alt="...">
			<div class="content">
				<p class="goodsName">${goods.goods_name}</p>	        
		        <div class="text">
		          <div class="100_price" style="font-size: 14px; margin-top: 20px;">
		          	<fmt:formatNumber value="${Math.ceil(goods.goods_price/100)}" type="number" var="goods_price_100g" />100g당 ${goods_price_100g}원
		          </div>
				  <div class="price">			  
					  <fmt:formatNumber value="${goods.goods_price}" type="number" var="goods_price" />기준가 ${goods_price}원
					  <fmt:formatNumber value="${goods.goods_weight}" type="number" var="goods_weight" />(${goods_weight}g)			  
				  </div>
		            <hr style="color:#9F9FA0;">
		            <div class="option">
				        <table>
						  <tr class="option-row" >
						    <td>
						      <span style="font-weight: 700;">배송옵션</span>
						    </td>
						    <td>
						      <select name="delivery_option" id="delivery_option">
							    <option value="normal">----------------- 선택하세요 -----------------</option>
							    <option value="camp">캠핑장 직접배송</option>
							  </select>
						    </td>
						  </tr>
						  <tr></tr><tr> </tr>
						  <tr class="option-row">
						    <td>
						      <span style="font-weight: 700;">수량</span>
						    </td>
						    <td class="numBox-cell">
						      <button type="button" class="minus">-</button>
						      <input type="number" id="cart_count" name="cart_count" class="numBox" min="1" max="20" value="1" readonly="readonly"/>
						      <button type="button" class="plus">+</button>
						    </td>
						  </tr>					  
						</table>
	   				</div>
	   				<script>
							// 수량 증가 버튼 클릭 이벤트
						    $(".plus").click(function() {
						        var num = parseInt($(".numBox").val());
						        var maxQuantity = 20; // 상품의 최대 수량
	
						        if (num < maxQuantity) {
						            $(".numBox").val(num + 1);
						        }
						    });
	
						    // 수량 감소 버튼 클릭 이벤트
						    $(".minus").click(function() {
						        var num = parseInt($(".numBox").val());
	
						        if (num > 1) {
						            $(".numBox").val(num - 1);
						        }
						    });
						  </script>
		        </div>
		        <div class="text-right">
		            <a class="cart" href="javascript:add_cart('${goods.goods_id}')"><button type="button" id="cartButton" >장바구니</button></a>
		            <a class="buy" href="javascript:fn_order_each_goods('${goods.goods_id}','${goods.goods_name}','${goods.goods_price}','${goods.file_name}');"><button type="button" id="orderButton">주문하기</button></a>
		        </div>
			</div> 
		</div>
		</div>
		
		
		<!-- 하단 탭 메뉴  -->
		<div class="tab-menu">
					<!-- Tab 이름 -->
					<div class="tab">
						<button class="tablinks" onclick="deliveryOpen(event, 'goodsDetail')">상품설명</button>
						<button class="tablinks" onclick="deliveryOpen(event, 'review')">리뷰</button>
						<button class="tablinks" onclick="deliveryOpen(event, 'goodsInfo')">상품안내</button>
					</div>
	
					<!-- 상품설명 -->
					<div id="goodsDetail" class="tabcontent" style="display: block;">
						<div class="goods_detail">
							<c:if test="${goods_sort eq 'PIG' }">
								<img  src="${contextPath}/resources/images/goods_detail_image/pork_detail.png">
								<div><img  src="${contextPath}/resources/images/goods_detail_image/delivery.png" style="display: block; margin-top: 10px;"></div>
							</c:if>
							<c:if test="${goods_sort eq 'COW' }">
								<img  src="${contextPath}/resources/images/goods_detail_image/cow_detail.png">
							</c:if>
							<c:if test="${goods_sort eq 'CHICKEN' }">
								<img  src="${contextPath}/resources/images/goods_detail_image/chicken_detail.png">
							</c:if>
							<c:if test="${goods_sort eq 'MEALKIT' and goods.goods_id==6 }">
								<div><img  src="${contextPath}/resources/images/goods_detail_image/mealkit4.png"></div>
		            			<div><img  src="${contextPath}/resources/images/goods_detail_image/delivery.png" style="display: block; margin-top: 10px;"></div>
							</c:if>					
						</div>					
					</div>
	
					<!-- 리뷰 -->
					<div id="review" class="tabcontent">
						<div class="review">
						
						</div>
					</div>
	
	
						<!-- 상품안내 -->
						<div id="goodsInfo" class="tabcontent">
							<div class="goods_detail_tab">
							<p class="goods_info_title">상품기본정보</p><br>	 
								<table class="goodsInfo_table">
									<tr>
										<td>·품목명</td>
										<td>${goods.goods_name}</td>
										<td></td>
									</tr>
									<tr>
										<td>·내용량</td>
										<td>${goods.goods_weight}g / 제품에 별도 표기</td>
										<td></td>
									</tr>
									<tr>
										<td>·생산지 및 소재지</td>
										<td>${goods.goods_seller } / ${goods.goods_country }</td>
										<td></td>
									</tr>
									<tr>
										<td>·원산지</td>
										<td>국내산</td>
										<td></td>
									</tr>
									<tr>
										<td>·소비기한</td>
										<td>${goods.goods_intro }</td>
										<td></td>
									</tr>
									<tr>
										<td>·보관방법</td>
										<td>-2~10℃ 냉장 보관</td>
										<td></td>
									</tr>
								</table>
							</div>
							
							<div class="goods_detail_tab">
								<p class="goods_info_title">교환/환불 안내</p><br>	 
								<table class="goodsInfo_table"  style="border-bottom: none; font-size:15px;">
									<tr >
										<td>- 신선식품이기 때문에 단순 변심으로 인한 개인적인 사유로는 교환 및 환불이 불가합니다.</td>									
									</tr>
								
									<tr>
										<td>- 상품의 변질, 이물질 발견, 아이스박스 및 아이스팩이 파손되어 배송될 경우 고객센터(1800-0202)로 전화주시면 곧바로<br>&nbsp;&nbsp;교환/환불 해드리겠습니다.</td>										
									</tr>
									
									<tr>
										<td>- 고객센터 운영 시간은 월-토요일 오전 8시 30분-5시 30분이며, 운영 시간 이외에는 전화 문의가 어렵습니다.<br>
											   &nbsp;&nbsp;고객센터 1:1 문의 혹은 카카오톡 플러스친구 @육룰로 사진과 함께 내용을 적어 보내주시면
											   담당자가 확인 후 <br>&nbsp;&nbsp;빠르게 처리 도와드리겠습니다.</td>										
									</tr>
								</table>
							</div>
						</div>
	</div>
		
		
		
	<script type="text/javascript">    
		//상품옵션값 보내기 위한 함수
		function getDeliveryOption() {
		    var deliveryOption  = document.getElementById("delivery_option").value;
		    return deliveryOption;
		}
	    
	    
	    //장바구니 추가   
	    /* document.getElementsByName("cart_count")은 배열과 유사한 NodeList을 반환하므로, 
	    	해당 이름을 가진 요소가 하나뿐인 경우 인덱스 0을 사용하여 해당 요소에 접근 */
	    function add_cart(goods_id){
	    	var cart_count=document.getElementsByName("cart_count")[0].value;
	     	var delivery_option = getDeliveryOption(); // getDeliveryOption() 함수를 호출하여 옵션 값을 얻음
	        
	    	$.ajax({
	    		type:"post",
	    		async:false,
	    		url: "${contextPath}/cart/addGoods.do",
	    		data:{goods_id:goods_id, cart_count:cart_count, delivery_option:delivery_option},
	    		success: function(data, textStatus){
	    			if(data.trim()=="add_success"){
	    				imagePopup('open','layer01');
	    			}else if(data.trim()=="already_existed"){
	    				alert("이미 카트에 등록된 제품입니다.");
	    			}
	    		},
	    		error: function(data, textStatus){
	    			alert("에러가 발생했습니다."+data);
	    		},
	    		complete: function(data, textStatus){
	    			alert("장바구니에 추가되었습니다.");
	    		}
	    	});
	    }
	    
	    /* 장바구니 추가시 팝업창 */
		function imagePopup(type) {
			if (type == 'open') {
				// 팝업창을 연다.
				jQuery('#layer').attr('style', 'visibility:visible');
	
				// 페이지를 가리기위한 레이어 영역의 높이를 페이지 전체의 높이와 같게 한다.
				jQuery('#layer').height(jQuery(document).height());
			}
	
			else if (type == 'close') {
	
				// 팝업창을 닫는다.
				jQuery('#layer').attr('style', 'visibility:hidden');
			}
		}
	    
		function fn_order_each_goods(goods_id, goods_name, goods_price, file_name) {
		    var _isLogOn = document.getElementById("isLogOn");
		    var isLogOn = _isLogOn.value;
	
		    if (isLogOn === "false" || isLogOn === '') {
		        alert("로그인 후 주문이 가능합니다!!");
		    }
	
		    var order_quantity = document.getElementById("cart_count").value;
		    var delivery_option = document.getElementById("delivery_option").value; // 배송옵션 추가
		    var total_price = parseInt(goods_price) * parseInt(order_quantity);
	
		    var formObj = document.createElement("form");
		    var i_goods_id = document.createElement("input");
		    var i_goods_name = document.createElement("input");
		    var i_goods_price = document.createElement("input");
		    var i_file_name = document.createElement("input");
		    var i_order_quantity = document.createElement("input");
		    var i_delivery_option = document.createElement("input"); // 배송옵션을 넘기기 위한 input 엘리먼트 추가
	
		    i_goods_id.name = "goods_id";
		    i_goods_name.name = "goods_name";
		    i_goods_price.name = "goods_sales_price";
		    i_file_name.name = "file_name";
		    i_order_quantity.name = "order_quantity";
		    i_delivery_option.name = "order_delivery_option"; // 배송옵션을 넘기기 위해 name 설정
		    
		    i_goods_id.value = goods_id;
		    i_goods_name.value = goods_name;
		    i_goods_price.value = goods_price;
		    i_file_name.value = file_name;
		    i_order_quantity.value = order_quantity;	   
		    i_delivery_option.value = delivery_option; // 배송옵션을 넘기기 위해 value 설정
	
		    formObj.appendChild(i_goods_id);
		    formObj.appendChild(i_goods_name);
		    formObj.appendChild(i_goods_price);
		    formObj.appendChild(i_file_name);
		    formObj.appendChild(i_order_quantity);
		    formObj.appendChild(i_delivery_option); // 배송옵션을 넘기기 위한 input 엘리먼트를 폼에 추가
	
		    document.body.appendChild(formObj);
		    formObj.method = "post";
		    formObj.action = "${contextPath}/order/orderEachGoods.do";
		    formObj.submit();
		}
	    
	</script>
	<!--Tab 관련  -->
		<script type="text/javascript">
			// 페이지 로드 시 상품설명 탭이 기본으로 선택되도록 설정
			  document.addEventListener("DOMContentLoaded", function() {
			    // "상품설명" 탭 버튼을 선택
			    var defaultTabButton = document.querySelector(".tablinks");
			    defaultTabButton.click(); // 프로그래밍 방식으로 클릭 이벤트 발생
			  });
	
			function deliveryOpen(evt, deliveryName) {
				var i, tabcontent, tablinks;
	
				// Get all elements with class="tabcontent" and hide them
				tabcontent = document.getElementsByClassName("tabcontent");
				for (i = 0; i < tabcontent.length; i++) {
					tabcontent[i].style.display = "none";
				}
	
				// Get all elements with class="tablinks" and remove the class "active"
				tablinks = document.getElementsByClassName("tablinks");
				for (i = 0; i < tablinks.length; i++) {
					tablinks[i].className = tablinks[i].className.replace(
							" active", "");
				}
	
				// Show the current tab, and add an "active" class to the button that opened the tab
				document.getElementById(deliveryName).style.display = "block";
				evt.currentTarget.className += " active";
			}
		</script>
	
	
	<div id="layer" style="visibility: hidden">
	<!-- visibility:hidden 으로 설정하여 해당 div안의 모든것들을 가려둔다. -->
	<div id="popup" >
		<!-- 팝업창 닫기 버튼 -->
		<font size="3.5" id="contents">
		<b>상품을 장바구니에 담았습니다.</b></font>
		<a href='${contextPath}/cart/myCartList.do'><input value="장바구니 보기" type="button" class="btn btn-secondary btn-sm"></a>
		<a href="javascript:" onClick="javascript:imagePopup('close', '.layer01');">
			<input type="button" class="btn btn-secondary btn-sm" value="계속 쇼핑하기"/> 
		</a>
	
		</div>
	</div>
	<!-- 로그인 상태를 <hidden> 태그에 저장합니다. -->
	<input type="hidden" name="isLogOn" id="isLogOn" value="${isLogon}"/>
	
	</body>
	</html>