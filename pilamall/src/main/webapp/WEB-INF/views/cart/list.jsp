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
					<h2>장바구니</h2>
					
					<form role="form" id="orderForm" name="updateInfo" method="post" action="/order/info">
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}">
						<!-- 장바구니 리스트 -->
						<table class="table cart-table goods-table">
							<thead class="table-title">
								<tr>
									<th class="c-img">이미지</th>
									<th class="c-name">제품명</th>
									<th class="c-stock">수량</th>
									<th class="c-price">가격</th>
									<th class="c-total">총 가격</th>
									<th class="c-remove">삭제</th>
								</tr>													
							</thead>
							<c:set var="sum" value="0" />
							<tbody>
								<c:forEach items="${cart }" var="cart">
								<input type="hidden" name="userId" id="userId" value="${cart.userId }">
									<tr class="table-info">
										<td class="c-img"><img src="${cart.thumbImg }"></td>
										<td class="c-name">${cart.gdsName }</td>
										<td class="c-stock"><strong>${cart.cartStock }</strong> 개</td>
										<td class="c-price"><strong>${cart.price }</strong> 원</td>
										<td class="c-total"><strong>${cart.cartStock * cart.price }</strong> 원</td>
										<td class="c-remove"><button type="submit" class="cart_delete" id="cartNum" value="${cart.cartNum }">삭제</button></td>
									</tr>
									<c:set var="sum" value="${sum + (cart.price * cart.cartStock) }" />
								</c:forEach>
							</tbody>
						</table>
						
						<!-- 총 가격 -->
						<div class="listResult">
							<div class="cart_sum">
								<fieldset class="cart_sum">
								<table>
									<tr>
										<td>
											총 제품 가격<br>
											<strong><fmt:formatNumber pattern="###,###,###" value="${sum }"/></strong> 원
										</td>
										<td>
											<c:if test="${sum < 50000 && sum != 0}">
												배송비<br>
												<strong>3000</strong>원
											</c:if>	
											<c:if test="${sum >= 50000 && sum != 0}">
												배송비<br>
												<strong>무료</strong>
											</c:if>
										</td>
										<td>
											총 합계<br> 
											<c:if test="${sum < 50000 && sum != 0}">
												<strong><fmt:formatNumber pattern="###,###,###" value="${sum + 3000 }"/></strong> 원
											</c:if>	
											<c:if test="${sum >= 50000 && sum != 0}">
												<strong><fmt:formatNumber pattern="###,###,###" value="${sum}" /></strong> 원
											</c:if>
										</td>
									</tr>
								</table>
								</fieldset>
							</div>
						</div>
							
						<!-- 주문버튼 -->
						<c:if test="${sum != 0 }">
							<div class="orderButton">
								<button type="button">주문하기</button>
							</div>
						</c:if>
							
							
						<!-- 상품 주문(성함 및 주소등 입력) -->
						<table class="orderInfo" style="display:none">
							<c:if test="${sum < 50000 && sum != 0 }">	
								<input type="hidden" name="amount" value="${sum + 3000 }" />
							</c:if>
							<c:if test="${sum >= 50000 && sum != 0 }">
								<input type="hidden" name="amount" value="${sum}" />
							</c:if>
							<tr>
								<td>
									<label>수령인</label>
									<input type="text" id="receiver" name="receiver" value="${member.userName }" required />
								</td>
							</tr>
							<tr>
								<td>
									<label>핸드폰번호</label>
									<input type="text" id="orderPhone" name="orderPhone" value="${member.userPhone }" required />
									<input type="hidden" id="phCheckVal" value="Y" />
									<div class="text_fail" id="ph-error" style="color:red">010을 포함한 11자리의 숫자로 입력해주시기바랍니다.</div>
									<div class="text_success" id="ph-success" style="color:blue">사용가능한 연락처 입니다.</div>
									
								</td>
							</tr>
							<tr>
								<td>
									<label>주소<span></span></label>
									<input type="text" id="userAddr1" name="userAddr1" placeholder="우편번호" value="${member.userAddr1 }" readonly="readonly" required/>
									<button class="check-button" id="execDaumPostcode">우편번호 찾기</button>
													
									<input type="text" id="userAddr2" name="userAddr2" placeholder="주소" value="${member.userAddr2 }" readonly="readonly" required/>
									
									<input type="text" id="userAddr3" name="userAddr3" placeholder="상세주소" value="${member.userAddr3 }" required />
									
									<input class="signup-button" id="ad_submit" type="submit" value="구매하기" />
								</td>
							</tr>
						</table>						
					</form>
					
				</div>		
			</div>
			
		</div>
	</div>
