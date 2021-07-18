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
					<h2>구매 내역 상세</h2>
	
					<c:forEach items="${order }" var="order" varStatus="status">
						<c:if test="${status.first }">
							<form id="cancelForm" role="form" action="/order/cancel" method="post">
								<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}">
								<input type="hidden" name="orderId" id="orderId" value="${order.orderId }">
								<input type="hidden" name="gdsNum" id="gdsNum" value="${order.gdsNum }">
								<input type="hidden" name="cartStock" id="cartStock" value="${order.cartStock }">
								<input type="hidden" name="delivery" id="delivery" value="">
								<p><strong>수령인 : </strong>${order.receiver }</p>
								<p><strong>핸드폰번호 : </strong><c:out value="${order.orderPhone }"/></p>
								<p><strong>주소 : </strong><c:out value="(${order.userAddr1 }) ${order.userAddr2 } ${order.userAddr3 }" /></p>
								<p><strong>배송 상태 : </strong><b class="deli">${order.delivery }</b></p>
								
								<c:if test="${order.delivery != '배송중' && order.delivery != '환불대기-준비' && order.delivery != '환불대기-완료'}">
									<button class="btn-default" type="submit" data-oper="refund">환불 요청</button>
								</c:if>
								<c:if test="${order.delivery == '입금대기' }">
									<button class="btn-default" type="submit" data-oper="cancel">구매 취소</button>
								</c:if>
								<c:if test="${order.delivery == '배송중' }">
									<div class="deli-text">
										<p>배송중일 때에는 환불 신청이 불가합니다.</p>
										<p>배송이 완료되면 신청해주시기 바랍니다.</p>
									</div>
								</c:if>
							</form>
						</c:if>
					</c:forEach> 
					
					
					<!-- 장바구니 리스트 -->
					<table class="table cart-table goods-table">
						<thead class="table-title">
							<tr>
								<th class="c-img">이미지</th>
								<th class="c-name">제품명</th>
								<th class="c-stock">수량</th>
								<th class="c-price">가격</th>
								<th class="c-total">총 가격</th>
							</tr>													
						</thead>
						<tbody>
							<c:forEach items="${order }" var="order">
							<tr class="table-info">
								<td class="c-img"><img src="${order.thumbImg }"></td>
								<td class="c-name">${order.gdsName }</td>
								<td class="c-stock"><strong>${order.cartStock }</strong> 개</td>
								<td class="c-price"><strong>${order.price }</strong> 원</td>
								<td class="c-total"><strong>${order.cartStock * order.price }</strong> 원</td>
							</tr>
							<c:set var="sum" value="${sum + (order.price * order.cartStock) }" />
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
					
				</div>		
			</div>
			
		</div>
	</div>
</section><!-- Start Blog Area-->

<%@ include file="../includes/footer.jsp"%>

<script>
$(document).ready(function() {
	
	//시큐리티 처리
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	$(document).ajaxSend(function(e,xhr,options) {
		xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
	});
	
	//취소 및 환불 기능 실행
	var form = $("#cancelForm");
	var delivery = $(".deli").html();
	
	console.log(delivery);
	
	$(".btn-default").on("click", function(e) {
		e.preventDefault();
		var oper = $(this).data("oper");
		
		if(oper === 'cancel') {
			alert("구매가 취소 되었습니다.");
			form.submit();
		}
		else if(oper === 'refund') {
			if(delivery == "배송완료") {
				$("#delivery").val("환불대기-완료");
			}
			else {
				$("#delivery").val("환불대기-준비");
			}
			alert("환불 신청이 되었습니다.");
			form.attr("action", "/order/refund").submit();
		}
	});
});
</script>