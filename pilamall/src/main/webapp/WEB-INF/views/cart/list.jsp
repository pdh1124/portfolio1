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
						<li><a href="#">구매내역</a></li>
						<li><a href="#">환불내역</a></li>
						<li><a href="#">내 문의 내역</a></li>
					</ul>
				</div>
			</div>
			<div class="col-sm-8 col-md-9">
				<div class="login">
						<h2>장바구니</h2>
						
						<form role="form" id="orderForm" name="updateInfo" method="post" action="/order/info">
						<!-- 장바구니 리스트 -->
						<table class="table cart-table goods-table">
							<thead class="table-title">
								<tr>
									<th class="c-img">이미지</th>
									<th class="c-name">제품명</th>
									<th class="c-stock">수량</th>
									<th class="c-price">가격</th>
									<th class="c-total">총 가격</th>
									<th class="c-remove">삭제</th>
								</tr>													
							</thead>
							<c:set var="sum" value="0" />
							<tbody>
								<c:forEach items="${cart }" var="cart">
								<input type="hidden" name="userId" id="userId" value="${cart.userId }">
									<tr class="table-info">
										<td class="c-img"><img src="${cart.thumbImg }"></td>
										<td class="c-name">${cart.gdsName }</td>
										<td class="c-stock"><strong>${cart.cartStock }</strong> 개</td>
										<td class="c-price"><strong>${cart.price }</strong> 원</td>
										<td class="c-total"><strong>${cart.cartStock * cart.price }</strong> 원</td>
										<td class="c-remove"><button type="submit" class="cart_delete" id="cartNum" value="${cart.cartNum }">삭제</button></td>
									</tr>
									<c:set var="sum" value="${sum + (cart.price * cart.cartStock) }" />
								</c:forEach>
							</tbody>
						</table>
						
						<!-- 총 가격 -->
						<div class="listResult">
							<div class="cart_sum">
								<fieldset class="cart_sum">
								<table>
									<tr>
										<td>
											총 제품 가격<br>
											<strong><fmt:formatNumber pattern="###,###,###" value="${sum }"/></strong> 원
										</td>
										<td>
											<c:if test="${sum < 50000 && sum != 0}">
												배송비<br>
												<strong>3000</strong>원
											</c:if>	
											<c:if test="${sum >= 50000 && sum != 0}">
												배송비<br>
												<strong>무료</strong>
											</c:if>
										</td>
										<td>
											총 합계<br> 
											<c:if test="${sum < 50000 && sum != 0}">
												<strong><fmt:formatNumber pattern="###,###,###" value="${sum + 3000 }"/></strong> 원
											</c:if>	
											<c:if test="${sum >= 50000 && sum != 0}">
												<strong><fmt:formatNumber pattern="###,###,###" value="${sum}" /></strong> 원
											</c:if>
										</td>
									</tr>
								</table>
								</fieldset>
							</div>
						</div>
						
						<!-- 주문버튼 -->
						<c:if test="${sum != 0 }">
							<div class="orderButton">
								<button type="button">주문하기</button>
							</div>
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
	
	//삭제 처리
	$(".cart_delete").on("click", function(e) {
		e.preventDefault();
		var cartNum = $(this).val();
	
		console.log(cartNum);
		
		$.ajax({
			url: "/cart/delete",
			type: "post",
			data: {
				cartNum : cartNum
			},
			success: function() {
				location.reload();
			},
			error: function() {
				alert("삭제 실패");
			}
		});
	});
	
	
});
</script>