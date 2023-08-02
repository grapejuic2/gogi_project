<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="imageFileList"  value="${servMap.imageFileList}"  />
<c:set var="servRead"  value="${servMap.servVO}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 조회</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="${contextPath}/resources/css/noticeRead.css" rel="stylesheet" type="text/css">
<script>

    // 댓글 등록 함수
    function fn_comment(cust_serv_no) {
        var cmt_content = $("#cmt_content").val();
        if (cmt_content === null || cmt_content.trim() === "") {
            alert("댓글 내용을 입력해주세요.");
        } else {
            $.ajax({
                type: 'POST',
                url: "<c:url value='/serv/addComment.do'/>", 
                data: $("#commentForm").serialize(),
                success: function (data) {
                    if (data === "success") {
                        alert("댓글을 등록했습니다.");
                        getCommentList(); // 댓글 등록 후 댓글 리스트 갱신
                        $("#cmt_content").val(""); // 댓글 작성 폼 초기화
                    }
                },
                error: function (request, status, error) {
                    alert("댓글 등록에 실패했습니다.");
                }
            });
        }
    }

    // 초기 페이지 로딩시 댓글 불러오기
    $(function () {
        getCommentList();
    });

    // 댓글 불러오기(AJAX)
	function getCommentList() {
	    $.ajax({
	        type: 'GET',
	        url: "${contextPath}/serv/commentList.do",
	        dataType: "json",
	        data: { cust_serv_no: ${servRead.cust_serv_no} }, // 현재 게시물의 cust_serv_no를 파라미터로 전달
	        success: function (data) {
	            var html = "";
	            var cCnt = data.length;
	
	            if (data.length > 0) {
	                for (i = 0; i < data.length; i++) {
	                    html += "<div>";
	                    html += "<div class='cmt'><table id='mem_id'><h2 style='margin-bottom: 10px;'><strong>" + data[i].mem_id + "<span class='cmt_date'>" + data[i].cmt_date + "</span>" + "</strong></h2>";
	                    html += data[i].cmt_content + "<tr><td></td></tr>";
	                    html += "</table></div>";
	                    html += "</div>";
	                }
	            } else {
	                html += "<div>";
	                html += "<div class='nonono'><table><h6 style='padding-right:140px;'><strong>등록된 댓글이 없습니다.</strong></h6>";
	                html += "</table></div>";
	                html += "</div>";
	            }
	
	            $("#cCnt").html(cCnt);
	            $("#CommentList").html(html);
	        },
	        error: function (request, status, error) {
	            alert("댓글 불러오기에 실패했습니다.");
	        }
	    });
	}
</script>
<style>
   .cmt {
      width: 900px;
      font-size: 1.5em;
      margin: 10px 0px;
      padding: 10px 0px;
      border-bottom: 1px solid #ccc;
   }
   .cmt_btn {
      width: 80px;
       height: 40px;
       font-size: 1.2em;
       font-weight: bold;
       background: rgb(245, 215, 0);
       border-radius: 5px;
       border: 0px;
       color: #fff;
   }
   .cmt_date {
      margin-left: 10px;
      font-weight: normal;
      font-size: 0.8em;
   }
   .nonono {
      width: 900px;
      text-align: center;
      font-size: 2em;
      margin: 10px 0px;
   }
