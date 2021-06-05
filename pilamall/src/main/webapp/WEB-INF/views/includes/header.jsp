<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core를 쓸 때 태그에 c로 표시  -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt를 쓸 때 태그에 fmt로 표시 fmt : formatter 형식 맞춰서 표시 -->
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title>필라몰 | pilamall</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Fav Icon -->
	<link id="favicon" rel="icon" type="image/png" href="/resources/img/favicon.ico" />
	<!-- Google Font Raleway -->
	<link href='https://fonts.googleapis.com/css?family=Raleway:200,300,500,400,600,700,800' rel='stylesheet' type='text/css'>
	<!-- Google Font Dancing Script -->
	<link href='https://fonts.googleapis.com/css?family=Dancing+Script' rel='stylesheet' type='text/css'>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css" />
	<!-- Font Awesome CSS -->
	<link rel="stylesheet" type="text/css" href="/resources/css/font-awesome.min.css" />
	<!-- Owl Carousel CSS -->
	<link rel="stylesheet" type="text/css" href="/resources/css/owl.carousel.min.css" />
	<!-- Animate CSS -->
	<link rel="stylesheet" type="text/css" href="/resources/css/animate.min.css" />
	<!-- simpleLens CSS -->
	<link rel="stylesheet" type="text/css" href="/resources/css/jquery.simpleLens.css" />
	<!-- Price Slider CSS -->
	<link rel="stylesheet" type="text/css" href="/resources/css/jquery-price-slider.css" />
	<!-- MeanMenu CSS -->
	<link rel="stylesheet" type="text/css" href="/resources/css/meanmenu.min.css" />
	<!-- Magnific Popup CSS -->
	<link rel="stylesheet" type="text/css" href="/resources/css/magnific-popup.css" />
	<!-- Nivo Slider CSS -->
	<link rel="stylesheet" type="text/css" href="/resources/css/nivo-slider.css" />
	<!-- Stylesheet CSS -->
	<link rel="stylesheet" type="text/css" href="/resources/css/style.css" />
	<!-- Responsive Stylesheet -->
	<link rel="stylesheet" type="text/css" href="/resources/css/responsive.css" />
	<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
</head>
<body>
<div class="header-top"><!--Start Header Top Area-->
	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-md-4">
				<div class="info">
					<div class="phn-num float-left">
						<p>PliaMall 포트폴리오 (박동훈)</p>
					</div>
				</div>
			</div>
			<div class="col-sm-12 col-md-4"></div>
			<div class="col-sm-12 col-md-4">
				<div id="top-menu" class="float-right">
					<ul>
						<li><a href="/member/login">로그인</a></li>
						<li style="color:#ffffff;">/</li>
						<li><a href="/member/signup">회원가입</a>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div><!--End Header Top Area-->
<div class="header-area"><!--Start Header Area-->
	<div class="container">
		<div class="row">
			<div class="col-sm-4 col-lg-3"></div>
			<div class="col-sm-4 col-lg-6">
				<div class="logo text-center">
					<a href="/product/main">
						<img src="/resources/img/header/logo.png" alt="" />
					</a>
				</div>
			</div>
			<div class="col-sm-4 col-lg-3">
				<div class="cart-info float-right">
					<a href="cart.html">
						<h5>My cart <span>2</span> items - <span>$390</span></h5>
						<i class="fa fa-shopping-cart"></i>
					</a>
					<div class="cart-hover">
						<ul class="header-cart-pro">
							<li>
								<div class="image"><a href="#"><img alt="cart item" src="/resources/img/cart-1.jpg"></a></div>
								<div class="content fix"><a href="#">Product Name</a><span class="price">Price: $130</span><span class="quantity">Quantity: 1</span></div>
								<i class="fa fa-trash delete"></i>
							</li>
							<li>
								<div class="image"><a href="#"><img alt="cart item" src="/resources/img/cart-2.jpg"></a></div>
								<div class="content fix"><a href="#">Product Name</a><span class="price">Price: $130</span><span class="quantity">Quantity: 2</span></div>
								<i class="fa fa-trash delete"></i>
							</li>
						</ul>
						<div class="header-button-price">
							<a href="checkout.html"><i class="fa fa-sign-out"></i><span>Check Out</span></a>
							<div class="total-price"><h3>Total Price : <span>$390</span></h3></div>
						</div>
					</div>
				</div>
				<div class="search float-right">
					<input type="text" value="" placeholder="Search Here...." />
					<button class="submit"><i class="fa fa-search"></i></button>
				</div>
			</div>
		</div>
	</div>
