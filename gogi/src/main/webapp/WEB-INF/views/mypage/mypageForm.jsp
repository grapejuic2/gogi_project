<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<head>
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

#mem_id, #mem_name, #mem_email, #mem_pw {
	width: 200px;
}

#mem_birth_y, #mem_birth_m, #mem_birth_d, #mem_tel1, #mem_tel2,
	#mem_tel3 {
	width: 120px;
}

.category img {
	margin-right: 15px;
	margin-bottom: 50px;
}

.slidewrap {
	width: 100%;
	margin: 0 auto;
	position: relative;
	margin-bottom: 60px;
}

.category {
	display: flex;
	justify-content: center;
}
</style>

<link href="${contextPath}/resources/css/memberForm.css"
	rel="stylesheet" type="text/css">

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<title>회원 페이지</title>
</head>

<script>
function fn_modify_member_info(attribute){
	var value;
	// alert(member_id);
	// alert("mod_type:"+mod_type);
		var frm_mod_member=document.frm_mod_member;
		if(attribute=='member_pw'){
			value=frm_mod_member.member_pw.value;
			//alert("member_pw:"+value);
		}else if(attribute=='member_gender'){
			var member_gender=frm_mod_member.member_gender;
			for(var i=0; member_gender.length;i++){
			 	if(member_gender[i].checked){
					value=member_gender[i].value;
					break;
				} 
			}
			
		}else if(attribute=='member_birth'){
			var member_birth_y=frm_mod_member.member_birth_y;
			var member_birth_m=frm_mod_member.member_birth_m;
			var member_birth_d=frm_mod_member.member_birth_d;
			var member_birth_gn=frm_mod_member.member_birth_gn;
			
			for(var i=0; member_birth_y.length;i++){
			 	if(member_birth_y[i].selected){
					value_y=member_birth_y[i].value;
					break;
				} 
			}
			for(var i=0; member_birth_m.length;i++){
			 	if(member_birth_m[i].selected){
					value_m=member_birth_m[i].value;
					break;
				} 
			}
			
			for(var i=0; member_birth_d.length;i++){
			 	if(member_birth_d[i].selected){
					value_d=member_birth_d[i].value;
					break;
				} 
			}
			
			//alert("수정 년:"+value_y+","+value_m+","+value_d);
			for(var i=0; member_birth_gn.length;i++){
			 	if(member_birth_gn[i].checked){
					value_gn=member_birth_gn[i].value;
					break;
				} 
			}
			//alert("생년 양음년 "+value_gn);
			value=+value_y+","+value_m+","+value_d+","+value_gn;
		}else if(attribute=='tel'){
			var tel1=frm_mod_member.tel1;
			var tel2=frm_mod_member.tel2;
			var tel3=frm_mod_member.tel3;
			
			for(var i=0; tel1.length;i++){
			 	if(tel1[i].selected){
					value_tel1=tel1[i].value;
					break;
				} 
			}
			value_tel2=tel2.value;
			value_tel3=tel3.value;
			value=value_tel1+","+value_tel2+", "+value_tel3;
		}else if(attribute=='hp'){
			var hp1=frm_mod_member.hp1;
			var hp2=frm_mod_member.hp2;
			var hp3=frm_mod_member.hp3;
			var smssts_yn=frm_mod_member.smssts_yn;
			
			for(var i=0; hp1.length;i++){
			 	if(hp1[i].selected){
					value_hp1=hp1[i].value;
					break;
				} 
			}
			value_hp2=hp2.value;
			value_hp3=hp3.value;
			value_smssts_yn=smssts_yn.checked;
			value=value_hp1+","+value_hp2+", "+value_hp3+","+value_smssts_yn;
		}else if(attribute=='mem_email'){
			var email1=frm_mod_member.email1;
			
			value_email1=email1.value;
			value=value_email1;
			//alert(value);
		}else if(attribute=='address'){
			var zipcode=frm_mod_member.zipcode;
			var roadAddress=frm_mod_member.roadAddress;
			var jibunAddress=frm_mod_member.jibunAddress;
			var namujiAddress=frm_mod_member.namujiAddress;
			
			value_zipcode=zipcode.value;
			value_roadAddress=roadAddress.value;
			value_jibunAddress=jibunAddress.value;
			value_namujiAddress=namujiAddress.value;
			value=value_zipcode+","+value_roadAddress+","+value_jibunAddress+","+value_namujiAddress;
		}
		console.log(attribute);
		
		$.ajax({
			type : "post",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/mypage/modifyMyInfo.do",
			data : {
				attribute : attribute,
				value : value,
			},
			success : function(data, textStatus) {
				if (data.trim() === 'mod_success') {
					alert("회원 정보를 수정했습니다.");
				} else if (data.trim() === 'failed') {
					alert("다시 시도해 주세요.");
				}
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다." + data);
			},
			complete : function(data, textStatus) {
				alert("작업을 완료 했습니다");
			}
		});
	}

	//주소 스크립트
	function execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 도로명 조합형 주소 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('roadAddress').value = fullRoadAddr;
						document.getElementById('jibunAddress').value = data.jibunAddress;

						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							//예상되는 도로명 주소에 조합형 주소를 추가한다.
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
						} else {
							document.getElementById('guide').innerHTML = '';
						}

						window.close();
					}
				}).open();
	}
