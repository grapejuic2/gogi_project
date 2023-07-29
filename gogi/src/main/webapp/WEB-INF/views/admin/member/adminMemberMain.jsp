<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script>

function search_member(search_period){	
	temp=calcPeriod(search_period);
	var date=temp.split(",");
	beginDate=date[0];
	endDate=date[1];
	//alert("beginDate:"+beginDate+",endDate:"+endDate);
	//return ;
	var formObj=document.createElement("form");
	var formObj=document.createElement("form");
	var i_beginDate = document.createElement("input"); 
	var i_endDate = document.createElement("input");
    
	i_beginDate.name="beginDate";
	i_beginDate.value=beginDate;
	i_endDate.name="endDate";
	i_endDate.value=endDate;
	
    formObj.appendChild(i_beginDate);
    formObj.appendChild(i_endDate);
    document.body.appendChild(formObj); 
    formObj.method="get";
    formObj.action="/gogi/admin/member/adminMemberMain.do";
    formObj.submit();
}

function fn_member_detail(mem_id){
    var frm_delivery_list = document.frm_delivery_list;

    var formObj = document.createElement("form");
    var i_mem_id = document.createElement("input");
    
    i_mem_id.name = "mem_id";
    i_mem_id.value = mem_id;
    
    formObj.appendChild(i_mem_id);
    document.body.appendChild(formObj); 
    formObj.method = "post";
    formObj.action = "/gogi/admin/member/memberDetail.do";
    formObj.submit();
}

//상세조회 버튼 클릭 시 수행
function fn_detail_search(){
	var frm_delivery_list=document.frm_delivery_list;
	
	beginYear=frm_delivery_list.beginYear.value;
	beginMonth=frm_delivery_list.beginMonth.value;
	beginDay=frm_delivery_list.beginDay.value;
	endYear=frm_delivery_list.endYear.value;
	endMonth=frm_delivery_list.endMonth.value;
	endDay=frm_delivery_list.endDay.value;
	search_type=frm_delivery_list.s_search_type.value;
	search_word=frm_delivery_list.t_search_word.value;

	var formObj=document.createElement("form");
	var i_command = document.createElement("input");
	var i_beginDate = document.createElement("input"); 
	var i_endDate = document.createElement("input");
	var i_search_type = document.createElement("input");
	var i_search_word = document.createElement("input");
	
    i_command.name="command";
    i_beginDate.name="beginDate";
    i_endDate.name="endDate";
    i_search_type.name="search_type";
    i_search_word.name="search_word";
    
    i_command.value="list_detail_order_goods";
	i_beginDate.value=beginYear+"-"+beginMonth+"-"+beginDay;
    i_endDate.value=endYear+"-"+endMonth+"-"+endDay;
    i_search_type.value=search_type;
    i_search_word.value=search_word;
	
    formObj.appendChild(i_command);
    formObj.appendChild(i_beginDate);
    formObj.appendChild(i_endDate);
    formObj.appendChild(i_search_type);
    formObj.appendChild(i_search_word);
    document.body.appendChild(formObj); 
    formObj.method="post";
    formObj.action="/${contextPath}/admin/member/memberDetail.do";
    formObj.submit();
	
}
function updateStatus(memberId, status, delNote) {
    // AJAX를 사용하여 서버로 상태 변경 요청과 메모를 전달
    $.ajax({
        type: 'POST', // POST 방식으로 전송
        url: '${pageContext.request.contextPath}/admin/member/updateStatus.do', // 요청할 URL (상황에 맞게 수정 필요)
        data: {
            memberId: memberId,
            status: status,
            delNote: delNote
        },
        success: function (response) {
            // 서버로부터 응답을 받은 후 실행되는 함수
            alert("변경하였습니다.");
            // 이후 필요한 처리를 수행하면 됩니다.
        },
        error: function (xhr, status, error) {
            // 서버 요청이 실패한 경우 실행되는 함수
            console.error("AJAX 오류 발생: " + error);
            // 이후 실패에 대한 처리를 수행하면 됩니다.
        }
    });
}
</script>
</head>
<body>

	<div class="title_underline">
		<h3 class="admin_member_title"><b>회원 조회</b></h3>
	</div>
	
