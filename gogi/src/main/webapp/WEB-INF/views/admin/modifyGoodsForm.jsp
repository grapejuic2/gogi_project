<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="goods"  value="${goodsMap.goods}"  />
<c:set var="imageFileList"  value="${goodsMap.imageFileList}"  />

<!DOCTYPE html>
<html lang="ko">
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.navbar.navbar-inverse {
	padding: 10px;
	padding-left: 200px;
	padding-right: 200px;
	background: white;
	border: none;
}

.nav.navbar-nav {
	margin-top: 70px;
	margin-left: 40px;
}

ul.nav.navbar-nav li a:hover {
	color: #000000;
}

@import url(https://fonts.googleapis.com/css?family=Roboto:300);
</style>

<link href="${contextPath}/resources/css/admin/admin.css" rel="stylesheet" type="text/css">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<c:choose>
<c:when test='${not empty goods.goods_status}'>
<script>

window.onload=function()
{
	init();
}

function init(){
	var frm_mod_goods=document.frm_mod_goods;
	var h_goods_status=frm_mod_goods.h_goods_status;
	var goods_status=h_goods_status.value;
	var select_goods_status=frm_mod_goods.goods_status;
	 select_goods_status.value=goods_status;
}
</script>
</c:when>
</c:choose>
<script type="text/javascript">
// 수정된 상품 정보의 속성과 수정 값을 컨트롤러로 전송합니다.
function fn_modify_goods(goods_id, attribute){
	var frm_mod_goods=document.frm_mod_goods;
	var value="";
	if(attribute=='goods_sort'){
		value=frm_mod_goods.goods_sort.value;
	}else if(attribute=='goods_title'){
		value=frm_mod_goods.goods_title.value;
	}else if(attribute=='goods_writer'){
		value=frm_mod_goods.goods_writer.value;   
	}else if(attribute=='goods_publisher'){
		value=frm_mod_goods.goods_publisher.value;
	}else if(attribute=='goods_price'){
		value=frm_mod_goods.goods_price.value;
	}else if(attribute=='goods_sales_price'){
		value=frm_mod_goods.goods_sales_price.value;
	}else if(attribute=='goods_point'){
		value=frm_mod_goods.goods_point.value;
	}else if(attribute=='goods_published_date'){
		value=frm_mod_goods.goods_published_date.value;
	}else if(attribute=='goods_page_total'){
		value=frm_mod_goods.goods_page_total.value;
	}else if(attribute=='goods_isbn'){
		value=frm_mod_goods.goods_isbn.value;
	}else if(attribute=='goods_delivery_price'){
		value=frm_mod_goods.goods_delivery_price.value;
	}else if(attribute=='goods_delivery_date'){
		value=frm_mod_goods.goods_delivery_date.value;
	}else if(attribute=='goods_status'){
		value=frm_mod_goods.goods_status.value;
	}else if(attribute=='goods_contents_order'){
		value=frm_mod_goods.goods_contents_order.value;
	}else if(attribute=='goods_writer_intro'){
		value=frm_mod_goods.goods_writer_intro.value;
	}else if(attribute=='goods_intro'){
		value=frm_mod_goods.goods_intro.value;
	}else if(attribute=='publisher_comment'){
		value=frm_mod_goods.publisher_comment.value;
	}else if(attribute=='recommendation'){
		value=frm_mod_goods.recommendation.value;
	}

	$.ajax({
		type : "post",
		async : false, //false인 경우 동기식으로 처리한다.
		url : "${contextPath}/admin/goods/modifyGoodsInfo.do",
		data : {
			goods_id:goods_id,
			// 상품 속성과 수정 값을 Ajax로 전송합니다.
			attribute:attribute,
			value:value
		},
		success : function(data, textStatus) {
			if(data.trim()=='mod_success'){
				alert("상품 정보를 수정했습니다.");
			}else if(data.trim()=='failed'){
				alert("다시 시도해 주세요.");	
			}
			
		},
		error : function(data, textStatus) {
			alert("에러가 발생했습니다."+data);
		},
		complete : function(data, textStatus) {
			//alert("작업을완료 했습니다");
			
		}
	}); //end ajax	
}



  function readURL(input,preview) {
	//  alert(preview);
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#'+preview).attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
  }  

  // '이미지 추가' 클릭 시 상세 이미지 파일 업로드를 추가합니다.
  var cnt =1;
  function fn_addFile(){
	  $("#d_file").append("<br>"+"<input  type='file' name='detail_image"+cnt+"' id='detail_image"+cnt+"'  onchange=readURL(this,'previewImage"+cnt+"') />");
	  $("#d_file").append("<img  id='previewImage"+cnt+"'   width=200 height=200  />");
	  $("#d_file").append("<input  type='button' value='추가'  onClick=addNewImageFile('detail_image"+cnt+"','${imageFileList[0].goods_id}','detail_image')  />");
	  cnt++;
  }
  
  // 기존 이미지를 다른 이미지로 변경한 후 FormData를 이용해 Ajax로 수정합니다.
  function modifyImageFile(fileId,goods_id, image_id,fileType){
    // alert(fileId);
	  var form = $('#FILE_FORM')[0];
      var formData = new FormData(form);
      
      // formData에 수정할 이미지와 이미지 정보를 name/value로 저장합니다.
      formData.append("fileName", $('#'+fileId)[0].files[0]);
      formData.append("goods_id", goods_id);
      formData.append("image_id", image_id);
      formData.append("fileType", fileType);
      
      $.ajax({
        url: '${contextPath}/admin/goods/modifyGoodsImageInfo.do',
        processData: false,
        contentType: false,
        // formData를 Ajax로 전송합니다.
        data: formData,
        type: 'POST',
	      success: function(result){
	         alert("이미지를 수정했습니다!");
	       }
      });
  }
  
  // 새 이미지 추가 후 FormData를 이용해 Ajax로 수정합니다.
  function addNewImageFile(fileId,goods_id, fileType){
	   //  alert(fileId);
		  var form = $('#FILE_FORM')[0];
	      var formData = new FormData(form);
	      formData.append("uploadFile", $('#'+fileId)[0].files[0]);
	      formData.append("goods_id", goods_id);
	      formData.append("fileType", fileType);
	      
	      $.ajax({
	          url: '${contextPath}/admin/goods/addNewGoodsImage.do',
	                  processData: false,
	                  contentType: false,
	                  data: formData,
	                  type: 'post',
	                  success: function(result){
	                      alert("이미지를 수정했습니다!");
	                  }
	          });
	  }
  
  // 이미지를 삭제합니다.
  function deleteImageFile(goods_id,image_id,imageFileName,trId){
	var tr = document.getElementById(trId);

      	$.ajax({
    		type : "post",
    		async : true, //false인 경우 동기식으로 처리한다.
    		url : "${contextPath}/admin/goods/removeGoodsImage.do",
    		data: {goods_id:goods_id,
     	           image_id:image_id,
     	           imageFileName:imageFileName},
    		success : function(data, textStatus) {
    			alert("이미지를 삭제했습니다.");
                tr.style.display = 'none';
    		},
    		error : function(data, textStatus) {
    			alert("에러가 발생했습니다." + textStatus);
    		},
    		complete : function(data, textStatus) {
    			//alert("작업을완료 했습니다");
    			
    		}
    	}); //end ajax	
  }
  
  /* 상품삭제 */
 function deleteGoods(goods_id) {
		  $.ajax({
		    type: "post",
		    async: true,
		    url: "${contextPath}/admin/goods/removeGoods.do",
		    data: { goods_id: goods_id },
		    success: function(data, textStatus) {
		      alert("상품을 삭제했습니다.");
		      location.href = "${contextPath}/admin/goods/adminGoodsMain.do";
		    },
		    error: function(data, textStatus) {
		      alert("에러가 발생했습니다." + textStatus);
		    },
		    complete: function(data, textStatus) {
		      //alert("작업을완료 했습니다");
		    }
		  }); //end ajax
		}
  
  function backToList(obj) {
		obj.action = "${contextPath}/admin/goods/adminGoodsMain.do";
		obj.submit();
	}
  
</script>

<title>상품 수정</title>
</head>
<body>
	<div class="admin-page">
		<div class="admin-text">
			<a href="${contextPath}/main/main.do"><img
				src="${contextPath}/resources/images/logo/logo2.png" alt="logo2" width="150px"  style="text-align: center;"></a>
		</div>

		<div class="category">
			<a href="#" data-category="상품 정보 수정"
				style="margin-bottom: 20px; margin-right: 10px; margin-left: 10px;">사</a> 
			<a href="#" data-category="문의 내역"
				style="margin-bottom: 20px; margin-right: 10px; margin-left: 10px;">문의내역</a>
 			<a href="${contextPath}/mypage/listMyOrderHistory.do" data-category="주문 내역"
				style="margin-bottom: 20px; margin-right: 10px; margin-left: 10px;">주문내역</a>
			<a href="#" data-category="리뷰 확인"
				style="margin-bottom: 20px; margin-right: 10px; margin-left: 10px;">리뷰확인</a>
			<a href="${contextPath}/mypage/deleteMemForm.do" data-category="회원탈퇴"
				style="margin-bottom: 20px; margin-right: 10px; margin-left: 10px;">회원탈퇴</a>
		</div>
	
	<!-- <div class="title_underline" id="order-history-title"> -->
		<h3><b>주문 배송 조회</b></h3>
	<!-- </div> -->
	
	<table class="form">
		<tbody align=center >
			<tr style="background:skyblue" >
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
				            ${item.goods_sales_price*item.order_quantity }원/${item.order_quantity }<br>
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
