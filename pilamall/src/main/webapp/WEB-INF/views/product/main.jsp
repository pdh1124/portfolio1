<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core를 쓸 때 태그에 c로 표시  -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt를 쓸 때 태그에 fmt로 표시 fmt : formatter 형식 맞춰서 표시 -->

<%@ include file="../includes/header.jsp"%>

<!-- HOME SLIDER -->
<div class="slider-wrap home-1-slider">
	<div id="mainSlider" class="nivoSlider slider-image">
		<img src="/resources/img/slider/1.jpg" alt="main slider" title="#htmlcaption1"/>
		<img src="/resources/img/slider/2.jpg" alt="main slider" title="#htmlcaption2"/>
	</div>
	<div id="htmlcaption1" class="nivo-html-caption slider-caption-1">
		<div class="slider-progress"></div>							
		<div class="slide1-text slide-text">
			<div class="middle-text">
				<div class="cap-title wow slideInRight" data-wow-duration=".9s" data-wow-delay="0s">
					<h1>Exclusive Jewelry</h1>
				</div>
				<div class="cap-dec wow slideInRight" data-wow-duration="1.3s" data-wow-delay="0s">
					<h2>to express personality</h2>
				</div>	
				<div class="cap-readmore wow fadeInUpBig" data-wow-duration="1.5s" data-wow-delay="0s">
					<a href="#">Shop Now</a>
				</div>	
			</div>	
		</div>						
	</div>
	<div id="htmlcaption2" class="nivo-html-caption slider-caption-2">
		<div class="slider-progress"></div>					
		<div class="slide2-text slide-text">
			<div class="middle-text">
				<div class="cap-title wow bounceInDown" data-wow-duration=".9s" data-wow-delay="0s">
					<h1>Exclusive Jewelry</h1>
				</div>
				<div class="cap-dec wow bounceInRight" data-wow-duration="1.5s" data-wow-delay="0s">
					<h2>to express personality</h2>
				</div>	
				<div class="cap-readmore wow bounceInUp" data-wow-duration="1.3s" data-wow-delay=".5s">
					<a href="#">Shop Now</a>
				</div>										
			</div>										
		</div>
	</div>
