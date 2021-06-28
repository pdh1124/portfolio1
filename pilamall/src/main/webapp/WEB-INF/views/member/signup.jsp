<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core를 쓸 때 태그에 c로 표시  -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt를 쓸 때 태그에 fmt로 표시 fmt : formatter 형식 맞춰서 표시 -->

<%@ include file="../includes/header.jsp"%>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<div class="page-title fix"><!--Start Title-->
	<div class="overlay section">
		<h2>회원가입</h2>
	</div>
</div><!--End Title-->
<div class="login-page page fix"><!--start login Area-->
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<div class="about-img">
					<img src="/resources/img/member/login_img.jpg" alt="" />
				</div>
			</div>
			<div class="col-sm-6">
				<div class="login">
					<form id="signup-form" method="post" action="/member/signup">
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}">
						<h2>회원가입</h2>
						<p>필라몰에서 나만의 계정을 만들어보세요.</p>
						<label>아이디<span>*</span></label>
						<input type="text" id="userId" name="userId" placeholder="아이디를 입력하세요. (영문 소문자, 숫자만 입력 가능)" required/>
						<input type="hidden" id="idCheckVal" value="N" />
						<div class="text_fail" id="id-danger" style="color:red">이미 존재하는 ID입니다.</div>
						<div class="text_fail" id="id-error" style="color:red">회원 ID는 띄어쓰기 없이 5~15자리의 영문자와 숫자만 가능합니다.</div>
						<div class="text_success" id="id-success" style="color:blue">사용가능한 ID 입니다.</div>


						<label>비밀번호<span>*</span></label>
						<input type="password" id="userPass" name="userPass" placeholder="비밀번호를 입력해주세요. (영문 대/소문자, 숫자를 모두 포함)" required/>
						<input type="hidden" id="pwCheckVal" value="N" />
						<div class="text_fail" id="pw-error" style="color:red">비밀번호는 영문,숫자,특수문자를 포함한 8자리 이상 작성해야 합니다.</div>
						
						<label>비밀번호확인<span>*</span></label>
						<input type="password" id="userPass_comp" name="userPass_comp" placeholder="비밀번호를 입력해주세요. (영문 대/소문자, 숫자를 모두 포함)" required/>
						<input type="hidden" id="pwcCheckVal" value="N" />
						<div class="text_fail" id="pw-danger" style="color:red">비밀번호가 일치하지 않습니다.</div>
						<div class="text_success" id="pw-success" style="color:blue">비밀번호가 일치합니다.</div>

						<label>성함<span>*</span></label>
						<input type="text" id="userName" name="userName" required />
						
						<label>이메일<span>*</span></label>
						<input type="text" id="userEmail" name="userEmail" required />
						<input type="hidden" id="emCheckVal" value="N" />
						<div class="text_fail" id="em-danger" style="color:red">이미 존재하는 E-mail입니다.</div>
						<div class="text_fail" id="em-error" style="color:red">E-mail 형식에 맞도록 작성하여주시기 바랍니다.</div>
						<div class="text_success" id="em-success" style="color:blue">사용가능한 E-mail 입니다.</div>
						<button class="check-button" id="emCheck-button">본인인증하기</button>
						
						<input type="text" class="compare" placeholder="인증 키 입력" style="display:none" />
						<button class="check-button" id="emNumCheck-button">인증 키 확인</button>
						
						<label>핸드폰번호<span>*</span></label>
						<input type="text" id="userPhone" name="userPhone" required />
						<input type="hidden" id="phCheckVal" value="N" />
						<div class="text_fail" id="ph-danger" style="color:red">이미 가입한 핸드폰 번호입니다.</div>
						<div class="text_fail" id="ph-error" style="color:red">010을 포함한 11자리의 숫자로 입력해주시기바랍니다.</div>
						<div class="text_success" id="ph-success" style="color:blue">사용가능한 핸드폰 번호 입니다.</div>
						
						<label>주소<span></span></label>
						<input type="text" id="userAddr1" name="userAddr1" placeholder="우편번호" required readonly="readonly"/>
						<button class="check-button" id="execDaumPostcode">우편번호 찾기</button>
											
						<input type="text" id="userAddr2" name="userAddr2" placeholder="주소" required readonly="readonly"/>
						
						<input type="text" id="userAddr3" name="userAddr3" placeholder="상세주소" required readonly="readonly"/>
						
						<input class="signup-button" type="submit" value="회원가입" />
					</form>
				</div>
			</div>
		</div>
	</div>
