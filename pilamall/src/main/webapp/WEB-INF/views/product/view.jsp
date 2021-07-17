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
			 //console.log(data);
		
			 var star = this.star;
			 
			 //리뷰 리스트 만들기
			 str += "<li class='reply_List' data-repnum='" + this.repNum + "'>";
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
			 str += "<div id='review_con_" + this.repNum + "' class='replyContent'>" + this.repCon + "</div><br />";
			 //str += "<div class='replyContent'>" + this.userName + "</div><br />";
			 //str += "<div class='replyContent'>" + this.repNum + "</div><br />";
			 str += "<input type='hidden' class='reviewId' value=" + this.userId + ">";
			 str += "<div class='review_bt'>";
			 str += "<b class='review_modify' id='review_modify_" + this.repNum + "' data-repnum='" + this.repNum + "' data-id='" + this.userId + "'>수정/삭제</b>";
			 str += "</div>";
			 str += "<div class='div_line'></div>";
			 str += "</li>";
		});
		
		// 조립한 HTML코드를 추가
		$("section.replyList ul").html(str);
		
	});
}

</script>

<div id="modal">
	<div class="modal_content">
    	<input type="hidden" id="modalRepNum" name="repNum">
    	<input type="hidden" id="modalUserId" name="userId"> 
        <h2>리뷰 수정</h2>   
       	<br>
       	

       	<label for="title">별점</label><br>
		<select class="review-star" name="star" id="star">
			<option value="5">★★★★★</option>
			<option value="4">★★★★☆</option>
			<option value="3">★★★☆☆</option>
			<option value="2">★★☆☆☆</option>
			<option value="1">★☆☆☆☆</option>
		</select>

		<br><br>					
        <p class="cont">    
			<label>댓글</label>
			<div class="form-group">
				<textarea class="modal_repCon" id="reply_modal" name="modal_repCon"></textarea>
			</div>
        </p>
        <br>
        
		<button type="button" class="modal_modify_btn">수정</button>
	    <button type='button' class='delete'>삭제</button>	         
		<button type="button" class="modal_close_btn" >취소</button>
        
    </div>
    <div class="modal_layer"></div>
