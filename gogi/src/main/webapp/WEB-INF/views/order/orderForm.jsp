<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="card mt-4" style="width:1400px;">
	  <div class="row g-0">
	    <div class="col-md-7" style="border-right:2px solid lightgrey; padding:0 20px 0 20px;">
	      <div class="title_underline" id="order-div">
		<h3 style="margin-top:-30px;">주문확인</h3>
	</div>
	
	<form name="form_order">	
		<table class="table">
			<tr>
				<td></td>
				<td>주문상품명</td>
				<td>수량</td>
				<td>주문금액</td>
				<td>배송비</td>
				<td>주문금액합계</td>
			</tr>
			
			<c:forEach var="item" items="${myOrderList }">
				<tr>
					<td class="goods_image">
						<a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
						    <img width="75" alt="" src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
						    <input type="hidden" id="h_goods_id" name="h_goods_id" value="${item.goods_id }" />
							<input type="hidden" id="h_goods_fileName" name="h_goods_fileName" value="${item.goods_fileName }" />
						</a>
					</td>
					<td>
						<a href="${pageContext.request.contextPath}/goods/goods.do?command=goods_detail&goods_id=${item.goods_id }">${item.goods_title }</A>
						<input type="hidden" id="h_goods_title" name="h_goods_title" value="${item.goods_title }" />
					</td>
					<td>
						${item.order_goods_qty }개
					    <input type="hidden" id="h_order_goods_qty" name="h_order_goods_qty" value="${item.order_goods_qty}" />
					</td>
					<td>${item.goods_sales_price}원</td>
					<td>0원</td>
					<td>
						${item.goods_sales_price * item.order_goods_qty}원
						<input  type="hidden" id="h_each_goods_price" name="h_each_goods_price" value="${item.goods_sales_price * item.order_goods_qty}" />
					</td>
				</tr>
				<c:set var="final_total_order_price" value="${final_total_order_price+ item.goods_sales_price* item.order_goods_qty}" />
				<c:set var="total_order_price" value="${total_order_price+ item.goods_sales_price* item.order_goods_qty}" />
				<c:set var="total_order_goods_qty" value="${total_order_goods_qty+item.order_goods_qty }" />
			</c:forEach>
		</table>
		
		<br>
		<div class="title_underline">
			<h3>배송지 정보</h3>
		</div>
		
		<div class="detail_table">
		
			<table class="table">
				<tr>
					<td class="fixed_join">배송방법</td>
					<td>
					    <input type="text" id="delivery_method" name="delivery_method" value="일반택배" readonly> &nbsp;&nbsp;&nbsp;
				    </td>
				</tr>
				<tr>
					<td class="fixed_join">배송지 선택</td>
					<td>
						<input type="radio" name="delivery_place" onClick="restore_all()" value="기본배송지" checked>기본배송지 &nbsp;&nbsp;&nbsp; 
						<input type="radio" name="delivery_place" value="새배송지" onClick="reset_all()">새로입력 &nbsp;&nbsp;&nbsp;
				    </td>
				</tr>
				<tr>
					<td class="fixed_join">받으실 분</td>
					<td><input id="receiver_name" name="receiver_name" type="text" size="40" value="${orderer.member_name }" />
					   <input type="hidden" id="h_orderer_name" name="h_orderer_name"  value="${orderer.member_name }" /> 
					   <input type="hidden" id="h_receiver_name" name="h_receiver_name"  value="${orderer.member_name }" />
					</td>
				</tr>
				<tr>
					<td class="fixed_join">휴대폰번호</td>
					<td>
						<select id="hp1" name="hp1">
							<option>없음</option>
							<option value="010" selected>010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>
						 - <input size="10px" type="text" id="hp2" name="hp2" value="${orderer.hp2 }"> 
						 - <input size="10px" type="text" id="hp3" name="hp3" value="${orderer.hp3 }">
						<input type="hidden" id="h_hp1" name="h_hp1" value="${orderer.hp1 }" /> 
						<input type="hidden" id="h_hp2" name="h_hp2" value="${orderer.hp2 }" /> 
						<input type="hidden" id="h_hp3" name="h_hp3"  value="${orderer.hp3 }" />
						<c:set  var="orderer_hp" value="${orderer.hp1}-${orderer.hp2}-${orderer.hp3 }"/>
					</td>
				</tr>
				
				<tr>
					<td class="fixed_join">유선전화(선택)</td>
					<td>
						<select id="tel1" name="tel1">
							<option value="02">02</option>
							<option value="031">031</option>
							<option value="032">032</option>
							<option value="033">033</option>
							<option value="041">041</option>
							<option value="042">042</option>
							<option value="043">043</option>
							<option value="044">044</option>
							<option value="051">051</option>
							<option value="052">052</option>
							<option value="053">053</option>
							<option value="054">054</option>
							<option value="055">055</option>
							<option value="061">061</option>
							<option value="062">062</option>
							<option value="063">063</option>
							<option value="064">064</option>
							<option value="0502">0502</option>
							<option value="0503">0503</option>
							<option value="0505">0505</option>
							<option value="0506">0506</option>
							<option value="0507">0507</option>
							<option value="0508">0508</option>
							<option value="070">070</option>
						</select> - <input size="10px" type="text" id="tel2" name="tel2" value="${orderer.tel2 }"> - <input size="10px" type="text" id="tel3" name="tel3" value="${orderer.tel3 }">
						
							<input type="hidden" id="h_tel1" name="h_tel1" value="${orderer.tel1 }" />
							<input type="hidden" id="h_tel2" name="h_tel2"	value="${orderer.tel2 }" />
							<input type="hidden" id="h_tel3" name="h_tel3"value="${orderer.tel3 }" />
						</td>
						
					</tr>
					<tr>
						<td class="fixed_join">주소</td>
						<td>
							<br>
							<input type="text" id="zipcode" name="zipcode" size="5" value="${orderer.zipcode }"> 
							<a href="javascript:execDaumPostcode()"><input type="button" class="btn btn-secondary btn-sm" value="우편번호검색" /></a> <br>
							<p>
								<br>
								<input type="text" id="roadAddress" name="roadAddress" size="50" value="${orderer.roadAddress }" placeholder=" 지번 주소"/><br>
								<br> 
								<input type="text" id="jibunAddress" name="jibunAddress" size="50" value="${orderer.jibunAddress }" placeholder=" 도로명 주소"/><br>
								<br> 
								<input type="text" id="namujiAddress"  name="namujiAddress" size="50" value="${orderer.namujiAddress }" placeholder=" 나머지 주소" /> 
							</p> 
							 <input type="hidden" id="h_zipcode" name="h_zipcode" value="${orderer.zipcode }" /> 
							 <input type="hidden"  id="h_roadAddress" name="h_roadAddress"  value="${orderer.roadAddress }" /> 
							 <input type="hidden"  id="h_jibunAddress" name="h_jibunAddress" value="${orderer.jibunAddress }" /> 
							 <input type="hidden"  id="h_namujiAddress" name="h_namujiAddress" value="${orderer.namujiAddress }" />
						</td>
					</tr>
					<tr>
						<td class="fixed_join">배송 메시지</td>
						<td>
							<input id="delivery_message" name="delivery_message" type="text" size="50" placeholder="택배 기사님께 전달할 메시지를 남겨주세요." />
					     </td>
					</tr>
			</table>
		</div>
		
	    </div>
	    
	    
	    <div class="col-md-5">
	      <div class="card-body">
	      
	      <div class="title_underline" style="margin-top:35px">
	      <h3 style="margin-top:-30px">주문고객</h3>
	  </div>
		 <table class="table">
			 <tr class="dot_line">
				<td>이름</td>
				<td>
				 <input  type="text" value="${orderer.member_name}" size="15" />
				</td>
			  </tr>
			  <tr class="dot_line">
				<td>휴대폰</td>
				<td>
				 <input  type="text" value="${orderer.hp1}-${orderer.hp2}-${orderer.hp3}" size="15" />
				</td>
			  </tr>
			  <tr class="dot_line">
				<td>이메일</td>
				<td>
				 <input  type="text" value="${orderer.email1}@${orderer.email2}" size="15" />
				</td>
			  </tr>
		</table>
		
		<br>
	<div class="title_underline">
		<h3>결제정보</h3>
	</div>
	
	<table class="table" style="background: lightgrey">
			<tr align=center>
				<td><b>총 상품수</b></td>
				<td><b>총 상품금액</b></td>
				<td></td>
				<td><b>총 배송비</b></td>
				<td></td>
				<td><b>최종 결제금액</b></td>
			</tr>
			<tr align=center>
				<td>
					<p id="p_totalNum">${total_order_goods_qty}개</p> 
					<input id="h_total_order_goods_qty" type="hidden" value="${total_order_goods_qty}" />
				</td>
				<td>
					<p id="p_totalPrice">${total_order_price}원</p> <input
					id="h_totalPrice" type="hidden" value="${total_order_price}" />
				</td>
				<td>
					<img width="25" style="margin-top:-13px" src="${pageContext.request.contextPath}/resources/image/plus.jpg"></td>
				<td>
					<p id="p_totalDelivery">${total_delivery_price }원</p> <input
					id="h_totalDelivery" type="hidden" value="${total_delivery_price}" />
				</td>
				<td>
					<img width="25" style="margin-top:-13px" src="${pageContext.request.contextPath}/resources/image/equal.jpg"></td>
				<td>
					<p id="p_final_totalPrice" style="font-size:20; font-weight:bold;">
						${final_total_order_price }원
					</p> <input id="h_final_total_Price" type="hidden" value="${final_total_order_price}" />
				</td>
			</tr>
	</table>

	
	<div class="detail_table">
		<table class="table">
			<tbody>
				<tr >
					<td>
					   <input type="radio" id="pay_method" name="pay_method" value="신용카드" onClick="fn_pay_card()" checked>신용카드 &nbsp;&nbsp;&nbsp;
					   <input type="radio" id="pay_method" name="pay_method" value="무통장 입금">무통장 입금 &nbsp;&nbsp;&nbsp;
					</td>
				</tr>
				<tr >
					<td>
					   <input type="radio" id="pay_method" name="pay_method" value="휴대폰결제" onClick="fn_pay_phone()">휴대폰 결제 &nbsp;&nbsp;&nbsp;
					   <input type="radio" id="pay_method" name="pay_method" value="카카오페이(간편결제)">카카오페이 &nbsp;&nbsp;&nbsp;
					   <input type="radio" id="pay_method" name="pay_method" value="페이코(간편결제)">페이코(간편결제) &nbsp;&nbsp;&nbsp;
					</td>
				</tr>
				<tr id="tr_pay_card">
					<td>
					  카드 선택:&nbsp;&nbsp;&nbsp;
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
					<br><br>
					할부 기간:&nbsp;&nbsp;&nbsp;
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
				  휴대폰 번호 입력:
				  	       <input  type="text" size="5" value=""  id="pay_order_tel1" name="pay_order_tel1" />-
				           <input  type="text" size="5" value="" id="pay_order_tel2" name="pay_order_tel2" />-
				           <input  type="text" size="5" value="" id="pay_order_tel3" name="pay_order_tel3" />
				  </td>
				</tr>
			</tbody>
		</table>
	</div>
</form>
		<br><br> 
		<a href="javascript:fn_show_order_detail();"> 
			<input type="button" class="btn btn-secondary" value="최종결제하기" />
		</a> 
		<a href="${contextPath}/main/main.do"> 
			<input type="button" class="btn btn-secondary" value="쇼핑계속하기" />
		</a>
	
    </div>
	    </div>
	  </div>
	</div>
</body>
</html>