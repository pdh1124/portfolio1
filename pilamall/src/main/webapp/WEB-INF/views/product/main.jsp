<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core를 쓸 때 태그에 c로 표시  -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt를 쓸 때 태그에 fmt로 표시 fmt : formatter 형식 맞춰서 표시 -->

<%@ include file="../includes/header.jsp"%>

<!-- 메인 배너 -->
<div class="slider-wrap home-1-slider">
	<div id="mainSlider" class="nivoSlider slider-image">
		<a href="#"><img src="/resources/Images/main/main_banner_1.jpg" alt="main slider"/></a>
		<a href="#"><img src="/resources/Images/main/main_banner_2.jpg" alt="main slider"/></a>
	</div>
</div>

<!-- HOME SLIDER -->
<div class="featured-product section fix"><!--start Featured Product Area-->
	<div class="container">
		<div class="row">
			<div class="section-title">
				<h2><span>NEW</span> PRODUCT</h2>
				<div class="underline"></div>
			</div>
			<div class="col-sm-12">
				<!-- Featured slider Area Start -->
				<div class="feature-pro-slider owl-carousel">
					<!-- 상품1 -->
					<c:forEach var="product" items="${product }">
						<div class="product-item fix">
							<c:if test="${product.stock > 0 }">
							<div class="product-img-hover">
								<!-- Product image -->
								
								<a href="/product/view?gdsNum=${product.gdsNum }" class="pro-image fix"><img src="${product.thumbImg }" alt="product" /></a>
							</div>
							<div class="pro-name-price-ratting">
								<!-- Product Name -->
								<div class="pro-name">
									<a href="/product/view?gdsNum=${product.gdsNum }">${product.gdsName }</a>
								</div>
								
								<!-- Product Price -->
								<div class="pro-price fix">
									<p><span class="new"><fmt:formatNumber value="${product.price }" pattern="###,###,###" /></span> 원</p>
								</div>
							</div>
							</c:if>
							<c:if test="${product.stock eq 0 }">
							<div class="product-img-hover">
								<!-- Product image -->
								
								<a href="#" class="pro-image fix solt-out"><img src="${product.thumbImg }" alt="product" /></a>
							</div>
							<div class="pro-name-price-ratting">
								<!-- Product Name -->
								<div class="pro-name">
									<a href="#" style=" text-decoration:line-through;">${product.gdsName }</a>
								</div>
								
								<!-- Product Price -->
								<div class="pro-price fix">
									<p><span style="color:red;" class="new">solt out</span></p>
								</div>
							</div>
							</c:if>
						</div>
					</c:forEach>
					<!-- 상품 끝 -->
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 카테고리 제품 -->
<div class="tab-product-area section fix">
	<div class="container">
		<div class="row">
			<div class="section-title">
				<h2><span>CATEGORY</span> PRODUCT</h2>
				<div class="underline"></div>
			</div>
			<!-- 네비 탭 -->
			<ul class="tabs-list" role="tablist">
				<li class="active"><a href="#new" data-toggle="tab">요가복</a></li>
				<li><a href="#feature" data-toggle="tab">요가용품</a></li>
			</ul>
			<!-- 상품들 1 -->
			<div class="tab-content">
				<div class="tab-pane fade in active" id="new">
					<div class="tab-pro-slider new-product owl-carousel">
						<!-- 상품 -->
						<c:forEach var="main1" items="${main1 }">
							<div class="single-product-item fix">	
								<div class="product-item fix">
									<c:if test="${main1.stock > 0 }">
									<div class="product-img-hover">
										<!-- Product image -->
										
										<a href="/product/view?gdsNum=${main1.gdsNum }" class="pro-image fix"><img src="${main1.thumbImg }" alt="product" /></a>
									</div>
									<div class="pro-name-price-ratting">
										<!-- Product Name -->
										<div class="pro-name">
											<a href="/product/view?gdsNum=${main1.gdsNum }">${main1.gdsName }</a>
										</div>
										
										<!-- Product Price -->
										<div class="pro-price fix">
											<p><span class="new"><fmt:formatNumber value="${main1.price }" pattern="###,###,###" /></span> 원</p>
										</div>
									</div>
									</c:if>
									<c:if test="${main1.stock eq 0 }">
									<div class="product-img-hover">
										<!-- Product image -->
										
										<a href="#" class="pro-image fix solt-out"><img src="${main1.thumbImg }" alt="product" /></a>
									</div>
									<div class="pro-name-price-ratting">
										<!-- Product Name -->
										<div class="pro-name">
											<a href="#" style=" text-decoration:line-through;">${main1.gdsName }</a>
										</div>
										
										<!-- Product Price -->
										<div class="pro-price fix">
											<p><span style="color:red;" class="new">solt out</span></p>
										</div>
									</div>
									</c:if>
								</div>	
							</div>
						</c:forEach>
						<!-- 상품 끝 -->
					</div>
				</div>
				<div class="tab-pane fade" id="feature">
					<div class="tab-pro-slider feature-product owl-carousel">
						<!-- 상품 -->
						<c:forEach var="main2" items="${main2 }">
							<div class="single-product-item fix">	
								<div class="product-item fix">
									<c:if test="${main2.stock > 0 }">
									<div class="product-img-hover">
										<!-- Product image -->
										
										<a href="/product/view?gdsNum=${main2.gdsNum }" class="pro-image fix"><img src="${main2.thumbImg }" alt="product" /></a>
									</div>
									<div class="pro-name-price-ratting">
										<!-- Product Name -->
										<div class="pro-name">
											<a href="/product/view?gdsNum=${main2.gdsNum }">${main2.gdsName }</a>
										</div>
										
										<!-- Product Price -->
										<div class="pro-price fix">
											<p><span class="new"><fmt:formatNumber value="${main2.price }" pattern="###,###,###" /></span> 원</p>
										</div>
									</div>
									</c:if>
									<c:if test="${main2.stock eq 0 }">
									<div class="product-img-hover">
										<!-- Product image -->
										
										<a href="#" class="pro-image fix solt-out"><img src="${main2.thumbImg }" alt="product" /></a>
									</div>
									<div class="pro-name-price-ratting">
										<!-- Product Name -->
										<div class="pro-name">
											<a href="#" style=" text-decoration:line-through;">${main2.gdsName }</a>
										</div>
										
										<!-- Product Price -->
										<div class="pro-price fix">
											<p><span style="color:red;" class="new">solt out</span></p>
										</div>
									</div>
									</c:if>
								</div>	
							</div>
						</c:forEach>
						<!-- 상품 끝 -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div><!--End Product Area-->
