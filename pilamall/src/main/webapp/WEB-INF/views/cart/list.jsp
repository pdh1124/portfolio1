<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core를 쓸 때 태그에 c로 표시  -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt를 쓸 때 태그에 fmt로 표시 fmt : formatter 형식 맞춰서 표시 -->

<%@ include file="../includes/header.jsp"%>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<section class="blog-page page fix"><!-- Start Blog Area-->
	<div class="container">
		<div class="row">
			<div class="col-sm-4 col-md-3">
				<div class="single-sidebar">
					<h2>마이 페이지</h2>
					<ul>
						<li><a href="/member/mypage">회원정보 수정</a></li>
						<li><a href="/cart/list">장바구니</a></li>
						<li><a href="#">구매내역</a></li>
						<li><a href="#">환불내역</a></li>
						<li><a href="#">내 문의 내역</a></li>
					</ul>
				</div>
			</div>
			<div class="col-sm-8 col-md-9">
				<div class="login">
					<form id="info-form" name="updateInfo" method="post" action="/order/info">
						<h2>장바구니</h2>
						<!-- 장바구니 리스트 -->
						<table class="table cart-table goods-table">
							<thead class="table-title">
								<tr>
									<th class="c-img">이미지</th>
									<th class="c-name">제품명</th>
									<th class="c-stock">수량</th>
									<th class="c-price">가격</th>
									<th class="c-total">총 가격</th>
									<th class="c-remove">삭제</th>
								</tr>													
							</thead>
							<c:set var="sum" value="0" />
							<tbody>
								<c:forEach items="${cart }" var="cart">
								<input type="hidden" name="userId" id="userId" value="${cart.userId }">
									<tr class="table-info">
										<td class="c-img"><img src="${cart.thumbImg }"></td>
										<td class="c-name">${cart.gdsName }</td>
										<td class="c-stock"><strong>${cart.cartStock }</strong> 개</td>
										<td class="c-price"><strong>${cart.price }</strong> 원</td>
										<td class="c-total"><strong>${cart.cartStock * cart.price }</strong> 원</td>
										<td class="c-remove"><button type="submit" class="cart_delete" value="${cart.gdsNum }" id="gdsNum">삭제</button></td>
									</tr>
									<c:set var="sum" value="${sum + (cart.price * cart.cartStock) }" />
								</c:forEach>
							</tbody>
						</table>
						
						<!-- 총 가격 -->
						<div class="listResult">
							<div class="cart_sum">
								<fieldset>
									<c:if test="${sum < 50000 && sum != 0}">
										<legend>배송비 3000원</legend>
									</c:if>
								</fieldset>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section><!-- Start Blog Area-->

<%@ include file="../includes/footer.jsp"%>

