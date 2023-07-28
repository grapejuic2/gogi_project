<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
  
  .list_view{
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-top:20px;
  margin-left: 30px;
  font-family: 'Noto Sans KR', sans-serif;
  width:90%;
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
font-size:25px;
font-family: 'Noto Sans KR', sans-serif;
}
  /* 배송지 정보 테이블 스타일 */
  .detail_table {
    width: 100%;

  }

  .detail_table td {
    text-align: center; /* 텍스트를 왼쪽에 정렬합니다. */
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

H1{
display: flex;
text-align: center;
font-size: 19px; 
font-weight: 500;
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
  .input-container input[type="text"] {
    width: 780px; /* 원하는 길이로 설정 (예: 300px) */
    border: 1px solid #E8E8E8;
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
  font-size: 25px;
  font-weight: 700;
  }
  
   .list_view td:nth-child(1) {
    
    font-size: 15px;
    font-weight: 500;
  }
    .list_view tr {
    height: 50px; /* 원하는 높이 값으로 변경 */
  }
</style>
</head>
<body>
<div class="order-container">

	 <div class="title">주문 상세 정보</div>
	<H1>주문 내역</H1>
	<TABLE class="list_view">
		<TBODY align=center>
			<tr style="font-size: 20px; font-weight: 500; background: #E8E8E8;">
			    <td>주문번호</td>
				<td colspan=2 class="fixed" >주문상품</td>
				<td>수량</td>
				<td>주문금액</td>
				<td>배송비</td>
				<td>예상적립금</td>
				<td>주문금액합계</td>
			</tr>			
			<c:forEach var="item" items="${myOrderList }">
				<TR>
				    <td> ${item.order_id }</td>
					<td class="goods_image">
					  <a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
					    <img width="30" alt="" src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.file_name}">
					  </a>
					</td>
					<td style="text-align: left;">					
					     <a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">${item.goods_name }</a>				
					</td>
					<td>${item.order_quantity }개</td>
					<td>${item.order_quantity *item.goods_sales_price}원</td>
					<td>0원</td>
					<td>${1500 *item.order_quantity }원</td>
					<td>${item.order_quantity *item.goods_sales_price}원</td>
				</TR>
			</c:forEach>
		</TBODY>
	</TABLE>
	<DIV class="clear"></DIV>
	 <H1>주문고객</H1>
	 <hr style="border: 1px #E8E8E8;">
		 <table>
		   <TBODY>
			 <tr class="dot_line">
				<td>이름</td>
				<td>
				 <input  type="text" value="${orderer.mem_name}" size="15" disabled />
				</td>
			  </tr>
			  <tr class="dot_line">
				<td>핸드폰</td>
				<td>
				 <input  type="text" value="${orderer.mem_tel1}-${orderer.mem_tel2}-${orderer.mem_tel1}" size="15" disabled />
				</td>
			  </tr>
			  <tr class="dot_line">
				<td>이메일</td>
				<td>
				   <input  type="text" value="${orderer.mem_email}" size="15" disabled />
				</td>
			  </tr>
		   </TBODY>
		</table>
	
<form  name="form_order">
	<br>
	<br>
	<H1>배송지 정보</H1>
	<hr style="border: 1px #E8E8E8;">
	<DIV class="detail_table">
	
		<TABLE>
			<TBODY>
				<TR class="dot_line">
					<TD class="fixed_join">배송방법</TD>
					<TD>
					   ${myOrderInfo.delivery_method }
				    </TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">받으실 분</TD>
					<TD>
					${myOrderInfo.order_rec_name }
					</TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">휴대폰번호</TD>
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
			 	<TR class="dot_line">
					<TD class="fixed_join">선물 포장</TD>
					<td>
					${myOrderInfo.gift_wrapping}
					</td>
				</TR>
			</TBODY>
		</TABLE>
		
	</DIV>
	
	<DIV class="clear"></DIV>
	<br>

	<H1>결제정보</H1>
	<hr style="border: 1px #E8E8E8;">
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
</div>

<DIV class="clear"></DIV>		
</body>
</html>