<div class="magic-area fix"><!--Start Magic Area-->
	<div class="col-sm-12 col-md-6 image">
		<a href="/product/view?gdsNum=47"><img src="/resources/Images/main/main_sub_banner.jpg" alt="magic" /></a>
	</div>
	<div class="col-sm-12 col-md-6 content">
		<h2>필라테스의 가벼운 시작</h2>
		<h3>요가 매트에서부터 시작합니다.</h3>
		<p>처음부터 여러장비를 맞출 필요 없이 가벼운 매트하나부터 차근차근 시작하는 겁니다.<br />가벼운 동작부터 몸을 익숙하게 만드는것이 중요합니다.</p>
		<a href="/product/view?gdsNum=47">Shop Now</a>
	</div>
</div><!--End Magic Area-->
<div class="blog-area section fix"><!--Start Blog Area-->
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<div class="about-text">
					<h2><span>공지사항</span> 게시판</h2>
				</div>
				<table class="table cart-table board_table">
					<thead class="table-title">
						<tr>
							<th class="b_title">제목</th>
							<th class="b_writer">작성자</th>
						</tr>													
					</thead>
					<tbody>
						<c:forEach var="notice" items="${notice }">
							<tr class="table-info main-table">
								<td class="m_title align-left">
									<h5><a href="/notice/get?noNum=${notice.noNum }"><c:out value="${notice.noTitle }" /></a></h5>
								</td>
								<td class="m_writer">
									<h5><c:out value="필라몰 운영자" /></h5>
								</td>
							</tr>
						</c:forEach>					
					</tbody>
				</table>
			</div>
			<div class="col-sm-6">
				<div class="about-text">
					<h2><span>커뮤니티</span> 게시판</h2>
				</div>
				<table class="table cart-table board_table">
					<thead class="table-title">
						<tr>
							<th class="b_title">제목</th>
							<th class="b_writer">작성자</th>
						</tr>													
					</thead>
					<tbody>
						<c:forEach var="board" items="${board }">
							<tr class="table-info main-table">
								<td class="m_title align-left">
									<h5><a href="/board/comm_get?bno=${board.bno }"><c:out value="${board.title }" /></a></h5>
								</td>
								<td class="m_writer">
									<h5><c:out value="${board.writer }" /></h5>
								</td>
							</tr>
						</c:forEach>					
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div><!--End Blog Area-->


<%@ include file="../includes/footer.jsp"%>