<script>
$(document).ready(function() {
	
	/*기본 셋팅*/
	//post 형식에 토큰 처리 (하지 않으면 post를 못함)
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	$(document).ajaxSend(function(e,xhr,options) {
		xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
	});
	
	//엔터키 누르면 넘어가는 이벤트 방지
	$('input').keydown(function() {
		if (event.keyCode === 13) {
			console.log("엔터키!!!");
			event.preventDefault();
		}
	});

	//수정완료버튼 가리기
	$(".signup-button").hide();
	
	//form을 보내기 위해 변수 지정
	var sendForm = $("#info-form");
	
	
	/*비밀번호변경*/
	//비밀번호는 영문,숫자,특수문자를 포함한 8자리 이상 작성
	var pwReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
	
	//해당 안내문구를 가린다.
	$("#userPass_comp").hide();
	$("#pw-danger").hide();
	$("#pw-error").hide();
	$("#pw-success").hide();
	
	//비밀번호 수정버튼
	$("#mo_password").on("click", function(e) {
		e.preventDefault();
		$("#mo_password").hide();
		$("#userPass").attr("readonly", false);
		$("#userPass").css("pointer-events", 'auto');
		$("#userPass_comp").show();
		$("#userPass_comp").css("pointer-events", 'auto');
		$("#pw_submit").show();
		$("#pw_submit").css("pointer-events", 'auto');
		document.getElementById("pwCheckVal").value="N";
		document.getElementById("pwcCheckVal").value="N";
	});
	
	//유효성 검사
	$("#userPass").keyup(function() {
		
		var pwd1 = $("#userPass").val();
		
		if(pwd1 != "") {
			if (pwReg.test($("#userPass").val())) {
				$("#pw-danger").hide();
				$("#pw-error").hide();
				$("#pw-success").hide();
				document.getElementById("pwCheckVal").value="Y";
			}
			else if (!pwReg.test($("#userPass").val())) {
				$("#pw-danger").hide();
				$("#pw-error").show();
				$("#pw-success").hide();
				document.getElementById("pwCheckVal").value="N";
			}
		}
	});
	
	
	//비밀번호 일치 체크
	$("#userPass_comp").keyup(function() {
		
		var pwd1 = $("#userPass").val();
		var pwd2 = $("#userPass_comp").val();
		
		if(pwd1 != "" || pwd2 != "") {
			if(pwd1 != pwd2) {
				if (pwd2 != "") {
					$("#pw-danger").show();
					$("#pw-error").hide();
					$("#pw-success").hide();
					document.getElementById("pwcCheckVal").value="N";
				}
			}
			else {
				console.log("hi");
				$("#pw-danger").hide();
				$("#pw-error").hide();
				$("#pw-success").show();
				document.getElementById("pwcCheckVal").value="Y";
			}
		}
	});


	$(document).on('click', '#pw_submit', function(e) {
		e.preventDefault(); //이벤트 막기
		//비밀번호 유효성 체크
		if(document.getElementById("pwCheckVal").value == 'N') {
			alert("비밀번호를 제대로 입력해주시기 바랍니다.");
			$("#userPass").focus();
			return false;
		}
		
		//비밀번호 일치 체크
		if(document.getElementById("pwcCheckVal").value == 'N') {
			alert("비밀번호를 일치시켜 주시기 바랍니다.");
			$("#userPass_comp").focus();
			return false;
		}
		alert("비밀번호가 수정되었습니다.");
		
		sendForm.submit();
	});

	
	/*이름 변경*/
	//이름 수정버튼
	$("#mo_name").on("click", function(e) {
		e.preventDefault();
		$("#mo_name").hide();
		$("#userName").attr("readonly", false);
		$("#userName").attr("value", "");
		$("#userName").css("pointer-events", 'auto');
		$("#na_submit").show();
		$("#na_submit").css("pointer-events", 'auto');
		document.getElementById("naCheckVal").value="N";	
	});
	
	//수정완료버튼
	$(document).on('click', '#na_submit', function(e) {
		e.preventDefault(); //이벤트 막기
		//이름 체크
		if($("#userName").val() == "") {
			document.getElementById("naCheckVal").value="N";
			alert("이름을 입력해 주시기 바랍니다.");
			$("#userName").focus();
			return false;
		} else {
			document.getElementById("naCheckVal").value="Y";
		}

		alert("이름이 수정되었습니다.");
		sendForm.submit();
	});
	
	
	/*이메일 변경*/
	//해당 안내문구를 가린다.
	$("#em-danger").hide();
	$("#em-error").hide();
	$("#em-success").hide();
	$("#compare").hide();
	$("#emCheck-button").hide();
	$("#emNumCheck-button").hide();
	var key = "";
	var isCertifiaction = false; //인증 성공여부 check
	
	//이메일 수정버튼
	$("#mo_email").on("click", function(e) {
		e.preventDefault();
		$("#mo_email").hide();
		$("#userEmail").attr("readonly", false);
		$("#userEmail").attr("value", "");
		$("#userEmail").css("pointer-events", 'auto');
		$("#em_submit").show();
		$("#em_submit").css("pointer-events", 'auto');
		//$("#compare").show();
		//$("#emCheck-button").show();
		//$("#emNumCheck-button").show();
		document.getElementById("emCheckVal").value="N";	
	});
	
	//이메일 유효성 및 중복 검사
	var emReg = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	$("#userEmail").keyup(function() {
		
		if($("#userEmail").val() != " ") {
			if(emReg.test($("#userEmail").val())) {
				
				$.ajax({
					url: "/member/emCheck",
					data: {
						"userEmail": $("#userEmail").val()
					},
					dataType: "json",
					type: "post",
					async: false,
					success: function(data) {
						if(data == 1) {
							$("#em-danger").show();
							$("#em-error").hide();
							$("#em-success").hide();
							$("#emCheck-button").hide(); //본인인증하기 버튼 숨기기
							document.getElementById("emCheckVal").value = 'N';
						}
						else if (data == 0) {
							$("#em-danger").hide();
							$("#em-error").hide();
							$("#em-success").show();
							$("#emCheck-button").show(); //본인인증하기 버튼 숨기기
							document.getElementById("emCheckVal").value = 'Y';
						}
					}
				});
			}
			else if (!emReg.test($("#userEmail").val())) {
				$("#em-danger").hide();
				$("#em-error").show();
				$("#em-success").hide();
				$("#emCheck-button").hide(); //본인인증하기 버튼 숨기기
				document.getElementById("emCheckVal").value = 'N';
			}
		}
	});
	
	//본인인증버튼 클릭시 메일 보내기
	$("#emCheck-button").on("click", function(e) {
		e.preventDefault();
		$.ajax({
			type: 'post',
			url: "/member/emailAuth",
			dataType: 'json',
			async: false,
			data: {
				"userEmail": $("#userEmail").val()
			},
			success: function(data) {
				key = data.key;
			}
		}); 
		
		alert("작성하신 E-mail로 인증번호를 발송했습니다.");
		$("#compare").show()
		$("#compare").css("pointer-events", 'auto');
		$("#emNumCheck-button").show(); //인증 키 확인 버튼 숨기기
		
	});
	
	//인증번호 입력 후 인증 키 확인버튼 클릭
	$("#emNumCheck-button").on("click", function(e) {
		e.preventDefault();
		
		if($(".compare").val() == key) {
			alert("인증되었습니다.");
			isCertifiaction = true;
			
		} else {
			alert("인증번호가 일치하지 않습니다.");
			$(".compare").val("");
			isCertifiaction = false;
		}
	});
	
	//수정완료버튼
	$(document).on('click', '#em_submit', function(e) {
		e.preventDefault(); //이벤트 막기
		//이름 체크
		//이메일 중복 체크
		if(document.getElementById("emCheckVal").value == 'N') {
			alert("이메일을 제대로 입력해주시길 바랍니다.");
			$("#userEmail").focus();
			return false;
		}

		//이메일 인증 여부
		if(isCertifiaction == true) {
			alert("메일 수정이 완료되었습니다.")
			sendForm.submit();
		} 
		else {
			alert("메일 인증이 진행되지 않았습니다.");
			return false;
		}
		
	});
	
	
	/*핸드폰번호 변경*/
	//해당 안내문구를 가린다.
	$("#ph-danger").hide();
	$("#ph-error").hide();
	$("#ph-success").hide();
	
	//이메일 수정버튼
	$("#mo_phone").on("click", function(e) {
		e.preventDefault();
		$("#mo_phone").hide();
		$("#userPhone").attr("readonly", false);
		$("#userPhone").attr("value", "");
		$("#userPhone").css("pointer-events", 'auto');
		$("#ph_submit").show();
		$("#ph_submit").css("pointer-events", 'auto');
		document.getElementById("phCheckVal").value="N";	
	});
	
	//휴대폰 유효성 범위
	var phReg = /^[0-9]{11}$/;
	
	$("#userPhone").keyup(function() {
		if($("#userPhone").val() != " ") {
			if(phReg.test($("#userPhone").val())) {
				
				$.ajax({
					url: "/member/phCheck",
					data: {
						"userPhone":$("#userPhone").val()
					},
					dataType: "json",
					type: "post",
					async: false,
					success: function(data) {
						if(data == 1) {
							$("#ph-danger").show();
							$("#ph-error").hide();
							$("#ph-success").hide();
							document.getElementById("phCheckVal").value = 'N';
						} 
						else if(data == 0) {
							$("#ph-danger").hide();
							$("#ph-error").hide();
							$("#ph-success").show();
							document.getElementById("phCheckVal").value = 'Y';
						}
					}
				});
			}
			
 			else if(!phReg.test($("#userPhone").val())) {
				$("#ph-danger").hide();
				$("#ph-error").show();
				$("#ph-success").hide();
				document.getElementById("phCheckVal").value = 'N';
			}
		}
	});
	
	$(document).on('click', '#ph_submit', function(e) {
		e.preventDefault(); //이벤트 막기
		
		if(document.getElementById("phCheckVal").value == 'N') {
			alert("핸드폰번호를 양식에 맞게 작성하시길 바랍니다.");
			$("#userPhone").focus();
			return false;
		}

		sendForm.submit();
	});
	
	
	/*주소변경*/
	$("#execDaumPostcode").hide();
	
	//이메일 수정버튼
	$("#mo_addr").on("click", function(e) {
		e.preventDefault();
		$("#mo_addr").hide();
		$("#userAddr1").attr("pointer-events", 'auto');
		$("#userAddr1").attr("value", "");
		$("#execDaumPostcode").show();
		$("#userAddr2").attr("pointer-events", 'auto');
		$("#userAddr2").attr("value", "");
		$("#userAddr3").attr("pointer-events", 'auto');
		$("#userAddr3").attr("value", "");
		$("#userAddr3").attr("readonly", false);
		$("#ad_submit").show();
		$("#ad_submit").css("pointer-events", 'auto');
	});
	
	/*주소 버튼 post취소 후 execDaumPostcode메소드 실행*/
	$("#execDaumPostcode").on("click", function(e) {
		e.preventDefault();
		execDaumPostcode();
	});
	
	$(document).on('click', '#ad_submit', function(e) {
		e.preventDefault(); //이벤트 막기

		if($("#userAddr1").val() == "") {
			alert("주소를 입력해주시기 바랍니다.");
			return false;
		}
		
		if($("#userAddr3").val() == "") {
			alert("주소를 입력해주시기 바랍니다.");
			$("#userAddr3").focus();
			return false;
		}
		
		sendForm.submit();
	});
	
});

/*주소 처리를 위해 다음주소 연동
http://postcode.map.daum.net/guide#sample*/
function execDaumPostcode() {
	new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            
        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                // document.getElementById("sample6_extraAddress").value = extraAddr;
                addr += extraAddr;
            
            } else {
                //document.getElementById("sample6_extraAddress").value = '';
                addr += ' ';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            //document.getElementById('sample6_postcode').value = data.zonecode;
            //document.getElementById("sample6_address").value = addr;
            $("#userAddr1").val(data.zonecode);
            $("#userAddr2").val(addr);
            // 커서를 상세주소 필드로 이동한다.
            //document.getElementById("sample6_detailAddress").focus();
            $("#userAddr3").attr("readonly", false);
            $("#userAddr3").focus();
        }
    }).open(); 
}
</script>