</section><!-- Start Blog Area-->

<%@ include file="../includes/footer.jsp"%>

<script>
$(document).ready(function() {
	
	//시큐리티 처리
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	$(document).ajaxSend(function(e,xhr,options) {
		xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
	});
	
	
	//삭제 처리
	$(".cart_delete").on("click", function(e) {
		e.preventDefault();
		var cartNum = $(this).val();
	
		console.log(cartNum);
		
		$.ajax({
			url: "/cart/delete",
			type: "post",
			data: {
				cartNum : cartNum
			},
			success: function() {
				alert("삭제했습니다.");
				location.reload();
			},
			error: function() {
				alert("삭제 실패");
			}
		});
	});
	
	
	//주문창 열기
	$(".orderButton").on("click", " button", function(e) {
		e.preventDefault();
		$(".orderButton").css("display","none");
		$(".orderInfo").css("display","block");
		
	});
	
	
	//엔터키 누르면 넘어가는 이벤트 방지
	$('input').keydown(function() {
		if (event.keyCode === 13) {
			console.log("엔터키!!!");
			event.preventDefault();
		}
	});
	
	/*핸드폰 유효성 및 중복 검사*/
	//해당 안내문구를 가린다.
	$("#ph-danger").hide();
	$("#ph-error").hide();
	$("#ph-success").hide();
	
	//휴대폰 유효성 범위
	var phReg = /^[0-9]{11}$/;
	
	$("#userPhone").keyup(function() {
		if($("#userPhone").val() != " ") {
			if(phReg.test($("#userPhone").val())) {
				$("#ph-error").hide();
				$("#ph-success").show();
				document.getElementById("phCheckVal").value = 'Y';
			}
			
 			else if(!phReg.test($("#userPhone").val())) {
				$("#ph-error").show();
				$("#ph-success").hide();
				document.getElementById("phCheckVal").value = 'N';
			}
		}
	});
	
	
	/*주소 버튼 post취소 후 execDaumPostcode메소드 실행*/
	$("#execDaumPostcode").on("click", function(e) {
		e.preventDefault();
		execDaumPostcode();
		$("#userAddr3").val("");
	});
	
	
	/*구매하기 누를때 다 입력되어있는지 확인*/
	var sendForm = $("#orderForm");
	
	$(document).on('click', '#ad_submit', function(e) {
		e.preventDefault(); //이벤트 막기

		//핸드폰 유효성 및 중복 체크
		if(document.getElementById("receiver").value == "") {
			alert("수령인을 입력해주시기 바랍니다.");
			$("#receiver").focus();
			return false;
		}
		
		//핸드폰 유효성 및 중복 체크
		if(document.getElementById("phCheckVal").value == 'N') {
			alert("핸드폰번호를 제대로 입력해주시기 바랍니다.");
			$("#orderPhone").focus();
			return false;
		}
		
		//주소 확인
		if($("#userAddr1").val() == "") {
			alert("주소를 입력해주시기 바랍니다.");
			return false;
		}
		
		if($("#userAddr3").val() == "") {
			alert("주소를 입력해주시기 바랍니다.");
			$("#userAddr3").focus();
			return false;
		}
		
		sendForm.submit();
	});
	
});

/*주소 처리를 위해 다음주소 연동
http://postcode.map.daum.net/guide#sample*/
function execDaumPostcode() {
	new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            
        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                // document.getElementById("sample6_extraAddress").value = extraAddr;
                addr += extraAddr;
            
            } else {
                //document.getElementById("sample6_extraAddress").value = '';
                addr += ' ';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            //document.getElementById('sample6_postcode').value = data.zonecode;
            //document.getElementById("sample6_address").value = addr;
            $("#userAddr1").val(data.zonecode);
            $("#userAddr2").val(addr);
            // 커서를 상세주소 필드로 이동한다.
            //document.getElementById("sample6_detailAddress").focus();
            $("#userAddr3").attr("readonly", false);
            $("#userAddr3").focus();
        }
    }).open(); 
}
</script>