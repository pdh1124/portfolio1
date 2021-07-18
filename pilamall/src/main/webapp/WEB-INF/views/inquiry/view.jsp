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
						<li><a href="/order/list">구매내역</a></li>
						<li><a href="/order/refundList">환불내역</a></li>
						<li><a href="/inquiry/list">내 문의 내역</a></li>
					</ul>
				</div>
			</div>
			
			
			<div class="col-sm-8 col-md-9">
				<div class="login">
					<form class="inq_form" id="info-form" name="updateInfo" method="post" action="/inquiry/modify">
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}">
						<input type="hidden" name="inqNum" value="${inquiry.inqNum}">
						<h2>회원정보 수정</h2>
						<table class="inquiry_modify">
						<tr>
							<td>
								<label>제목</label>
								<input type="text" id="inqTitle" name="inqTitle" value="${inquiry.inqTitle }"/>
								
								<label>작성자</label>
								<input type="text" id="userId" name="userId" value="${inquiry.userId }" readonly="readonly"/>
								
								<label>내용</label>
								<textarea type="text" rows="10" id="inqContent" name="inqContent">${inquiry.inqContent }</textarea>
								
								<c:if test="${inquiry.inqState != '답변대기' }">
									<label>답변</label>
									<textarea type="text" rows="10" id="inqContent" name="inqContent"  readonly="readonly">${inquiry.inqReply }</textarea>
								</c:if>
							</td>
						</table>
						
						<button type="submit" class="inq_bt" id="inq_delete" data-oper="delete">문의 삭제</button>
						
						<c:if test="${inquiry.inqState == '답변대기' }">
							<button type="submit" class="inq_bt" id="inq_modify" data-oper="modify">문의 수정</button>
						</c:if>	
					</form>
				</div>
			</div>
			
		</div>
	</div>
</section><!-- Start Blog Area-->

<%@ include file="../includes/footer.jsp"%>


<script>
$(document).ready(function() {
	
	//수정 버튼, 삭제 버튼 submit 하기
	var formObj = $(".inq_form");
	
	$('.inq_bt').on("click", function(e) {
		
		e.preventDefault();
		
		var oper = $(this).data("oper");

		
		if(oper == 'delete') {
			alert("삭제 완료.");
			formObj.attr("action", "/inquiry/delete").submit();
		} 
		else if(oper == 'modify') {
			alert("수정 완료.");
			formObj.attr("action", "/inquiry/modify").submit();
		}
	});
});
</script>