<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core를 쓸 때 태그에 c로 표시  -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt를 쓸 때 태그에 fmt로 표시 fmt : formatter 형식 맞춰서 표시 -->

<%@ include file="../../includes/header.jsp"%>

<section class="blog-page page fix"><!-- Start Blog Area-->
	<div class="container">
		<div class="row">
			<div class="col-sm-4 col-md-3">
				<div class="single-sidebar">
					<h2>관리자 페이지</h2>
					<ul>
						<li><a href="/admin/main">매출</a></li>
						<li><a href="/admin/goods/register">상품 등록</a></li>
						<li><a href="/admin/goods/list">상품 목록</a></li>
						<li><a href="#">주문 목록</a></li>
						<li><a href="#">환불 목록</a></li>
						<li><a href="#">문의 내역</a></li>
					</ul>
				</div>
			</div>
			<div class="col-sm-8 col-md-9">
				<div class="login">
					<form id="goodsRegister-form" name="goods-register" method="post" action="/admin/goods/modify" enctype="multipart/form-data">
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}">
						<input type="hidden" name="gdsNum" value="${goods.gdsNum} "/>
						<h2>상품 수정</h2>
						<div class="table-responsive">
							<table class="table cart-table board_table">
								<tbody>
									<tr class="table-info">
										<td class="b_write_left">
											<h5>상품명</h5>
										</td>
										<td class="b_write_right">
											<input type="text" id="gdsName" name="gdsName" value="${goods.gdsName }" required />
										</td>								
									</tr>
									<tr class="table-info">
										<td class="b_write_left">
											<h5>상품가격</h5>
										</td>
										<td class="b_write_right">
											<input type="text" id="price" name="price" value="${goods.price }" required />
										</td>								
									</tr>
									<tr class="table-info">
										<td class="b_write_left">
											<h5>상품 수량</h5>
										</td>
										<td class="b_write_right">
											<input type="text" id="stock" name="stock" value="${goods.stock }" required />
										</td>								
									</tr>
									<tr class="table-info">
										<td class="b_write_left">
											<h5>분류</h5>
										</td>
										<td class="b_write_right align-left">
											<select class="goods_cateCode" id="cateCode" name="cateCode" required>
												<option <c:if test="${goods.cateCode eq '요가복' }">selected="selected"</c:if> value="요가복">요가복</option>
												<option <c:if test="${goods.cateCode eq '요가용품' }">selected="selected"</c:if> value="요가용품">요가용품</option>
											</select>
										</td>								
									</tr>
									<tr class="table-info">
										<td class="b_write_left">
											<h5>상품 설명</h5>
										</td>
										<td class="b_write_right">
											<textarea rows="10" type="text" id="gdsDes" name="gdsDes">${goods.gdsDes }</textarea>
										</td>								
									</tr>
									<tr class="table-info">
										<td class="b_write_left">
											<h5>썸네일</h5>
										</td>
										<td class="b_write_right">
											<input type="file" id="gdsImg" name="file">
										</td>								
									</tr>
									<tr class="table-info">
										<td class="b_write_left">
											<h5>이미지</h5>
										</td>
										<td class="b_write_right align-left" id="goods-thumbnail">
											<img src="${goods.gdsImg }" width="300px" height="auto"/>
											<input type="hidden" name="gdsImg" value="${goods.gdsImg }" />
											<input type="hidden" name="thumbImg" value="${goods.thumbImg }" />
										</td>							
									</tr>				
								</tbody>
							</table>							
							
							<div class="goods_modi_bt">
								<button data-oper="list" class="modi-list" type="submit">목록보기</button>
								<button data-oper="modify" class="modi-submit" type="submit">상품 수정</button>
								<button data-oper="remove" class="modi-remove" type="submit">상품 삭제</button>
							</div>
						</div>
	
					</form>
				</div>
			</div>
		</div>
	</div>
</section><!-- Start Blog Area-->

<%@ include file="../../includes/footer.jsp"%>

<script>
$(document).ready(function() {
	
	/*이미지 첨부시 이미지를 화면에 출력*/
	$("#gdsImg").change(function() {
		if(this.files && this.files[0]) {
			var reader = new FileReader;
			
			reader.onload = function(data) {
				$("#goods-thumbnail img").attr("src", data.target.result).width(300);
			}
			
			reader.readAsDataURL(this.files[0]);
		}
	});
	
	
	/*이미지 수정(바꾸기)*/
	
	/*수량과 가격에 한글이나 영어를 못치게 하기(숫자만 입력 가능)*/
	var regExp = /[^0-9]/gi;
	
	$("#price").keyup(function() {
		numCheck($(this));
	});
	
	$("#stock").keyup(function() {
		numCheck($(this));
	});
	
	function numCheck(selector) {
		var tempVal = selector.val();
		selector.val(tempVal.replace(regExp, ""));
	}
	
	
	
	//버튼을 클릭하면 수정 및 삭제 실행
	var formObj = $("#goodsRegister-form");
	
	$(".goods_modi_bt button").on("click", function(e) {
		
		var operation = $(this).data("oper");
		
		//삭제 버튼
		if (operation === 'remove') {
			e.preventDefault();
			alert("삭제되었습니다.");
			formObj.attr("action","/admin/goods/remove");
			formObj.submit();
		}
	
		//리스트 버튼
		else if (operation === 'list') {
			e.preventDefault();
			location.href="/admin/goods/list";
		}
			
	});
	
});
</script>