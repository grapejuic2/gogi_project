<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="delivery_fee" value="3500"/>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="httpps://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>

<style>
.detail_table{
 display: flex;
  flex-direction: column;
  align-items: left;
  margin-top:20px;
  margin-left: 30px;
  font-family: 'Noto Sans KR', sans-serif;
  font-weight:400;
  width:90%;
  border-collapse: separate;
}
.detail_table table{
  margin-top: 10px;
  margin-bottom: 40px;
  text-align: left;
  border-collapse: separate; /* 'collapse'에서 'separate'로 변경 */
  width:100%;
}
 .detail_table table {
    width: 100%;
  }

  .detail_table td {
    text-align: left;
  }
  #hp1{
 font-family: 'Noto Sans KR', sans-serif;
  outline: 0;
  height: 40px;
  border: 1px solid #E8E8E8;
  margin: 5px 5px 5px 0;
  padding: 10px;
  box-sizing: border-box;
  font-size: 14px;
}

.payment_table{
	font-family: 'Noto Sans KR', sans-serif;
	 font-size: 15px;
	 margin-top: 30px;
 	margin-left: 30px;
 	font-weight: 400;
}
  .payment_table td {
	padding:5px;
  }
   /* 첫 번째 열의 넓이 조정 */
  .payment_table td:first-child {
    width: 100px; /* 원하는 넓이로 조정하세요 */
  }
  
  .detail_table td:first-child {
   width: 100px; /* 원하는 넓이로 조정하세요 */
  }
  
   table td:second-child {
   margin-left: 30px; /* 원하는 넓이로 조정하세요 */
  }
  
  .list_view{
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-top:20px;
  margin-bottom:40px;
  font-family: 'Noto Sans KR', sans-serif;
  width:100%;
  border-collapse: separate; /* 테이블 셀 경계를 분리합니다. */
    /* 테이블 셀 사이의 간격을 10px로 설정합니다. */
}


  .list_view td {
    width: 200px;
  }
  .list_view th, .list_view td {
  border-top: 1px solid #E8E8E8; /* 위쪽에 border 추가 */
  padding: 8px;
  vertical-align: middle;
}
H1{
margin-left: 30px;
font-family: 'Noto Sans KR', sans-serif;
display: flex;
font-size: 19px; 
font-weight: 500;
}


  .detail_table td {
    text-align: left;
    padding: 5px; /* 셀 내부 여백을 추가합니다. */
  }
  
  .detail_table2{
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-top:20px;
  margin-left: 30px;
  font-family: 'Noto Sans KR', sans-serif;
  width:90%;
  border-collapse: separate;
   border: 1px solid #E8E8E8;
   padding:10px;
  }

 .detail_table2 td:first-child {
   width: 150px; /* 원하는 넓이로 조정하세요 */
  }

 .detail_table2 td{
 padding: 5px; 
 }
.list_view table{
  margin-top: 10px;
  margin-bottom: 40px;
  text-align: center;
  border-collapse: separate; /* 'collapse'에서 'separate'로 변경 */
  width:100%;
  
}


td{
height: 50px;
}
.order_cus{
font-family: 'Noto Sans KR', sans-serif;
width:100%;
margin-top: 20px;
}

  .input-container {
    margin-bottom: 10px; /* 원하는 간격을 설정하세요 */
    line-height: 35px; /* 원하는 높이를 설정하세요 */
    margin-left: 35px;
  }
 input[type="text"] {
    width: 730px; /* 원하는 길이로 설정 (예: 300px) */
    border: none;
    background: transparent;
    line-height: 35px;
    margin-left: 30px;
    padding: 0;
  }
  
   .order-container{
    width: 900px;
    margin: 0 auto; /* Added margin to center the form */
   
  }
  
  .dot_line{
  font-family: 'Noto Sans KR', sans-serif;
  font-size: 17px;
  margin-left: 20px;
  }
  .title{
  font-family: 'Noto Sans KR', sans-serif;
  text-align: center;
  margin-top: 30px;
  margin-bottom:40px;
  font-size: 30px;
  font-weight: 700;
  }
  
   .list_view td:nth-child(1) {
    font-weight: 500;
  }

    .list_view tr {
    height: 50px; /* 원하는 높이 값으로 변경 */
  }
  .fixed_join{
  	width:200px;
  }
