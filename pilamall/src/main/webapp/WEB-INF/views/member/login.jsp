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
				<div class="login">
					<form id="login-form" method="post" action="/member/login">
					<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">
						<h2>LOGIN</h2>
						<p>필라몰에 오신것을 환영합니다.</p>
						<label>아이디<span>*</span></label>
						<input type="text" name="userId" placeholder="아이디" />
						<label>패스워드<span>*</span></label>
						<input type="password" name="userPass" placeholder="****" />
						<div class="remember">
							<input type="checkbox" />
							<p>자동로그인</p>
							<p><a href="/member/findUserId">아이디</a>나 <a href="/member/findUserPass">패스워드</a>를 잊으셨나요?</p>
						</div>
						<input type="submit" value="login" />
					</form>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="about-img">
					<img src="/resources/img/member/login_img.jpg" alt="" />
				</div>
			</div>
		</div>
	</div>
</div><!--End login Area-->

<%@ include file="../includes/footer.jsp"%>
