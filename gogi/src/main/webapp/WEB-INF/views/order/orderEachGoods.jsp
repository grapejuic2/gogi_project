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
 .order-container{
    display: flex;
    width: 90%;
    margin: 0 auto; /* Added margin to center the form */
    align-content: center;
  }
  <style>
#layer {
	z-index: 2;
	position: absolute;
	top: 0px;
	left: 0px;
	width: 100%;
	/* background-color:rgba(0,0,0,0.8); */
}

#popup_order_detail {
	z-index: 3;
	position: fixed;
	text-align: center;
	left: 10%;
	top: 0%;
	width: 60%;
	height: 100%;
	background-color:#ccff99;
	border: 2px solid  #0000ff;
}

#close {
	z-index: 4;
	float: right;
}
</style>
</head>
<body>
<div class="order-container">
<H1>1.주문확인</H1>
<form  name="form_order">	
	<table class="list_view">
		<tbody align=center>
			<tr style="background: #33ff00">
				<td colspan=2 class="fixed">주문상품명</td>
				<td>수량</td>
				<td>주문금액</td>
				<td>배송비</td>
				<td>예상적립금</td>
				<td>주문금액합계</td>
			</tr>
			<tr>
				<c:forEach var="item" items="${myOrderList }">
					<td class="goods_image">
					  <a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
					    <img width="75" alt=""  src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.file_name}">
					    <input   type="hidden" id="h_goods_id" name="h_goods_id" value="${item.goods_id }" />
					    <input   type="hidden" id="h_goods_fileName" name="h_goods_fileName" value="${item.file_name }" />
					  </a>
					</td>
					<td>
					  <h2>
					     <a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">${item.goods_name }</A>
					      <input   type="hidden" id="h_goods_title" name="h_goods_title" value="${item.goods_name }" />
					  </h2>
					</td>
					<td>
					  <h2>${item.order_quantity }개<h2>
					    <input   type="hidden" id="h_order_goods_qty" name="h_order_goods_qty" value="${item.order_quantity}" />
					</td>
					<td><fmt:formatNumber value="${item.goods_sales_price}" type="number" var="goods_sales_price" />
					<h2>${goods_sales_price}원</h2></td>
					<td><h2>0원</h2></td>
					<td><fmt:formatNumber value="${0.05 *item.goods_sales_price}" type="number" var="goods_sales_price" />
					<h2>${goods_sales_price}원</h2></td>
					<td>
					  <fmt:formatNumber value="${item.goods_sales_price * item.order_quantity}" type="number" var="each_goods_price" />
					  <h2>${each_goods_price}원</h2>
					  <input  type="hidden" id="h_each_goods_price"  name="h_each_goods_price" value="${item.goods_sales_price * item.order_quantity}" />
					</td>
			</tr>
			<c:set var="final_total_order_price"
				value="${final_total_order_price+ item.goods_sales_price* item.order_quantity}" />
			<c:set var="total_order_price"
				value="${total_order_price+ item.goods_sales_price* item.order_quantity}" />
			<c:set var="total_order_goods_qty"
				value="${total_order_goods_qty+item.order_quantity }" />
			</c:forEach>
		</tbody>
	</table>
	<div class="clear"></div>

	<br>
	<br>
	<H1>2.배송지 정보</H1>
	<DIV class="detail_table">
	
		<table>
			<tbody>
				<tr class="dot_line">
					<td class="fixed_join">배송방법</td>
					<td>
					    <input type="radio" id="delivery_method" name="delivery_method" value="일반택배" checked>일반택배 &nbsp;&nbsp;&nbsp; 
						<input type="radio" id="delivery_method" name="delivery_method" value="편의점택배">편의점택배 &nbsp;&nbsp;&nbsp; 
						<input type="radio" id="delivery_method" name="delivery_method" value="해외배송">해외배송 &nbsp;&nbsp;&nbsp;
				    </td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">배송지 선택</td>
					<td><input type="radio" name="delivery_place"
						onClick="restore_all()" value="기본배송지" checked>기본배송지 &nbsp;&nbsp;&nbsp; 
						<input type="radio" name="delivery_place" value="새로입력" onClick="reset_all()">새로입력 &nbsp;&nbsp;&nbsp;
						<input type="radio" name="delivery_place" value="최근배송지">최근배송지 &nbsp;&nbsp;&nbsp;
				    </td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">받으실 분</td>
					<td><input id="receiver_name" name="receiver_name" type="text" size="40" value="${orderer.mem_name }" />
					   <input type="hidden" id="h_orderer_name" name="h_orderer_name"  value="${orderer.mem_name }" /> 
					   <input type="hidden" id="h_receiver_name" name="h_receiver_name"  value="${orderer.mem_name }" />
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">휴대폰번호</td>
					<td><select id="hp1" name="hp1">
							<option>없음</option>
							<option value="010" selected>010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
					</select> 
					 - <input size="10px" type="text" id="hp2" name="hp2" value="${orderer.mem_tel2 }"> 
					 - <input size="10px" type="text" id="hp3" name="hp3" value="${orderer.mem_tel3 }"><br><br> 
					  <input type="hidden" id="h_hp1" name="h_hp1" value="${orderer.mem_tel1 }" /> 
					  <input type="hidden" id="h_hp2" name="h_hp2" value="${orderer.mem_tel2 }" /> 
					  <input type="hidden" id="h_hp3" name="h_hp3"  value="${orderer.mem_tel3 }" />
					  <c:set  var="orderer_hp" value="${orderer.mem_tel1}-${orderer.mem_tel2}-${orderer.mem_tel3 }"/>
					   									
					         
				  </tr>
				
				<tr class="dot_line">
					<td class="fixed_join">주소</td>
					<td><input type="text" id="zipcode" name="zipcode" size="5"
						value="${orderer.zipcode }"> 
						<a href="javascript:execDaumPostcode()">우편번호검색</a> <br>
						<p>
							지번 주소:<br>
							<input type="text" id="roadAddress" name="roadAddress" size="50" value="${orderer.roadAddress }" /><br>
							<br> 도로명 주소: 
							   <input type="text" id="jibunAddress" name="jibunAddress" size="50"
								              value="${orderer.jibunAddress }" /><br>
							<br> 나머지 주소: 
							   <input type="text" id="namujiAddress"  name="namujiAddress" size="50"
								     value="${orderer.namujiAddress }" /> 
						</p> 
						 <input type="hidden" id="h_zipcode" name="h_zipcode" value="${orderer.zipcode }" /> 
						 <input type="hidden"  id="h_roadAddress" name="h_roadAddress"  value="${orderer.roadAddress }" /> 
						 <input type="hidden"  id="h_jibunAddress" name="h_jibunAddress" value="${orderer.jibunAddress }" /> 
						 <input type="hidden"  id="h_namujiAddress" name="h_namujiAddress" value="${orderer.namujiAddress }" />
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">배송 메시지</td>
					<td>
					   <input id="delivery_message" name="delivery_message" type="text" size="50"
						                   placeholder="택배 기사님께 전달할 메시지를 남겨주세요." />
				     </td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">선물 포장</td>
					<td><input type="radio" id="gift_wrapping" name="gift_wrapping" value="yes">예
						&nbsp;&nbsp;&nbsp; <input type="radio"  id="gift_wrapping" name="gift_wrapping" checked value="no">아니요</td>
				</td>
			</tboby>
		</table>
	</div>
	<div >
	  <br><br>
	   <h2>주문고객</h2>
		 <table>
		   <tbody>
			 <tr class="dot_line">
				<td ><h2>이름</h2></td>
				<td>
				 <input  type="text" value="${orderer.mem_name}" size="15" />
				</td>
			  </tr>
			  <tr class="dot_line">
				<td ><h2>핸드폰</h2></td>
				<td>
				 <input  type="text" value="${orderer.mem_tel1}-${orderer.mem_tel2}-${orderer.mem_tel3}" size="15" />
				</td>
			  </tr>
			  <tr class="dot_line">
				<td ><h2>이메일</h2></td>
				<td>
				 <input  type="text" value="${orderer.mem_email}" size="15" />
				</td>
			  </tr>
		   </tbody>
		</table>
	</div>
	<div class="clear"></div>
	<br>
	<br>
	<br>


	<H1>3.할인 정보</H1>
	<div class="detail_table">
		<table>
			<tbody>
				<tr class="dot_line">
					<td width=100>적립금</td>
					<td><input name="discount_juklip" type="text" size="10" />원/1000원
						&nbsp;&nbsp;&nbsp; <input type="checkbox" /> 모두 사용하기</td>
				</tr>
				<tr class="dot_line">
					<td>예치금</td>
					<td><input name="discount_yechi" type="text" size="10" />원/1000원
						&nbsp;&nbsp;&nbsp; <input type="checkbox" /> 모두 사용하기</td>
				</tr>
				<tr class="dot_line">
					<td>상품권 전환금</td>
					<td cellpadding="5"><input name="discount_sangpum" type="text"
						size="10" />원/0원 &nbsp;&nbsp;&nbsp; <input type="checkbox" /> 모두
						사용하기</td>
				</tr>
				<tr class="dot_line">
					<td>OK 캐쉬백 포인트</td>
					<td cellpadding="5"><input name="discount_okcashbag" type="text"
						size="10" />원/0원 &nbsp;&nbsp;&nbsp; <input type="checkbox" /> 모두
						사용하기</td>
				</tr>
				<tr class="dot_line">
					<td>쿠폰할인</td>
					<td cellpadding="5"><input name="discount_coupon" type="text"
						size="10" />원/0원 &nbsp;&nbsp;&nbsp; <input type="checkbox" /> 모두
						사용하기</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="clear"></div>

	<br>
	<table width=80% class="list_view" style="background: #ccffff">
		<tbody>
			<tr align=center class="fixed">
				<td class="fixed">총 상품수</td>
				<td>총 상품금액</td>
				<td></td>
				<td>총 배송비</td>
				<td></td>
				<td>총 할인 금액</td>
				<td></td>
				<td>최종 결제금액</td>
			</tr>
			<tr cellpadding=40 align=center>
				<td id="">
					<p id="p_totalNum">${total_order_goods_qty}개</p> 
					<input id="h_total_order_goods_qty" type="hidden" value="${total_order_goods_qty}" />
				</td>
				<td>
					<p id="p_totalPrice">${total_order_price}원</p> <input
					id="h_totalPrice" type="hidden" value="${total_order_price}" />
				</td>
				<td><IMG width="25" alt=""
					src="${pageContext.request.contextPath}/resources/image/plus.jpg"></td>
				<td>
					<p id="p_totalDelivery">${total_delivery_price }원</p> <input
					id="h_totalDelivery" type="hidden" value="${total_delivery_price}" />
				</td>
				<td>
				<img width="25" alt="" 	src="${pageContext.request.contextPath}/resources/image/minus.jpg"></td>
				<td>
					<p id="p_totalSalesPrice">${total_discount_price }원</p> 
					<input id="h_total_sales_price" type="hidden" value="${total_discount_price}" />
				</td>
				<td><img width="25" alt="" src="${pageContext.request.contextPath}/resources/image/equal.jpg"></td>
				<td>
					<p id="p_final_totalPrice">
						<font size="15">${final_total_order_price }원 </font>
					</p> <input id="h_final_total_Price" type="hidden" value="${final_total_order_price}" />
				</td>
			</tr>
		</tbody>
	</table>
   <div class="clear"></div>
	<br>
	<br>
	<br>
	<h1>4.결제정보</h1>
	<div class="detail_table">
		<table>
			<tbody>
				<tr >
					<td>
					   <input type="radio" id="pay_method" name="pay_method" value="신용카드"   onClick="fn_pay_card()" checked>신용카드 &nbsp;&nbsp;&nbsp; 
					   <input type="radio" id="pay_method" name="pay_method" value="제휴 신용카드"  >제휴 신용카드 &nbsp;&nbsp;&nbsp; 
					   <input type="radio" id="pay_method" name="pay_method" value="실시간 계좌이체">실시간 계좌이체 &nbsp;&nbsp;&nbsp;
					   <input type="radio" id="pay_method" name="pay_method" value="무통장 입금">무통장 입금 &nbsp;&nbsp;&nbsp;
					</td>
				</tr>
				<tr >
					<td>
					   <input type="radio" id="pay_method" name="pay_method" value="휴대폰결제" onClick="fn_pay_phone()">휴대폰 결제 &nbsp;&nbsp;&nbsp;
					   <input type="radio" id="pay_method" name="pay_method" value="카카오페이(간편결제)">카카오페이(간편결제) &nbsp;&nbsp;&nbsp; 
					   <input type="radio" id="pay_method" name="pay_method" value="페이나우(간편결제)">페이나우(간편결제) &nbsp;&nbsp;&nbsp; 
					   <input type="radio" id="pay_method" name="pay_method" value="페이코(간편결제)">페이코(간편결제) &nbsp;&nbsp;&nbsp;
					</td>
				</tr>
				<tr >
					<td>
					   <input type="radio"  id="pay_method" name="pay_method" value="직접입금">직접입금&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
				<tr id="tr_pay_card">
					<td>
					  <strong>카드 선택<strong>:&nbsp;&nbsp;&nbsp;
					  <select id="card_com_name" name="card_com_name">
							<option value="삼성" selected>삼성</option>
							<option value="하나SK">하나SK</option>
							<option value="현대">현대</option>
							<option value="KB">KB</option>
							<option value="신한">신한</option>
							<option value="롯데">롯데</option>
							<option value="BC">BC</option>
							<option value="시티">시티</option>
							<option value="NH농협">NH농협</option>
					</select>
					<br><Br>
					<strong>할부 기간:<strong>  &nbsp;&nbsp;&nbsp;
					<select id="card_pay_month" name="card_pay_month">
							<option value="일시불" selected>일시불</option>
							<option value="2개월">2개월</option>
							<option value="3개월">3개월</option>
							<option value="4개월">4개월</option>
							<option value="5개월">5개월</option>
							<option value="6개월">6개월</option>
					</select>
					
					</td>
				</tr>
				<tr id="tr_pay_phone" style="visibility:hidden">
				  <td>
				  <strong>휴대폰 번호 입력: <strong>
				  	       <input  type="text" size="5" value=""  id="pay_order_tel1" name="pay_order_tel1" />-
				           <input  type="text" size="5" value="" id="pay_order_tel2" name="pay_order_tel2" />-
				           <input  type="text" size="5" value="" id="pay_order_tel3" name="pay_order_tel3" />
				  </td>
				</tr>
			</tbody>
		</table>
	</div>
