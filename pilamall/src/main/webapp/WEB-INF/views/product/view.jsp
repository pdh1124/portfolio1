<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core를 쓸 때 태그에 c로 표시  -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt를 쓸 때 태그에 fmt로 표시 fmt : formatter 형식 맞춰서 표시 -->

<%@ include file="../includes/header.jsp"%>

<script>
//리뷰 리스트
function replyList() {
	
	var gdsNum = ${product.gdsNum};
	
	//비동기식 데이터를 요청한다.
	$.getJSON("/product/view/replyList" + "?gdsNum=" + gdsNum, function(data) {
		
		var str = "";
		
		$(data).each(function() {
			 console.log(data);
			 

			 var star = this.star;
			 
			 //리뷰 리스트 만들기
			 str += "<li class='reply_List' data-repNum='" + this.repNum + "'>";
			 str += "<div class='userInfo'>";
			 str += "<span class='review_userId'>" + this.userId + "</span> ㆍ ";
			 
			 if(star == 1) {
				 str += "<span class='review_star'>★☆☆☆☆</span>";
			 }
			 if(star == 2) {
				 str += "<span class='review_star'>★★☆☆☆</span>";
			 }
			 if(star == 3) {
				 str += "<span class='review_star'>★★★☆☆</span>";
			 }
			 if(star == 4) {
				 str += "<span class='review_star'>★★★★☆</span>";
			 }
			 if(star == 5) {
				 str += "<span class='review_star'>★★★★★</span>";
			 }
			 str += "</div>";
			 str += "<div class='replyContent'>" + this.repCon + "</div><br />";
			 //str += "<div class='replyContent'>" + this.userName + "</div><br />";
			 //str += "<div class='replyContent'>" + this.repNum + "</div><br />";
			 str += "<div class='review_bt'>";
			 str += "<a href='#' data-repNum=" + this.repNum + ">수정</a> / ";
			 str += "<a href='#' data-repNum=" + this.repNum + ">삭제</a>";
			 str += "</div>";
			 str += "<div class='div_line'></div>";
			 str += "</li>";
		});
		
		// 조립한 HTML코드를 추가
		$("section.replyList ul").html(str);
		
	});
}

</script>

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
							<div>
								<section class="replyList">
									<ul>
										<!-- 리뷰 리스트 목록이 들어갈 위치 -->
									</ul>
								</section>
								<script>
									replyList(); <!--리스트 스크립트문 실행-->
								</script>
							</div>
						</div>
						
					</div>
				</div>
			</div>
			
			<sec:authorize access='isAuthenticated()'>
				<div>

					<h4 class="heading">리뷰 작성</h4>
					
					<div id="commentform">
						<div class="row">
							<div class="form-input" id="reply_form">
								<label for="title">별점<span>*</span></label>
								<select class="review-star" name="star">
									<option value="5">★★★★★</option>
									<option value="4">★★★★☆</option>
									<option value="3">★★★☆☆</option>
									<option value="2">★★☆☆☆</option>
									<option value="1">★☆☆☆☆</option>
								</select>
								<input type="hidden" value="${product.gdsNum}" name="gdsNum" id="gdsNum">
								<input type="hidden" value="repDate" name="repDate" id="repDate">
								
								<input type="hidden" aria-required="true" value="<sec:authentication property="principal.username"/>" name="userId" id="userId" readonly="readonly"><br>
								<label for="comment" class="field-label">내용<span>*</span></label>
								<textarea aria-required="true" name="repCon" id="repCon" rows="4"></textarea><br>
								<button type="submit" id="submit" name="submit">댓글 등록</button>
							</div>
						</div>
					</div>
				</div><!-- end commentform -->
			</sec:authorize>
		</div>
	</div>
</section><!--End Product Details Area-->

<%@ include file="../includes/footer.jsp"%>


<script>
$(document).ready(function() {
	
	//시큐리티 처리
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	$(document).ajaxSend(function(e,xhr,options) {
		xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
	});
	
	
});
</script>