</script>

<body>
	<div class="memberForm-page">
		<div class="memberForm-text">
			<a href="${contextPath}/main/main.do"><img
				src="${contextPath}/resources/images/logo/logo2.png" alt="logo2"
				width="150px"></a>
		</div>

		<div class="category">
			<a href="${contextPath}/mypage/mypageForm.do"
				data-category="개인 정보 수정"
				style="margin-bottom: 20px; margin-right: 10px; margin-left: 10px;">개인정보
				수정</a> <a href="#" data-category="문의 내역"
				style="margin-bottom: 20px; margin-right: 10px; margin-left: 10px;">문의내역</a>
			<a href="#" data-category="포인트 조회"
				style="margin-bottom: 20px; margin-right: 10px; margin-left: 10px;">포인트조회</a>
			<a href="#" data-category="주문 내역"
				style="margin-bottom: 20px; margin-right: 10px; margin-left: 10px;">주문내역</a>
			<a href="#" data-category="장바구니"
				style="margin-bottom: 20px; margin-right: 10px; margin-left: 10px;">장바구니</a>
			<a href="#" data-category="회원탈퇴"
				style="margin-bottom: 20px; margin-right: 10px; margin-left: 10px;">회원
				탈퇴</a>
		</div>

		<div class="form">
			<form name="frm_mod_member" class="configform"
				action="${contextPath}/mypage/modifyMyInfo.do" method="post">
				<h2 style="margin-bottom: 20px; margin-top: 0px;">개인 정보 수정</h2>

				<div class="form-group" style="margin-bottom: 0px;">
					<div class="label-group">
						<label for="myp_id">아이디</label>
					</div>
					<input type="text" name="mem_id" value="${memberInfo.mem_id}"
						disabled />
				</div>

				<div class="form-group">
					<div class="label-group">
						<label for="mem_pw">비밀번호</label>
					</div>
					<input type="password" placeholder="비밀번호" name="mem_pw"
						style="margin-right: 5px;">
				</div>

				<div class="form-group">
					<div class="label-group">
						<label for="mem_name">이름</label>
					</div>
					<input type="text" name="mem_name" value="${memberInfo.mem_name}"
						disabled />
				</div>

				<div class="form-group">
					<div class="label-group">
						<label for="mem_birth">생년월일</label>
					</div>
					<div class="input-group">
						<input type="text" id="mem_birth_y" name="mem_birth_y"
							placeholder="년" maxlength="4"> <input type="text"
							id="mem_birth_m" name="mem_birth_m" placeholder="월" maxlength="2">
						<input type="text" id="mem_birth_d" name="mem_birth_d"
							placeholder="일" maxlength="2">
					</div>
				</div>

				<div class="form-group">
					<div class="label-group">
						<label for="mem_tel">연락처</label>
					</div>
					<div class="input-group">
						<input type="text" id="mem_tel1" name="member_tel1"
							placeholder="통신사" maxlength="3"> <input type="text"
							id="mem_tel2" name="member_tel2" placeholder="중간 번호"
							maxlength="4"> <input type="text" id="mem_tel3"
							name="member_tel3" placeholder="마지막 번호" maxlength="4">
					</div>
				</div>

				<div class="form-group">
					<!-- 주소 폼 -->
					<div class="label-group">
						<label for="mem_addr">주소</label>

					</div>
					<div class="input-group">
						<input type="text" id="zipcode" name="zipcode" size="50">
					</div>
				</div>
				<button>
					<a href="javascript:execDaumPostcode()">우편번호검색</a>
				</button>

				<div class="form-group">
					<div class="label-group">
						<label for="mem_addr">도로명 주소</label>
						</div>
						<div class="input-group">
							<input type="text" id="roadAddress" name="roadAddress" size="50"><br>
						</div>
				</div>
				<div class="form-group">
					<div class="label-group">
						<label for="mem_addr">지번 주소</label>
						</div>
						<div class="input-group">
							<input type="text" id="jibunAddress" name="jibunAddress"
								size="50"><br>
						</div>
					</div>
				<div class="form-group">
					<div class="label-group">
						<label for="mem_addr">나머지 주소</label>
						</div>
						<div class="input-group">
							<input type="text" name="namujiAddress" size="50" />
						</div>
				</div>

				<div class="form-group">
					<div class="label-group">
						<label for="mem_email">이메일</label>
					</div>
					<input type="text" placeholder="이메일" id="mem_email" name="mem_email" />
				</div>

				<button type="button" onclick="fn_modify_member_info()">정보수정</button>

				<input type="hidden" name="mem_id" value="${memberInfo.mem_id}" />
				<input type="hidden" name="mem_name" value="${memberInfo.mem_name}" />
				<input type="hidden" name="mem_birth_y" value="" /> 
				<input type="hidden" name="mem_birth_m" value="" /> 
				<input type="hidden" name="mem_birth_d" value="" /> 
				<input type="hidden" name="mem_tel1" value="" /> 
				<input type="hidden" name="mem_tel2" value="" /> 
				<input type="hidden" name="mem_tel3" value="" /> 
				<input type="hidden" name="mem_email" value="" />
			</form>
		</div>
	</div>
</body>
</html>