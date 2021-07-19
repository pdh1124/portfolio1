<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core를 쓸 때 태그에 c로 표시  -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt를 쓸 때 태그에 fmt로 표시 fmt : formatter 형식 맞춰서 표시 -->
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

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
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}">
					<div class="col-sm-12">
						<div class="table-responsive">
							<table class="table cart-table board_table">
								<thead class="table-title">
									<tr>
										<th colspan="2" class="b_bno">글 작성하기</th>	
									</tr>													
								</thead>
								<tbody>								
									<sec:authorize access="hasRole('ROLE_USER')">
										<input type="hidden" name="notice" value="일반" />
									</sec:authorize>
									<sec:authorize access="hasRole('ROLE_ADMIN')">
									<tr class="table-info">
										<td class="b_write_left">
											<h5>공지사항 등록</h5>
										</td>
										<td class="b_write_right">
											<select class="board_notice" name="notice">
												<option value="일반">일반</option>
												<option value="공지사항">공지사항</option>
											</select>
										</td>
									</tr>											
									</sec:authorize>
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
											<input type="text" name="writer" value='<sec:authentication property="principal.username"/>' readonly="readonly" />
										</td>								
									</tr>
									<tr class="table-info">
										<td class="b_write_left">
											<h5>글 내용</h5>
										</td>
										<td class="b_write_right">
											<textarea rows="10" type="text" name="content"></textarea>
										</td>
									</tr>
									<tr class="table-info">
										<td class="b_write_left">
											<h5>첨부파일</h5>
										</td>
										<td class="b_write_right align-left">
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
		
		var str = "";
		$(".uploadResult ul li").each(function(i, obj) {
			// i:순서 , obj:요소(첨부파일 목록 1개)
			
			var jobj = $(obj);
			console.dir(jobj);
			console.log("-----------------");
			console.log(jobj.data("filename"));
			
			str += "<input type='hidden' name='attachList[" + i + "].fileName' value='" + jobj.data("filename") + "'>";
			str += "<input type='hidden' name='attachList[" + i + "].uuid' value='" + jobj.data("uuid") + "'>";
			str += "<input type='hidden' name='attachList[" + i + "].uploadPath' value='" + jobj.data("path") + "'>";
			str += "<input type='hidden' name='attachList[" + i + "].fileType' value='" + jobj.data("type") + "'>";
		});
		
		formObj.append(str).submit();
	});
	
	
	//첨부파일 등록
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
	
	
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	/*ajax 처리시 csrf 값을 함께 전송하기 위한 준비
	스프링 시큐리티는 데이터 post 전송시 csrf 값을 꼭 확인 하므로*/
	
	
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
			beforeSend : function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			data:formData,
			type:'POST',
			dataType:'json',
			success:function(result) {
				console.log(result);
				showUploadResult(result);
			}
		});
	});
	
	//글쓰기 폼에 첨부파일을 등록 할 경우 목록에 꾸리기
	function showUploadResult(uploadResultArr) {
		if(!uploadResultArr || uploadResultArr.length == 0) {
			return;
		}
		
		var uploadUL = $(".uploadResult ul");
		var str = "";
		
		$(uploadResultArr).each(function(i, obj) {
			
			var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName); 
			var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/"); //역슬러시를 찾아서 슬러시로 변환
			
	
			str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'>";
			str += "<div>";
			str += "<img src='/resources/img/attach.png' width='100px' height='20px'>";
			str += "<span>" + obj.fileName + "</span> ";
			str += "<b data-file='" + fileCallPath + "' data-type='file'> [x]</b>";
			str += "</div>";
			str += "</li>";
		});
		uploadUL.append(str);
	}
	
	//[x]를 클릭했을때 목록에서 지우기
	$(".uploadResult").on("click", "b", function(e) {
		
		console.log("파일 삭제");
		
		var targetFile = $(this).data("file");
		var type = $(this).data("type");
		var targetLi = $(this).closest("li");
		
		$.ajax({
			url: '/deleteFile',
			data: {
				fileName: targetFile,
				type: type
			},
			beforeSend : function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			dataType: 'text',
			type: 'POST',
			success: function(result) {
				alert(result);
				targetLi.remove();
			}
		})
	});
});
</script>


