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
						<li><a href="#">문의 내역</a></li>
					</ul>
				</div>
			</div>
			
			
			<div class="col-sm-8 col-md-9">
				<div class="login">
					<h2>배송 대기 목록</h2>
					<table class="table cart-table goods-table">
						<thead class="table-title">
							<tr>
								<th class="o-num">주문번호</th>
								<th class="o-name">아이디</th>
								<th class="o-name">성함</th>
								<th class="o-addr">주소</th>
								<th class="o-total">가격</th>
								<th class="o-stats">상태</th>
							</tr>													
						</thead>
						<tbody>
							<c:forEach items="${order_wait}" var="order_wait">
								<tr class="table-info">
									<td class="o-num"><a href="/admin/order/view?num=${order_wait.orderId }"><strong style="color:#0000f1;">${order_wait.orderId }</strong></a></td>
									<td class="o-name"><c:out value="${order_wait.userId }" /></td>
									<td class="o-name"><c:out value="${order_wait.receiver }" /></td>
									<td class="o-addr"><c:out value="(${order_wait.userAddr1 }) ${order_wait.userAddr2 } ${order_wait.userAddr3 }" /></td>
									<td class="o-total"><strong><fmt:formatNumber pattern="###,###,###" value="${order_wait.amount }" /></strong> 원</td>
									<td class="o-stats"><span style="color:#f10000;">${order_wait.delivery }</span></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- Pagination -->
					<div class="pagination">
						<ul style="margin-top: 50px;">
							<c:if test="${pageMaker_wait.prev }">
								<li class="pageMove_wait"><a href="${pageMaker_wait.startPage-1 }"><i class="fa fa-angle-left"></i></a></li>
							</c:if>
							<c:forEach var="num" begin="${pageMaker_wait.startPage }" end="${pageMaker_wait.endPage }">
								<li class='pageMove_wait ${pageMaker_wait.cri.pageNum == num?"active":"" }'><a href="${num}"><span>${num }</span></a></li>
							</c:forEach>
							<c:if test="${pageMaker_wait.next }">
								<li class="pageMove_wait"><a href="${pageMaker_wait.endPage+1 }"><i class="fa fa-angle-right"></i></a></li>
							</c:if>
						</ul>
					</div>
					
					<form id="actionForm_wait" action="/admin/order/list" method="get">
						<input type="hidden" name="pageNum" value="${pageMaker_wait.cri.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker_wait.cri.amount}">
					</form>
				</div>	
				<br /><br />
				<div class="login">
					<h2>배송 중인 목록</h2>
					<table class="table cart-table goods-table">
						<thead class="table-title">
							<tr>
								<th class="o-num">주문번호</th>
								<th class="o-name">아이디</th>
								<th class="o-name">성함</th>
								<th class="o-addr">주소</th>
								<th class="o-total">가격</th>
								<th class="o-stats">상태</th>
							</tr>													
						</thead>
						<tbody>
							<c:forEach items="${order_deli}" var="order_deli">
								<tr class="table-info">
									<td class="o-num"><a href="/admin/order/view?num=${order_deli.orderId }"><strong style="color:#0000f1;">${order_deli.orderId }</strong></a></td>
									<td class="o-name"><c:out value="${order_deli.userId }" /></td>
									<td class="o-name"><c:out value="${order_deli.receiver }" /></td>
									<td class="o-addr"><c:out value="(${order_deli.userAddr1 }) ${order_deli.userAddr2 } ${order_deli.userAddr3 }" /></td>
									<td class="o-total"><strong><fmt:formatNumber pattern="###,###,###" value="${order_deli.amount }" /></strong> 원</td>
									<td class="o-stats"><span style="color:#f10000;">${order_deli.delivery }</span></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<!-- Pagination -->
					<div class="pagination">
						<ul style="margin-top: 50px;">
							<c:if test="${pageMaker_deli.prev }">
								<li class="pageMove_deli"><a href="${pageMaker_deli.startPage-1 }"><i class="fa fa-angle-left"></i></a></li>
							</c:if>
							<c:forEach var="num" begin="${pageMaker_deli.startPage }" end="${pageMaker_deli.endPage }">
								<li class='pageMove_deli ${pageMaker_deli.cri.pageNum == num?"active":"" }'><a href="${num}"><span>${num }</span></a></li>
							</c:forEach>
							<c:if test="${pageMaker_deli.next }">
								<li class="pageMove_deli"><a href="${pageMaker_deli.endPage+1 }"><i class="fa fa-angle-right"></i></a></li>
							</c:if>
						</ul>
					</div>
					
					<form id="actionForm_deli" action="/admin/order/list" method="get">
						<input type="hidden" name="pageNum" value="${pageMaker_deli.cri.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker_deli.cri.amount}">
					</form>
					
				</div>	
				<br /><br />
				<div class="login">
					<h2>배송 완료 목록</h2>
					<table class="table cart-table goods-table">
						<thead class="table-title">
							<tr>
								<th class="o-num">주문번호</th>
								<th class="o-name">아이디</th>
								<th class="o-name">성함</th>
								<th class="o-addr">주소</th>
								<th class="o-total">가격</th>
								<th class="o-stats">상태</th>
							</tr>													
						</thead>
						<tbody>
							<c:forEach items="${order_comp}" var="order_comp">
								<tr class="table-info">
									<td class="o-num"><a href="/admin/order/view?num=${order_comp.orderId }"><strong style="color:#0000f1;">${order_comp.orderId }</strong></a></td>
									<td class="o-name"><c:out value="${order_comp.userId }" /></td>
									<td class="o-name"><c:out value="${order_comp.receiver }" /></td>
									<td class="o-addr"><c:out value="(${order_comp.userAddr1 }) ${order_comp.userAddr2 } ${order_comp.userAddr3 }" /></td>
									<td class="o-total"><strong><fmt:formatNumber pattern="###,###,###" value="${order_comp.amount }" /></strong> 원</td>
									<td class="o-stats"><span style="color:#f10000;">${order_comp.delivery }</span></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<!-- Pagination -->
					<div class="pagination">
						<ul style="margin-top: 50px;">
							<c:if test="${pageMaker_comp.prev }">
								<li class="pageMove_comp"><a href="${pageMaker_comp.startPage-1 }"><i class="fa fa-angle-left"></i></a></li>
							</c:if>
							<c:forEach var="num" begin="${pageMaker_comp.startPage }" end="${pageMaker_comp.endPage }">
								<li class='pageMove_comp ${pageMaker_comp.cri.pageNum == num?"active":"" }'><a href="${num}"><span>${num }</span></a></li>
							</c:forEach>
							<c:if test="${pageMaker_comp.next }">
								<li class="pageMove_comp"><a href="${pageMaker_comp.endPage+1 }"><i class="fa fa-angle-right"></i></a></li>
							</c:if>
						</ul>
					</div>
					
					<form id="actionForm_comp" action="/admin/order/list" method="get">
						<input type="hidden" name="pageNum" value="${pageMaker_comp.cri.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker_comp.cri.amount}">
					</form>
				</div>		
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