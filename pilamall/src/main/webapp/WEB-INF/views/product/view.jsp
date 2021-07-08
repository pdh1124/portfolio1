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
								<a class="simpleLens-lens-image" data-lens-image="img/single-product/1.jpg">
									<img src="img/single-product/1.jpg" alt="" class="simpleLens-big-image">
								</a>
							</div>
						</div>
						<div class="tab-pane fade" id="image-2">
							<div class="simpleLens-big-image-container">
								<a class="simpleLens-lens-image" data-lens-image="img/single-product/2.jpg">
									<img src="img/single-product/2.jpg" alt="" class="simpleLens-big-image">
								</a>
							</div>
						</div>
						<div class="tab-pane fade" id="image-3">
							<div class="simpleLens-big-image-container">
								<a class="simpleLens-lens-image" data-lens-image="img/single-product/3.jpg">
									<img src="img/single-product/3.jpg" alt="" class="simpleLens-big-image">
								</a>
							</div>
						</div>
						<div class="tab-pane fade" id="image-4">
							<div class="simpleLens-big-image-container">
								<a class="simpleLens-lens-image" data-lens-image="img/single-product/4.jpg">
									<img src="img/single-product/4.jpg" alt="" class="simpleLens-big-image">
								</a>
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
					<h2>PRODUCT NAME DEMO</h2>
					<!-- Product Ratting -->
					<div class="pro-ratting">
						<i class="on fa fa-star"></i>
						<i class="on fa fa-star"></i>
						<i class="on fa fa-star"></i>
						<i class="on fa fa-star"></i>
						<i class="on fa fa-star-half-o"></i>
					</div>
					<h3><span>$165</span>$150</h3>
					<h4>10 Reviews</h4>
					<h5>Availability - <span>In Stock</span></h5>
					<h6>QUICK OVERVIEW</h6>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco aboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepte.</p>
					<div class="select-menu fix">
						<div class="sort fix">
							<h4>SIZE</h4>
							<select>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
							</select>
						</div>
						<div class="sort fix">
							<h4>Color</h4>
							<select>
								<option value="pink">pink</option>
								<option value="red">red</option>
								<option value="blue">blue</option>
							</select>
						</div>
						<div class="sort fix">
							<h4>Qty</h4>
							<select>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select>
						</div>
					</div>
					<div class="review">
						<textarea rows="4" placeholder="Write Your Review..."></textarea>
					</div>
					<div class="action-btn">
						<a href="#"><i class="fa fa-shopping-cart"></i></a>
						<a href="#"><i class="fa fa-heart-o"></i></a>
						<a href="#"><i class="fa fa-refresh"></i></a>
					</div>
				</div>
			</div>
			<div class="col-sm-12 fix">
				<div class="description">
					<!-- Nav tabs -->
					<ul class="nav product-nav">
						<li class="active"><a data-toggle="tab" href="#description">DESCRIPTION</a></li>
						<li class=""><a data-toggle="tab" href="#review">REVIEWS</a></li>
						<li class=""><a data-toggle="tab" href="#tags">PRODUCTS TAGS</a></li>
						<li class=""><a data-toggle="tab" href="#custom-tags">CUSTOM TABS</a></li>
					</ul>
					<!-- Tab panes -->
					<div class="tab-content">
						<div id="description" class="tab-pane fade active in" role="tabpanel">
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco aboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepte.</p>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamc.</p>
						</div>
						<div id="review" class="tab-pane fade" role="tabpanel">
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco aboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepte.</p>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamc.</p>
						</div>
						<div id="tags" class="tab-pane fade" role="tabpanel">
							<a href="#">JEWELRY</a><a href="#">Necklaces</a><a href="#">Jewelry Sets</a><a href="#">Churi</a>
						</div>
						<div id="custom-tags" class="tab-pane fade" role="tabpanel">
							<a href="#">JEWELRY</a><a href="#">Necklaces</a><a href="#">Jewelry Sets</a><a href="#">Churi</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section><!--End Product Details Area-->

<%@ include file="../includes/footer.jsp"%>