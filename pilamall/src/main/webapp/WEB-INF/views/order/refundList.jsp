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
						<li><a href="#">내 문의 내역</a></li>
					</ul>
				</div>
			</div>
			
			
			<div class="col-sm-8 col-md-9">
				<div class="login">
					<h2>환불 내역</h2>
					<table class="table cart-table goods-table">
						<thead class="table-title">
							<tr>
								<th class="r-num">주문번호</th>
								<th class="r-sta">상태</th>
								<th class="r-date">환불 신청일</th>
							</tr>													
						</thead>
						<tbody>
							<c:forEach items="${refund}" var="refund">
								<tr class="table-info">
									<td class="r-num"><a href="/order/refundView?num=${refund.orderId }"><strong style="color:#0000f1;">${refund.orderId }</strong></a></td>
									<c:if test="${refund.refundState == '환불대기' }">
										<td class="r-sta" style="color:#f10000;"><c:out value="${refund.refundState }" /></td>
									</c:if>
									<c:if test="${refund.refundState == '환불완료' }">
										<td class="r-sta" style="color:#00f100;"><c:out value="${refund.refundState }" /></td>
									</c:if>
									<td class="r-date"><fmt:formatDate value="${refund.refundDate }" pattern="yyyy-MM-dd" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>		
			</div>
			
		</div>
	</div>
</section><!-- Start Blog Area-->

<%@ include file="../includes/footer.jsp"%>