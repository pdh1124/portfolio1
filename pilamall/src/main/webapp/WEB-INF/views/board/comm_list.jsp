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
									<!--td class="b_title">
										<h5><a href="/board/comm_get?bno=${board.bno }"><c:out value="${board.title }" /><span style="color:red"></span></a></h5>
									</td-->
									<td class="b_title">
										<h5><a href="${board.bno }" class="move"><c:out value="${board.title }" /><span style="color:red"></span></a></h5>
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
					<c:if test="${pageMaker.prev }">
						<li class="pageMove"><a href="${pageMaker.startPage-1 }"><i class="fa fa-angle-left"></i></a></li>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
						<li class='pageMove ${pageMaker.cri.pageNum == num?"active":"" }'><a href="${num} "><span>${num }</span></a></li>
					</c:forEach>
					<c:if test="${pageMaker.next }">
						<li class="pageMove"><a href="${pageMaker.endPage-1 }"><i class="fa fa-angle-right"></i></a></li>
					</c:if>
				</ul>
			</div>
		
			<form id="actionForm" action="/board/comm_list" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }" />
				<input type="hidden" name="amount" value="${pageMaker.cri.amount }" />
			</form>				
		</div>
	</div>
</section><!--End Cart Area-->

<%@ include file="../includes/footer.jsp"%>

<script>
$(document).ready(function() {
	
	var actionForm = $("#actionForm");
	
	//페이징 숫자 및 <, >를 클릭하면 넘어가는 메소드
	$(".pageMove a").on("click", function(e) {
		e.preventDefault();
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
	//제목 클릭시 넘어가는 메소드
	$(".move").on("click", function(e) {
		console.log("클릭함2");
		e.preventDefault();
		actionForm.append("<input type='hidden' name='bno' value='" + $(this).attr("href") + "'>");
		actionForm.attr("action","/board/comm_get");
		actionForm.submit();
	});
});
</script>