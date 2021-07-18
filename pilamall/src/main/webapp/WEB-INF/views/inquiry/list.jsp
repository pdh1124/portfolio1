<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core를 쓸 때 태그에 c로 표시  -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt를 쓸 때 태그에 fmt로 표시 fmt : formatter 형식 맞춰서 표시 -->

<%@ include file="../includes/header.jsp"%>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<section class="blog-page page fix"><!-- Start Blog Area-->
	<div class="container">
		<div class="row">
			<div class="col-sm-4 col-md-3">
				<div class="single-sidebar">
					<h2>마이 페이지</h2>
					<ul>
						<li><a href="/member/mypage">회원정보 수정</a></li>
						<li><a href="/cart/list">장바구니</a></li>
						<li><a href="/order/list">구매내역</a></li>
						<li><a href="/order/refundList">환불내역</a></li>
						<li><a href="/inquiry/list">내 문의 내역</a></li>
					</ul>
				</div>
			</div>
			
			
			<div class="col-sm-8 col-md-9">
				<div class="login">
					<h2>내 문의 내역<a id="inq_register" href="/inquiry/register">1:1 문의하기</a></h2>
					
					<table class="table cart-table goods-table">
						<thead class="table-title">
							<tr>
								<th class="o-name">제목</th>
								<th class="o-addr">작성일</th>
								<th class="o-total">상태</th>
								<th class="o-stats">답변일</th>
							</tr>													
						</thead>
						<tbody>
							<c:forEach items="${inquiry}" var="inquiry">
								<tr class="table-info">
									<td class="o-name" style="text-align:left;"><strong><a href="/inquiry/view?inqNum=${inquiry.inqNum }">${inquiry.inqTitle }</a></strong></td>
									<td class="o-addr"><fmt:formatDate value="${inquiry.regDate }" pattern="yyyy-MM-dd" /></td>
									<td class="o-total">
										<c:if test="${inquiry.inqState == '답변대기' }">
											<strong style="color:#f10000;">${inquiry.inqState}</strong>
										</c:if>
										<c:if test="${inquiry.inqState == '답변완료' }">
											<strong style="color:#0000f1;">${inquiry.inqState}</strong>
										</c:if>
									</td>
									<td class="o-stats">
										<c:if test="${inquiry.inqState == '답변대기' }">
											-
										</c:if>
										<c:if test="${inquiry.inqState == '답변완료' }">
											<fmt:formatDate value="${inquiry.inqDate }" pattern="yyyy-MM-dd" />
										</c:if>
									</td>
								</tr>		
							</c:forEach>
						</tbody>
					</table>
				</div>		
			</div>
			
		</div>
	</div>
</section><!-- Start Blog Area-->

<%@ include file="../includes/footer.jsp"%>