</style>
</head>
<body>
<div class="order-container">

	 <div class="title">주문 상세 정보</div>
	<H1>주문 내역</H1>
	<hr>
	<TABLE class="list_view">
		<TBODY align=center>
			<tr style="font-size: 17px;font-weight:500; text-align: center;background: #1D1D1D; color:white;">
			    <td>주문번호</td>
				<td colspan=2 class="fixed" >주문상품</td>
				<td>수량</td>
				<td>주문금액</td>
				<td>배송비</td>
				<td>적립금</td>
				<td>주문금액합계</td>
			</tr>			
			<c:forEach var="item" items="${myOrderList }">
				<TR>
				    <td> ${item.order_id }</td>
					<td class="goods_image">
					  <a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
					    <img width="75" alt="" src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.file_name}">
					  </a>
					</td>
					<td style="text-align: left; width:30%">					
					     <a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">${item.goods_name }</a>				
					</td>
					<td>${item.order_quantity }개</td>
					<fmt:formatNumber value="${item.order_quantity *item.goods_sales_price}" type="number" var="final_price" />
					<td>${final_price}원</td>
					<td><fmt:formatNumber value="${delivery_fee}" type="number" var="delivery_fee2" />${delivery_fee2 }원</td>					
					<td>${1500 *item.order_quantity }원</td>
					<td>${item.order_quantity *item.goods_sales_price+delivery_fee}원</td>
				</TR>
			</c:forEach>
		</TBODY>
	</TABLE>
	<DIV class="clear"></DIV>
	 <H1>주문고객</H1>
	 <hr>
		 <table style="margin-left: 30px;">
		   <TBODY>
			 <tr class="dot_line" >
				<td style="color:#A6A6A6">이름</td>
				<td style="vertical-align: middle;">
				 <input type="text" value="${orderer.mem_name}" size="15" disabled />
				</td>
			  </tr>
			  <tr class="dot_line">
				<td style="color:#A6A6A6">연락처</td>
				<td style="vertical-align: middle;">
				 <input  type="text" value="${orderer.mem_tel1}-${orderer.mem_tel2}-${orderer.mem_tel3}" size="15" disabled />
				</td>
			  </tr>
			  <tr class="dot_line">
				<td style="color:#A6A6A6">이메일</td>
				<td style="vertical-align: middle;">
				   <input  type="text" value="${orderer.mem_email}" size="15" disabled />
				</td>
			  </tr>
		   </TBODY>
		</table>
	
<form  name="form_order">
	<br>
	<br>
	<H1>배송지 정보</H1>
	<hr>
	<DIV class="detail_table" >
	
		<TABLE >
			<TBODY >
				<TR class="dot_line" style="text-align: left;">
					<TD class="fixed_join">희망 배송일</TD>
					<TD>
					   ${myOrderInfo.order_deli_hope_date }
				    </TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">받으실 분</TD>
					<TD>
					${myOrderInfo.order_rec_name }
					</TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">연락처</TD>
					<TD>
					  ${myOrderInfo.order_rec_hp1}-${myOrderInfo.order_rec_hp2}-${myOrderInfo.order_rec_hp3}</TD>
				  </TR>
				<TR class="dot_line">
					<TD class="fixed_join">주소</TD>
					<td>
					   ${myOrderInfo.order_delivery_address}
					</td>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">배송 메시지</TD>
					<TD>
					${myOrderInfo.order_delivery_message}
					</TD>
				</TR>

			</TBODY>
		</TABLE>
		
	</DIV>
	
	<DIV class="clear"></DIV>
	<br>

	<H1>결제정보</H1>
	<hr>
	<DIV class="detail_table">
		<table>
			<TBODY>
				<TR class="dot_line">
					<TD class="fixed_join">결제방법</TD>
					<TD>
					   ${myOrderInfo.order_pay_method }
				    </TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">결제카드</TD>
					<TD>
					   ${myOrderInfo.card_company_name}
				    </TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">할부기간</TD>
					<TD>
					   ${myOrderInfo.card_pay_month }
				    </TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">결제금액</TD>
					<TD>
					   ${myOrderInfo.final_total_price }
				    </TD>
				</TR>
				
			</TBODY>
		</table>
	</DIV>
</form>
    <DIV class="clear"></DIV>
	<br>
	<br>
	<br>

		<br>
		<br> 
		<a href="${contextPath}/main/main.do"> 
		   <IMG width="75" alt="" src="${contextPath}/resources/image/btn_shoping_continue.jpg">
		</a>

	</div>

<DIV class="clear"></DIV>		
</body>
</html>