<table class="table table-striped table-hover" style="width:1200px">
		<tbody align=center >
			<tr align=center bgcolor="#00BFFE">
				<td><span><b>회원아이디</b></span></td>
				<td><span><b>회원이름</b></span></td>
				<td><span><b>휴대폰번호</b></span></td>
				<td><span><b>주소</b></span></td>
				<td><span><b>가입일</b></span></td>
				<td><span><b>탈퇴여부</b></span></td>
				<td><span><b>비고</b></span></td>
				<td><span><b>수정하기</b></span></td>
			</tr>
   <c:choose>
     <c:when test="${empty listMember}">			
			<tr>
		       <td colspan=5 class="fixed">
				  <strong>조회된 회원이 없습니다.</strong>
			   </td>
		     </tr>
	 </c:when>
	 <c:otherwise>
	     <c:forEach var="item" items="${listMember}" varStatus="item_num">
	            <tr >       
					<td width=10%>
					  <a href="${pageContext.request.contextPath}/admin/member/memberDetail.do?mem_id=${item.mem_id}">
					     <span>${item.mem_id}</span>
					  </a>
					</td>
					<td width=10%>
					  <span>${item.mem_name}</span><br>
					</td>
					<td width=17% >
					  <span>${item.mem_tel1}-${item.mem_tel2}-${item.mem_tel3}</span><br>
					</td>
					<td width=37%>
					  <span>${item.roadAddress}</span><br>
					  <span>${item.jibunAddress}</span>
					  <span>${item.namujiAddress}</span><br>
					</td>
					<td width=15%>
					   <c:set var="join_date" value="${item.mem_reg_date}" />
					   <c:set var="arr" value="${fn:split(join_date,' ')}" />
					   <span><c:out value="${arr[0]}" /></span>
				    </td>
				    <td width=10%>
				       <select name="status">
                <option value="N" <c:if test="${item.mem_del_yn == 'N'}">selected</c:if>>활동중</option>
                <option value="B" <c:if test="${item.mem_del_yn == 'B'}">selected</c:if>>비활성화</option>
                <option value="Y" <c:if test="${item.mem_del_yn == 'Y'}">selected</c:if>>탈퇴</option>
            </select>
            
				    </td>
				    <td>
				    <span><textarea name="del_note">${item.del_note }</textarea></span>
				    </td>
				    <td>
				    <button onclick="updateStatus('${item.mem_id}', document.getElementsByName('status')[${item_num.index}].value, document.getElementsByName('del_note')[${item_num.index}].value)">변경</button>
				    </td>
				</tr>
		</c:forEach>
	</c:otherwise>
  </c:choose>	
         <tr>
             <td colspan=8 class="fixed">
                  <c:forEach   var="page" begin="1" end="10" step="1" >
		         <c:if test="${section >1 && page==1 }">
		          <a href="${contextPath}/admin/member/adminMemberMain.do?chapter=${section-1}&pageNum=${(section-1)*10 +1 }">&nbsp; &nbsp;</a>
		         </c:if>
		          <a href="${contextPath}/admin/member/adminMemberMain.do?chapter=${section}&pageNum=${page}">${(section-1)*10 +page } </a>
		         <c:if test="${page ==10 }">
		          <a href="${contextPath}/admin/member/adminMemberMain.do?chapter=${section+1}&pageNum=${section*10+1}">&nbsp; next</a>
		         </c:if> 
	      		</c:forEach> 
           </td>
        </tr>  		   
		</tbody>
	</table>
  	
<c:choose>
 <c:when test="${not empty order_goods_list }">	
   <DIV id="page_wrap">
		  <c:forEach   var="page" begin="1" end="10" step="1" >
		         <c:if test="${section >1 && page==1 }">
		          <a href="${contextPath}/admin/member/adminMemberMain.do?chapter=${section-1}&pageNum=${(section-1)*10 +1 }">&nbsp; &nbsp;</a>
		         </c:if>
		          <a href="${contextPath}/admin/member/adminMemberMain.do?chapter=${section}&pageNum=${page}">${(section-1)*10 +page } </a>
		         <c:if test="${page ==10 }">
		          <a href="${contextPath}/admin/member/adminMemberMain.do?chapter=${section+1}&pageNum=${section*10+1}">&nbsp; next</a>
		         </c:if> 
	      		</c:forEach> 
	</DIV>	
 </c:when>
</c:choose>
</body>
</html>

