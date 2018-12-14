<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<!-- 아임포트 스크립트 이게 없으면 실행이 안됨.. -->

<script>
	$(document).ready(
			function() {
				var IMP = window.IMP; // 생략해도 괜찮습니다.
				IMP.init("imp49321816"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.

				$("#payment").click(function() { //payment 버튼 클릭시 
// 					console.log("클릭됐습니다.");
					requestPayment(); //결제 실행 함수
				});

				$("#merchant_uid").val( //merchant_uid 설정법 공연명_book_idx_날짜
						'공연명' + '_' + 'book_idx'
								+ '_' + new Date().getTime());
				$("#back").click(function() {
					history.go(-1); //이전으로 
				});
				$("#cancel").click(function(){ //결제취소 버튼 
					$.ajax({
						url: "/ticket/cancel"
						, method : "POST"
						, dataType: "json"
						, data: {
							payIdx : '3' //payment payIdx 로 조회하여 취소 
						}
						, success : function(d){
							console.log(d);
							if(d=='fail'){
								alert("이미 취소된 거래입니다.");
							}else {
								alert(d);
							}
						}, error: function(){
							console.log("검색 실패");
						}
						});
					  		
				});
			});

	function requestPayment() {
		IMP.request_pay({
			pg : 'uplus', //PG사 - 'kakao':카카오페이, 'html5_inicis':이니시스(웹표준결제), 'nice':나이스페이, 'jtnet':제이티넷, 'uplus':LG유플러스, 'danal':다날, 'payco':페이코, 'syrup':시럽페이, 'paypal':페이팔
			pay_method : $("#pay_method").val(), //결제방식 - 'samsung':삼성페이, 'card':신용카드, 'trans':실시간계좌이체, 'vbank':가상계좌, 'phone':휴대폰소액결제
			merchant_uid : $("#merchant_uid").val(), //고유주문번호 - random, unique 해야됨 중복되면 결제가 되지 않음 (없으면 안됨)
			amount : $("#amount").val(), //결제금액 - 필수항목 ( 없으면 안됨.)
			buyer_email : $("#buyer_email").val(), //주문자Email - 선택항목 해당 메일로 주문결제 내역을 보내줌 
			buyer_name : $("#buyer_name").val(), //주문자명 - 선택항목
			buyer_tel : $("#buyer_tel").val(), //주문자연락처 - 필수항목, 누락되면 PG사전송 시 오류 발생!!
			buyer_addr : $("#buyer_addr").val(), //주문자주소 - 선택항목 
			//buyer_postcode : '123-456', //주문자우편번호 - 선택항목
			m_redirect_url : 'https://www.yourdomain.com/payments/complete' //모바일결제후 이동페이지 - 선택항목, 모바일에서만 동작

		}, function(rsp) { // callback - 결제 이후 호출됨, 이곳에서 DB에 저장하는 로직을 작성한다
			if (rsp.success) { // 결제 성공 로직
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
				msg += '결제 수단 : ' + rsp.pay_method;
				msg += '결제 시간 : ' + rsp.paid_at;
				msg += '[rsp.success]';

				// 결제 완료 처리 로직
				//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
				jQuery.ajax({
					url : "/ticket/payment",//해당 URL 로 데이터 전송(현재는 payment DB에 저장됨 ) 
					//cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
					type : 'POST',
					dataType : 'json',
					data : {
						// rsp객체를 통해 전달된 데이터를 DB에 저장할 때 사용한다
						impUid : rsp.imp_uid,
						merchantUid : rsp.merchant_uid,
						payMethod : rsp.pay_method, //결제정보
						pfmIdx : 14, //공연번호 
						paidAmount : rsp.paid_amount, //결제금액
						buyerName : rsp.buyer_name, //구매자 이름 
						buyerEmail : rsp.buyer_email, //구매자 메일 
						useridx : "${loginUser.userIdx }", //유저 idx
						paid_at : rsp.paid_at //필요없음
					}

				}).done(function(data) {
					//[2] 서버에서의 응답 처리
					if (data == 'success') {
						var msg = '결제가 완료되었습니다.';
// 						msg += '\n고유ID : ' + rsp.imp_uid;
// 						msg += '\n상점 거래ID : ' + rsp.merchant_uid;
// 						msg += '\n결제 금액 : ' + rsp.paid_amount;
// 						msg += '\n카드 승인번호 : ' + rsp.apply_num;
// 						msg += '\n[done]';

						alert(msg);

					} else {
						var msg = '결제가 제대로 되지 않았습니다. 자동 취소 처리 하였습니다.'
						//[3] 아직 제대로 결제가 되지 않았습니다.
						//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
						alert(msg);
					}
				});
			} else { // 결제 실패 로직
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			alert(msg);
			//여기서 메인으로 돌아가는 코드 작성 
		});
	}
</script>
${loginUser.userIdx };
<table id="pay" style="margin: 0 auto;">
	<tr>
		<th>결제수단</th>
		<td><select id="pay_method">
				<option value="card" selected>카드</option>
				<option value="samsung">삼성페이</option>
				<option value="phone">휴대폰 소액결제</option>
		</select></td>
	</tr>
	<tr>
		<th>주문번호</th>
		<td><input type="text" id="merchant_uid" /></td>
	</tr>
	<tr>
		<th>금액</th>
		<td><select id="amount">
				<option value="100" selected>1만원</option>
				<option value="20000">2만원</option>
				<option value="30000">3만원</option>
				<option value="50000">5만원</option>
				<option value="100000">10만원</option>
		</select></td>
	</tr>

	<tr>
		<th>성함</th>
		<td><input type="text" id="buyer_name" name="buyerName" value="${loginUser.name }"></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><input type="text" id="buyer_tel" value="${loginUser.phone }"></td>
	</tr>
	<tr>
		<th>배송주소</th>
		<td><input type="text" id="buyer_addr" value="${loginUser.addr }"></td>
	</tr>
	<tr>
	<th>이메일 주소</th>
		<td><input type="text" id="buyer_email" value="${loginUser.email }" ></td>
	</tr>
</table>

<button id="payment">결제하기</button>
<button id="back">돌아가기</button>
<button id="cancel">결제취소</button>

