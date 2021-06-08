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
				<a href="/board/comm_modify">수정하기</a>
				<a href="/board/comm_list">목록보기</a>
				<a href="/board/comm_register">다음 &gt;</a>
				<a href="/board/comm_register">&lt; 이전</a>
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
									<div class="avatar">
										<img alt="" src="img/blog/comment-1.jpg">	
									</div>
									<div class="comment-box">
										<div class="comment-author">
											<p class="com-name"><strong>Tom Cruze</strong></p>3 day ago  <a href="#" class="repost-link"> Repost </a> <a href="#" class="comment-reply-link"> Reply </a>
										</div>
										<div class="comment-text">
											<p>Lorem ipsum dolor sit amet, consectetur adi ing elit, sed do eiusmo empor incididunt ut labore et dolore magna aliqua magna aliqua Lorem ipsum dolor sit amet, consectetur adi ing elit, sed do eiusmo empor incididunt ut labore et dolore magna aliqua magna aliqua Lorem ipsum dolor sit amet, </p>
										</div>
									</div>
								</div>
								<ul class="children-comment">
									<li class="comment">
										<div class="the-comment">
											<div class="avatar">
												 <img alt="" src="img/blog/comment-2.jpg">
											</div>
											<div class="comment-box">
												<div class="comment-author">
													<p class="com-name"><strong>Nill Pori</strong></p>3 mins ago <a href="#" class="repost-link"> Repost </a> <a href="#" class="comment-reply-link"> Reply </a>
												</div>
												<div class="comment-text">
													<p>Lorem ipsum dolor sit amet, consectetur adi ing elit, sed do eiusmo empor incididunt ut labore et dolore magna aliqua magna aliqua Lorem ipsum dolor sit amet, consectetur adi ing elit, sed do eiusmo empor incididunt ut labore et dolore magna aliqua magna aliqua.<br>
												</p></div>
											</div>
										</div>
									</li><!-- #comment-## -->
								</ul><!-- .children -->
							</li><!-- #comment-## -->
							<li class="sin-comment">
								<div class="the-comment">
									<div class="avatar">
										<img alt="" src="img/blog/comment-3.jpg">
									</div>
									<div class="comment-box">
										<div class="comment-author">
											<p class="com-name"><strong>TOMAS LEE</strong></p>3 day ago  <a href="#" class="repost-link"> Repost </a> <a href="#" class="comment-reply-link"> Reply </a>
										</div>
										<div class="comment-text">
											<p>Lorem ipsum dolor sit amet, consectetur adi ing elit, sed do eiusmo empor incididunt ut labore et dolore magna aliqua magna aliqua Lorem ipsum dolor sit amet, consectetur adi ing elit, sed do eiusmo empor incididunt ut labore et dolore magna aliqua magna aliqua Lorem ipsum dolor sit amet, </p>
										</div>
									</div>
								</div>
							</li><!-- #comment-## -->
						</ol>
					</div>
					<div class="commentform">
						<div class="div_line"></div>
						<h4 class="heading">댓글 작성</h4>
						<form class="comment-form" id="commentform" method="post" action="#">
							<div class="row">
								<div class="col-md-4">
									<div class="form-input">
										<label for="title">제목<span>*</span></label>
										<input type="text" aria-required="true" value="" name="title" id="title">
									</div>
								</div>
							</div>
							<div class="form-input">
								<label for="comment" class="field-label">내용<span>*</span></label>
								<textarea aria-required="true" name="comment" id="comment" rows="4"></textarea>
							</div>
							<p class="form-submit">
								<input type="submit" value="submit" id="submit" name="submit">
							</p>
						</form>
					</div><!-- end commentform -->
				</div>
		</div>
	</div>
</section><!--End Cart Area-->

<%@ include file="../includes/footer.jsp"%>
