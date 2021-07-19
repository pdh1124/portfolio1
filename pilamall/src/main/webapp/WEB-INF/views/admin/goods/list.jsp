<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core를 쓸 때 태그에 c로 표시  -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt를 쓸 때 태그에 fmt로 표시 fmt : formatter 형식 맞춰서 표시 -->

<%@ include file="../../includes/header.jsp"%>

<sec:authorize access="hasRole('ROLE_ADMIN')"> 
<sec:authentication property="principal.username" var="userid" />

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
						<li><a href="/admin/order/list">주문 목록</a></li>
						<li><a href="/admin/order/refundList">환불 목록</a></li>
						<li><a href="/admin/inquiry/list">문의 내역</a></li>
					</ul>
				</div>
			</div>
			<div class="col-sm-8 col-md-9">
				<table class="table cart-table goods-table">
					<thead class="table-title">
						<tr>
							<th class="g-num">상품번호</th>
							<th class="g-img">이미지</th>
							<th class="g-name">제품명</th>
							<th class="g-category">카테고리</th>
							<th class="g-price">가격</th>
							<th class="g-stock">수량</th>
							<th class="g-regdate">등록날짜</th>
						</tr>													
					</thead>
					<tbody>
						<c:forEach items="${list }" var="list">
							<tr class="table-info">
								<td class="g-num">${list.gdsNum }</td>
								<td class="g-img"><img src="${list.thumbImg }" width="100px" height="100px"></td>
								<td class="g-name"><a href="/admin/goods/modify?gdsNum=${list.gdsNum }">${list.gdsName }</a></td>
								<td class="g-category">${list.cateCode }</td>
								<td class="g-price"><fmt:formatNumber value="${list.price }" pattern="###,###,###" /> 원</td>
								<td class="g-stock">${list.stock } 개</td>
								<td class="g-regdate"><fmt:formatDate value="${list.regDate }" pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>	
			</div>
		</div>
	</div>
</section><!-- Start Blog Area-->

</sec:authorize>

<%@ include file="../../includes/footer.jsp"%>

