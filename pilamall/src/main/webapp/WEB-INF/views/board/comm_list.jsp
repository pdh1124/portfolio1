<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core를 쓸 때 태그에 c로 표시  -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt를 쓸 때 태그에 fmt로 표시 fmt : formatter 형식 맞춰서 표시 -->

<%@ include file="../includes/header.jsp"%>

<div class="page-title fix"><!--Start Title-->
	<div class="overlay section">
		<h2>커뮤니티 게시판</h2>
	</div>
</div><!--End Title-->
<section class="cart-page page fix"><!--Start Cart Area-->
	<div class="container">
		<div class="row">

			<div class="proceed fix" style="margin:16px;"> 
				<a id="procedto" href="/board/comm_register">글 작성하기</a>
			</div>
			<div class="col-sm-12">
				<div class="table-responsive">
					<table class="table cart-table board_table">
						<thead class="table-title">
							<tr>
								<th class="b_bno">글번호</th>
								<th class="b_title">제목</th>
								<th class="b_writer">작성자</th>
								<th class="b_regdate">작성일</th>
								<th class="b_views">조회수</th>
								<th class="b_re_up">추천</th>
								<th class="b_re_down">반대</th>
							</tr>													
						</thead>
						<tbody>
							<c:forEach var="board" items="${list }">
								<tr class="table-info">
									<td class="b_bno">
										<h5><c:out value="${board.bno }" /></h5>
									</td>
									<td class="b_title">
										<h5><a href="/board/comm_get?bno=${board.bno }"><c:out value="${board.title }" /></a><span style="color:red"></span></h5>
									</td>
									<td class="b_writer">
										<h5><c:out value="${board.writer }" /></h5>
									</td>
									<td class="b_regdate">
										<h5><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }" /></h5>
									</td>
									<td class="b_views">
										<h5>3</h5>
									</td>
									<td class="b_re_up">
										<h5>1</h5>
									</td>
									<td class="b_re_down">
										<h5>1</h5>
									</td>
								</tr>
							</c:forEach>					
						</tbody>
					</table>
				</div>
			</div>
			<!-- Pagination -->
			<div class="pagination">
				<ul style="margin-top: 50px;">
					<li><a href="#"><i class="fa fa-angle-left"></i></a></li>
					<li class="active"><span>1</span></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">6</a></li>
					<li><a href="#">7</a></li>
					<li><a href="#">8</a></li>
					<li><a href="#">9</a></li>
					<li><a href="#"><i class="fa fa-angle-right"></i></a></li>
				</ul>
			</div>	
		</div>
	</div>
</section><!--End Cart Area-->

<%@ include file="../includes/footer.jsp"%>
