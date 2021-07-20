<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core를 쓸 때 태그에 c로 표시  -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt를 쓸 때 태그에 fmt로 표시 fmt : formatter 형식 맞춰서 표시 -->

<%@ include file="../../includes/header.jsp"%>

<sec:authorize access="hasRole('ROLE_ADMIN')"> 
<sec:authentication property="principal.username" var="userid" />

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<section class="blog-page page fix"><!-- Start Blog Area-->
	<div class="container">
		<div class="row">
			<div class="col-sm-4 col-md-3">
				<div class="single-sidebar">
					<h2>관리자 페이지</h2>
					<ul>
						<li><a href="/admin/main">매출</a></li>
						<li><a href="/admin/goods/register">상품 등록</a></li>
						<li><a href="/admin/goods/list">상품 목록</a></li>
						<li><a href="/admin/order/list">주문 목록</a></li>
						<li><a href="/admin/order/refundList">환불 목록</a></li>
						<li><a href="/admin/inquiry/list">문의 내역</a></li>
					</ul>
				</div>
			</div>
			
			
			<div class="col-sm-8 col-md-9">
				<div class="login">
					<form class="inq_form" id="info-form" name="updateInfo" method="post" action="reply">
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}">
						<input type="hidden" name="inqNum" value="${inquiry.inqNum}">
						<input type="hidden" name="inqState" value="답변완료">
						<h2>내 문의내역 상세보기</h2>
						<table class="inquiry_modify">
						<tr>
							<td>
								<label>제목</label>
								<input type="text" id="inqTitle" name="inqTitle" value="${inquiry.inqTitle }" readonly="readonly"/>
								
								<label>작성자</label>
								<input type="text" id="userId" name="userId" value="${inquiry.userId }" readonly="readonly"/>
								
								<label>내용</label>
								<textarea type="text" rows="10" id="inqContent" name="inqContent" readonly="readonly">${inquiry.inqContent }</textarea>
													
								<label>첨부파일 <span style="color:#bbbbbb;">파일을 클릭하면 다운로드가 가능합니다.</span></label>
								<div class="uploadResult">
									<ul>
									</ul>
								</div>							
								
								<label>답변</label>
								<textarea type="text" rows="10" id="inqReply" name="inqReply"></textarea>
								
							</td>
						</table>
						
						<button type="submit" class="inq_bt" id="inq_modify" data-oper="modify">답변 등록</button>

					</form>
				</div>
			</div>
			
		</div>
	</div>
</section><!-- Start Blog Area-->

</sec:authorize>

<%@ include file="../../includes/footer.jsp"%>


<script>
$(document).ready(function() {
	
	var formObj = $("form");
	
	$("button").on("click", function(e) {
		e.preventDefault();
		
		alert("답변이 완료되었습니다.");
		formObj.submit();
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