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
						<h2>회원가입</h2>
						<p>필라몰에서 나만의 계정을 만들어보세요.</p>
						<label>아이디<span>*</span></label>
						<input type="text" id="userId" name="userID" required/>
						<input type="hidden" id="idCheckVal" value="N">
						<div class="text_fail" id="id-danger">이미 존재하는 id입니다 .</div>
						<div class="text_success" id="id-success">사용가능한 id 입니다.</div>
						<div class="text_fail" id="id-error"> 회원아이디는 띄어쓰기없이 5~15자리의 영문자 또는 숫자만 가능합니다 .</div>
						
						
						<label>비밀번호<span>*</span></label>
						<input type="password" id="userPass" name="userPass" placeholder="비밀번호를 입력해주세요. (영문 대/소문자, 숫자를 모두 포함)" required/>
						<label>비밀번호 확인<span>*</span></label>
						<input type="password" required/>
						
						<label>성함<span>*</span></label>
						<input type="text" id="userName" name="userName" required/>
						<input type="hidden" id="idCheckVal" value="N">
						<div class="text_fail" id="id-danger">이미 존재하는 id입니다 .</div>
						<div class="text_success" id="id-success">사용가능한 id 입니다.</div>
						<div class="text_fail" id="id-error"> 회원아이디는 띄어쓰기없이 5~15자리의 영문자 또는 숫자만 가능합니다 .</div>
						
						<label>핸드폰번호<span>*</span></label>
						
						
						<input type="submit" value="Sign up" />
					</form>
				</div>
			</div>
		</div>
	</div>
</div><!--End login Area-->

<%@ include file="../includes/footer.jsp"%>
