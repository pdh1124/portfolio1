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
			<div class="board_move_bt fix"> 
				<button data-oper="modify">수정하기</button>
				<button data-oper="list">목록보기</button>
				<c:if test="${board.nextBno ne null}">
					<a href="/board/comm_get?bno=${board.nextBno}">다음 &gt;</a>
				</c:if>
				<c:if test="${board.prevBno ne null}">
					<a href="/board/comm_get?bno=${board.prevBno}">&lt; 이전</a>
				</c:if>
				
				<form id="hidden_form" action="/board/modify" method="get">
					<input type="hidden" id="bno" name="bno" value="${board.bno }" />
					<input type="hidden" name="pageNum" value="${cri.pageNum }" />
					<input type="hidden" name="amount" value="${cri.amount }" />
					<input type="hidden" name="type" value="${pageMaker.cri.type }" />
					<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }" /> 
				</form>
			</div>
			
			
			<div class="single-blog blog-details">
				<div class="content fix">
					<h4><c:out value="${board.bno }" /> 번 게시물</h4>
					<h2><c:out value="${board.title }" /></h2>
					<div class="meta">
						<i class="fa fa-pencil-square-o"></i><c:out value="${board.writer }" /> 
						<i class="fa fa-calendar"></i><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }" /> 
						<i class="fa fa-comments"></i>12 Comments
					</div>
					<div class="div_line"></div>
					<p><c:out value="${board.content }" /></p>
				</div>
			</div>
			
			
			
			
			
			<div id="comments">
				<div class="comments-list">
					<div class="div_line"></div>
					<h4 class="heading">댓글</h4>
					<ol class="commentlists">
						<li class="sin-comment">
							<div class="the-comment">
								<div class="comment-box">
									<div class="comment-author">
										<p class="com-name"><strong></strong></p><span id='comment-modify'>  </span> <a class="comment-reply-link">  </a>
									</div>
									<div class="comment-text">
										<p></p>
									</div>
								</div>
							</div>
						</li><!-- #comment-## -->
					</ol>
				</div>
						
				<div>
					<div class="div_line"></div>
					<h4 class="heading">댓글 작성</h4>
					<div id="commentform">
						<div class="row">
							<div class="form-input" id="reply_form">
								<label for="title">작성자<span>*</span></label>
								<input type="hidden" value="${board.bno}" name="bno" id="bno">
								<input type="hidden" value="replyDate" name="replyDate" id="replyDate">
								
								<input type="text" aria-required="true" value="replyer" name="replyer" id="replyer"><br>
								<label for="comment" class="field-label">내용<span>*</span></label>
								<textarea aria-required="true" name="reply" id="reply" rows="4"></textarea><br>
								<button type="submit" id="submit" name="submit">댓글 등록</button>
							</div>
						</div>
					</div>
				</div><!-- end commentform -->
			</div>
		</div>
	</div>
</section><!--End Cart Area-->

<%@ include file="../includes/footer.jsp"%>

<script type="text/javascript" src="/resources/js/comm_reply.js"></script>

<script>
$(document).ready(function() {
	
	//목록보기,수정,이전글,다음글 버튼
	var operForm = $(".board_move_bt form");
	
	$(".board_move_bt button").on("click", function(e) {
		var operation = $(this).data("oper");
		
		if (operation === 'list') {
			e.preventDefault();
			operForm.attr("action","/board/comm_list").attr("method","get");
			
		}
		else if (operation === 'modify') {
			e.preventDefault();
			operForm.attr("action","/board/comm_modify").submit();
		}
	
		operForm.submit();
	});
	
		
	//post처리 시 csrf 값을 함께 전송하기 위해 ajaxsend시 같이 넘김
	/*
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	$(document).ajaxSend(function(e,xhr,options) {
		xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
	});
	*/
	
	//댓글
	var bnoValue = '<c:out value="${board.bno}"/>'; //bno 게시물 번호
	
	var reply_form = $("#reply_form"); //쓰기폼
	var reply_replyDate = reply_form.find("input[name='replyDate']"); //댓글 작성일 항목.
	var comm_reply = reply_form.find("textarea[name='reply']");//댓글 내용
	var comm_replyer = reply_form.find("input[name='replyer']");//댓글 작성자
	var comm_submit = reply_form.find("button[name='submit']"); //쓰기버튼
	
	/*
	replyService.add({
		reply : "생성 테스트",
		replyer : "테스터",
		bno : bnoValue
	}, function(result) {
		alert("result: " + result);
	});
	*/
	
	//댓글 - 등록 버튼 클릭 
	comm_submit.on("click", function(e) {
		
		var reply = {
				reply : comm_reply.val(),
				replyer : comm_replyer.val(),
				bno : bnoValue
		};
		console.log(reply);
		
		replyService.add(reply, function(result) {
			alert(result + "! 댓글 작성이 완료되었습니다.");
			comm_reply.val("");
			showList(-1);
		});
	});
	
	
	//콘솔에다가 리스트를 출력하는 것
	/*replyService.getList(
		{
			bno: bnoValue,
			page: 1
		}, 
		function(list) {
			for(var i = 0, len = list.length || 0; i < len; i++) {
				console.log(list[i]);
			}	
		}
	);*/
	

	//댓글 리스트
	var replyUL = $(".commentlists");
	
	function showList(page) {
		replyService.getList({
			bno : bnoValue,
			page: page || 1
		},
		function(list) {
			var str = "";
			if(list == null || list.length == 0) {
				replyUL.html("");
				return;
			}
			for(var i = 0, len = list.length || 0; i < len; i++) {
				str += "<li class='sin-comment'>";
				str += "<div class='the-comment'>";
				str += "<div class='comment-box'>";
				str += "<div class='comment-author' data-rno='" + list[i].rno + "'>";
				str += "<p class='com-name'><strong>" + list[i].replyer + "</strong></p>";
				str += replyService.displayTime(list[i].replyDate);
				str += "<a class='comment-modify'> 수정 </a>";
				str += "<a class='comment-reply-link'> 삭제 </a>";
				str += "</div>";
				str += "<div class='comment-text'>";
				str += "<p>" + list[i].reply + "</p>";
				str += "</div>";
				str += "</div>";
				str += "</div>";
				str += "</li>";
			}
			replyUL.html(str);
		});
	}
	showList(1);
	
	
	
	//댓글 수정
	$(".comment-modify").on("click", function(e) {
		console.log("hi");
	});

});
</script>




