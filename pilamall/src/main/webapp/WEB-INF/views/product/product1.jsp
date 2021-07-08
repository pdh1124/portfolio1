<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core를 쓸 때 태그에 c로 표시  -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt를 쓸 때 태그에 fmt로 표시 fmt : formatter 형식 맞춰서 표시 -->

<%@ include file="../includes/header.jsp"%>

<div class="page-title fix"><!--Start Title-->
	<div class="overlay section">
		<h2>요가복</h2>
	</div>
</div><!--End Title-->
<div class="shop-product-area section fix"><!--Start Shop Area-->
	<div class="container">
		<div class="row">
			<div class="shop-products">
				<!-- Single Product Start -->
				<c:forEach items="${list }" var="list">
					<div class="col-sm-4 col-md-3 fix">
						<div class="product-item fix">
							<div class="product-img-hover">
								<!-- Product image -->
								<a href="/product/view?gdsNum=${list.gdsNum }" class="pro-image fix"><img src="${list.thumbImg }" alt="product" /></a>
								<!-- Product action Btn -->
								<div class="product-action-btn">
									<a class="quick-view" href="/product/view?gdsNum=${list.gdsNum }"><i class="fa fa-search"></i></a>
									<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
									<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
								</div>
							</div>
							<div class="pro-name-price-ratting">
								<!-- Product Name -->
								<div class="pro-name">
									<a href="/product/view?gdsNum=${list.gdsNum }">${list.gdsName }</a>
								</div>
								<!-- Product Ratting -->
								<div class="pro-ratting">
									<i class="on fa fa-star"></i>
									<i class="on fa fa-star"></i>
									<i class="on fa fa-star"></i>
									<i class="on fa fa-star"></i>
									<i class="on fa fa-star-half-o"></i>
								</div>
								<!-- Product Price -->
								<div class="pro-price fix">
									<p><span class="new"><fmt:formatNumber value="${list.price }" pattern="###,###,###" /></span> 원</p>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<!-- Single Product End -->

				<!-- Pagination -->
				<div class="pagination">
					<ul style="margin-top: 50px;">
						<c:if test="${pageMaker.prev }">
							<li class="pageMove"><a href="${pageMaker.startPage-1 }"><i class="fa fa-angle-left"></i></a></li>
						</c:if>
						<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
							<li class='pageMove ${pageMaker.cri.pageNum == num?"active":"" }'><a href="${num} "><span>${num }</span></a></li>
						</c:forEach>
						<c:if test="${pageMaker.next }">
							<li class="pageMove"><a href="${pageMaker.endPage+1 }"><i class="fa fa-angle-right"></i></a></li>
						</c:if>
					</ul>
				</div>
				
				<!-- 페이징 이동시 넘기는 값 -->
				<form id="actionForm" action="/product/all" method="get">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }" />
					<input type="hidden" name="amount" value="${pageMaker.cri.amount }" />
				</form>
			</div>
		</div>
	</div>
</div>

<%@ include file="../includes/footer.jsp"%>

<script>
$(document).ready(function() {
	
	//페이징 이동시 넘기는 값
	var actionForm = $("#actionForm");
	
	$(".pageMove a").on("click", function(e) {
		
		e.preventDefault();
		
		actionFrom.find("input[name='pageNum']").val($(this).attr("href"));
		//액션폼 input[name=pageNum] 값을 찾아서 href로 받은 값으로 대체
		
		actionForm.submit();
	});
});
</script>