</form>
</div>
    <div class="clear"></div>
	<br>
	<br>
	<br>

		<br>
		<br> 
		<a href="javascript:fn_show_order_detail();"> 
			<input type="button" class="btn btn-secondary" value="최종결제하기" />
		</a> 
		<a href="${contextPath}/main/main.do"> 
			<input type="button" class="btn btn-secondary" value="쇼핑계속하기" />
		</a>
	
<div class="clear"></div>		
	<div id="layer" style="visibility:hidden">
		<!-- visibility:hidden 으로 설정하여 해당 div안의 모든것들을 가려둔다. -->
		<div id="popup_order_detail">
			<!-- 팝업창 닫기 버튼 -->
			<a href="javascript:" onClick="javascript:imagePopup('close', '.layer01');">
			 <img  src="${contextPath}/resources/image/close.png" id="close" />
			</a> 
			<br/> 
			  <div class="detail_table">
			  <h1>최종 주문 사항</h1>
			<table>
				<tbody align=left>
				 	<tr>
					  <td width=200px>
					      주문상품번호:
					 </td>
					 <td>
						 <p id="p_order_goods_id"> 주문번호 </p>    
					 </td>
				   </tr>
				   <tr>
					  <td width=200px>
					      주문상품명:
					 </td>
					 <td>
						  <p id="p_order_goods_title"> 주문 상품명 </p>    
					 </td>
				   </tr>
				   <tr>
					  <td width=200px>
					      주문상품개수:
					 </td>
					 <td>
						  <p id="p_total_order_goods_qty"> 주문 상품개수 </p>    
					 </td>
				   </tr>
				   <tr>
					  <td width=200px>
					     주문금액합계:
					 </td>
					 <td >
					      <p id="p_total_order_goods_price">주문금액합계</p>
					 </td>
				   </tr>
					<tr>
					  <td width=200px>
					     주문자:
					 </td>
					 <td>
					      <p id="p_orderer_name"> 주문자 이름</p>
					 </td>
				   </tr>
				   <tr>
					  <td width=200px>
					     받는사람:
					 </td>
					 <td>
					      <p id="p_receiver_name">받는사람이름</p>
					 </td>
				   </tr>
				   <tr>
					  <td width=200px>
					     배송방법:
					 </td>
					 <td>
					      <p id="p_delivery_method">배송방법</p>
					 </td>
				   </tr>
				   <tr>
					  <td width=200px>
					     받는사람 휴대폰번호:
					 </td>
					 <td>
					      <p id="p_receiver_hp_num"></p>
					 </td>
				   </tr>
				   <tr>
					  <td width=200px>
					     배송주소:
					 </td>
					 <td align=left>
					      <p id="p_delivery_address">배송주소</p>
					 </td>
				   </tr>
				    <tr>
					  <td width=200px>
					     배송메시지:
					 </td>
					 <td align=left>
					      <p id="p_delivery_message">배송메시지</p>
					 </td>
				   </tr>
				   <tr>
					  <td width=200px>
					     선물포장 여부:
					 </td>
					 <td align=left>
					      <p id="p_gift_wrapping">선물포장</p>
					 </td>
				   </tr>
				   <tr>
					  <td width=200px>
					     결제방법:
					 </td>
					 <td align=left>
					      <p id="p_pay_method">결제방법</p>
					 </td>
				   </tr>
				   <tr>
				    <td colspan=2 align=center>
				    <input  name="btn_process_pay_order" type="button" onClick="fn_process_pay_order()" value="최종결제하기">
				    </td>
				   </tr>
				</tbody>
				</table>
			</div>
			</div>
			</div>
			<div class="clear"></div>	
			<br> 
			