</div>
<!-- HOME SLIDER -->
<div class="featured-product section fix"><!--start Featured Product Area-->
	<div class="container">
		<div class="row">
			<div class="section-title">
				<h2>Weekly Featured Products</h2>
				<div class="underline"></div>
			</div>
			<div class="col-sm-12">
				<!-- Featured slider Area Start -->
				<div class="feature-pro-slider owl-carousel">
					<!-- Single Product Start -->
					<div class="product-item fix">
						<div class="product-img-hover">
							<!-- Product image -->
							<a href="product-details.html" class="pro-image fix"><img src="/resources/img/featured/1.jpg" alt="featured" /></a>
							<!-- Product action Btn -->
							<div class="product-action-btn">
								<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
								<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
								<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
							</div>
						</div>
						<div class="pro-name-price-ratting">
							<!-- Product Name -->
							<div class="pro-name">
								<a href="product-details.html">Product Name Demo</a>
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
								<p><span class="old">$165</span><span class="new">$150</span></p>
							</div>
						</div>
					</div><!-- Single Product End -->
					<!-- Single Product Start -->
					<div class="product-item fix">
						<div class="product-img-hover">
							<!-- Product image -->
							<a href="product-details.html" class="pro-image fix"><img src="/resources/img/featured/2.jpg" alt="featured" /></a>
							<!-- Product action Btn -->
							<div class="product-action-btn">
								<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
								<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
								<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
							</div>
						</div>
						<div class="pro-name-price-ratting">
							<!-- Product Name -->
							<div class="pro-name">
								<a href="product-details.html">Product Name Demo</a>
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
								<p><span class="old">$165</span><span class="new">$150</span></p>
							</div>
						</div>
					</div><!-- Single Product End -->
					<!-- Single Product Start -->
					<div class="product-item fix">
						<div class="product-img-hover">
							<!-- Product image -->
							<a href="product-details.html" class="pro-image fix"><img src="/resources/img/featured/3.jpg" alt="featured" /></a>
							<!-- Product action Btn -->
							<div class="product-action-btn">
								<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
								<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
								<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
							</div>
						</div>
						<div class="pro-name-price-ratting">
							<!-- Product Name -->
							<div class="pro-name">
								<a href="product-details.html">Product Name Demo</a>
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
								<p><span class="old">$165</span><span class="new">$150</span></p>
							</div>
						</div>
					</div><!-- Single Product End -->
					<!-- Single Product Start -->
					<div class="product-item fix">
						<div class="product-img-hover">
							<!-- Product image -->
							<a href="product-details.html" class="pro-image fix"><img src="/resources/img/featured/4.jpg" alt="featured" /></a>
							<!-- Product action Btn -->
							<div class="product-action-btn">
								<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
								<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
								<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
							</div>
						</div>
						<div class="pro-name-price-ratting">
							<!-- Product Name -->
							<div class="pro-name">
								<a href="product-details.html">Product Name Demo</a>
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
								<p><span class="old">$165</span><span class="new">$150</span></p>
							</div>
						</div>
					</div><!-- Single Product End -->
					<!-- Single Product Start -->
					<div class="product-item fix">
						<div class="product-img-hover">
							<!-- Product image -->
							<a href="product-details.html" class="pro-image fix"><img src="/resources/img/featured/1.jpg" alt="featured" /></a>
							<!-- Product action Btn -->
							<div class="product-action-btn">
								<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
								<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
								<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
							</div>
						</div>
						<div class="pro-name-price-ratting">
							<!-- Product Name -->
							<div class="pro-name">
								<a href="product-details.html">Product Name Demo</a>
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
								<p><span class="old">$165</span><span class="new">$150</span></p>
							</div>
						</div>
					</div><!-- Single Product End -->
					<!-- Single Product Start -->
					<div class="product-item fix">
						<div class="product-img-hover">
							<!-- Product image -->
							<a href="product-details.html" class="pro-image fix"><img src="/resources/img/featured/2.jpg" alt="featured" /></a>
							<!-- Product action Btn -->
							<div class="product-action-btn">
								<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
								<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
								<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
							</div>
						</div>
						<div class="pro-name-price-ratting">
							<!-- Product Name -->
							<div class="pro-name">
								<a href="product-details.html">Product Name Demo</a>
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
								<p><span class="old">$165</span><span class="new">$150</span></p>
							</div>
						</div>
					</div><!-- Single Product End -->
					<!-- Single Product Start -->
					<div class="product-item fix">
						<div class="product-img-hover">
							<!-- Product image -->
							<a href="product-details.html" class="pro-image fix"><img src="/resources/img/featured/3.jpg" alt="featured" /></a>
							<!-- Product action Btn -->
							<div class="product-action-btn">
								<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
								<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
								<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
							</div>
						</div>
						<div class="pro-name-price-ratting">
							<!-- Product Name -->
							<div class="pro-name">
								<a href="product-details.html">Product Name Demo</a>
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
								<p><span class="old">$165</span><span class="new">$150</span></p>
							</div>
						</div>
					</div><!-- Single Product End -->
					<!-- Single Product Start -->
					<div class="product-item fix">
						<div class="product-img-hover">
							<!-- Product image -->
							<a href="product-details.html" class="pro-image fix"><img src="/resources/img/featured/4.jpg" alt="featured" /></a>
							<!-- Product action Btn -->
							<div class="product-action-btn">
								<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
								<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
								<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
							</div>
						</div>
						<div class="pro-name-price-ratting">
							<!-- Product Name -->
							<div class="pro-name">
								<a href="product-details.html">Product Name Demo</a>
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
								<p><span class="old">$165</span><span class="new">$150</span></p>
							</div>
						</div>
					</div><!-- Single Product End -->
				</div><!-- Featured slider Area End -->
			</div>
		</div>
	</div>
</div><!--End Featured Product Area-->

