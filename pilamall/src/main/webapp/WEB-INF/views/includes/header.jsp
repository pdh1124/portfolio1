<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core를 쓸 때 태그에 c로 표시  -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt를 쓸 때 태그에 fmt로 표시 fmt : formatter 형식 맞춰서 표시 -->

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE HTML>
<html>
<head profile="http://www.w3.org/2005/10/profile">
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
	<meta charset="UTF-8">
	<title>필라몰 | pilamall</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Fav Icon -->
	<link id="favicon" rel="icon" href="/resources/img/favicon.ico" />
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
	<!-- jQuery 2.1.4 -->
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
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
						<sec:authorize access="isAuthenticated()">
							<sec:authentication property="principal.username" var="userId"/>
							<li>어서오세요.&nbsp; ${userId } 님</li>
							<li>/</li>
							<li><a href="/member/mypage">회원관리</a>
								<ul class="top_menu">
									<sec:authorize access="hasRole('ROLE_ADMIN')">
										<li><a href="/admin/main">관리자페이지</a></li>
									</sec:authorize>
									<sec:authorize access="permitAll">
										<li><a href="/member/mypage">마이페이지</a></li>
									</sec:authorize>
									<li><a href="/inquiry/register">1:1문의</a></li>
									<li>
									<form action="/member/logout" method="GET">
										<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
										<a id="member_logout" href="/member/logout">로그아웃</a>
									</form>
									</li>
								</ul>
							</li>
						</sec:authorize>
						<sec:authorize access="isAnonymous()">
							<li><a href="/member/login">로그인</a></li>
							<li style="color:#ffffff;">/</li>
							<li><a href="/member/signup">회원가입</a></li>
						</sec:authorize>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div><!--End Header Top Area-->
<div class="header-area"><!--Start Header Area-->
	<div class="container">
		<div class="row">
			<div class="col-sm-4 col-lg-3">
				<div class="logo text-center">
					<a href="/product/main">
						<img src="/resources/img/header/logo.png" alt="" />
					</a>
				</div>
			</div>
			<!-- 검색창 -->
			<div class="col-sm-4 col-lg-6">
				<form id="search-Form" action="/product/search" method="get">
					<div class="search float-right">
						<input type="text" name="keyword" value="${pageMaker.cri.keyword }" autocomplete="off" placeholder="상품을 검색해 주세요...." />
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }" />
						<input type="hidden" name="amount" value="${pageMaker.cri.amount }" />
						<button class="submit"><i class="fa fa-search"></i></button>
					</div>
				</form>
			</div>
			
			<script>
			$(document).ready(function(){
			
				var goods_searchForm = $("#search-Form");
				
				$("#search-Form button").on("click", function(e) {
					
					//키워드가 빈값이면 키워드를 입력하라고 띄움.
					if(!goods_searchForm.find("input[name='keyword']").val()) {
						alert("검색어를 입력해 주세요.");
						return false;
					}
					
					//검색을 한후에는 1페이지로 이동해라.
					goods_searchForm.find("input[name='pageNum']").val(1);
					goods_searchForm.find("input[name='amount']").val(16);
					e.preventDefault();
					goods_searchForm.submit();
				});
			});
			</script>
			
			<div class="col-sm-4 col-lg-3">
				<sec:authorize access="isAuthenticated()">
				<div class="cart-info float-right">
					<a href="/cart/list">
						<h5>장바구니</h5>
						<i class="fa fa-shopping-cart"></i>
					</a>
				</div>
				</sec:authorize>
				<sec:authorize access="isAnonymous()">	
					<div class="cart-info float-right">
						<a href="/member/login">
							<h5>장바구니</h5>
							<i class="fa fa-shopping-cart"></i>
						</a>
					</div>
				</sec:authorize>		
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
							<li><a href="/product/main" class="active">메인페이지</a></li>
							<li><a href="/product/all">전체 상품</a></li>
							<li><a href="/product/product1">요가복</a></li>
							<li><a href="/product/product2">요가용품</a></li>
							<li><a href="#">게시판</a>
								<ul class="sub-menu">
									<li><a href="/notice/list">공지사항 게시판</a></li>
									<li><a href="/board/comm_list">커뮤니티 게시판</a></li>
								</ul>
							</li>
							<li><a href="#">소개</a></li>
						</ul>
					</nav>
				</div>
				<div class="mobile-menu hidden-md hidden-lg">
					<nav>
						<ul>
							<li><a href="/product/main" class="active">메인페이지</a></li>
							<li><a href="#">전체 상품</a></li>
							<li><a href="#">요가복</a></li>
							<li><a href="#">요가용품</a></li>
							<li><a href="/board/list">게시판</a>
								<ul>
									<li><a href="#">문의 게시판</a></li>
									<li><a href="/board/comm_list">커뮤니티 게시판</a></li>
								</ul>
							</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
</div><!--End Main Menu Area-->

<!-- 스마트에디터2  -->
<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>