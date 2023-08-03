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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

    // 댓글 목록 표시 함수
    function showCommentList(data) {
        var html = "";
        var cCnt = data.length;

        if (data.length > 0) {
            for (i = 0; i < data.length; i++) {
                html += "<div>";
                html += "<div class='cmt'><table id='mem_id'><h2 style='margin-bottom: 10px;'><strong>" + data[i].mem_id + "<span class='cmt_date'>" + data[i].cmt_date + "</span>" + "</strong></h2>";
                html += data[i].cmt_content + "<tr><td></td></tr>";
                html += "<a href='#' class='reply-button' data-cmtid='" + data[i].cmt_number + "' data-memid='" + data[i].mem_id + "'>답글 달기</a>";
                html += "<div class='replyFormContainer'></div>";
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
                showCommentList(data); // 댓글 목록을 표시하는 함수 호출
            },
            error: function (request, status, error) {
                alert("댓글 불러오기에 실패했습니다.");
            }
        });
    }
    
    function submitReplyForm(button) {
        var replyContent = $(button).closest('.reply-form').find("#reply_content").val();
        var parentCommentId = $(button).closest('.reply-form').find("#parent_comment_id").val();
        var parentCommentAuthor = $(button).closest('.reply-form').find("#parent_comment_author").val();
        var custServNo = $("#cust_serv_no").val(); // 현재 게시물의 cust_serv_no

        if (replyContent === null || replyContent.trim() === "") {
            alert("대댓글 내용을 입력해주세요.");
        } else {
            $.ajax({
                type: 'POST',
                url: "${contextPath}/serv/addReply.do",
                data: {
                    cust_serv_no: custServNo,
                    parent_comment_id: parentCommentId,
                    parent_comment_author: parentCommentAuthor,
                    reply_content: replyContent
                },
                success: function (data) {
                    if (data === "success") {
                        alert("대댓글을 등록했습니다.");
                        getCommentList(); // 댓글 목록을 갱신하여 표시
                        $(button).closest('.reply-form').find("#reply_content").val(""); // 대댓글 작성 폼 텍스트 영역 초기화
                    }
                },
                error: function (request, status, error) {
                    alert("대댓글 등록에 실패했습니다.");
                }
            });
        }
    }
    
    $(document).on("click", ".reply-button", function (event) {
        event.preventDefault(); // 기본 동작 막기

        // 클릭된 "답글 달기" 버튼이 속한 댓글에 대한 정보 가져오기
        var parentCommentId = $(this).data("parent_comment_id"); // data-cmtid 속성에서 값을 가져옴
        var parentCommentAuthor = $(this).data("memid"); // data-memid 속성에서 값을 가져옴
        alert("parentCommentId: "+ parentCommentId + "<br>" +"parentCommentAuthor: "+ parentCommentAuthor);
        
        // 대댓글 작성 폼 토글
        showReplyForm(parentCommentId, parentCommentAuthor, this);
    });
    
    function showReplyForm(parentCommentId, parentCommentAuthor, button) {
        var replyFormHtml = '<div class="reply-form">' +
            '<table>' +
            '<tr>' +
            '<td>' +
            '<textarea style="width: 700px; height: 40px;" rows="3" cols="10" id="reply_content" name="reply_content" placeholder="대댓글을 입력하세요"></textarea>' +
            '<input type="hidden" id="parent_comment_id" name="cmt_parent_num" value="' + parentCommentId + '">' +
            '<input type="hidden" id="parent_comment_author" name="mem_id" value="' + parentCommentAuthor + '">' +
            '<input type="button" value="등록" class="cmt_btn" onClick="submitReplyForm(this)">' +
            '</td>' +
            '</tr>' +
            '</table>' +
            '</div>';

        var replyFormContainer = $(button).closest('.cmt').find('.replyFormContainer');
        var isReplyFormVisible = replyFormContainer.hasClass('showing');
        if (isReplyFormVisible) {
            replyFormContainer.removeClass('showing').empty();
        } else {
            replyFormContainer.addClass('showing').html(replyFormHtml);
        }
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
   
       /* 기본적으로 폼을 숨김 */
    .replyFormContainer {
        display: none;
    }
    /* .showing 클래스를 가지면 폼을 보이도록 변경 */
    .replyFormContainer.showing {
        display: block;
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
			
		<!-- 댓글 목록과 대댓글 작성 폼 영역 -->
        <div class="board_coment">  
            <!-- 댓글 등록 폼 -->
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
                <input type="hidden" id="cust_serv_no" name="cust_serv_no" value="${servRead.cust_serv_no}" />        
            </form> 

            <!-- 댓글 목록 표시 -->
			<div id="CommentList">
			    <c:if test="data.length > 0">
				    <c:forEach var="item" items="data">
				        <div>
				            <div class="cmt">
				                <table id="mem_id">
				                 <tr>
				                 <td>
				                    <h2 style="margin-bottom: 10px;"><strong>${item.mem_id}<span class="cmt_date">${item.cmt_date}</span></strong></h2>
				                    ${item.cmt_content}
				                  <a href='#' class='reply-button' data-cmtid='${item.cmt_number}' data-memid='${item.mem_id}' data-parent_comment_id='${item.cmt_parent_num}'>답글 달기</a>
				                 </td>
				                 </tr>
				                <tr>
				                  <td>    
				                    <!-- 여기에서 대댓글 작성 폼을 추가하기 위해 replyFormContainer를 클래스로 변경 -->
				                    <div class="replyFormContainer"></div>
				                  </td>
				                 <tr>
				                </table>
				            </div>
				        </div>
				    </c:forEach>
				</c:if>
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