<div class="tab-product-area section fix"><!--Start Product Area-->
	<div class="container">
		<div class="row">
			<!-- Nav tabs -->
			<ul class="tabs-list" role="tablist">
				<li class="active"><a href="#new" data-toggle="tab">NEW ARRIVALS</a></li>
				<li><a href="#feature" data-toggle="tab">FEATURED</a></li>
				<li><a href="#b-sales" data-toggle="tab">BEST SELLERS</a></li>
				<li><a href="#trending" data-toggle="tab">TRENDING</a></li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content">
				<div class="tab-pane fade in active" id="new">
					<div class="tab-pro-slider new-product owl-carousel">
						<div class="single-product-item fix">
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/1.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/2.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
						</div>
						<div class="single-product-item fix">
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/2.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/6.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
						</div>
						<div class="single-product-item fix">
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/2.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/7.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
						</div>
						<div class="single-product-item fix">
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/4.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/2.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
						</div>
						<div class="single-product-item fix">
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/1.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/2.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
						</div>
						<div class="single-product-item fix">
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/2.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/6.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
						</div>
						<div class="single-product-item fix">
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/2.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/7.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
						</div>
						<div class="single-product-item fix">
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/4.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/2.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="feature">
					<div class="tab-pro-slider feature-product owl-carousel">
						<div class="single-product-item fix">
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/2.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/2.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
						</div>
						<div class="single-product-item fix">
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/2.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/2.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
						</div>
						<div class="single-product-item fix">
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/4.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/1.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
						</div>
						<div class="single-product-item fix">
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/6.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/7.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
						</div>
						<div class="single-product-item fix">
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/2.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/2.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
						</div>
						<div class="single-product-item fix">
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/2.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/2.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
						</div>
						<div class="single-product-item fix">
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/4.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/1.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
						</div>
						<div class="single-product-item fix">
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/6.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/7.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="b-sales">
					<div class="tab-pro-slider best-product owl-carousel">
						<div class="single-product-item">
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/10.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/1.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
						</div>
						<div class="single-product-item">
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/2.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/4.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
						</div>
						<div class="single-product-item">
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/6.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/2.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
						</div>
						<div class="single-product-item">
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/2.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/2.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
						</div>
						<div class="single-product-item">
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/10.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/1.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
						</div>
						<div class="single-product-item">
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/2.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/4.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
						</div>
						<div class="single-product-item">
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/6.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/2.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
						</div>
						<div class="single-product-item">
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/2.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/2.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="trending">
					<div class="tab-pro-slider trending-product owl-carousel">
						<div class="single-product-item">
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/2.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/2.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
						</div>
						<div class="single-product-item">
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/6.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/4.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
						</div>
						<div class="single-product-item">
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/9.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/10.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
						</div>
						<div class="single-product-item">
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/1.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/8.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
						</div>
						<div class="single-product-item">
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/3.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/2.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
						</div>
						<div class="single-product-item">
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/6.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/4.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
						</div>
						<div class="single-product-item">
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/9.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/10.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
						</div>
						<div class="single-product-item">
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/1.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
							<!-- Single Product Start -->
							<div class="product-item fix">
								<div class="product-img-hover">
									<!-- Product image -->
									<a href="product-details.html" class="pro-image fix"><img src="/resources/img/product/8.jpg" alt="product" /></a>
									<!-- Product action Btn -->
									<div class="product-action-btn">
										<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
										<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
										<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
									</div>
								</div>
								<div class="pro-name-price-ratting">
									<!-- Product Name -->
									<div class="pro-name">
										<a href="product-details.html">Product Name Demo</a>
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
										<p><span class="old">$165</span><span class="new">$150</span></p>
									</div>
								</div>
							</div><!-- Single Product End -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div><!--End Product Area-->
<div class="magic-area fix"><!--Start Magic Area-->
	<div class="col-sm-12 col-md-6 image">
		<a href="#"><img src="/resources/img/magic.jpg" alt="magic" /></a>
	</div>
	<div class="col-sm-12 col-md-6 content">
		<h2>Use Jewelry’s magic</h2>
		<h3>buy fine jewelry</h3>
		<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor</p>
		<a href="#">Shop Now</a>
	</div>
