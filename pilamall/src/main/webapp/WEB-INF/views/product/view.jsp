<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core를 쓸 때 태그에 c로 표시  -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt를 쓸 때 태그에 fmt로 표시 fmt : formatter 형식 맞춰서 표시 -->

<%@ include file="../includes/header.jsp"%>

<div class="page-title fix"><!--Start Title-->
	<div class="overlay section">
		<h2>Product Details</h2>
	</div>
</div><!--End Title-->
<section class="product-page page fix"><!--Start Product Details Area-->
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<div class="details-pro-tab">
			<!-- Tab panes -->
					<div class="tab-content details-pro-tab-content">
						<div class="tab-pane fade in active" id="image-1">
							<div class="simpleLens-big-image-container">		
								<img src="${product.gdsImg }" alt="" class="simpleLens-big-image">
							</div>
						</div>
					</div>
					<!-- Nav tabs -->
					<ul class="tabs-list details-pro-tab-list" role="tablist">
						<li class="active"><a href="#image-1" data-toggle="tab"><img src="img/single-product/thumb-1.jpg" alt="" /></a></li>
						<li><a href="#image-2" data-toggle="tab"><img src="img/single-product/thumb-2.jpg" alt="" /></a></li>
						<li><a href="#image-3" data-toggle="tab"><img src="img/single-product/thumb-3.jpg" alt="" /></a></li>
						<li><a href="#image-4" data-toggle="tab"><img src="img/single-product/thumb-4.jpg" alt="" /></a></li>
					</ul>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="shop-details">
					<!-- Product Name -->
					<h2>${product.gdsName }</h2>
					<!-- Product Ratting -->
					<div class="pro-ratting">
						<i class="on fa fa-star"></i>
						<i class="on fa fa-star"></i>
						<i class="on fa fa-star"></i>
						<i class="on fa fa-star"></i>
						<i class="on fa fa-star-half-o"></i>
					</div>
					<h3 style="font-size:24px; font-weight:bold;">${product.price } 원</h3>
					<p>${product.gdsDes }</p>
					<div class="action-btn">
						<a href="#"><i class="fa fa-shopping-cart"></i> 장바구니 </a>
						<a href="#"><i class="fa fa-refresh"></i> 구매하기 </a>
					</div>
				</div>
			</div>
			<div class="col-sm-12 fix">
				<div class="description">
					<!-- Nav tabs -->
					<ul class="nav product-nav">
						<li class="active"><a data-toggle="tab" href="#description">리뷰</a></li>
					</ul>
					<!-- Tab panes -->
					<div class="tab-content">
						<div id="description" class="tab-pane fade active in" role="tabpanel">
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco aboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepte.</p>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</section><!--End Product Details Area-->

<%@ include file="../includes/footer.jsp"%>