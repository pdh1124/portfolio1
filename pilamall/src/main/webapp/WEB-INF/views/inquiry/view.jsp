<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core를 쓸 때 태그에 c로 표시  -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt를 쓸 때 태그에 fmt로 표시 fmt : formatter 형식 맞춰서 표시 -->

<%@ include file="../includes/header.jsp"%>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>



<section class="blog-page page fix"><!-- Start Blog Area-->
	<div class="container">
		<div class="row">
			<div class="col-sm-4 col-md-3">
				<div class="single-sidebar">
					<h2>마이 페이지</h2>
					<ul>
						<li><a href="/member/mypage">회원정보 수정</a></li>
						<li><a href="/cart/list">장바구니</a></li>
						<li><a href="/order/list">구매내역</a></li>
						<li><a href="/order/refundList">환불내역</a></li>
						<li><a href="/inquiry/list">내 문의 내역</a></li>
					</ul>
				</div>
			</div>
			
			
			<div class="col-sm-8 col-md-9">
				<div class="login">
					<form class="inq_form" id="info-form" name="updateInfo" method="post" action="/inquiry/modify">
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}">
						<input type="hidden" name="inqNum" value="${inquiry.inqNum}">
						<h2>내 문의내역 상세보기</h2>
						<table class="inquiry_modify">
						<tr>
							<td>
								<label>제목</label>
								<input type="text" id="inqTitle" name="inqTitle" value="${inquiry.inqTitle }"/>
								
								<label>작성자</label>
								<input type="text" id="userId" name="userId" value="${inquiry.userId }" readonly="readonly"/>
								
								<label>내용</label>
								<textarea type="text" rows="10" id="inqContent" name="inqContent">${inquiry.inqContent }</textarea>
								
								<c:if test="${inquiry.inqState != '답변대기' }">
									<label>답변</label>
									<textarea type="text" rows="10" id="inqContent" name="inqContent"  readonly="readonly">${inquiry.inqReply }</textarea>
								</c:if>
								
						
								<label>첨부파일 <span style="color:#bbbbbb;">파일을 클릭하면 다운로드가 가능합니다.</span></label>
								<input type="file" name="uploadFile" multiple>
								<div class="uploadResult">
									<ul>
									</ul>
								</div>							
		
							</td>
						</table>
						
						<button type="submit" class="inq_bt" id="inq_delete" data-oper="delete">문의 삭제</button>
						
						<c:if test="${inquiry.inqState == '답변대기' }">
							<button type="submit" class="inq_bt" id="inq_modify" data-oper="modify">문의 수정</button>
						</c:if>	
						
					</form>
				</div>
			</div>
			
		</div>
	</div>
</section><!-- Start Blog Area-->

<%@ include file="../includes/footer.jsp"%>


<script>
$(document).ready(function() {
	
	<c:if test="${inquiry.inqState == '답변완료' }">
	$("#inqTitle").on("click", function() {
		$(this).attr("readonly", true);
	});
	$("#inqContent").on("click", function() {
		$(this).attr("readonly", true);
	});
	$("input[name='uploadFile']").css("display", "none");
	</c:if>
	
	//수정 버튼, 삭제 버튼 submit 하기
	var formObj = $(".inq_form");
	
	$('.inq_bt').on("click", function(e) {
		
		e.preventDefault();
		
		var oper = $(this).data("oper");

		
		if(oper == 'delete') {
			alert("삭제 완료.");
			formObj.attr("action", "/inquiry/delete").submit();
		} 
		else if(oper == 'modify') {
			var str = ""; 
			$(".uploadResult ul li").each(function(i, obj) {
				// i:순서 , obj:요소(첨부파일 목록 1개)
				var jobj = $(obj);
				str += "<input type='hidden' name='attachList["+ i +"].fileName' value='" + jobj.data("filename") + "' >";
				str += "<input type='hidden' name='attachList["+ i +"].uuid' value='" + jobj.data("uuid") + "' >";
				str += "<input type='hidden' name='attachList["+ i +"].uploadPath' value='" + jobj.data("path") + "' >";
				str += "<input type='hidden' name='attachList["+ i +"].fileType' value='" + jobj.data("type") + "' >";
			});
			
			alert("수정 완료.");
			formObj.append(str).submit();
		}
	});
	
	/*register,modify처리 부분*/
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
			dataType: 'text',
			type: 'POST',
			success: function(result) {
				alert(result);
				targetLi.remove();
			}
		})
	});
	
	
	/*get처리 부분*/
	//첨부파일 목록 표시
	(function() {
		var inqNum = $("input[name='inqNum']").val();
		
		$.getJSON("/inquiry/getAttachList",{inqNum:inqNum}, function(arr) {
		
			console.log(arr);
			var str ="";
			
			$(arr).each(function(i,attach){
				str += "<li data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName + "' data-type='" + attach.fileType + "'>";
				str += "<div>";
				str += "<img src='/resources/img/attach.png' width='100px'>";
				str += "<span>&nbsp;" + attach.fileName + "</span><br />";
				str += "</div>";
				str += "</li>";
			});
			$(".uploadResult ul").html(str);
		});
	})();
	
	//첨부파일 클릭시 다운로드 처리
	$(".uploadResult").on("click","li",function(e) {
		console.log("파일 다운로드");
		var liObj = $(this);
		var path = encodeURIComponent(liObj.data("path") + "/" + liObj.data("uuid") + "_" + liObj.data("filename"));
		
		self.location="/download?fileName="+path;
	});
});
</script>