</div><!--End Magic Area-->
<div class="blog-area section fix"><!--Start Blog Area-->
	<div class="container">
		<div class="row">
			<div class="section-title">
				<h2>Latest From Blog</h2>
				<div class="underline"></div>
			</div>
			<div class="blog-slider owl-carousel">
				<div class="single-blog">
					<div class="content fix">
						<a class="image fix" href="blog-details.html"><img src="/resources/img/blog/blog-1.jpg" alt="" />
							<div class="date">
								<h4>25</h4>
								<h5>Aug</h5>
							</div>
						</a>
						<h2><a class="title" href="blog-details.html">Lorem ipsum dolor sit amet</a></h2>
						<div class="meta">
							<a href="#"><i class="fa fa-pencil-square-o"></i>John Lee</a>
							<a href="#"><i class="fa fa-calendar"></i>2 Days ago</a>
							<a href="#"><i class="fa fa-comments"></i>12 Comments</a>
						</div>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim niam.</p>
					</div>
				</div>
				<div class="single-blog">
					<div class="content fix">
						<a class="image fix" href="blog-details.html"><img src="/resources/img/blog/blog-2.jpg" alt="" />
							<div class="date">
								<h4>25</h4>
								<h5>Aug</h5>
							</div>
						</a>
						<h2><a class="title" href="blog-details.html">Lorem ipsum dolor sit amet</a></h2>
						<div class="meta">
							<a href="#"><i class="fa fa-pencil-square-o"></i>John Lee</a>
							<a href="#"><i class="fa fa-calendar"></i>2 Days ago</a>
							<a href="#"><i class="fa fa-comments"></i>12 Comments</a>
						</div>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim niam.</p>
					</div>
				</div>
				<div class="single-blog">
					<div class="content fix">
						<a class="image fix" href="blog-details.html"><img src="/resources/img/blog/blog-3.jpg" alt="" />
							<div class="date">
								<h4>25</h4>
								<h5>Aug</h5>
							</div>
						</a>
						<h2><a class="title" href="blog-details.html">Lorem ipsum dolor sit amet</a></h2>
						<div class="meta">
							<a href="#"><i class="fa fa-pencil-square-o"></i>John Lee</a>
							<a href="#"><i class="fa fa-calendar"></i>2 Days ago</a>
							<a href="#"><i class="fa fa-comments"></i>12 Comments</a>
						</div>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim niam.</p>
					</div>
				</div>
				<div class="single-blog">
					<div class="content fix">
						<a class="image fix" href="blog-details.html"><img src="/resources/img/blog/blog-4.jpg" alt="" />
							<div class="date">
								<h4>25</h4>
								<h5>Aug</h5>
							</div>
						</a>
						<h2><a class="title" href="blog-details.html">Lorem ipsum dolor sit amet</a></h2>
						<div class="meta">
							<a href="#"><i class="fa fa-pencil-square-o"></i>John Lee</a>
							<a href="#"><i class="fa fa-calendar"></i>2 Days ago</a>
							<a href="#"><i class="fa fa-comments"></i>12 Comments</a>
						</div>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim niam.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div><!--End Blog Area-->
<div class="funfact section fix"><!--Start Fun Factor Area-->
	<div class="container">
		<div class="row">
			<div class="section-title">
				<h2>Fun Factor</h2>
				<div class="underline"></div>
			</div>
			<div class="col-xs-6 col-sm-3">
				<div class="fun-factor">
					<div class="fun-factor-in">
						<i class="fa fa-user"></i>
						<div class="fun-factor-out"></div>
					</div>
					<p class="timer" data-from="0" data-to="11250"></p>
					<h4>Happy Customers</h4>
				</div>
			</div>
			<div class="col-xs-6 col-sm-3">
				<div class="fun-factor">
					<div class="fun-factor-in">
						<i class="fa fa-database"></i>
						<div class="fun-factor-out"></div>
					</div>
					<p class="timer" data-from="0" data-to="7500"></p>
					<h4>Items</h4>
				</div>
			</div>
			<div class="col-xs-6 col-sm-3">
				<div class="fun-factor">
					<div class="fun-factor-in">
						<i class="fa fa-eye"></i>
						<div class="fun-factor-out"></div>
					</div>
					<p class="timer" data-from="0" data-to="2050"></p>
					<h4>Views</h4>
				</div>
			</div>
			<div class="col-xs-6 col-sm-3">
				<div class="fun-factor">
					<div class="fun-factor-in">
						<i class="fa fa-money"></i>
						<div class="fun-factor-out"></div>
					</div>
					<p class="timer" data-from="0" data-to="1550"></p>
					<h4>Sales</h4>
				</div>
			</div>
		</div>
	</div>
</div><!--Start Fun Factor Area-->
<div class="testimonial-area fix"><!--Start Testimonial Area-->
	<div class="overlay section">
		<div class="container">
			<div class="row">
				<div class="col-sm-offset-0 col-sm-12 col-md-offset-2 col-md-8">
					<div class="testimonial-slider  owl-carousel">
						<div class="testimonial-item">
							<div class="image fix">
								<img src="/resources/img/testimonial/testimonial.jpg" alt="" />
							</div>
							<div class="content fix">
								<p>Lorem ipsum dolor sit amet, consectetur adiising elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua...</p>
								<h3>Zasika Williams</h3>
							</div>
						</div>
						<div class="testimonial-item">
							<div class="image fix">
								<img src="/resources/img/testimonial/testimonial.jpg" alt="" />
							</div>
							<div class="content fix">
								<p>Lorem ipsum dolor sit amet, consectetur adiising elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua...</p>
								<h3>Zasika Williams</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div><!--End Testimonial Area-->


<%@ include file="../includes/footer.jsp"%>