<script type="text/javascript">
window.onload=function(){
	init();
}

function init(){
  	var form_order=document.form_order;

  	var h_hp1=form_order.h_hp1;
  	var hp1=h_hp1.value;
  	var select_hp1=form_order.hp1;
  	select_hp1.value=hp1;
  }    

function fn_pay_phone(){
	
	
	var e_card=document.getElementById("tr_pay_card");
	var e_phone=document.getElementById("tr_pay_phone");
	e_card.style.visibility="hidden";
	e_phone.style.visibility="visible";
}

function fn_pay_card(){
	var e_card=document.getElementById("tr_pay_card");
	var e_phone=document.getElementById("tr_pay_phone");
	e_card.style.visibility="visible";
	e_phone.style.visibility="hidden";
}

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

var goods_id="";
var goods_title="";
var goods_fileName="";

var order_quantity;
var each_goods_price;
var total_order_goods_price;
var total_order_goods_qty;
var orderer_name;
var receiver_name;
var hp1;
var hp2;
var hp3;
var receiver_hp_num;
var delivery_address;
var delivery_message;
var delivery_method;
var gift_wrapping;
var pay_method;
var card_com_name;
var card_pay_month;
var pay_orderer_hp_num;

function fn_show_order_detail(){
	goods_id="";
	goods_name="";
	
	var frm=document.form_order;
	var h_goods_id=frm.h_goods_id;
	var h_goods_title=frm.h_goods_title;
	var h_goods_fileName=frm.h_goods_fileName;
	var r_delivery_method= frm.delivery_method;
	var h_order_goods_qty=document.getElementById("h_order_goods_qty");
	var h_total_order_goods_qty=document.getElementById("h_total_order_goods_qty");
	var h_total_sales_price=document.getElementById("h_total_sales_price");
	var h_final_total_Price=document.getElementById("h_final_total_Price");
	var h_orderer_name=document.getElementById("h_orderer_name");
	var i_receiver_name=document.getElementById("receiver_name");
	
	
	if(h_goods_id.length <2 ||h_goods_id.length==null){
		goods_id+=h_goods_id.value;
	}else{
		for(var i=0; i<h_goods_id.length;i++){
			goods_id+=h_goods_id[i].value+"<br>";
			
		}	
	}
	
	if(h_goods_title.length <2 ||h_goods_title.length==null){
		goods_title+=h_goods_title.value;
	}else{
		for(var i=0; i<h_goods_title.length;i++){
			goods_title+=h_goods_title[i].value+"<br>";
			
		}	
	}
	
	
	if(h_goods_fileName.length <2 ||h_goods_fileName.length==null){
		goods_fileName+=h_goods_fileName.value;
	}else{
		for(var i=0; i<h_goods_fileName.length;i++){
			goods_fileName+=h_goods_fileName[i].value+"<br>";
			
		}	
	}
	
	
	total_order_goods_price=h_final_total_Price.value;
	total_order_goods_qty=h_total_order_goods_qty.value;
	
	for(var i=0; i<r_delivery_method.length;i++){
	  if(r_delivery_method[i].checked==true){
		 delivery_method=r_delivery_method[i].value
		 break;
	  }
	} 
		
	var r_gift_wrapping  =  frm.gift_wrapping;
	
	
	for(var i=0; i<r_gift_wrapping.length;i++){
	  if(r_gift_wrapping[i].checked==true){
		  gift_wrapping=r_gift_wrapping[i].value
		 break;
	  }
	} 
	
	var r_pay_method  =  frm.pay_method;
	
	for(var i=0; i<r_pay_method.length;i++){
	  if(r_pay_method[i].checked==true){
		  pay_method=r_pay_method[i].value
		  if(pay_method=="신용카드"){
			var i_card_com_name=document.getElementById("card_com_name");
			var i_card_pay_month=document.getElementById("card_pay_month");
			card_com_name=i_card_com_name.value;
			card_pay_month=i_card_pay_month.value;
			pay_method+="<Br>"+
				 		"카드사:"+card_com_name+"<br>"+
				 		"할부개월수:"+card_pay_month;
			pay_orderer_hp_num="해당없음";
			
		  }else if(pay_method=="휴대폰결제"){
			var i_pay_order_tel1=document.getElementById("pay_order_tel1");
			var i_pay_order_tel2=document.getElementById("pay_order_tel2");
			var i_pay_order_tel3=document.getElementById("pay_order_tel3");
			pay_orderer_hp_num=i_pay_order_tel1.value+"-"+
						   	    i_pay_order_tel2.value+"-"+
							    i_pay_order_tel3.value;
			pay_method+="<Br>"+"결제휴대폰번호:"+pay_orderer_hp_num;
			card_com_name="해당없음";
			card_pay_month="해당없음";
		  } //end if
		 break;
	  }// end for
	}
	
	var i_hp1=document.getElementById("hp1");
	var i_hp2=document.getElementById("hp2");
	var i_hp3=document.getElementById("hp3");

	var i_zipcode=document.getElementById("zipcode");
	var i_roadAddress=document.getElementById("roadAddress");
	var i_jibunAddress=document.getElementById("jibunAddress");
	var i_namujiAddress=document.getElementById("namujiAddress");
	var i_delivery_message=document.getElementById("delivery_message");
	var i_pay_method=document.getElementById("pay_method");

//	alert("총주문 금액:"+total_order_goods_price);
	order_goods_qty=h_order_goods_qty.value;
	//order_total_price=h_order_total_price.value;
	
	orderer_name=h_orderer_name.value;
	receiver_name=i_receiver_name.value;
	hp1=i_hp1.value;
	hp2=i_hp2.value;
	hp3=i_hp3.value;

	
	receiver_hp_num=hp1+"-"+hp2+"-"+hp3;
	
	delivery_address="우편번호:"+i_zipcode.value+"<br>"+
						"도로명 주소:"+i_roadAddress.value+"<br>"+
						"[지번 주소:"+i_jibunAddress.value+"]<br>"+
								  i_namujiAddress.value;
	
	delivery_message=i_delivery_message.value;
	
	var p_order_goods_id=document.getElementById("p_order_goods_id");
	var p_order_goods_title=document.getElementById("p_order_goods_title");
	var p_order_goods_qty=document.getElementById("p_order_goods_qty");
	var p_total_order_goods_qty=document.getElementById("p_total_order_goods_qty");
	var p_total_order_goods_price=document.getElementById("p_total_order_goods_price");
	var p_orderer_name=document.getElementById("p_orderer_name");
	var p_receiver_name=document.getElementById("p_receiver_name");
	var p_delivery_method=document.getElementById("p_delivery_method");
	var p_receiver_hp_num=document.getElementById("p_receiver_hp_num");
	var p_delivery_address=document.getElementById("p_delivery_address");
	var p_delivery_message=document.getElementById("p_delivery_message");
	var p_pay_method=document.getElementById("p_pay_method");
	
	p_order_goods_id.innerHTML=goods_id;
	p_order_goods_title.innerHTML=goods_title;
	p_total_order_goods_qty.innerHTML=total_order_goods_qty+"개";
	p_total_order_goods_price.innerHTML=total_order_goods_price+"원";
	p_orderer_name.innerHTML=orderer_name;
	p_receiver_name.innerHTML=receiver_name;
	p_delivery_method.innerHTML=delivery_method;
	p_receiver_hp_num.innerHTML=receiver_hp_num;
	p_delivery_address.innerHTML=delivery_address;
	p_delivery_message.innerHTML=delivery_message;
	p_gift_wrapping.innerHTML=gift_wrapping;
	p_pay_method.innerHTML=pay_method;
	imagePopup('open');
}