</div><!--End login Area-->

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
	
	//페이지를 시작하면 userId를 입력하는 칸에 포커스를 두어라
	$("#userId").focus();
	
	
	/*아이디 유효성 및 중복 체크*/
	//아이디 a~z,0~9 5자리부터 15자리까지 한다.
	var idReg = /^[a-za-z0-9]{5,15}$/;
	
	//해당 안내문구를 가린다.
	$("#id-danger").hide();
	$("#id-error").hide();
	$("#id-success").hide();
	
	$("#userId").keyup(function() { //keyup() : 키보드 입력할 때마다 감지한다.
		//console.log("작동확인");
		if($("#userId").val() != " ") { //val() : 양식의 값을 가져온다.
			if(idReg.test($("#userId").val())) { //test() : 찾는 문자열이, 들어있는지 아닌지를 알려준다.
				$.ajax({
					url: "/member/idCheck",
					data: {
						"userId": $("#userId").val()
					},
					dataType: "json",
					type: "post",
					async: false, //async는 기본이 true고, false를 하면 비동기식이 아닌 동기식방식으로 ajax를 호출하여 서버에 응답을 기다렸다가 응답을 모두 완료 후 다음 로직을 실행하는 동기식으로 변경
					success: function(data) {
						//아이디 중복 검사
						if(data == 1) { //이미 아이디가 있는 경우
							$("#id-danger").show();
							$("#id-error").hide();
							$("#id-success").hide();
							document.getElementById("idCheckVal").value="N";
						}
						else if(data == 0) { //아이디가 없어서 가입 가능할 경우
							$("#id-danger").hide();
							$("#id-error").hide();
							$("#id-success").show();
							document.getElementById("idCheckVal").value="Y";
						}
					}
				});
			} 
			else if(!idReg.test($("#userId").val())) { //유효성 검사를 통과하지 못한 경우
				$("#id-danger").hide();
				$("#id-error").show();
				$("#id-success").hide();
				document.getElementById("idCheckVal").value="N";
			}
		}
	});
	
	
	/*비밀번호 유효성 및 일치체크*/
	//비밀번호는 영문,숫자,특수문자를 포함한 8자리 이상 작성
	var pwReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
	
	//해당 안내문구를 가린다.
	$("#pw-danger").hide();
	$("#pw-error").hide();
	$("#pw-success").hide();
	
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


	/*이메일 형식, 중복 검사, 인증메일 확인*/
	//해당 안내문구를 가린다.
	$("#em-danger").hide();
	$("#em-error").hide();
	$("#em-success").hide();
	
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
	
	$("#emNumCheck-button").hide(); //인증 키 확인 버튼 숨기기
	$("#emCheck-button").hide(); //본인인증하기 버튼 숨기기
	var key = "";
	var isCertifiaction = false; //인증 성공여부 check
	
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
		
		//console.log("key : " + key);
		
		alert("작성하신 E-mail로 인증번호를 발송했습니다.");
		$(".compare").css("display", "block");
		$("#emNumCheck-button").show(); //인증 키 확인 버튼 숨기기
	});
	
	//인증번호 입력 후 인증 키 확인버튼 클릭
	$("#emNumCheck-button").on("click", function(e) {
		e.preventDefault();
		
		if($(".compare").val() == key) {
			alert("인증되었습니다.");
			isCertifiaction = true;
			console.log(isCertifiaction);
		} else {
			alert("인증번호가 일치하지 않습니다.");
			$(".compare").val("");
			isCertifiaction = false;
		}
	});
	
	
	/*핸드폰 유효성 및 중복 검사*/
	//해당 안내문구를 가린다.
	$("#ph-danger").hide();
	$("#ph-error").hide();
	$("#ph-success").hide();
	
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
	
	
	/*주소 버튼 post취소 후 execDaumPostcode메소드 실행*/
	$("#execDaumPostcode").on("click", function(e) {
		e.preventDefault();
		execDaumPostcode();
	});
	

		
	/*검사를 통과하지 못했을 경우*/
	var sendForm = $("#signup-form");
	
	$(".signup-button").on("click", function(e) {
		e.preventDefault();
		
		
		//아이디가 오류가 있거나 중복일 경우 실패처리
		if(document.getElementById("idCheckVal").value == 'N') {
			alert("아이디를 제대로 입력해주시기 바랍니다.");
			$("#userId").focus();
			return false;
		}
		
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
		
		//이메일 중복 체크
		if(document.getElementById("emCheckVal").value == 'N') {
			alert("이메일을 제대로 입력해주시길 바랍니다.");
			$("#userEmail").focus();
			return false;
		}
		
		//핸드폰 유효성 및 중복 체크
		if(document.getElementById("phCheckVal").value == 'N') {
			alert("핸드폰번호를 제대로 입력해주시기 바랍니다.");
			$("#userPhone").focus();
			return false;
		}
		
		console.log(isCertifiaction);
		
		//이메일 인증 여부
		if(isCertifiaction == true) {
			sendForm.submit();
		} 
		else {
			alert("메일 인증이 진행되지 않았습니다.");
			return false;
		}
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
