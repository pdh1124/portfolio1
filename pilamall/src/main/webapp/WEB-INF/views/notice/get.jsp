<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core를 쓸 때 태그에 c로 표시  -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt를 쓸 때 태그에 fmt로 표시 fmt : formatter 형식 맞춰서 표시 -->

<%@ include file="../includes/header.jsp"%>

<div class="page-title fix"><!--Start Title-->
	<div class="overlay section">
		<h2>공지사항 게시판</h2>
	</div>
</div><!--End Title-->
<section class="cart-page page fix"><!--Start Cart Area-->
	<div class="container">
		<div class="row">
			<div class="board_move_bt fix"> 
				<sec:authentication property="principal" var="pinfo" />
				<sec:authorize access="isAuthenticated()">
					<c:if test="${pinfo.username eq board.userId}">
						<button data-oper="modify">수정하기</button>
					</c:if>
				</sec:authorize>
				<button data-oper="list">목록보기</button>
				<c:if test="${board.nextNoNum ne 0}">
					<a href="/notice/get?noNum=${board.nextNoNum}">다음 &gt;</a>
				</c:if>
				<c:if test="${board.prevNoNum ne 0}">
					<a href="/notice/get?noNum=${board.prevNoNum}">&lt; 이전</a>
				</c:if>
				
				<form id="hidden_form" action="/notice/modify" method="get">
					<input type="hidden" id="noNum" name="noNum" value="${board.noNum }" />
					<input type="hidden" name="pageNum" value="${cri.pageNum }" />
					<input type="hidden" name="amount" value="${cri.amount }" />
					<input type="hidden" name="type" value="${pageMaker.cri.type }" />
					<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }" /> 
				</form>
			</div>
						
			<div class="single-blog blog-details">
				<div class="content fix">
					<h4><c:out value="${board.noNum }" /> 번 게시물</h4>
					<h2><c:out value="${board.noTitle }" /></h2>
					<div class="meta">
						<sec:authorize access="hasRole('ROLE_ADMIN')"> 
						<i class="fa fa-pencil-square-o"></i><c:out value="${board.userId }" />
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_USER')"> 
						<i class="fa fa-pencil-square-o"></i><c:out value="필라몰 운영자" />
						</sec:authorize>
						<i class="fa fa-calendar"></i><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regDate }" /> 
					</div>
					<div class="div_line"></div>
					<p id="se2">${board.noContent }</p>
					
				</div>
			</div>

		</div>
	</div>
</section><!--End Cart Area-->

<%@ include file="../includes/footer.jsp"%>

<script>
$(document).ready(function() {
	
	//목록보기,수정,이전글,다음글 버튼
	var operForm = $(".board_move_bt form");
	
	$(".board_move_bt button").on("click", function(e) {
		var operation = $(this).data("oper");
		
		if (operation === 'list') {
			e.preventDefault();
			operForm.attr("action","/notice/list").attr("method","get");
			
		}
		else if (operation === 'modify') {
			e.preventDefault();
			operForm.attr("action","/notice/modify").submit();
		}
	
		operForm.submit();
	});
	
		
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	$(document).ajaxSend(function(e,xhr,options) {
		xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
	});
	
	
});
</script>




