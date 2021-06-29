<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core를 쓸 때 태그에 c로 표시  -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt를 쓸 때 태그에 fmt로 표시 fmt : formatter 형식 맞춰서 표시 -->

<%@ include file="../includes/header.jsp"%>

<section class="blog-page page fix"><!-- Start Blog Area-->
	<div class="container">
		<div class="row">
			<div class="col-sm-4 col-md-3">
				<div class="single-sidebar">
					<h2>마이 페이지</h2>
					<ul>
						<li><a href="/member/mypage">회원정보 수정</a></li>
						<li><a href="#">장바구니</a></li>
						<li><a href="#">구매내역</a></li>
						<li><a href="#">환불내역</a></li>
						<li><a href="#">내 문의 내역</a></li>
					</ul>
				</div>
			</div>
			<div class="col-sm-8 col-md-9">
				<div class="login">
					<form id="signup-form" method="post" action="/member/signup">
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}">
						<h2>회원가입</h2>
						<p>필라몰에서 나만의 계정을 만들어보세요.</p>
						<label>아이디</label>
						<input type="text" id="userId" name="userId" placeholder="아이디를 입력하세요. (영문 소문자, 숫자만 입력 가능)" required/>
						<input type="hidden" id="idCheckVal" value="N" />
						<div class="text_fail" id="id-danger" style="color:red">이미 존재하는 ID입니다.</div>
						<div class="text_fail" id="id-error" style="color:red">회원 ID는 띄어쓰기 없이 5~15자리의 영문자와 숫자만 가능합니다.</div>
						<div class="text_success" id="id-success" style="color:blue">사용가능한 ID 입니다.</div>


						<label>비밀번호</label>
						<input type="password" id="userPass" name="userPass" placeholder="비밀번호를 입력해주세요. (영문 대/소문자, 숫자를 모두 포함)" required/>
						<input type="hidden" id="pwCheckVal" value="N" />
						<div class="text_fail" id="pw-error" style="color:red">비밀번호는 영문,숫자,특수문자를 포함한 8자리 이상 작성해야 합니다.</div>
						<div class="text_fail" id="pw-danger" style="color:red">비밀번호가 일치하지 않습니다.</div>
						<div class="text_success" id="pw-success" style="color:blue">비밀번호가 일치합니다.</div>

						<label>성함</label>
						<input type="text" id="userName" name="userName" required />
						
						<label>이메일</label>
						<input type="text" id="userEmail" name="userEmail" required />
						<input type="hidden" id="emCheckVal" value="N" />
						<div class="text_fail" id="em-danger" style="color:red">이미 존재하는 E-mail입니다.</div>
						<div class="text_fail" id="em-error" style="color:red">E-mail 형식에 맞도록 작성하여주시기 바랍니다.</div>
						<div class="text_success" id="em-success" style="color:blue">사용가능한 E-mail 입니다.</div>
						<button class="check-button" id="emCheck-button">본인인증하기</button>
						
						<input type="text" class="compare" placeholder="인증 키 입력" style="display:none" />
						<button class="check-button" id="emNumCheck-button">인증 키 확인</button>
						
						<label>핸드폰번호</label>
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
</section><!-- Start Blog Area-->

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
