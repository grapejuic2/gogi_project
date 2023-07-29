<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
@import url(https://fonts.googleapis.com/css?family=Roboto:300);

#mem_id, #mem_name, #mem_email, #mem_pw, #mem_pw_confirm{
	width: 200px;
}
#mem_birth_y, #mem_birth_m, #mem_birth_d, #mem_tel1, #mem_tel2, #mem_tel3{
	width: 120px;
}
.form-group.address-container {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  margin-bottom: 10px;
}

/* Adjust width of the address containers as needed */
.address-container {
  width: 100%; /* This will make the address fields occupy the full width of the form */
}

/* Optional: Adjust spacing between address fields */
.address-container input {
  margin-bottom: 5px;
}

.required {
    color: #DB0000; /* 원하는 색상으로 변경하세요 */
}

</style>

<link href="${contextPath}/resources/css/mypage/mypageForm.css" rel="stylesheet" type="text/css">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>주문내역</title>

</head>
<body>
	<div class="frm_mod_member">
		<div class="memberForm-text">
			<a href="${contextPath}/main/main.do"><img
				src="${contextPath}/resources/images/logo/logo2.png" alt="logo2" width="150px"  style="text-align: center;"></a>
		</div>
		
	<!-- <div class="title_underline" id="order-history-title"> -->
		<h3 style="text-align: center;"><b>주문 배송 조회</b></h3>
	<!-- </div> -->
	
	<table class="form">
		<tbody align=center >
			<tr style="background:#e8e8e8; color: #1d1d1d;" >
				<td><b>주문번호</b></td>
				<td><b>주문일자</b></td>
				<td><b>주문내역</b></td>
				<td><b>주문금액/수량</b></td>
				<td><b>주문상태</b></td>
				<td><b>주문자</b></td>
				<td><b>수령자</b></td>
				<td><b>주문취소</b></td>
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
            <tr>       
				<td>
				  ${item.order_id }
				</td>
				<td >
				 ${item.order_time}
				</td>
				<td> 
				    <strong>
					   <c:forEach var="item2" items="${myOrderHistList}" varStatus="j">
				          <c:if  test="${item.order_id == item2.order_id}" >
				            <a href="${contextPath}/goods/goodsDetail.do?goods_id=${item2.goods_id }">${item2.goods_name }</a><br>
				         </c:if>   
					 </c:forEach>
					 </strong>
				</td>
				<td>
				   <strong>
				      <c:forEach var="item2" items="${myOrderHistList}" varStatus="j">
				          <c:if  test="${item.order_id == item2.order_id}" >
				            ${item2.goods_sales_price*item2.order_quantity }원/${item2.order_quantity }<br>
				         </c:if>   
					 </c:forEach>
				   </strong>
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
					       	주문취소
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
</script>
</body>
</html>
