<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core를 쓸 때 태그에 c로 표시  -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt를 쓸 때 태그에 fmt로 표시 fmt : formatter 형식 맞춰서 표시 -->

<%@ include file="../../includes/header.jsp"%>

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
					<h2>환불 대기 내역</h2>
					<table class="table cart-table goods-table">
						<thead class="table-title">
							<tr>
								<th class="r-num">주문번호</th>
								<th class="r-sta">상태</th>
								<th class="r-id">유저 아이디</th>
								<th class="r-date">환불 신청일</th>
							</tr>													
						</thead>
						<tbody>
							<c:forEach items="${refund_wait}" var="refund_wait">
								<tr class="table-info">
									<td class="r-num"><a href="/admin/order/refundView?id=${refund_wait.orderId }"><strong style="color:#0000f1;">${refund_wait.orderId }</strong></a></td>
									<td class="r-sta"><c:out value="${refund_wait.refundState }" /></td>
									<td class="r-id"><c:out value="${refund_wait.userId }" /></td>
									<td class="r-date"><fmt:formatDate value="${refund_wait.refundDate }" pattern="yyyy-MM-dd" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<br /><br />
			

					<h2>환불 완료 내역</h2>
					<table class="table cart-table goods-table">
						<thead class="table-title">
							<tr>
								<th class="r-num">주문번호</th>
								<th class="r-sta">상태</th>
								<th class="r-id">유저 아이디</th>
								<th class="r-date">환불 신청일</th>
							</tr>													
						</thead>
						<tbody>
							<c:forEach items="${refund_comp}" var="refund_comp">
								<tr class="table-info">
									<td class="r-num"><a href="/admin/order/refundView?id=${refund_comp.orderId }"><strong style="color:#0000f1;">${refund_comp.orderId }</strong></a></td>
									<td class="r-sta"><c:out value="${refund_comp.refundState }" /></td>
									<td class="r-id"><c:out value="${refund_comp.userId }" /></td>
									<td class="r-date"><fmt:formatDate value="${refund_comp.refundDate }" pattern="yyyy-MM-dd" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>		
			</div>
			
		
			</div>
			
		</div>
	</div>
</section><!-- Start Blog Area-->

<%@ include file="../../includes/footer.jsp"%>