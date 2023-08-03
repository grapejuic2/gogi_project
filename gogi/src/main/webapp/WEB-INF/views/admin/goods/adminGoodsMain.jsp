<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html >
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="utf-8">
</head>
<style>
.form{
margin: 0;
width:100%;
}
.frm_mod_main{
  width: 1000px;
  padding:30px;

  margin: 0 auto; 
  font-family: 'Noto Sans KR', sans-serif;
  border: 1px solid #E8E8E8;
  margin-top: 40px;
  margin-bottom: 40px;  
}

.table{
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
 
</style>
<body>
	<div class="title">
		<h3 class="title"><b>상품 조회</b></h3>
	</div>
	
	<TABLE class="frm_mod_main">
		<TBODY align=center >
			<tr style="background:#1D1D1D;color: #FFFFFF;font-size: 17px; height: 35px; padding:5px;" >
				<td><span><b>상품번호</b></span></td>
				<td><span><b>상품이름</b></span></td>
				<td><span><b>회사</b></span></td>
				<td><span><b>상품가격</b></span></td>
				<td><span><b>입고일</b></span></td>
			</tr>
   <c:choose>
     <c:when test="${empty newGoodsList }">			
			<TR>
		       <TD colspan=8 class="fixed">
				  <strong>조회된 상품이 없습니다.</strong>
			   </TD>
		     </TR>
	 </c:when>
	 <c:otherwise>
     <c:forEach var="item" items="${newGoodsList }">
			 <TR>       
				<TD>
			      
				  <span>${item.goods_id }</span>
				 
				</TD>
				<TD>
				 <a href="${pageContext.request.contextPath}/admin/goods/modifyGoodsForm.do?goods_id=${item.goods_id}">
				    <span>${item.goods_name } </span>
				 </a> 
				</TD>
				<TD>
				   <span>${item.goods_seller }</span> 
				</TD>
				<td>
				  <span>${item.goods_price }</span>
				</td>
				<td>
					<fmt:formatDate value="${item.goods_delivery_date }" pattern="yyyy-MM-dd" />
				</td>
			</TR>
	</c:forEach>
	</c:otherwise>
  </c:choose>
           <tr>
             <td colspan=8 class="fixed" style="padding-left: 105px;">
                 <c:forEach   var="page" begin="1" end="10" step="1" >
		         <c:if test="${section >1 && page==1 }">
		          <a href="${contextPath}/admin/goods/adminGoodsMain.do?chapter=${section-1}&pageNum=${(section-1)*10 +1 }">&nbsp; &nbsp;</a>
		         </c:if>
		          <a href="${contextPath}/admin/goods/adminGoodsMain.do?chapter=${section}&pageNum=${page}">${(section-1)*10 +page } </a>
		         <c:if test="${page == 10 }">
		          <a href="${contextPath}/admin/goods/adminGoodsMain.do?chapter=${section+1}&pageNum=${section*10+1}">&nbsp; next</a>
		         </c:if> 
	      		</c:forEach>
	      	<form class="add-goods-form" action="${contextPath}/admin/goods/addNewGoodsForm.do" style="float: right;">
				<input type="submit" value="상품 등록하기" class="btn btn-secondary btn-sm">
			</form>
	      	</td>
		</TBODY>
	</TABLE>
		
</body>
</html>