</div>

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
				</div>
			</div>
			<div class="col-sm-6">
				<div class="shop-details">
					<!-- Product Name -->
					<input type="hidden" value="${product.gdsNum }" name="gdsNum" id="gdsNum">
					<h2>${product.gdsName }</h2>
					<h3 style="font-size:24px; font-weight:bold;">${product.price } 원</h3>
					<p>${product.gdsDes }</p>
					<div class="cartSotck">
						<span>구매 수량 : </span>
						<input name="stock" id="stock" type="number" value="1" min="1" max="${product.stock}"/>
					</div>
					<div class="action-btn">
						<b class="addToCart"><i class="fa fa-shopping-cart"></i> 장바구니 </b>
						<b class="addToBuy"><i class="fa fa-refresh"></i> 바로구매 </b>
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
						<div class="row review_form">
							<form class="form-input" id="reply_form" role="form" method="post" autocomplete="off">
								<input type="hidden" value="${product.gdsNum}" name="gdsNum" id="gdsNum">
								<input type="hidden" value="${userId}" name="userId" id="userId">
								
								<label for="title">별점<span>*</span></label>
								<select class="review-star" name="star" id="star">
									<option value="5">★★★★★</option>
									<option value="4">★★★★☆</option>
									<option value="3">★★★☆☆</option>
									<option value="2">★★☆☆☆</option>
									<option value="1">★☆☆☆☆</option>
								</select>
								<br><br>
								<label for="comment" class="field-label">내용<span>*</span></label>
								<textarea aria-required="true" name="repCon" id="repCon" rows="4"></textarea>
								<button type="button" id="review_submit">댓글 등록</button>
							</form>
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
	
	
	//리뷰 등록
	$("#review_submit").on("click", function(e) {
		
		var reviewId = $(".reviewId");
		var userId = $("#userId").val();
		
		//이미 등록한 리뷰가 있는지 확인
		if(reviewId.val() == userId) {
			e.preventDefault();
			alert("이미 리뷰를 등록하셨습니다.");
			return;
		}
		
		e.preventDefault();
		
		var formObj = $("#review_form form[role='form']");
		var gdsNum = $("#gdsNum").val();
		var repCon = $("#repCon").val();
		var star = $("#star").val();
			
		var data = {
			gdsNum : gdsNum,
			userId : userId,
			repCon : repCon,
			star : star
		}
		
		$.ajax({
			url: "/product/view/registReply",
			type: "post",
			data: data,
			success: function() {
				replyList(); //리스트 새로고침
				$("#repCon").val("");
			}
		});
	});
	
	
	//리뷰 수정/삭제 및 모달창 띄우기
	$(document).on("click", ".review_modify", function() {
		
		var repNum = $(this).data("repnum");
		var reviewId = $(this).data("id");
		var userId = $("#userId").val();
		
		//console.log(repNum);
		//console.log(reviewId);
		//console.log(userId);
		
		//로그인이 되어 있지 않는지 확인
		if(!userId) {
			alert("리뷰를 수정하시려면 로그인을 하셔야 합니다.");
			return;
		}
		
		//이미 등록한 리뷰가 있는지 확인
		if(reviewId != userId) {
			alert("리뷰를 등록한 이용자만 수정할 수 있습니다.");
			return;
		}
		
		$("#modal").css("display", "block");
		$('html').scrollTop(0);
		
		var content = $("#review_con_" + repNum).text();
		
		console.log(repNum);
		console.log(content);
		
		$("#modalRepNum").val(repNum);
		$("#modalUserId").val(userId);
		$(".modal_repCon").val(content);
		
	});
	
	
	//모달창 수정
	$(".modal_modify_btn").on("click", function() {
		
		var modifyConfirm = confirm("정말 수정하시겠습니까?");
		var repNum = $("#modalRepNum").val();
		var repCon = $("#reply_modal").val();
		var star = $("#star").val();
		
		console.log("repNum : " + repNum);
		console.log(star);
		console.log(repCon);
		
		if(modifyConfirm) {
			var data = {
				repNum : repNum,
				repCon : repCon,
				star : star
			};
			
			$.ajax({
				url: "/product/view/modifyReply",
				type: "post",
				data: data,
				success: function(result) {
					console.log("result : " + result);
					if(result == 1) {
						replyList();
						$("#modal").css("display", "none");
					} else {
						replyList();
						$("#modal").css("display", "none");
					}
				},
				error : function() {
					alert("로그인하셔야 합니다.");
				}
			});
		}
	});
	
	//모달창 삭제
	$(".delete").on("click", function() {
		
		var removeConfirm = confirm("정말 삭제하시겠습니까?");
		var repNum = $("#modalRepNum").val();
		
		console.log(repNum);
		
		if(removeConfirm) {
			
			var data = {
				repNum : repNum
			}
			
			$.ajax({
				url: "/product/view/deleteReply",
				type: "post",
				data: data,
				success: function(result) {
					if(result == 1) {
						replyList();
					} else if (result != 1) {
						replyList();
					} 
				},
				error: function() {
					alert("로그인하셔야합니다.");
				}
			});
			$("#modal").css("display", "none");
		}
	});
	
	
	//수정창 닫기
	$(".modal_close_btn").on("click", function() {
		$("#modal").css("display", "none");
	});
	
	
	//재고량을 넘을 시 최대 재고량으로 리턴
	$("#stock").change(function(e) {
		
		e.preventDefault();
		
		var max = $(this).attr("max");
		var now = $(this).val();
		
		var maxVal = parseInt(max);
		var nowVal = parseInt(now);
		
		if(maxVal < nowVal) {
			nowVal = maxVal;
		}
		
		return $(this).val(nowVal);
	});
	
	//장바구니 담기
	$(".addToCart").on("click", function() {
		var gdsNum = $("#gdsNum").val();
		var stock = $("#stock").val();
		
		console.log(gdsNum);
		console.log(stock);
		
		$.ajax({
			url: "/cart/addToCart",
			type: "post",
			data: {
				gdsNum: gdsNum,
				stock: stock
			},
			success: function() {
				alert("상품을 장바구니에 추가했습니다.");
				$("#stock").val("1");
			},
			error: function() {
				alert("카드에 담질 못했습니다.");
			}
		});
	});
	
	//장바구니 담기 후 바로 구매
	$(".addToBuy").on("click", function() {
		var gdsNum = $("#gdsNum").val();
		var stock = $("#stock").val();
		
		console.log(gdsNum);
		console.log(stock);
		
		$.ajax({
			url: "/cart/addToCart",
			type: "post",
			data: {
				gdsNum: gdsNum,
				stock: stock
			},
			success: function() {
				location.href = '/cart/list';
			},
			error: function() {
				alert("카드에 담질 못했습니다.");
			}
		});
		
		
	});
});
</script>