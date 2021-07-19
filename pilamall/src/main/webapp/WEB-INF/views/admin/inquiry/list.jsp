<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core를 쓸 때 태그에 c로 표시  -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt를 쓸 때 태그에 fmt로 표시 fmt : formatter 형식 맞춰서 표시 -->

<%@ include file="../../includes/header.jsp"%>

<sec:authorize access="hasRole('ROLE_ADMIN')"> 
<sec:authentication property="principal.username" var="userid" />

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<section class="blog-page page fix"><!-- Start Blog Area-->
	<div class="container">
		<div class="row">
			<div class="col-sm-4 col-md-3">
				<div class="single-sidebar">
					<h2>관리자 페이지</h2>
					<ul>
						<li><a href="/admin/main">매출</a></li>
						<li><a href="/admin/goods/register">상품 등록</a></li>
						<li><a href="/admin/goods/list">상품 목록</a></li>
						<li><a href="/admin/order/list">주문 목록</a></li>
						<li><a href="/admin/order/refundList">환불 목록</a></li>
						<li><a href="/admin/inquiry/list">문의 내역</a></li>
					</ul>
				</div>
			</div>
			
			
			<div class="col-sm-8 col-md-9">
				<div class="login">
					<h2>문의 답변대기 목록</h2>
					<table class="table cart-table goods-table">
						<thead class="table-title">
							<tr>
								<th class="o-name">번호</th>
								<th class="o-addr">제목</th>
								<th class="o-total">작성자</th>
								<th class="o-stats">작성일</th>
							</tr>													
						</thead>
						<tbody>
							<c:forEach items="${inquiry}" var="inquiry">
								<tr class="table-info">
									<td class="o-name">${inquiry.inqNum }</td>
									<td class="o-addr" style="text-align:left;"><strong><a href="/admin/inquiry/reply?inqNum=${inquiry.inqNum }">${inquiry.inqTitle }</a></strong></td>
									<td class="o-addr">${inquiry.userId }</td>
									<td class="o-total"><fmt:formatDate value="${inquiry.regDate }" pattern="yyyy-MM-dd" /></td>		
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- Pagination -->
					<div class="pagination">
						<ul style="margin-top: 50px;">
							<c:if test="${pageMaker.prev }">
								<li class="pageMove_wait"><a href="${pageMaker.startPage-1 }"><i class="fa fa-angle-left"></i></a></li>
							</c:if>
							<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
								<li class='pageMove_wait ${pageMaker.cri.pageNum == num?"active":"" }'><a href="${num}"><span>${num }</span></a></li>
							</c:forEach>
							<c:if test="${pageMaker.next }">
								<li class="pageMove_wait"><a href="${pageMaker.endPage+1 }"><i class="fa fa-angle-right"></i></a></li>
							</c:if>
						</ul>
					</div>
					
					<form id="actionForm_wait" action="/admin/inquiry/list" method="get">
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
					</form>
				</div>	
				<br /><br />
				
				<div class="login">
					<h2>문의 답변완료 목록</h2>
					<table class="table cart-table goods-table">
						<thead class="table-title">
							<tr>
								<th class="o-name">번호</th>
								<th class="o-addr">제목</th>
								<th class="o-total">작성자</th>
								<th class="o-stats">작성일</th>
								<th class="o-stats">답변일</th>
							</tr>													
						</thead>
						<tbody>
							<c:forEach items="${inquiryFin}" var="inquiryFin">
								<tr class="table-info">
									<td class="o-name">${inquiryFin.inqNum }</td>
									<td class="o-addr" style="text-align:left;"><strong><a href="/admin/inquiry/reply?inqNum=${inquiryFin.inqNum }">${inquiryFin.inqTitle }</a></strong></td>
									<td class="o-addr">${inquiryFin.userId }</td>
									<td class="o-total"><fmt:formatDate value="${inquiryFin.regDate }" pattern="yyyy-MM-dd" /></td>
									<td class="o-total"><fmt:formatDate value="${inquiryFin.inqDate }" pattern="yyyy-MM-dd" /></td>		
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- Pagination -->
					<div class="pagination">
						<ul style="margin-top: 50px;">
							<c:if test="${pageMakerFin.prev }">
								<li class="pageMove_wait"><a href="${pageMakerFin.startPage-1 }"><i class="fa fa-angle-left"></i></a></li>
							</c:if>
							<c:forEach var="num" begin="${pageMakerFin.startPage }" end="${pageMakerFin.endPage }">
								<li class='pageMove_wait ${pageMakerFin.cri.pageNum == num?"active":"" }'><a href="${num}"><span>${num }</span></a></li>
							</c:forEach>
							<c:if test="${pageMakerFin.next }">
								<li class="pageMove_wait"><a href="${pageMakerFin.endPage+1 }"><i class="fa fa-angle-right"></i></a></li>
							</c:if>
						</ul>
					</div>
					
					<form id="actionForm_wait" action="/admin/inquiry/list" method="get">
						<input type="hidden" name="pageNum" value="${pageMakerFin.cri.pageNum}">
						<input type="hidden" name="amount" value="${pageMakerFin.cri.amount}">
					</form>
				</div>	
				<br /><br />
	
			</div>
			
		</div>
	</div>
</section><!-- Start Blog Area-->

</sec:authorize>

<%@ include file="../../includes/footer.jsp"%>

<script>
$(document).ready(function() {
		
	//배송 대기 목록 페이징 
	var actionForm_wait = $("#actionForm_wait");
	
	$(".pageMove_wait a").on("click", function(e) {
		e.preventDefault();
		
		actionForm_wait.find("input[name='pageNum']").val($(this).attr("href"));
		
		actionForm_wait.submit();
	});
	
	//배송 중 목록 페이징 
	var actionForm_deli = $("#actionForm_deli");
	
	$(".pageMove_deli a").on("click", function(e) {
		e.preventDefault();
		
		actionForm_deli.find("input[name='pageNum']").val($(this).attr("href"));
		
		actionForm_deli.submit();
	});
	
	//배송완료 목록 페이징 
	var actionForm_comp = $("#actionForm_comp");
	
	$(".pageMove_comp a").on("click", function(e) {
		e.preventDefault();
		
		actionForm_comp.find("input[name='pageNum']").val($(this).attr("href"));
		
		actionForm_comp.submit();
	});
	
});
</script>