</style>
</head>
<body>

	<h1>상세보기</h1>
	<div role="main" class="container">
		<div class="row row1">
			<table class="table" style="margin-bottom: 0px;">
				<tr>
					<th width=15% class="text-center fg lb fw">작성자</th>
					<td width=35% class="fgl" style="text-align: center;">${servRead.mem_id}</td>
					<th width=15% class="text-center lb fg fw">조회수</th>
					<td width=35% class="fgl bbu" style="text-align: center;">${servRead.cust_serv_hits}</td>
				</tr>
				<tr>
					<th width=15% class="text-center lb fg fw">제목</th>
					<td colspan="2" class="fgl">${servRead.cust_serv_title}</td>
					 
				</tr>
				<tr>
					<th width=15% class="text-center lb fg fw" style="vertical-align: middle;">문의 내역</th>
					<td colspan="4" class="text-left fg" valign="top" height="200">
					<pre class="fgl" style="white-space: pre-wrap; border: none; background-color: white;"> ${servRead.cust_serv_content}</pre>
					</td>
				</tr>
				<c:if test="${not empty imageFileList && imageFileList!='null' }">
					<c:forEach var="item" items="${imageFileList}">
						<tr>
						<th width=15% class="text-center lb fg fw" style="vertical-align: middle;">첨부 파일</th>
						<td class="result-images">						
							<img width=200 src="${contextPath}/thumbnails2.do?img_name=${item.img_name}&cust_serv_no=${item.cust_serv_no}" >						
						</td>
						</tr>
					</c:forEach>
				</c:if>
			
				
				<!-- 수정, 삭제, 목록 버튼 -->
				<tr>
					<td colspan="4" class="text-right">
						<div class="button-container" style="margin-top: 20px; margin-bottom: 20px;">
							<a class="atw" href="${contextPath}/serv/modify.do?cust_serv_no=${servRead.cust_serv_no}">
								<button type="submit" class="bbtn btn-sm btn-primary greylist">수정</button>
							</a>
							<a class="atw" href="${contextPath}/serv/delete.do?cust_serv_no=${servRead.cust_serv_no}">
								<button type="submit" class="btn btn-sm btn-primary greylist" style="height: 40px;">삭제</button>
							</a>
							<a class="atw" href="${contextPath}/serv/list.do">
								<button type="button" class="btn btn-sm btn-primary greylist" style="height: 40px;">목록</button>
							</a>
						</div>
					</td>
				</tr>
			</table>
			<div class="board_coment">  
			    <form id="commentForm" name="commentForm" method="post" style="margin-left:270px;">
			    <br><br>
			        <div>
			            <div style="margin-bottom: 10px;">
			                <span><strong>댓글</strong></span><span id="cCnt"></span>
			            </div>
			            <div>
			                <table class="table">                    
			                    <tr>
			                        <td>
			                            <textarea style="width: 750px; height: 80px;" rows="5" cols="10" id="cmt_content" name="cmt_content" placeholder="댓글을 입력하세요"></textarea>
			                            <a href='#' onClick="fn_comment('${servRead.cust_serv_no }')"><input type="button" value="등록" class="cmt_btn"></a>
			                        </td>
			                    </tr>
			                </table>
			            </div>
			        </div> 
			        <input type="hidden" id="cust_serv_no" name="cust_serv_no" value="${servRead.cust_serv_no }" />        
			    </form> 
				<form id="commentList" name="commentList" method="post">
				    <div id="CommentList"></div>
					</form>
						<div class="cmt-in hidden">
						    <button type="button" class="bbtn btn-sm btn-primary greylist" onclick="editComment()">수정</button>
						    <button type="button" class="bbtn btn-sm btn-primary greylist" onclick="deleteComment()">삭제</button>
						</div>
						
						<!-- 댓글 admin -->
						<div class="admin-comment-in hidden">
						    <button type="button" class="bbtn btn-sm btn-primary greylist" onclick="addComment()">등록</button>
						    <button type="button" class="bbtn btn-sm btn-primary greylist" onclick="editComment()">수정</button>
						    <button type="button" class="bbtn btn-sm btn-primary greylist" onclick="deleteComment()">삭제</button>
						</div>
				    <div class="cmt-out">
				</div>
        	</div>
   		</div>
   		</div>
   		<script>
			$(document).ready(function() {
				var userRole = '<c:out value="${sessionScope.memberInfo.mem_id}" />';
			    var isAdmin = userRole === 'admin';
			    
		        function toggleForm() {
		            if (isAdmin) {
		                $('.admin-comment-in').removeClass('hidden');
		                $('.cmt-in, .cmt-out').addClass('hidden');
		            } else if (userRole) {
		                $('.cmt-in').removeClass('hidden');
		                $('.admin-comment-in').addClass('hidden');
		            } else {
		                $('.cmt-in, .cmt-out, .admin-comment-in').addClass('hidden');
		            }
		        }
		        toggleForm();
		    });
			
			$(document).on("click", ".editComment", function () {

			    const comment_id = $(this).siblings('mem_id').val();
			    const comment_text = $(this).siblings('.').children('h5').text();
			    const comment_writer = $(this).siblings('b').text();

			    $("#comment_id").val(comment_id);
			    $("#comment_text").val(comment_text);
			    $("#comment_writer").val(comment_writer);

			});
		</script>
	</body>
</html>