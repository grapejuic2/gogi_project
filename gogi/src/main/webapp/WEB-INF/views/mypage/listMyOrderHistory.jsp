<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.form{
margin: 0;
width:100%;
}
.frm_mod_member{
  width: 1100px;
  padding:30px;

  margin: 0 auto; 
  font-family: 'Noto Sans KR', sans-serif;
  border: 1px solid #E8E8E8;
  margin-top: 40px;
  margin-bottom: 40px;  
}

table{
  width:100%;
  align-items: center;
  flex-direction: column;
  margin-top:20px;
  font-family: 'Noto Sans KR', sans-serif;
  border-collapse: separate; 
   border: 1px solid #E8E8E8;
}
 .title{
  font-family: 'Noto Sans KR', sans-serif;
  text-align: center;
  font-size: 30px;
  font-weight: 700;
  margin-bottom: 40px;
 }
 
  td {
  border-top: 1px solid #ddd; /* 위쪽에 border 추가 */
  padding: 15px;
  vertical-align: middle;
}
.required {
    color: #DB0000; /* 원하는 색상으로 변경하세요 */
  }
.cancel-order-btn{
border:none;
height: 30px;
}

.a{
border:none;
height: 30px;
}  
 
</style>


<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>주문내역</title>

</head>
<body>
	<div class="frm_mod_member">		
		
	<div class="title">
		주문 배송 조회
	</div> 
	
	<table class="form">
		<tbody align=center >
			<tr style="background:#1D1D1D;color: #FFFFFF;font-size: 17px; height: 35px; padding:5px;" >
				<td>주문번호</td>
				<td>주문일자</td>
				<td>주문내역</td>
				<td>주문금액/수량</td>
				<td>주문상태</td>
				<td>주문자</td>
				<td>수령자</td>
				<td>주문취소</td>
				<td>리뷰</td>
			</tr>
   <c:choose>
     <c:when test="${empty myOrderHistList }">			
			<tr>
		       <td colspan=8 class="fixed">
				  주문한 상품이 없습니다.
			   </td>
		     </tr>
	 </c:when>
	 <c:otherwise> 
     <c:forEach var="item" items="${myOrderHistList }" varStatus="i">
        <c:choose>
          <c:when test="${item.order_id != pre_order_id }">   
            <tr style="font-size: 15px; padding:10px ; border-top: 1px solid #ddd; /* 위쪽에 border 추가 */">       
				<td style="font-weight: 500;">
				  ${item.order_id }
				</td>
				<td>
				<fmt:formatDate value="${item.order_time}" pattern="yyyy년 MM월 dd일 HH시 mm분" var="orderTime"/>
				 ${orderTime}
				</td>
				<td style="text-align: left;"> 				
				   <c:forEach var="item2" items="${myOrderHistList}" varStatus="j">
			          <c:if  test="${item.order_id == item2.order_id}" >
			            <a href="${contextPath}/goods/goodsDetail.do?goods_id=${item2.goods_id }">${item2.goods_name }</a><br>
			         </c:if>   
				 </c:forEach>			
				</td>
				<td>
				
				  <c:forEach var="item2" items="${myOrderHistList}" varStatus="j">
                   <c:if  test="${item.order_id == item2.order_id}">
                         <fmt:formatNumber value="${item2.goods_sales_price*item2.order_quantity }" type="number" var="price" />
                         ${price }원/${item2.order_quantity }개<br>
                   </c:if>   
               </c:forEach>
			
				</td>
				<td>
				  <strong>
				    <c:choose>
					    <c:when test="${item.order_delivery_status=='delivery_prepared' }">
					       	배송준비중
					    </c:when>
					    <c:when test="${item.order_delivery_status=='delivering' }">
					       	배송중
					    </c:when>
					    <c:when test="${item.order_delivery_status=='finished_delivering' }">
					       	배송완료
					    </c:when>
					    <c:when test="${item.order_delivery_status=='cancel_order' }">
					       	<span class="required" >주문취소</span>
					    </c:when>
					    <c:when test="${item.order_delivery_status=='returning_goods' }">
					       	반품
					    </c:when>
				  </c:choose>
				  </strong>
				</td>
				<td>
				 ${item.mem_name } 
				</td>
				<td>
					${item.order_rec_name }
				</td>
				<td>
				    <c:choose>
				        <c:when test="${item.order_delivery_status =='delivery_prepared'}">
				            <input type="button" class="cancel-order-btn" value="주문취소" data-order-id="${item.order_id}" />
				        </c:when>
				        <c:otherwise>
				            <input type="button" class="cancel-order-btn" value="주문취소" data-order-id="${item.order_id}" />
				        </c:otherwise>
				    </c:choose>
				</td>
				<td>
					<a href="${contextPath}/review/reviewForm.do">리뷰작성</a>
				</td>
			</tr>
			<c:set  var="pre_order_id" value="${item.order_id }" />
		   </c:when>	
	  </c:choose>		
	</c:forEach>
	</c:otherwise>
  </c:choose>			   
		</tbody>
	</table>
     	
	<div class="clear"></div>
	</div>
	
	<script>
	function search_order_history(fixedSearchPeriod){
		var formObj=document.createElement("form");
		var i_fixedSearch_period = document.createElement("input");
		i_fixedSearch_period.name="fixedSearchPeriod";
		i_fixedSearch_period.value=fixedSearchPeriod;
	    formObj.appendChild(i_fixedSearch_period);
	    document.body.appendChild(formObj); 
	    formObj.method="get";
	    formObj.action="${contextPath}/mypage/listMyOrderHistory.do";
	    formObj.submit();
	}
	
	$(document).ready(function() {
	    $('.cancel-order-btn').on('click', function() {
	        var orderId = $(this).data('order-id');
	        fn_cancel_order(orderId);
	    });
	});
	
	function fn_cancel_order(order_id){
		var answer=confirm("주문을 취소하시겠습니까?");
		if(answer==true){
			var formObj=document.createElement("form");
			var i_order_id = document.createElement("input"); 
		    
		    i_order_id.name="order_id";
		    i_order_id.value=order_id;
			
		    formObj.appendChild(i_order_id);
		    document.body.appendChild(formObj); 
		    formObj.method="post";
		    formObj.action="${contextPath}/mypage/cancelMyOrder.do";
		    formObj.submit();	
		}
	}
	
	//리뷰 로그인 여부
	function fn_review_Form(isLogOn,url,goods_id) {
		if (isLogOn != '' && isLogOn != 'false'){
			var form = document.createElement("form");
			form.setAttribute("method", "post");
			form.setAttribute("action", url);
			var Goods_IdInput = document.createElement("input");
			Goods_IdInput.setAttribute("type", "hidden");
			Goods_IdInput.setAttribute("name", "goods_id");
			Goods_IdInput.setAttribute("value", goods_id);

			form.appendChild(Goods_IdInput);
			document.body.appendChild(form);
			form.submit();
		}else {
			alert("로그인 후 글쓰기가 가능합니다.");
			location.href = "${contextPath}/member/loginForm.do?action=/board/review/reviewForm.do&goods_id="+goods_id;
		}
	}
	
	 /* 리뷰삭제 */
	 function deleteReview(review_id){
		$.ajax({
		    type : "post",
		    async : true, //false인 경우 동기식으로 처리한다.
		    url : "${contextPath}/review/removeReview.do",
		    data: {review_id:review_id},
		    success : function(data, textStatus) {
		    	location.reload();
		    	alert("리뷰를 삭제했습니다!!");
		            tr.style.display = 'none';
		    },
		    error : function(data, textStatus) {
		    	alert("에러가 발생했습니다."+textStatus);
		    },
		    complete : function(data, textStatus) {
		    	//alert("작업을 완료 했습니다");
		    }
		}); //end ajax	
	}
	
</script>
</body>
</html>