function fn_process_pay_order(){
	
	alert("최종 결제하기");
	var formObj=document.createElement("form");
    var i_receiver_name=document.createElement("input");   
    var i_receiver_hp1=document.createElement("input");
    var i_receiver_hp2=document.createElement("input");
    var i_receiver_hp3=document.createElement("input");
    var i_delivery_address=document.createElement("input");
    var i_delivery_message=document.createElement("input");
    var i_delivery_method=document.createElement("input");
    var i_pay_method=document.createElement("input");
    var i_card_com_name=document.createElement("input");
    var i_card_pay_month=document.createElement("input");
    var i_pay_orderer_hp_num=document.createElement("input");
   
    i_receiver_name.name="order_rec_name";
    i_receiver_hp1.name="order_rec_hp1";
    i_receiver_hp2.name="order_rec_hp2";
    i_receiver_hp3.name="order_rec_hp3";
    
    i_delivery_address.name="order_delivery_address";
    i_delivery_message.name="order_delivery_message";
    i_delivery_method.name="order_delivery_method";
    i_pay_method.name="order_pay_method";
/*     i_delivery_option="order_delivery_option"; */
    i_card_com_name.name="card_company_name";
    i_card_pay_month.name="card_pay_month";
    i_pay_orderer_hp_num.name="pay_orderer_hp_num";
  
    i_receiver_name.value=receiver_name;
    i_receiver_hp1.value=hp1;
    i_receiver_hp2.value=hp2;
    i_receiver_hp3.value=hp3;
    i_delivery_address.value=roadAddress;
    i_delivery_message.value=delivery_message;
    i_delivery_method.value=delivery_method;
    i_pay_method.value=pay_method;
    i_card_com_name.value=card_com_name;
    i_card_pay_month.value=card_pay_month;
    i_pay_orderer_hp_num.value=pay_order_tel1;
    
    formObj.appendChild(i_receiver_name);
    formObj.appendChild(i_receiver_hp1);
    formObj.appendChild(i_receiver_hp2);
    formObj.appendChild(i_receiver_hp3);

    formObj.appendChild(i_delivery_address);
    formObj.appendChild(i_delivery_message);
    formObj.appendChild(i_delivery_method);
    
    formObj.appendChild(i_pay_method);
    formObj.appendChild(i_card_com_name);
    formObj.appendChild(i_card_pay_month);
    formObj.appendChild(i_pay_orderer_hp_num);
    

    document.body.appendChild(formObj); 
    formObj.method="post";
    formObj.action="${contextPath}/order/payToOrderGoods.do";
    formObj.submit();
	imagePopup('close');
}

</script>
</body>
</html>