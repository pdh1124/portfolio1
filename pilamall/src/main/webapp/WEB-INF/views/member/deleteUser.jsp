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
					<form id="deleteid-form" method="post" action="/member/deleteUser">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						<h2>계정 탈퇴하기</h2>
						<!-- p>그동안 필라몰을 이용해주셔서 감사합니다.<br>계정을 탈퇴하시려면 가입하신 아이디를 입력해주시기 바랍니다.</p -->
						<p>정말로 탈퇴하시겠습니까?</p>
						
						<label>아이디<span>*</span></label>
						<input type="text" id="userId" name="userId" required/>
						<input type="hidden" id="idCheckVal" value="N" />
						<div class="text_fail" id="id-danger">가입하신 id와 다릅니다.</div>
						<div class="text_success" id="id-success">가입하신 id와 동일합니다.</div>
						
						<input class="deleteid-button" type="submit" value="계정 탈퇴하기" />
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
	$("#id-success").hide();
	
	$("#userId").keyup(function() { //keyup() : 키보드 입력할 때마다 감지한다.
		//console.log("작동확인");
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
						$("#id-danger").hide();
						$("#id-success").show();
						document.getElementById("idCheckVal").value = "Y";
					}
					else if(data == 0) { //아이디가 없어서 가입 가능할 경우
						$("#id-danger").show();
						$("#id-success").hide();
						document.getElementById("idCheckVal").value = "N";
					}
				}
			});
		} 
	});
	
	var sendForm = $("#deleteid-form");
	
	$(".deleteid-button").on("click", function(e) {
		e.preventDefault();
		
		if(document.getElementById("idCheckVal").value == "N") {
			alert("아이디가 일치하지 않습니다.");
			return false;
		}
		
		alert("그동안 필라몰을 이용해주셔서 감사합니다.");
		sendForm.submit();
		
	});
});
</script>
