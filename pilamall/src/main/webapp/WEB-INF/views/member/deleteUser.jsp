<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core를 쓸 때 태그에 c로 표시  -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt를 쓸 때 태그에 fmt로 표시 fmt : formatter 형식 맞춰서 표시 -->

<%@ include file="../includes/header.jsp"%>

<div class="page-title fix"><!--Start Title-->
	<div class="overlay section">
		<h2>로그인</h2>
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
					<form id="findid-form" method="post" action="/member/deleteUser">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						<h2>계정 탈퇴하기</h2>
						<p>가입하신 아이디와 이메일을 입력해 주시기 바랍니다.</p>
						<label>성함<span>*</span></label>
						<input type="text" id="userName" name="userName" placeholder="가입하신 성함을 입력해주세요" required/>
						<input type="hidden" id="naCheckVal" value="N" />
						<div class="text_fail" id="na-error" style="color:red">이름을 입력해주세요.</div>
						
						<label>이메일<span>*</span></label>
						<input type="text" id="userEmail" name="userEmail" placeholder="가입하신 이메일을 입력해주세요." required/>
						<input type="hidden" id="emCheckVal" value="N" />
						<div class="text_fail" id="em-error" style="color:red">이메일 형식에 맞게 작성해주세요.</div>
					
						<input class="findid-button" type="submit" value="아이디 찾기" />
					</form>
				</div>
			</div>
			
		</div>
	</div>
</div><!--End login Area-->

<%@ include file="../includes/footer.jsp"%>

<script>
$(document).ready(function() {
	/*이름 작성 확인*/
	//해당 안내문구를 가린다.
	$("#na-error").hide();
	
	//이름 작성 유무 확인
	$("#userName").keyup(function() {
		
		if ($("#userName").val() == "") {
			$("#na-error").show();
			document.getElementById("naCheckVal").value = 'N';
		} else {
			$("#na-error").hide();
			document.getElementById("naCheckVal").value = 'Y';
		}
	});
	
	
	/*이메일 형식 검사*/
	//해당 안내문구를 가린다.
	$("#em-error").hide();
	
	//이메일 유효성 및 중복 검사
	var emReg = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	
	$("#userEmail").keyup(function() {
		if($("#userEmail").val() != " ") {
			if (!emReg.test($("#userEmail").val())) {
				$("#em-error").show();
				document.getElementById("emCheckVal").value = 'N';
			} else if(emReg.test($("#userEmail").val())) {
				$("#em-error").hide();
				document.getElementById("emCheckVal").value = 'Y';
			}
		}
	});
	
	
	/*검사를 통과하지 못했을 경우*/
	var sendForm = $("#findid-form");
	
	$(".findid-button").on("click", function(e) {
		e.preventDefault();

		//이름이 비어있으면
		if(document.getElementById("naCheckVal").value == 'N') {
			alert("이름을 입력해 주세요.");
			$("#userName").focus();
			return false;
		}
		
		//비밀번호 유효성 체크
		if(document.getElementById("emCheckVal").value == 'N') {
			alert("이메일을 제대로 입력해 주세요.");
			$("#userEmail").focus();
			return false;
		}
		sendForm.submit();
	});
});
</script>
