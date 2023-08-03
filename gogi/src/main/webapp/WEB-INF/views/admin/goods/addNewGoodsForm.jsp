<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />	
<!DOCTYPE html>

<meta charset="utf-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<head>
<script type="text/javascript">
  // 상세 이미지의 첨부 순서를 나타냅니다.
  var cnt=0;
  function fn_addFile(){
	  if(cnt == 0){
		  												  // 첫 번째 파일 업로드는 메인 이미지를 첨부하므로 name 속성을 main_image로 설정합니다.
		  $("#d_file").append("<br>"+"<input  type='file' name='main_image' id='f_main_image' />");	  
	  }else{
		  												  // 그 외의 이미지들은 name 속성의 값을 detail_image+cnt로 설정합니다.
		  $("#d_file").append("<br>"+"<input  type='file' name='detail_image"+cnt+"' />");
	  }
  	
  	cnt++;
  }
  
  function fn_add_new_goods(obj){
		 fileName = $('#f_main_image').val();
		 if(fileName != null && fileName != undefined){
			 obj.submit();
		 }else{
			 alert("메인 이미지는 반드시 첨부해야 합니다.");
			 return;
		 }
		 
	}
</script>    
</head>

<BODY>
<form action="${contextPath}/admin/goods/addNewGoods.do" method="post" enctype="multipart/form-data">
		<div class="title_underline" style="margin-top: 50px">
			<h3><b>새상품 등록창</b></h3>
		</div>
<div class="tab_container">
	<div class="tab_container" id="container">
		<ul class="tabs" id="goods_detail_menu">
			<li><a href="#tab1">상품정보</a></li>
			<li><a href="#tab4">상품소개</a></li>
			<li><a href="#tab7">상품이미지</a></li>
		</ul>
		<div class="tab_container">
			<div class="tab_content" id="tab1">
				<table class="table">
			<tr >
				<td width=200 >제품분류</td>
				<td width=500><select name="goods_sort">
						<option value="PIG" selected>돼지
						<option value="COW">소
						<option value="CHICKEN">닭
						<option value="MEALKIT">양념육/밀키트
					</select>
				</td>
			</tr>
			<tr >
				<td >제품이름</td>
				<td><input name="goods_name" type="text" size="40" /></td>
			</tr>
			 
			<tr>
				<td>제품회사</td>
				<td><input name="goods_seller" type="text" size="40" /></td>
			</tr>
			
			<tr>
				<td >제품정가</td>
				<td><input name="goods_price" type="text" size="40" /></td>
			</tr>
			
			<tr>
				<td >제품판매가격</td>
				<td><input name="goods_sales_price" type="text" size="40" /></td>
			</tr>
			
	 		<tr>
				<td >제품 구매 포인트</td>
				<td><input name="goods_point" type="text" size="40" /></td>
			</tr>
			
			<tr>
				<td >제품 등록일</td>
				<td><input name="goods_delivery_date"  type="date" size="40" /></td>
			</tr>
			<tr>
				<td >제품 중량</td>
				<td><input name="goods_weight"  type="text" size="40" /></td>
			</tr>
			<tr>
				<td >제품종류</td>
				<td>
				<select name="goods_status">
				  <option value="B">인기상품</option>
				  <option value="N" selected>신규상품</option>
				  <option value="S">할인상품</option>
				</select>
				</td>
			</tr>
			<tr>
			 <td>
			   <br>
			 </td>
			</tr>
				</table>	
			</div>
			 
			
			<div class="tab_content" id="tab4">
				<H4>제품소개</H4>
				<table class="table">
					<tr>
						<td >제품소개</td>
						<td><textarea  rows="20" cols="80" name="goods_intro"></textarea></td>
				    </tr>
			    </table>
			</div>
			
			<div class="tab_content" id="tab7">
				<h4>상품이미지</h4>
				<table >
					<tr>
						<td align="right">이미지파일 첨부</td>
			            														   <!-- '파일 추가' 클릭 시 파일 업로드가 동적으로 추가됩니다. -->
			            <td  align="left"> <input type="button"  value="파일 추가" onClick="fn_addFile()"/></td>
			            <td>
				            <div id="d_file">
				            </div>
			            </td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	
	<input type="button" value="상품 등록하기" class="btn btn-secondary btn-sm" onClick="fn_add_new_goods(this.form)">
</div>
</form>