</div><!--End Header Area-->
<div class="menu-area"><!--Start Main Menu Area-->
	<div class="container">
		<div class="row">
			<div class="clo-md-12">
				<div class="main-menu hidden-sm hidden-xs">
					<nav>
						<ul>
							<li><a href="/product/main" class="active">Home</a>
								<ul class="sub-menu">
									<li><a href="/product/main">Home 1</a></li>
									<li><a href="/product/main">Home 2</a></li>
									<li><a href="/product/main">Home 3</a></li>
								</ul>
							</li>
							<li><a href="#">Pages</a>
								<div class="mega-menu mega-menu-page">
									<div class="column-1 column">
										<ul>
											<li><a href="about-us.html">About US</a></li>
											<li><a href="blog.html">Blog</a></li>
											<li><a href="blog-left-sidebar.html">Blog left sidebar</a></li>
											<li><a href="blog-right-sidebar.html">Blog right sidebar</a></li>
											<li><a href="blog-details.html">Blog details</a></li>
										</ul>
									</div>
									<div class="column-2 column">
										<ul>
											<li><a href="cart.html">Cart</a></li>
											<li><a href="checkout.html">Checkout</a></li>
											<li><a href="coming-soon.html">Coming soon</a></li>
											<li><a href="contact.html">Contact</a></li>
											<li><a href="contact-2.html">Contact 2</a></li>
										</ul>
									</div>
									<div class="column-3 column">
										<ul>
											<li><a href="faq.html">FAQ</a></li>
											<li><a href="login.html">Login</a></li>
											<li><a href="portfolio.html">Portfolio 3 column</a></li>
											<li><a href="portfolio-2.html">Portfolio 4 column</a></li>
											<li><a href="404.html">404</a></li>
										</ul>
									</div>
									<div class="column-4 column">
										<ul>
											<li><a href="shop.html">Shop</a></li>
											<li><a href="shop-list.html">Shop list</a></li>
											<li><a href="shop-left-sidebar.html">Shop left sidebar</a></li>
											<li><a href="shop-right-sidebar.html">Shop right sidebar</a></li>
											<li><a href="product-details.html">Product details</a></li>
										</ul>
									</div>
								</div>
							</li>
							<li><a href="shop.html">Shop</a>
								<div class="mega-menu mega-menu-1">
									<div class="column-1 column">
										<ul>
											<li><a href="shop-list.html">rings</a></li>
											<li><a href="shop-left-sidebar.html">diamond ring</a></li>
											<li><a href="shop-right-sidebar.html">gold ring</a></li>
											<li><a href="shop-list.html">sliver ring</a></li>
											<li><a href="shop-left-sidebar.html">Platinum ring</a></li>
										</ul>
									</div>
									<div class="column-2 column">
										<ul>
											<li><a href="shop-list.html">Bracelets</a></li>
											<li><a href="shop-left-sidebar.html">diamond Bracelets</a></li>
											<li><a href="shop-right-sidebar.html">gold Bracelets</a></li>
											<li><a href="shop-left-sidebar.html">sliver Bracelets</a></li>
											<li><a href="shop-right-sidebar.html">Platinum Bracelets</a></li>
										</ul>
									</div>
									<div class="column-3 column">
										<ul>
											<li><a href="shop-list.html">lecklaces</a></li>
											<li><a href="shop-right-sidebar.html">diamond lecklaces</a></li>
											<li><a href="shop-left-sidebar.html">gold lecklaces</a></li>
											<li><a href="shop-right-sidebar.html">sliver lecklaces</a></li>
											<li><a href="shop-left-sidebar.html">Platinum lecklaces</a></li>
										</ul>
									</div>
									<div class="column-4 column">
										<a href="#"><img src="/resources/img/product/10.jpg" alt="" /></a>
									</div>
								</div>
							</li>
							<li><a href="shop.html">New Arrivals</a>
								<div class="mega-menu mega-menu-1">
									<div class="column-1 column">
										<ul>
											<li><a href="shop-list.html">rings</a></li>
											<li><a href="shop-left-sidebar.html">diamond ring</a></li>
											<li><a href="shop-right-sidebar.html">gold ring</a></li>
											<li><a href="shop-list.html">sliver ring</a></li>
											<li><a href="shop-left-sidebar.html">Platinum ring</a></li>
										</ul>
									</div>
									<div class="column-2 column">
										<ul>
											<li><a href="shop-list.html">Bracelets</a></li>
											<li><a href="shop-left-sidebar.html">diamond Bracelets</a></li>
											<li><a href="shop-right-sidebar.html">gold Bracelets</a></li>
											<li><a href="shop-left-sidebar.html">sliver Bracelets</a></li>
											<li><a href="shop-right-sidebar.html">Platinum Bracelets</a></li>
										</ul>
									</div>
									<div class="column-3 column">
										<ul>
											<li><a href="shop-list.html">lecklaces</a></li>
											<li><a href="shop-right-sidebar.html">diamond lecklaces</a></li>
											<li><a href="shop-left-sidebar.html">gold lecklaces</a></li>
											<li><a href="shop-right-sidebar.html">sliver lecklaces</a></li>
											<li><a href="shop-left-sidebar.html">Platinum lecklaces</a></li>
										</ul>
									</div>
									<div class="column-4 column">
										<ul>
											<li><a href="shop-right-sidebar.html">earrings</a></li>
											<li><a href="shop-list.html">diamond earrings</a></li>
											<li><a href="shop-left-sidebar.html">gold earrings</a></li>
											<li><a href="shop-list.html">sliver earrings</a></li>
											<li><a href="shop-left-sidebar.html">Platinum earrings</a></li>
										</ul>
									</div>
								</div>
							</li>
							<li><a href="portfolio.html">Portfolio</a>
								<ul class="sub-menu">
									<li><a href="portfolio.html">Portfolio 3 column</a></li>
									<li><a href="portfolio-2.html">Portfolio 4 column</a></li>
								</ul>
							</li>
							<li><a href="blog.html">Blog</a>
								<ul class="sub-menu">
									<li><a href="blog.html">Blog Page</a></li>
									<li><a href="blog-left-sidebar.html">Blog left sidebar</a></li>
									<li><a href="blog-right-sidebar.html">Blog right sidebar</a></li>
								</ul>
							</li>
							<li><a href="about-us.html">About Us</a></li>
							<li><a href="contact.html">Contact</a>
								<ul class="sub-menu">
									<li><a href="contact.html">Contact 1</a></li>
									<li><a href="contact-2.html">Contact 2</a></li>
								</ul>
							</li>
						</ul>
					</nav>
				</div>
				<div class="mobile-menu hidden-md hidden-lg">
					<nav>
						<ul>
							<li><a href="/product/main" class="active">Home</a>
								<ul>
									<li><a href="/product/main">Home 1</a></li>
									<li><a href="/product/main">Home 2</a></li>
									<li><a href="/product/main">Home 3</a></li>
								</ul>
							</li>
							<li><a href="#">Pages</a>
								<ul>
									<li><a href="about-us.html">About US</a></li>
									<li><a href="blog.html">Blog</a></li>
									<li><a href="blog-left-sidebar.html">Blog left sidebar</a></li>
									<li><a href="blog-right-sidebar.html">Blog right sidebar</a></li>
									<li><a href="blog-details.html">Blog details</a></li>
									<li><a href="cart.html">Cart</a></li>
									<li><a href="checkout.html">Checkout</a></li>
									<li><a href="coming-soon.html">Coming soon</a></li>
									<li><a href="contact.html">Contact</a></li>
									<li><a href="contact-2.html">Contact 2</a></li>
									<li><a href="faq.html">FAQ</a></li>
									<li><a href="login.html">Login</a></li>
									<li><a href="portfolio.html">Portfolio 3 column</a></li>
									<li><a href="portfolio-2.html">Portfolio 4 column</a></li>
									<li><a href="404.html">404</a></li>
									<li><a href="shop.html">Shop</a></li>
									<li><a href="shop-list.html">Shop list</a></li>
									<li><a href="shop-left-sidebar.html">Shop left sidebar</a></li>
									<li><a href="shop-right-sidebar.html">Shop right sidebar</a></li>
									<li><a href="product-details.html">Product details</a></li>
								</ul>
							</li>
							<li><a href="shop.html">Shop</a>
								<ul>
									<li><a href="shop-list.html">rings</a>
									<ul>
										<li><a href="shop-left-sidebar.html">diamond ring</a></li>
										<li><a href="shop-right-sidebar.html">gold ring</a></li>
										<li><a href="shop-list.html">sliver ring</a></li>
										<li><a href="shop-left-sidebar.html">Platinum ring</a></li>
									</ul>
									</li>
									<li><a href="shop-list.html">Bracelets</a>
									<ul>
										<li><a href="shop-left-sidebar.html">diamond Bracelets</a></li>
										<li><a href="shop-right-sidebar.html">gold Bracelets</a></li>
										<li><a href="shop-left-sidebar.html">sliver Bracelets</a></li>
										<li><a href="shop-right-sidebar.html">Platinum Bracelets</a></li>
									</ul>
									</li>
									<li><a href="shop-list.html">lecklaces</a>
									<ul>
										<li><a href="shop-right-sidebar.html">diamond lecklaces</a></li>
										<li><a href="shop-left-sidebar.html">gold lecklaces</a></li>
										<li><a href="shop-right-sidebar.html">sliver lecklaces</a></li>
										<li><a href="shop-left-sidebar.html">Platinum lecklaces</a></li>
									</ul>
									</li>
								</ul>
							</li>
							<li><a href="shop.html">New Arrivals</a>
								<ul>
									<li><a href="shop-list.html">rings</a>
									<ul>
										<li><a href="shop-left-sidebar.html">diamond ring</a></li>
										<li><a href="shop-right-sidebar.html">gold ring</a></li>
										<li><a href="shop-list.html">sliver ring</a></li>
										<li><a href="shop-left-sidebar.html">Platinum ring</a></li>
									</ul>
									</li>
									<li><a href="shop-list.html">Bracelets</a>
									<ul>
										<li><a href="shop-left-sidebar.html">diamond Bracelets</a></li>
										<li><a href="shop-right-sidebar.html">gold Bracelets</a></li>
										<li><a href="shop-left-sidebar.html">sliver Bracelets</a></li>
										<li><a href="shop-right-sidebar.html">Platinum Bracelets</a></li>
									</ul>
									</li>
									<li><a href="shop-list.html">lecklaces</a>
									<ul>
										<li><a href="shop-right-sidebar.html">diamond lecklaces</a></li>
										<li><a href="shop-left-sidebar.html">gold lecklaces</a></li>
										<li><a href="shop-right-sidebar.html">sliver lecklaces</a></li>
										<li><a href="shop-left-sidebar.html">Platinum lecklaces</a></li>
									</ul>
									</li>
									<li><a href="shop-right-sidebar.html">earrings</a>
									<ul>
										<li><a href="shop-right-sidebar.html">diamond lecklaces</a></li>
										<li><a href="shop-left-sidebar.html">gold earrings</a></li>
										<li><a href="shop-list.html">sliver earrings</a></li>
										<li><a href="shop-left-sidebar.html">Platinum earrings</a></li>
									</ul>
									</li>
								</ul>
							</li>
							<li><a href="portfolio.html">Portfolio</a>
								<ul>
									<li><a href="portfolio.html">Portfolio 3 column</a></li>
									<li><a href="portfolio-2.html">Portfolio 4 column</a></li>
								</ul>
							</li>
							<li><a href="blog.html">Blog</a>
								<ul>
									<li><a href="blog.html">Blog 1</a></li>
									<li><a href="blog-left-sidebar.html">Blog 2</a></li>
									<li><a href="blog-right-sidebar.html">Blog 3</a></li>
								</ul>
							</li>
							<li><a href="about-us.html">About Us</a></li>
							<li><a href="contact.html">Contact</a>
								<ul>
									<li><a href="contact.html">Contact 1</a></li>
									<li><a href="contact-2.html">Contact 2</a></li>
								</ul>
							</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
</div><!--End Main Menu Area-->