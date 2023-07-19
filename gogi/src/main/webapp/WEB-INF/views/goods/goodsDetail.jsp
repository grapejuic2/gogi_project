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
}

</style>
</head>
<body>
	<div class="goodsDetailContent">
	<div class="image-background">
		<img src="${contextPath}/thumbnails.do?goods_id=${goods.goods_id}&amp;fileName=${goods.file_name}" class="card-img-top" alt="...">
		<div class="content">
			<p class="goodsName">${goods.goods_name}</p>	        
	        <div class="text-right">
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
					        <option value="normal">--------------- 선택하세요 ---------------</option>
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
					      <input type="number" name="cart_count" class="numBox" min="1" max="20" value="1" readonly="readonly"/>
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
	            <button type="button" id="orderButton" onclick="order()">주문하기</button>
	        </div>
		</div> 
	</div>
	</div>
	
	
<script type="text/javascript">    
    //장바구니 추가
    
    /* document.getElementsByName("cart_count")와 document.getElementsByName("delivery_option")은 배열과 유사한 NodeList을 반환하므로, 
    	해당 이름을 가진 요소가 하나뿐인 경우 인덱스 0을 사용하여 해당 요소에 접근 */
    function add_cart(goods_id){
    	var cart_count=document.getElementsByName("cart_count")[0].value;
        var delivery_option=document.getElementsByName("delivery_option")[0].value;
        
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
</script>
		<div id="layer" style="visibility: hidden">
			<!-- visibility:hidden 으로 설정하여 해당 div안의 모든것들을 가려둔다. -->
			<div id="popup" >
				<!-- 팝업창 닫기 버튼 -->
				<font size="3.5" id="contents">
				<b>상품을 장바구니에 담았습니다.</b></font>
				<%-- <a href='${contextPath}/cart/myCartList.do'><input value="장바구니 보기" type="button" class="btn btn-secondary btn-sm"></a> --%>
				<a href="javascript:" onClick="javascript:imagePopup('close', '.layer01');">
					<!-- <input type="button" class="btn btn-secondary btn-sm" value="닫기"/> -->
				</a>
			</div>
		</div>
<!-- 로그인 상태를 <hidden> 태그에 저장합니다. -->
<input type="hidden" name="isLogOn" id="isLogOn" value="${isLogOn}"/>
</body>
</html>