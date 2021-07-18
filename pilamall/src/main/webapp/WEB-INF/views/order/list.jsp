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
					<h2>구매 내역</h2>
					<table class="table cart-table goods-table">
						<thead class="table-title">
							<tr>
								<th class="o-num">주문번호</th>
								<th class="o-name">수령인</th>
								<th class="o-addr">주소</th>
								<th class="o-total">가격</th>
								<th class="o-stats">상태</th>
							</tr>													
						</thead>
						<tbody>
							<c:forEach items="${order}" var="order">
								<c:if test="${order.delivery != '환불대기-준비' && order.delivery != '환불대기-완료' && order.delivery != '환불완료' }">
									<tr class="table-info">
										<td class="o-num"><a href="/order/view?num=${order.orderId }"><strong style="color:#0000f1;">${order.orderId }</strong></a></td>
										<td class="o-name"><c:out value="${order.receiver }" /></td>
										<td class="o-addr"><c:out value="(${order.userAddr1 }) ${order.userAddr2 } ${order.userAddr3 }" /></td>
										<td class="o-total"><strong><fmt:formatNumber pattern="###,###,###" value="${order.amount }" /></strong> 원</td>
										<td class="o-stats">
											<c:if test="${order.delivery == '배송준비' }">
												<span style="color:#f10000;">${order.delivery }</span>
											</c:if>
											<c:if test="${order.delivery == '배송중' }">
												<span style="color:#0000f1;">${order.delivery }</span>
											</c:if>
											<c:if test="${order.delivery == '배송완료' }">
												<span style="color:#00f100;">${order.delivery }</span>
											</c:if>
											<c:if test="${order.delivery == '환불대기-준비' || order.delivery == '환불대기-완료'}">
												<span style="color:#f10000;">환불대기</span>
											</c:if>
										</td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>		
			</div>
			
		</div>
	</div>
</section><!-- Start Blog Area-->

<%@ include file="../includes/footer.jsp"%>