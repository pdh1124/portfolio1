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
			<div class="login">
				<form id="login-form operForm" role="form" method="POST" action="/board/comm_modify">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					<input type="hidden" name="bno" value="${board.bno }">
					<input type="hidden" name="pageNum" value="${cri.pageNum }" />
					<input type="hidden" name="amount" value="${cri.amount }" />
					<input type="hidden" name="type" value="${pageMaker.cri.type }" />
					<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }" /> 
					<div class="col-sm-12">
						<div class="table-responsive">
							<table class="table cart-table board_table">
								<thead class="table-title">
									<tr>
										<th colspan="2" class="b_bno">글 작성하기</th>	
									</tr>													
								</thead>
								<tbody>
									<tr class="table-info">
										<td class="b_write_left">
											<h5>글제목</h5>
										</td>
										<td class="b_write_right">
											<input type="text" name="title" value='<c:out value="${board.title }" />' />
										</td>								
									</tr>
									<tr class="table-info">
										<td class="b_write_left">
											<h5>작성자</h5>
										</td>
										<td class="b_write_right">
											<input type="text" name="writer" readonly="readonly" value='<c:out value="${board.writer }" />' />
										</td>								
									</tr>
									<tr class="table-info">
										<td class="b_write_left">
											<h5>글 내용</h5>
										</td>
										<td class="b_write_right">
											<textarea rows="10" type="text" name="content"><c:out value="${board.content }" /></textarea>
										</td>								
									</tr>					
								</tbody>
							</table>
							<div class="board_bt">
								<button data-oper="list" class="board_bt_list">목록보기</button>
								<button data-oper="remove" class="board_bt_remove" type="submit">삭제하기</button>
								<button data-oper="modify" class="board_bt_submit" type="submit">수정하기</button>
							</div>
						</div>
					</div>
	
				</form>
			</div>
		</div>
	</div>
</section><!--End Cart Area-->


<%@ include file="../includes/footer.jsp"%>

<script>
$(document).ready(function() {
	
	var operForm = $("form");
	
	//각각 버튼에 대한 실행 
	$(".board_bt button").on("click", function(e) {
		
		var operation = $(this).data("oper");
		
		//리스트 버튼
		if (operation === 'list') {
			e.preventDefault();
			operForm.attr("action","/board/comm_list").attr("method","get");
			
			var pageNumTag = $("input[name='pageNum']");
			var amountTag = $("input[name='amount']");
			var keywordTag = $("input[name='keyword']");
			var typeTag = $("input[name='type']");
			
			operForm.empty(); //내용 비우기
			operForm.append(pageNumTag);
			operForm.append(amountTag);
			operForm.append(keywordTag);
			operForm.append(typeTag);
		}
		//삭제 버튼
		else if (operation === 'remove') {
			e.preventDefault();
			operForm.attr("action","/board/comm_remove");
		}
		
		//수정버튼
		else if (operation === 'modify') {
			
		}
		
		operForm.submit();
	});
});
</script>
