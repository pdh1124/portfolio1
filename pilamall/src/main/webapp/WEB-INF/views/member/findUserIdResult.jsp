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
					<h2>아이디 찾기 결과</h2>
					<div id="findid_result">찾으신 아이디는 <br /><span><c:out value="${userId }" /></span><br />입니다.</div>
					
					<h3><c:out value="${error }" /></h3>
					<h3><c:out value="${logout }" /></h3>
					<div class="findid_move_bt">
						<a  href="/member/login">로그인</a>
						<a class="board_move_bt" href="/member/findUserPass">비밀번호 찾기</a>
					</div> 
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
