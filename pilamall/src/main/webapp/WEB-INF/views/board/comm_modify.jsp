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
												<option value="일반" ${board.notice == "일반"?"selected":"" }>일반</option>
												<option value="공지사항" ${board.notice == "공지사항"?"selected":"" }>공지사항</option>
											</select>
										</td>
									</tr>											
									</sec:authorize>
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
								<button data-oper="list" class="board_bt_list">목록보기</button>
								<sec:authentication property="principal" var="pinfo" />
								<sec:authorize access="isAuthenticated()">
									<c:if test="${pinfo.username eq board.writer }">
										<button data-oper="remove" class="board_bt_remove" type="submit">삭제하기</button>
										<button data-oper="modify" class="board_bt_submit" type="submit">수정하기</button>
									</c:if>
								</sec:authorize>
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
	
	
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	$(document).ajaxSend(function(e,xhr,options) {
		xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
	});
	var formObj = $("form");
	
	//각각 버튼에 대한 실행 
	$(".board_bt button").on("click", function(e) {
		
		var operation = $(this).data("oper");
		
		//삭제 버튼
		if (operation === 'remove') {
			e.preventDefault();
			formObj.attr("action","/board/comm_remove");
		}
		
		//리스트 버튼
		else if (operation === 'list') {
			e.preventDefault();
			formObj.attr("action","/board/comm_list").attr("method","get");
			
			var pageNumTag = $("input[name='pageNum']");
			var amountTag = $("input[name='amount']");
			var keywordTag = $("input[name='keyword']");
			var typeTag = $("input[name='type']");
			
			formObj.empty(); //내용 비우기
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			formObj.append(keywordTag);
			formObj.append(typeTag);
		}
		
		//수정버튼
		else if (operation === 'modify') {
			var str ="";
			$(".uploadResult ul li").each(function(i,obj) {
				var jobj = $(obj);
				console.dir(jobj);
				console.log("-------------");
				console.log(jobj.data("filename"));
				
				str += "<input type='hidden' name='attachList[" + i + "].fileName' value='" + jobj.data("filename") + "'>";
				str += "<input type='hidden' name='attachList[" + i + "].uuid' value='" + jobj.data("uuid") + "'>";
				str += "<input type='hidden' name='attachList[" + i + "].uploadPath' value='" + jobj.data("path") + "'>";
				str += "<input type='hidden' name='attachList[" + i + "].fileType' value='" + jobj.data("type") + "'>";
			});
			formObj.append(str);
		}
		
		formObj.submit();
	});
	
	
	//첨부파일 목록 표시(get.jsp에 [x]추가)
	(function() {
		var bno = '<c:out value="${board.bno}" />';
		
		$.getJSON("/board/getAttachList",{bno:bno}, function(arr) {
		
			console.log(arr);
			var str ="";
			
			$(arr).each(function(i,attach){
				
				var fileCallPath = encodeURIComponent(attach.uploadPath + "/" + attach.uuid + "_" + attach.fileName); 
				
				str += "<li data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName + "' data-type='" + attach.fileType + "'>";
				str += "<div>";
				str += "<img src='/resources/img/attach.png' width='100px'>";
				str += "<span>&nbsp;" + attach.fileName + "</span>&nbsp;&nbsp;";
				str += "<b data-file='" + fileCallPath + "' data-type='file'>[x]</b>";
				str += "</div>";
				str += "</li>";
			});
			$(".uploadResult ul").html(str);
		});
	})();
	
	
	//[x]를 클릭했을때 목록에서 지우기(register.jsp에서 복사)
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
			dataType: 'text',
			type: 'POST',
			success: function(result) {
				alert(result);
				targetLi.remove();
			}
		})
	});
	
	
	
	//첨부파일 등록(register.jsp에서 복사)
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$"); //해당 확장자 업로드 제한
	var maxSize = 5242880; // 5MB
	
	//용량 크기와 확장자 체크(register.jsp에서 복사)
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
	
	//첨부파일을 올리면 표시,전달하는 ajax(register.jsp에서 복사)
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
			dataType:'json',
			success:function(result) {
				console.log(result);
				showUploadResult(result);
			}
		});
	});
	
	//글쓰기 폼에 첨부파일을 등록 할 경우 목록에 꾸리기(register.jsp에서 복사)
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
			str += "<img src='/resources/img/attach.png' width='20' height='20'>";
			str += "<span>" + obj.fileName + "</span> ";
			str += "<b data-file='" + fileCallPath + "' data-type='file'> [x]</b>";
			str += "</div>";
			str += "</li>";
		});
		uploadUL.append(str);
	}
});
</script>
