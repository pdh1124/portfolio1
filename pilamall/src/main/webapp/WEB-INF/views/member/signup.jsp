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
