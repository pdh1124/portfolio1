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
								<th class="b_re_up">좋아요</th>
							</tr>													
						</thead>
						<tbody>
							<c:forEach var="board" items="${list }">
								<c:if test="${board.notice == '공지사항'}">
									<tr class="table-info board_list_notice">
										<td class="b_bno">
											<h5>공지</h5>
										</td>
										<td class="b_title align-left">
											<h5><a href="${board.bno }" class="move"><c:out value="${board.title }" />
												<c:if test="${board.replyCnt ne 0 }">
													<span style="color:red"><c:out value="[${board.replyCnt }]"/></span>
												</c:if>
											</a></h5>
										</td>
										<td class="b_writer align-left">
											<h5>필라몰 관리자</h5>
										</td>
										<td class="b_regdate">
											<h5><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }" /></h5>
										</td>
										<td class="b_views">
											<h5><c:out value="${board.views }"/></h5>
										</td>
										<td class="b_re_up">
											<h5><c:out value="${board.likeCnt }"/></h5>
										</td>
									</tr>
								</c:if>
							</c:forEach>
							<c:forEach var="board" items="${list }">
								<c:if test="${board.notice == '일반'}">
								<tr class="table-info">
									<td class="b_bno">
										<h5><c:out value="${board.bno }" /></h5>
									</td>
									<!--td class="b_title">
										<h5><a href="/board/comm_get?bno=${board.bno }"><c:out value="${board.title }" /><span style="color:red"></span></a></h5>
									</td-->
									<td class="b_title align-left">
										<h5><a href="${board.bno }" class="move"><c:out value="${board.title }" />
											<c:if test="${board.replyCnt ne 0 }">
												<span style="color:red"><c:out value="[${board.replyCnt }]"/></span>
											</c:if>
										</a></h5>
									</td>
									<td class="b_writer align-left">
										<h5><c:out value="${board.writer }" /></h5>
									</td>
									<td class="b_regdate">
										<h5><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }" /></h5>
									</td>
									<td class="b_views">
										<h5><c:out value="${board.views }"/></h5>
									</td>
									<td class="b_re_up">
										<h5><c:out value="${board.likeCnt }"/></h5>
									</td>
								</tr>
								</c:if>
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
						<li class='pageMove ${pageMaker.cri.pageNum == num?"active":"" }'><a href="${num}"><span>${num }</span></a></li>
					</c:forEach>
					<c:if test="${pageMaker.next }">
						<li class="pageMove"><a href="${pageMaker.endPage+1 }"><i class="fa fa-angle-right"></i></a></li>
					</c:if>
				</ul>
			</div>
			<div class="col-sm-4 col-lg-6">
				<form id="board_searchForm" action="/board/comm_list" method="get">
					<select class="board_type" name="type">
						<option value="" ${pageMaker.cri.type==null?"selected":"" }>-</option>
						<option value="T" ${pageMaker.cri.type eq "T"?"selected":"" }>제목</option>
						<option value="C" ${pageMaker.cri.type eq "C"?"selected":"" }>내용</option>
						<option value="W" ${pageMaker.cri.type eq "W"?"selected":"" }>작성자</option>
						<option value="TC" ${pageMaker.cri.type eq "TC"?"selected":"" }>제목+내용</option>
						<option value="TW" ${pageMaker.cri.type eq "TW"?"selected":"" }>제목+작성자</option>
						<option value="WC" ${pageMaker.cri.type eq "WC"?"selected":"" }>내용+작성자</option>
						<option value="TWC" ${pageMaker.cri.type eq "TWC"?"selected":"" }>제목+내용+작성자</option>		
					</select>
					<div class="board_search">
						<input type="text" name="keyword" value="${pageMaker.cri.keyword }" placeholder="검색어를 입력해주세요." />
						<button type="submit" class="submit"><i class="fa fa-search"></i></button>
					</div>
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }" />
					<input type="hidden" name="amount" value="${pageMaker.cri.amount }" />
				</form>
			</div>
			
		
			<form id="actionForm" action="/board/comm_list" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }" />
				<input type="hidden" name="amount" value="${pageMaker.cri.amount }" />
				<input type="hidden" name="type" value="${pageMaker.cri.type }" />
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }" />
			</form>				
		</div>
	</div>
</section><!--End Cart Area-->

<%@ include file="../includes/footer.jsp"%>

<script>
$(document).ready(function() {
	
	//페이징 버튼과 상세페이지 이동-------------------- 시작
	var actionForm = $("#actionForm");
	
	//페이징 숫자 및 <, >를 클릭하면 넘어가는 메소드
	$(".pageMove a").on("click", function(e) {
		e.preventDefault();
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
	//제목 클릭시 넘어가는 메소드
	$(".move").on("click", function(e) {
		e.preventDefault();
		actionForm.append("<input type='hidden' name='bno' value='" + $(this).attr("href") + "'>");
		actionForm.attr("action","/board/comm_get");
		actionForm.submit();
	});
	//페이징 버튼과 상세페이지 이동-------------------- 끝
	
	
	//검색버튼 -----------------시작
	var board_searchForm = $("#board_searchForm");
	
	$("#board_searchForm button").on("click", function(e) {
		
		//옵션이 빈값이면 검색종류를 선택하라고 띄움.
		if(!board_searchForm.find("option:selected").val()) {
			alert("검색 종류를 선택해 주세요.");
			return false;
		}
		//키워드가 빈값이면 키워드를 입력하라고 띄움.
		if(!board_searchForm.find("input[name='keyword']").val()) {
			alert("검색어를 입력해 주세요.");
			return false;
		}
		
		//검색한 후에는 1페이지로 이동해라.
		board_searchForm.find("input[name='pageNum']").val(1);
		e.preventDefault();
		board_searchForm.submit();
	});
	//검색버튼 -----------------끝
	
});
</script>