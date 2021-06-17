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
				<form id="login-form" role="form" method="POST" action="/board/comm_register">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
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
											<input type="text" name="title" placeholder="글 제목을 입력해주세요." />
										</td>								
									</tr>
									<tr class="table-info">
										<td class="b_write_left">
											<h5>작성자</h5>
										</td>
										<td class="b_write_right">
											<input type="text" name="writer" placeholder="작성자명" />
										</td>								
									</tr>
									<tr class="table-info">
										<td class="b_write_left">
											<h5>글 내용</h5>
										</td>
										<td class="b_write_right">
											<textarea rows="10" type="text" name="content" placeholder="글 내용을 입력해주세요."></textarea>
										</td>								
									</tr>
									<tr class="table-info">
										<td class="b_write_left">
											<h5>첨부파일</h5>
										</td>
										<td class="b_write_right">
											<input type="file" name="uploadFile" multiple>
											<div class="uploadResult">
												<ul>
												</ul>
											</div>
										</td>								
									</tr>				
								</tbody>
							</table>							
							
							<div class="board_bt">
								<button class="board_bt_reset" type="reset">다시쓰기</button>
								<button class="board_bt_submit" type="submit">글 작성하기</button>
							</div>
							
							<form action="/board/comm_modify" method="get">
								<input type="hidden" id="bno" name="bno" value="${board.bno }" />
							</form>
						</div>
					</div>
	
				</form>
			</div>
		</div>
	</div>
</section><!--End Cart Area-->

<%@ include file="../includes/footer.jsp"%>

<script>
$(document).ready(function(e) {
	
	var formObj = $("form[role='form']");
	
	$("button[type='submit']").on("click", function(e) {
		e.preventDefault();
		console.log("submit clicked");
	});
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$"); //해당 확장자 업로드 제한
	var maxSize = 5242880; // 5MB
	
	//용량 크기와 확장자 체크
	function checkExtension(fileName, fileSize) {
		
		if(fileSize >= maxSize) {
			alert("파일 크기 초과");
			return false;
		}
		if(regex.test(fileName)) {
			alert("해당 종류의 파일은 업로드 불가");
			return false;
		}
		return true;
	}
	
	//첨부파일을 올리면 표시,전달하는 ajax
	$("input[type='file']").change(function(e) {
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files; //등록한 첨부파일의 정보를 배열형태로 전달(여러개의 첨부파일)
		
		for(var i=0; i<files.length;i++) {
			if(!checkExtension(files[i].name, files[i].size)) {
				return false;
			}
			formData.append("uploadFile",files[i]);
		}
		//ajax로 넘기는 명령
		$.ajax({
			url: '/uploadAjaxAction',
			processData:false,
			contentType:false,
			data:formData,
			type:'POST',
			success:function(result) {
				console.log(result);
				showUploadResult(result);
			}
		});
	});
	
	//글쓰기 폼에 첨부파일을 등록 할 경우 목록에 꾸리기
	function showUploadResult(uploadResultArr) {
		if(!uploadResultArr || uploadResultArr.ength == 0) {
			return;
		}
		
		var uploadUL = $(".uploadResult ul");
		var str = "";
		
		$(uploadResultArr).each(function(i, obj) {
			
			var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
			var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
		});
	}
});
</script>
