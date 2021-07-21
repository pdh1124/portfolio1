<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core를 쓸 때 태그에 c로 표시  -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt를 쓸 때 태그에 fmt로 표시 fmt : formatter 형식 맞춰서 표시 -->
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<%@ include file="../includes/header.jsp"%>

<sec:authorize access="hasRole('ROLE_ADMIN')"> 
<sec:authentication property="principal.username" var="userid" />

<div class="page-title fix"><!--Start Title-->
	<div class="overlay section">
		<h2>공지사항 게시판</h2>
	</div>
</div><!--End Title-->
<section class="cart-page page fix"><!--Start Cart Area-->
	<div class="container">
		<div class="row">
			<div class="login">
				<form id="login-form" role="form" method="POST" action="/notice/register">
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}">
					<input type="hidden" name="userId" value='<sec:authentication property="principal.username"/>'>
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
											<input type="text" name="noTitle" placeholder="글 제목을 입력해주세요." />
										</td>								
									</tr>
									<tr class="table-info">
										<td class="b_write_left">
											<h5>글 내용</h5>
										</td>
										<td class="b_write_right">
											<textarea rows="10" type="text" name="noContent" id="se2"></textarea>
										</td>
									</tr>				
								</tbody>
							</table>							
							
							<div class="board_bt">
								<button class="board_bt_submit" type="submit">글 작성하기</button>
							</div>
						</div>
					</div>
	
				</form>
			</div>
		</div>
	</div>
</section><!--End Cart Area-->

</sec:authorize>

<%@ include file="../includes/footer.jsp"%>

<script>
$(document).ready(function(e) {
	
	var oEditors = []; 
	$(function(){ 
		nhn.husky.EZCreator.createInIFrame({ 
			oAppRef: oEditors, 
			elPlaceHolder: "se2", 
			//SmartEditor2Skin.html 파일이 존재하는 경로 
			sSkinURI: "/resources/se2/SmartEditor2Skin.html", 
			htParams : { 
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
				bUseToolbar : true, 
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
				bUseVerticalResizer : true, 
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
				bUseModeChanger : true
			}, 
			fOnAppLoad : function(){ 
				//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용 
				oEditors.getById["se2"].exec("PASTE_HTML", [""]); 
			}, 
			fCreator: "createSEditor2" 
		}); 
	}); 
	
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	$(document).ajaxSend(function(e,xhr,options) {
		xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
	});
	
	
	var formObj = $("form[role='form']");
	
	$("button[type='submit']").on("click", function(e) {
		e.preventDefault();
		alert("공지사항 등록 완료");

		oEditors.getById["se2"].exec("UPDATE_CONTENTS_FIELD", []);
		formObj.submit();
	});
	
});
</script>


