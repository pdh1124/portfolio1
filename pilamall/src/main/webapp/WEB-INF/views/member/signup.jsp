<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core를 쓸 때 태그에 c로 표시  -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt를 쓸 때 태그에 fmt로 표시 fmt : formatter 형식 맞춰서 표시 -->

<%@ include file="../includes/header.jsp"%>

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
	
						<label>성함<span>*</span></label>
						<input type="text" id="userName" name="userName" required/>
						
						<label>이메일<span>*</span></label>
						<input type="text" id="userEmail" name="userEmail" required/>
						
						<label>핸드폰번호<span>*</span></label>
						<input type="text" id="userPhone" name="userPhone" required/>
						
						<label>주소1<span>*</span></label>
						<input type="text" id="userAddr1" name="userAddr1" required/>
						
						<label>주소2<span>*</span></label>
						<input type="text" id="userAddr2" name="userAddr2" required/>
						
						<label>주소3<span>*</span></label>
						<input type="text" id="userAddr3" name="userAddr3" required/>
						
						<input class="signup-button" type="submit" value="Sign up" />
					</form>
				</div>
			</div>
		</div>
	</div>
</div><!--End login Area-->

<%@ include file="../includes/footer.jsp"%>

<script>
$(document).ready(function() {
	
	//post 형식에 토큰 처리 (하지 않으면 post를 못함)
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	$(document).ajaxSend(function(e,xhr,options) {
		xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
	});
	
	//엔터키 누르면 넘어가는 이벤트 방지
	$('input').keydown(function() {
		if (event.keyCode === 13) {
			event.preventDefalut();
		}
	});
	
	//페이지를 시작하면 userId를 입력하는 칸에 포커스를 두어라
	$("#userId").focus();
	
	//아이디 a~z,0~9 5자리부터 15자리까지 한다.
	var idReg = /^[a-za-z0-9]{5,15}$/;
	
	//해당 안내문구를 가린다.
	$("#id-danger").hide();
	$("#id-error").hide();
	$("#id-success").hide();
	
	$("#userId").keyup(function() { //keyup() : 키보드 입력할 때마다 감지한다.
		console.log("작동확인");
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
	
	
	//검사를 통과하지 못했을 경우 
	function checkForm() {
		
		//아이디가 오류가 있거나 중복일 경우 실패처리
		if(document.getElementById("idCheckVal").value == 'N') {
			$("#userid").focus();
			return false;
		}
	}
});
</script>
