<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core를 쓸 때 태그에 c로 표시  -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt를 쓸 때 태그에 fmt로 표시 fmt : formatter 형식 맞춰서 표시 -->

<%@ include file="../includes/header.jsp"%>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<sec:authorize access="hasRole('ROLE_ADMIN')"> 
<sec:authentication property="principal.username" var="userid" />

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
					<h2>일일 매출</h2>
					<table class="table cart-table goods-table">
						<thead class="table-title">
							<tr>
								<th class="g-price">날짜</th>
								<th class="g-price">일일매출</th>
							</tr>													
						</thead>
						<tbody>
							<c:forEach items="${sum }" var="sum">
								<tr class="table-info">
									<td class="g-price"><fmt:formatDate value="${sum.salDate }" pattern="yyyy년 MM월 dd일" /></td>
									<td class="g-price"><strong><fmt:formatNumber value="${sum.salStock }" pattern="###,###,###" /></strong> 원</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>		
					
					<!-- Pagination -->
					<div class="pagination">
						<ul style="margin-top: 50px;">
							<c:if test="${pageMaker.prev }">
								<li class="pageMove"><a href="${pageMaker.startPage-1 }"><i class="fa fa-angle-left"></i></a></li>
							</c:if>
							<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
								<li class='pageMove ${pageMaker.cri.pageNum == num?"active":"" }'><a href="${num}"><span>${num }</span></a></li>
							</c:forEach>
							<c:if test="${pageMaker.next }">
								<li class="pageMove"><a href="${pageMaker.endPage+1 }"><i class="fa fa-angle-right"></i></a></li>
							</c:if>
						</ul>
					</div>	
					
					<form id="actionForm" action="/admin/main" method="get">
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
					</form>
				</div>
			</div>
		</div>
	</div>
</section><!-- Start Blog Area-->

</sec:authorize>

<%@ include file="../includes/footer.jsp"%>
<script>
//배송 대기 목록 페이징 
var actionForm = $("#actionForm");

$(".pageMove a").on("click", function(e) {
	e.preventDefault();
	
	actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	
	actionForm.submit();
});
</script>