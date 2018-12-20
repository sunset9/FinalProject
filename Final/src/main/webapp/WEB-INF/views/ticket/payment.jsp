<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript"

	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<!-- 아임포트 스크립트 이게 없으면 실행이 안됨.. -->
 <link rel="stylesheet" href="/resources/css/onestop.css" type="text/css" /> 
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>    
<!-- 다음 주소 API  -->
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<!-- jQueyr 모달창 script -->
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<style>
.wrap_ticket_info {
    width: 260px;
 
}
.txt_gray {
text-align: center;
}
#agreementPopup{
	  z-index: 0 !important;
	  background-color:white;  
}
#agreementPopup2{
	  z-index: 0 !important;
	  background-color:white;  
}
.glyphicon-remove:before {
    display: inline-block;
    position: absolute;
    left: 140px;
    font-size: 30px;
    bottom: 0px;
    color: black;
}

.section_onestop {
    width: 720px;
    margin-left: 90px;
    heigth: 652px;
    position: relative;
    float: left;
}
</style>
<script>
// var rp=0;
// var basepay=0;
// var fee=0;
function tabSet(param,btn){
	$(btn).click(function(){
		var i = $(btn).index(this);
		$(param).children().removeClass('on');
		$(param).children().eq(i).addClass('on');
	});
	$(btn).focus(function(){
		var i = $(btn).index(this);
		$(param).children().removeClass('on');
		$(param).children().eq(i).addClass('on');
	});
}
function layerPopupClose(e){
	if(e=='agreementPopup'){
		$('#agreementPopup').hide();
	}
	else if(e=='agreementPopup2'){
		$('#agreementPopup2').hide();
	}
}
jQuery.fn.center = function () {
    this.css("position","absolute");
    this.css("top", Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) + $(window).scrollTop()) + "px");
    this.css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + $(window).scrollLeft()) + "px");
    return this;
}
function popupAgreement(e)
{
	if(e=='03'){
		 $('#agreementPopup').show();
		 $("#agreementPopup").center();
	}
	else if(e=='04'){
		$('#agreementPopup2').show();
		$('#agreementPopup2').center();
	}
}
function openZipSearch() { //다음 우편번호 API 
	new daum.Postcode({
		oncomplete: function(data) {
			$('[name=delvyAddr]').val(data.address+data.buildingName);
		}
	}).open();
}
	$(document).ready(
			function() {
// 				basepay=$('#basePriceTotal').text();
// 				basepay=basepay.replace(/,/g, '');
// 				fee=$('#reservationFee').text();
// 				fee=fee.replace(/,/g,'');
// 				rp=(+basepay+(+fee));
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

	function setDeliveryType(e){ // 배송 방법
		//console.log(e);
		
		$('#paymentAmout').html('');
		//구현 전 값 후값 비교 후 .. 
		
		if(e=='DV03'){ // 배송으로 선택시 
			
			$('#part_delivery_info').show();
			$('#deliveryCost').html('2,500');
			if(rp==(+basepay+(+fee)+2500))
				{
					return;
				}
			else{
				var resultPay=0;
				resultPay=(+basepay+(+fee)+2500);
				resultPay=resultPay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				$('#paymentAmount').text(resultPay);
			}
		
		}else{ //현장 수령시 
			$('#part_delivery_info').hide();
			$('#deliveryCost').html('0');
			resultPay=rp;
			resultPay=resultPay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			$('#paymentAmount').text(resultPay);
		}
		
	}
	function requestPayment() {
		var totalpay=$('#paymentAmount').text();
		totalpay=totalpay.replace(/,/g, '');
		
		//console.log("무슨방법?:"+$('input[name="payMethodCode"]:checked').val());
		IMP.request_pay({
			pg : 'uplus', //PG사 - 'kakao':카카오페이, 'html5_inicis':이니시스(웹표준결제), 'nice':나이스페이, 'jtnet':제이티넷, 'uplus':LG유플러스, 'danal':다날, 'payco':페이코, 'syrup':시럽페이, 'paypal':페이팔
			pay_method : $('input[name="payMethodCode"]:checked').val(), //결제방식 - 'samsung':삼성페이, 'card':신용카드, 'trans':실시간계좌이체, 'vbank':가상계좌, 'phone':휴대폰소액결제
			merchant_uid : $("#merchant_uid").val(), //고유주문번호 - random, unique 해야됨 중복되면 결제가 되지 않음 (없으면 안됨)
			amount : totalpay, //결제금액 - 필수항목 ( 없으면 안됨.)
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
<div class="section_onestop">
<div class="wrap_select">

<div class="box_r">
<!-- 수령방법  -->

<!--결제방법  -->

<!-- 결제 수단 -->
<div id="partPaymentInfo" class="box_payment" style="">
<h3 class="select_tit">결제수단을 선택하세요</h3>
<ul class="list_receipt_how">
<li id="payMethod001">
	<label>
	<input type="radio" id="pay_method1" name="payMethodCode" value="card" title="신용카드" class="radio_pay_metohd_code"> 
	<span id="payMethodName001" class="txt_lab radio_pay_metohd_label">신용카드</span>
	</label>
</li>
<li id="payMethod003">
	<label>
    <input type="radio" id="pay_method2" name="payMethodCode" value="samsung" class="radio_pay_metohd_code"> 
	<span id="payMethodName003" class="txt_lab radio_pay_metohd_label" style="">삼성페이</span>
	</label>
</li>
<li id="payMethod002">
	<label>
	<input type="radio" id="pay_method3" name="payMethodCode" value="phone" title="휴대폰 결제" class="radio_pay_metohd_code"> 
	<span id="payMethodName002" class="txt_lab radio_pay_metohd_label" style="">휴대폰 결제</span>
	</label>
</li>
</ul>
</div>
<!-- 결제수단 -->
<!-- 결제 동의 -->
<div id="partCheckAgree" class="box_cont box_receipt">
	<ul class="box_agree" style="list-style: none;">
		<li class="list_agree frt">
			<div class="select_tit">
				예매자동의
				<div class="tit_check_r">
					<input type="checkbox" id="chkAgreeAll" name="chkAgreeAll"
						title="전체 동의합니다." class=""> <label for="chkAgreeAll"><span
						class="txt_lab">전체동의</span></label>
				</div>
			</div>
		</li>
		<li class="list_agree">
			<div class="tit_check">
				<input type="checkbox" id="chkAgree01" name="chkAgree"
					title="예매 및 취소 수수료/ 취소기한을 확인하였으며 동의합니다." class=""> <label
					for="chkAgree01"><span class="txt_lab">예매 및 취소 수수료/
						취소기한을 확인하였으며 동의합니다.</span></label>
			</div>
			<div class="box_ar_info">
				<div class="tb_date">
					<table class="tbl">
						<caption class="hide"></caption>
						<colgroup>
							<col style="width: 226px;">
							<col style="width: 326px;">
						</colgroup>
						<thead class="tb_date_th">
							<tr>
								<th class="txt_gray">취소방법</th>
								<th class="txt_gray">취소수수료</th>
							</tr>
						</thead>
						<tbody id="partCancelFeeList2">
							<tr>
								<td>전액환불</td>
								<td>없음</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</li>
		<li class="list_agree">
			<ul>
				<li class="float_l">
					<div class="tit_check">
						<input type="checkbox" id="chkAgree05" name="chkAgree"
							title="결제대행 서비스 표준이용약관"> <label for="chkAgree05"><span
							class="txt_lab">결제대행 서비스 표준이용약관</span></label>
							<a href="javascript: popupAgreement('04');" class="btn_flexible btn_flexible_ico2 btn_detail"><span>상세보기</span></a>
					</div>
				</li>
				<li class="float_r">
					<div class="tit_check">
						<input type="checkbox" id="chkAgree04" name="chkAgree"
							title="개인정보 제3자 제공 동의 및 주의사항"> <label for="chkAgree04"><span
							class="txt_lab">개인정보 제3자 제공 동의</span></label>
							<a href="javascript: popupAgreement('03');" class="btn_flexible btn_flexible_ico2 btn_detail">
							<span>상세보기</span></a>
						<!-- 레이어 보기 임시 onclick 이벤트 개발시 삭제 -->
					</div>
				</li>
			</ul>
		</li>
	</ul>
</div><!-- end class="box_cont box_receipt" -->
<!-- 결제 동의 -->

</div><!-- end class="box_r" -->
</div><!-- end class="wrap_select" -->
<!-- 티켓 정보 -->

</div><!-- end class="section_onestop" -->
<table id="pay" style="margin: 0 auto;">
<!-- 	<tr> -->
<!-- 		<th>결제수단</th> -->
<!-- 		<td><select id="pay_method"> -->
<!-- 				<option value="card" selected>카드</option> -->
<!-- 				<option value="samsung">삼성페이</option> -->
<!-- 				<option value="phone">휴대폰 소액결제</option> -->
<!-- 		</select></td> -->
<!-- 	</tr> -->
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

<!-- 	<tr> -->
<!-- 		<th>성함</th> -->
<%-- 		<td><input type="text" id="buyer_name" name="buyerName" value="${loginUser.name }"></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<th>전화번호</th> -->
<%-- 		<td><input type="text" id="buyer_tel" value="${loginUser.phone }"></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<th>배송주소</th> -->
<%-- 		<td><input type="text" id="buyer_addr" value="${loginUser.addr }"></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 	<th>이메일 주소</th> -->
<%-- 		<td><input type="text" id="buyer_email" value="${loginUser.email }" ></td> --%>
<!-- 	</tr> -->
</table>

<!-- <button id="payment">결제하기</button> -->
<button id="back">돌아가기</button>
<button id="cancel">결제취소</button>


<div class="layerPop layer_personal_info" id="agreementPopup" style="width: 590px; top: 50px; left: 25px; display: none;"><div class="la_header">
    <div class="la_header1" style="text-align: center;">
        <h3 style="display: inline-block;">개인정보 제3자 제공</h3>
        <a href="javascript:;" class="btn_layerpopup_close" onclick="layerPopupClose('agreementPopup'); return false;"><span class="glyphicon glyphicon-remove"></span></a>
    </div>
</div>
<div class="la_middle">
    <div class="la_middle1">
        <div class="box_personal">

            <div class="inner_default" data-contents="melon">
                <p>(주)카카오이 제공하는 서비스를 통해 이용자간 거래관계가 이루어진 경우 고객응대 및 공연정보 안내 등을 위하여 관련한 정보는 필요한 범위내에서 거래 당사자에게 아래와 같이 제공됩니다.</p>
                <ol class="list_personal">
                    <li class="frt">1. 개인정보 제공 동의
                        <span class="txt_per">(주)카카오는 정보통신망 이용촉진 및 정보보호 등에 관한 법률에 따라 이용자의 개인정보에 있어 아래와 같이 안내하고 동의를 받아 상품 기획사 및 (주)카카오 고객센터에 제공합니다.</span>
                    </li>
                    <li>2. 개인정보 제공받는자<span class="txt_per"><span id="agreeAnotherThirdPartyName"></span>(주)카카오 고객센터, <strong id="agreeBpName">(주)창라이프</strong>, <strong id="agreePlaceName">인천종합문화예술회관</strong><strong id="agreeClipBpName">, 클립서비스(주)</strong></span></li>
                    <li>3. 개인정보 이용목적
                        <ul>
                            <li class="li_per">- 고객센터 : 예매내역 확인 및 고객응대</li>
                            <li class="li_per">- 기획사 : 티켓현장발권, 캐스팅변경, 공연취소 등에 대한 고객안내<span id="g7ExtraText"></span></li>
                        </ul>
                    </li>
                    <li>4. 개인정보 제공항목<span class="txt_per">성명,아이디,휴대폰번호, 이메일주소,주문/배송 정보, 예매자가 입력한 추가 정보</span></li>
                    <li>5. 개인정보 보유 및 이용기간
                        <span class="txt_per">개인정보 이용목적 달성 시까지(단, 관계 법령의 규정에 의해 보존의 필요가 있는 경우 및 사전동의를 득한)</span>
                    </li>
                </ol>
            </div>

            <!-- UX-1630 : 20181115 -->
            <div class="inner_default" data-contents="charlotte" style="display:none;">
                <p>(주)카카오가 제공하는 멜론티켓 서비스를 통해 이용자간 거래관계가 이루어진 경우 고객응대 및 공연정보 안내 등을 위하여 관련한 정보는 필요한 범위내에서 거래 당사자에게 아래와 같이 제공됩니다.</p>
                <ol class="list_personal">
                    <li class="frt">1. 제공항목
                        <span class="txt_per">성명,아이디,휴대폰번호, 이메일주소,주문/배송 정보, 예매자가 입력한 추가 정보</span>
                    </li>
                    <li>2. 제공목적<span class="txt_per">티켓현장발권, 캐스팅변경, 공연취소 등에 대한 고객안내</span></li>
                    <li>3. 제공받는 자<span class="txt_per">기획사, 공연장</span></li>
                    <li>4. 보유 및 이용기간<span class="txt_per">재화 또는 서비스의 제공 완료일로부터 3개월(관련 법령에 의해 보존할 필요가 있는 경우 해당 보유기간 동안 보관)</span></li>
                </ol>
            </div>
            <!-- //UX-1630 : 20181115 -->

        </div>
    </div>
</div>
<div class="la_footer">
    <div class="la_footer1"></div>
</div>
</div>
<!-- 이용약관 2 -->
<div class="layerPop layer_personal_info" id="agreementPopup2" style="width: 590px; top: 50px; left: 25px; display: none;">
<div class="la_header">
    <div class="la_header1">
        <h3>결제대행 서비스 표준이용약관</h3>
        <div class="popClose">
            <a href="javascript:;" class="btn_layerpopup_close" onclick="layerPopupClose('agreementPopup2'); return false;"><span class="glyphicon glyphicon-remove"></span></a><!-- 레이어 닫기 임시 onclick 이벤트 개발시 삭제 -->
        </div>
    </div>
</div>
<div class="la_middle">
    <div class="la_middle1">
        <div class="box_personal">
            <ul class="tab_list">
                 <li class="tab_nth1 on">
                     <h2 class="tit"><a href="#none">전자금융거래 기본약관</a></h2>
                     <div class="box_cont"><!-- 금융거래 -->
                         <b>제1조 (목적) </b><br>
                         이 약관은 주식회사 한국사이버결제(이하 '회사'라 합니다)가 제공하는 전자지급결제대행서비스 및 결제대금예치서비스를 이용자가 이용함에 있어 회사와 이용자 사이의 전자금융거래에 관한 기본적인 사항을 정함을 목적으로 합니다. <br><br>
                         <b>제2조 (용어의 정의)</b><br>
                         이 약관에서 정하는 용어의 정의는 다음과 같습니다. <br>
                         1. '전자금융거래'라 함은 회사가 전자적 장치를 통하여 전자지급결제대행서비스 및 결제대금예치서비스(이하 '전자금융거래 서비스'라고 합니다)를 제공하고, 이용자가 회사의 종사자와 직접 대면하거나 의사소통을 하지 아니하고 자동화된 방식으로 이를 이용하는 거래를 말합니다. <br>
                         2. '전자지급결제대행서비스'라 함은 전자적 방법으로 재화의 구입 또는 용역의 이용에 있어서 지급결제정보를 송신하거나 수신하는 것 또는 그 대가의 정산을 대행하거나 매개하는 서비스를 말합니다.<br>
                         3. '결제대금예치서비스'라 함은 이용자가 재화의 구입 또는 용역의 이용에 있어서 그 대가(이하 '결제대금'이라 한다)의 전부 또는 일부를 재화 또는 용역(이하 '재화 등'이라 합니다)을 공급받기 전에 미리 지급하는 경우, 회사가 이용자의 물품수령 또는 서비스 이용 확인 시점까지 결제대금을 예치하는 서비스를 말합니다.<br>
                         4. '가맹점'이라 함은 금융기관 또는 전자금융업자와의 계약에 따라 직불전자지급수단이나 선불전자지급수단 또는 전자화폐에 의한 거래에 있어서 이용자에게 재화 또는 용역을 제공하는 자로서 금융기관 또는 전자금융업자가 아닌 자를 말합니다. (신설 2010.09.13)<br>
                         5. '이용자'라 함은 이 약관에 동의하고 회사가 제공하는 전자금융거래 서비스를 이용하는 자를 말합니다. <br>
                         6. '접근매체'라 함은 전자금융거래에 있어서 거래지시를 하거나 이용자 및 거래내용의 진실성과 정확성을 확보하기 위하여 사용되는 수단 또는 정보로서 전자식 카드 및 이에 준하는 전자적 정보(신용카드번호를 포함한다), '전자서명법'상의 인증서, 회사에 등록된 이용자번호, 이용자의 생체정보, 이상의 수단이나 정보를 사용하는데 필요한 비밀번호 등 전자금융거래법 제2조 제10호에서 정하고 있는 것을 말합니다.<br>
                         7. '거래지시'라 함은 이용자가 본 약관에 의하여 체결되는 전자금융거래계약에 따라 회사에 대하여 전자금융거래의 처리를 지시하는 것을 말합니다. <br>
                         8. '오류'라 함은 이용자의 고의 또는 과실 없이 전자금융거래가 전자금융거래계약 또는 이용자의 거래지시에 따라 이행되지 아니한 경우를 말합니다.<br>
                         <b>제3조 (약관의 명시 및 변경)</b><br>
                         ① 회사는 이용자가 전자금융거래 서비스를 이용하기 전에 이 약관을 게시하고 이용자가 이 약관의 중요한 내용을 확인할 수 있도록 합니다.<br>
                         ② 회사는 이용자의 요청이 있는 경우 전자문서의 전송방식에 의하여 본 약관의 사본을 이용자에게 교부합니다.&nbsp;&nbsp;&nbsp; <br><br>
                         ③ 회사가 약관을 변경하는 때에는 그 시행일 1월 전에 변경되는 약관을 회사가 제공하는 전자금융거래 서비스 이용 초기화면 및 회사의 홈페이지에 게시함으로써 이용자에게 공지합니다.<br><br>
                         <b>제4조 (전자지급결제대행서비스의 종류)</b><br>
                         회사가 제공하는 전자지급결제대행서비스는 지급결제수단에 따라 다음과 같이 구별됩니다. <br>
                         1. 신용카드결제대행서비스: 이용자가 결제대금의 지급을 위하여 제공한 지급결제수단이 신용카드인 경우로서, 회사가 전자결제시스템을 통하여 신용카드 지불정보를 송,수신하고 결제대금의 정산을 대행하거나 매개하는 서비스를 말합니다. <br>
                         2. 계좌이체대행서비스: 이용자가 결제대금을 회사의 전자결제시스템을 통하여 금융기관에 등록한 자신의 계좌에서 출금하여 원하는 계좌로 이체할 수 있는 실시간 송금 서비스를 말합니다. <br>
                         3. 가상계좌서비스: 이용자가 결제대금을 현금으로 결제하고자 경우 회사의 전자결제시스템을 통하여 자동으로 이용자만의 고유한 일회용 계좌의 발급을 통하여 결제대금의 지급이 이루어지는 서비스를 말합니다. <br>
                         4. 기타: 회사가 제공하는 서비스로서 지급결제수단의 종류에 따라 '휴대폰 결제대행서비스','ARS결제대행서비스', '상품권결제대행서비스', '교통카드결제대행서비스' 등이 있습니다.<br><br>
                         <b>제5조 (결제대금예치서비스의 내용)</b><br>
                         ① 이용자(이용자의 동의가 있는 경우에는 재화 등을 공급받을 자를 포함합니다. 이하 본조에서 같습니다)는 재화 등을 공급받은 사실을 재화 등을 공급받은 날부터 3영업일 이내에 회사에 통보하여야 합니다.<br>
                         ② 회사는 이용자로부터 재화 등을 공급받은 사실을 통보받은 후 회사와 통신판매업자간 사이에서 정한 기일 내에 통신판매업자에게 결제대금을 지급합니다.<br>
                         ③ 회사는 이용자가 재화 등을 공급받은 날부터 3영업일이 지나도록 정당한 사유의 제시없이 그 공급받은 사실을 회사에 통보하지 아니하는 경우에는 이용자의 동의없이 통신판매업자에게 결제대금을 지급할 수 있습니다.<br>
                         ④ 회사는 통신판매업자에게 결제대금을 지급하기 전에 이용자에게 결제대금을 환급받을 사유가 발생한 경우에는 그 결제대금을 소비자에게 환급합니다.<br>
                         ⑤ 회사는 이용자와의 결제대금예치서비스 이용과 관련된 구체적인 권리,의무를 정하기 위하여 본 약관과는 별도로 결제대금예치서비스이용약관을 제정할 수 있습니다. <br><br>
                         <b>제6조 (이용시간)</b><br>
                         ① 회사는 이용자에게 연중무휴 1일 24시간 전자금융거래 서비스를 제공함을 원칙으로 합니다. 단, 금융기관 기타 결제수단 발행업자의 사정에 따라 달리 정할 수 있습니다.<br>
                         ② 회사는 정보통신설비의 보수,점검 기타 기술상의 필요나 금융기관 기타 결제수단 발행업자의 사정에 의하여 서비스 중단이 불가피한 경우, 서비스 중단 3일 전까지 게시가능한 전자적 수단을 통하여 서비스 중단 사실을 게시한 후 서비스를 일시 중단할 수 있습니다. 다만, 시스템 장애보국, 긴급한 프로그램 보수, 외부요인 등 불가피한 경우에는 사전 게시없이 서비스를 중단할 수 있습니다. <br><br>
                         <b>제7조 (접근매체의 선정과 사용 및 관리)</b><br>
                         ① 회사는 전자금융거래 서비스 제공 시 접근매체를 선정하여 이용자의 신원, 권한 및 거래지시의 내용 등을 확인할 수 있습니다. <br>
                         ② 이용자는 접근매체를 제3자에게 대여하거나 사용을 위임하거나 양도 또는 담보 목적으로 제공할 수 없습니다.<br>
                         ③ 이용자는 자신의 접근매체를 제3자에게 누설 또는 노출하거나 방치하여서는 안되며, 접근매체의 도용이나 위조 또는 변조를 방지하기 위하여 충분한 주의를 기울여야 합니다. <br>
                         ④ 회사는 이용자로부터 접근매체의 분실이나 도난 등의 통지를 받은 때에는 그 때부터 제3자가 그 접근매체를 사용함으로 인하여 이용자에게 발생한 손해를 배상할 책임이 있습니다. <br><br>
                         <b>제8조 (거래내용의 확인)</b><br>
                         ① 회사는 이용자와 미리 약정한 전자적 방법을 통하여 이용자의 거래내용(이용자의 '오류정정 요구사실 및 처리결과에 관한 사항'을 포함합니다)을 확인할 수 있도록 하며, 이용자의 요청이 있는 경우에는 요청을 받은 날로부터 2주 이내에 모사전송 등의 방법으로 거래내용에 관한 서면을 교부합니다.<br>
                         ② 회사가 이용자에게 제공하는 거래내용 중 거래계좌의 명칭 또는 번호, 거래의 종류 및 금액, 거래상대방을 나타내는 정보, 거래일자, 전자적 장치의 종류 및 전자적 장치를 식별할 수 있는 정보와 해당 전자금융거래와 관련한 전자적 장치의 접속기록은 5년간, 건당 거래금액이 1만원 이하인 소액 전자금융거래에 관한 기록, 전자지급수단 이용시 거래승인에 관한 기록, 이용자의 오류정정 요구사실 및 처리결과에 관한 사항은 1년간의 기간을 대상으로 보존하고, 회사가 전자지급결제대행 서비스 제공의 대가로 수취한 수수료에 관한 사항을 제공합니다. (일부개정 2010.09.13)<br>
                         ③ 이용자가 제1항에서 정한 서면교부를 요청하고자 할 경우 다음의 주소 및 전화번호로 요청할 수 있습니다. <br> 
                         주소: 서울시 구로구 디지털로 33길 28, 5층(구로동, 우림이비지센터1차) 한국사이버결제<br>
                         이메일 주소: help@kcp.co.kr<br>
                         전화번호: 02-2108-1000 <br><br>
                         <b>제9조 (오류의 정정 등) </b><br>
                         ① 이용자는 전자금융거래 서비스를 이용함에 있어 오류가 있음을 안 때에는 회사에 대하여 그 정정을 요구할 수 있습니다. <br>
                         ② 회사는 전항의 규정에 따른 오류의 정정요구를 받은 때에는 이를 즉시 조사하여 처리한 후 정정요구를 받은 날부터 2주 이내에 그 결과를 이용자에게 알려 드립니다. <br><br>
                         <b>제 10조 (가맹점의 준수사항 등)</b><br>
                         ① 가맹점은 직불전자지급수단이나 선불전자지급수단 또는 전자화폐(이하 "전자화폐등"이라 한다)에 의한 거래를 이유로 재화 또는 용역의 제공 등을 거절하거나 이용자를 불리하게 대우하여서는 아니 됩니다.<br>
                         ② 가맹점은 이용자로 하여금 가맹점수수료를 부담하게 하여서는 아니 됩니다.<br>
                         ③ 가맹점은 다음 각 호의 어느 하나에 해당하는 행위를 하여서는 아니 됩니다.<br>
                         1. 재화 또는 용역의 제공 등이 없이 전자화폐등에 의한 거래를 한 것으로 가장(가장)하는 행위 <br>
                         2. 실제 매출금액을 초과하여 전자화폐등에 의한 거래를 하는 행위<br>
                         3. 다른 가맹점 이름으로 전자화폐등에 의한 거래를 하는 행위 <br>
                         4. 가맹점의 이름을 타인에게 빌려주는 행위 <br>
                         5. 전자화폐등에 의한 거래를 대행하는 행위 <br>
                         ④가맹점이 아닌 자는 가맹점의 이름으로 전자화폐등에 의한 거래를 하여서는 아니 됩니다. <br>
                         (본조 신설 2010.09.13)<br><br>
                         <b>제11조 (가맹점 모집 등)</b><br>
                         ① 회사는 가맹점을 모집하는 경우에는 가맹점이 되고자 하는 자의 영업여부 등을 확인하여야 합니다. 다만, 「여신전문금융업법」 제16조의2의 규정에 따라 이미 확인을 한 가맹점인 경우에는 그러하지 아니합니다.<br>
                         ② 회사는 다음 각 호의 사항을 금융위원회가 정하는 방법에 따라 가맹점에 알려야 합니다.<br>
                         1. 가맹점수수료 <br>
                         2. 제2항의 규정에 따른 가맹점에 대한 책임 <br>
                         3. 전조 규정에 따른 가맹점의 준수사항 <br>
                         ③ 회사는 가맹점이 전조의 규정을 위반하여 형의 선고를 받거나 관계 행정기관으로부터 위반사실에 대하여 서면통보를 받는 등 대통령령이 정하는 사유에 해당하는 때에는 특별한 사유가 없는 한 지체 없이 가맹점계약을 해지하여야 합니다. '대통령령이 정하는 사유'라 함은 다음 각 호의 어느 하나에 해당하는 경우를 말합니다.<br>
                         1. 가맹점이 전자금융거래법 제26조 또는 전조 제3항제3호 내지 제5호를 위반하여 형을 선고받은 경우 <br>
                         2. 가맹점이 전조 제1항․제2항 또는 제3항제3호 내지 제5호를 위반한 사실에 관하여 관계 행정기관으로부터 서면통보가 있는 경우 <br>
                         3. 관계 행정기관으로부터 해당 가맹점의 폐업사실을 서면으로 통보 받은 경우 <br>
                         (본조 신설 2010.09.13)<br><br>
                         <b>제12조 (회사의 책임)</b><br>
                         ① 회사가 접근매체의 발급주체가 아닌 경우에는 접근매체의 위조나 변조로 발생한 사고로 인하여 이용자에게 발생한 손해에 대하여 배상책임이 없습니다. <br>
                         ② 회사가 접근매체의 발급주체이거나 사용, 관리주체인 경우에는 접근매체의 위조나 변조로 발생한 사고로 인하여 이용자에게 발생한 손해에 대하여 배상책임이 있습니다. 다만 이용자가 제7조 제2항에 위반하거나 제3자가 권한 없이 이용자의 접근매체를 이용하여 전자금융거래를 할 수 있음을 알았거나 알 수 있었음에도 불구하고 이용자가 자신의 접근매체를 누설 또는 노출하거나 방치한 경우에는 그러하지 아니합니다. <br> 
                         ③ 회사는 계약체결 또는 거래지시의 전자적 전송이나 처리과정에서 발생한 사고로 인하여 이용자에게 그 손해가 발생한 경우에는 그 손해를 배상할 책임이 있습니다. 다만 본조 제2항 단서에 해당하거나 법인('중소기업기본법' 제2조 제2항에 의한 소기업을 제외합니다)인 이용자에게 손해가 발생한 경우로서 회사가 사고를 방지하기 위하여 보안절차를 수립하고 이를 철저히 준수하는 등 합리적으로 요구되는 충분한 주의의무를 다한 경우에는 그러하지 아니합니다. <br>
                         ④ 회사는 이용자로부터의 거래지시가 있음에도 불구하고 천재지변, 회사의 귀책사유가 없는 정전, 화재, 통신장애 기타의 불가항력적인 사유로 처리 불가능하거나 지연된 경우로서 이용자에게 처리 불가능 또는 지연사유를 통지한 경우(금융기관 또는 결제수단 발행업체나 통신판매업자가 통지한 경우를 포함합니다)에는 이용자에 대하여 이로 인한 책임을 지지 아니합니다. <br>
                         ⑤ 회사는 전자금융거래를 위한 전자적 장치 또는 '정보통신망 이용촉진 및 정보보호 등에 관한 법률' 제 2조 제 1항 제 1호에 따른 정보통신망에 침입하여 거짓이나 그 밖의 부정한 방법으로 획득한 접근매체의 이용으로 발생한 사고로 인하여 이용자에게 그 손해가 발생한 경우에는 그 손해를 배상할 책임이 있습니다. 다만, 다음과 같은 경우 회사는 이용자에 대하여 일부 또는 전부에 대하여 책임을 지지 않습니다.<br><br>
                         1. 회사가 접근매체에 따른 확인 외에 보안강화를 위하여 전자금융거래 시 요구하는 추가적인 보안조치를 이용자가 정당한 사유 없이 거부하여 전자금융거래법 제9조 제1항 제3호에 따른(이하 '사고'라 한다)사고가 발생한 경우.<br>
                         2. 이용자가 동항 제 1호의 추가적인 보안조치에서 사용되는 매체, 수단 또는 정보에 대하여 다음과 같은 행위를 하여 사고가 발생하는 경우<br>
                         가. 누설, 누출 또는 방치한 행위<br>
                         나. 제 3자에게 대여하거나 그 사용을 위임한 행위 또는 양도나 담보의 목적으로 제공한 행위<br>
                         (본조 신설 2015.10.13)<br><br>
                         <b>제13조 (전자지급거래계약의 효력)</b><br>
                         ① 회사는 이용자의 거래지시가 전자지급거래에 관한 경우 그 지급절차를 대행하며, 전자지급거래에 관한 거래지시의 내용을 전송하여 지급이 이루어지도록 합니다. <br>
                         ② 회사는 이용자의 전자지급거래에 관한 거래지시에 따라 지급거래가 이루어지지 않은 경우 수령한 자금을 이용자에게 반환하여야 합니다. <br><br>
                         <b>제14조 (거래지시의 철회)</b><br>
                         ① 이용자는 전자지급거래에 관한 거래지시의 경우 지급의 효력이 발생하기 전까지 거래지시를 철회할 수 있습니다. <br>
                         ② 전항의 지급의 효력이 발생 시점이란 (i) 전자자금이체의 경우에는 거래지시된 금액의 정보에 대하여 수취인의 계좌가 개설되어 있는 금융기관의 계좌 원장에 입금기록이 끝난 때 (ii) 그 밖의 전자지급수단으로 지급하는 경우에는 거래지시된 금액의 정보가 수취인의 계좌가 개설되어 있는 금융기관의 전자적 장치에 입력이 끝난 때를 말합니다. <br>
                         ③ 이용자는 지급의 효력이 발생한 경우에는 전자상거래 등에서의 소비자보호에 관한 법률 등 관련 법령상 청약의 철회의 방법 또는 본 약관 제5조에서 정한 바에 따라 결제대금을 반환받을 수 있습니다. <br><br>
                         <b>제15조 (전자지급결제대행 서비스 이용 기록의 생성 및 보존)</b><br>
                         ① 회사는 이용자가 전자금융거래의 내용을 추적, 검색하거나 그 내용에 오류가 발생한 경우에 이를 확인하거나 정정할 수 있는 기록을 생성하여 보존합니다.<br>
                         ② 전항의 규정에 따라 회사가 보존하여야 하는 기록의 종류 및 보존방법은 제8조 제2항에서 정한 바에 따릅니다. <br><br>
                         <b>제16조 (전자금융거래정보의 제공금지)</b><br>
                         회사는 전자금융거래 서비스를 제공함에 있어서 취득한 이용자의 인적사항, 이용자의 계좌, 접근매체 및 전자금융거래의 내용과 실적에 관한 정보 또는 자료를 이용자의 동의를 얻지 아니하고 제3자에게 제공, 누설하거나 업무상 목적 외에 사용하지 아니합니다.<br><br>
                         <b>제17조 (분쟁처리 및 분쟁조정)</b><br>
                         ① 이용자는 다음의 분쟁처리 책임자 및 담당자에 대하여 전자금융거래 서비스 이용과 관련한 의견 및 불만의 제기, 손해배상의 청구 등의 분쟁처리를 요구할 수 있습니다. <br>
                         담당자: 김명건<br>
                         연락처(전화번호, 전자우편주소): 070-7595-1031, <a href="mailto:minwon@kcp.co.kr">minwon@kcp.co.kr</a> <br>
                         (일부 개정 2015.10.13)<br>
                         ② 이용자가 회사에 대하여 분쟁처리를 신청한 경우에는 회사는 15일 이내에 이에 대한 조사 또는 처리 결과를 이용자에게 안내합니다. <br>
                         ③ 이용자는 '금융감독기구의 설치 등에 관한 법률' 제51조의 규정에 따른 금융감독원의 금융분쟁조정위원회나 '소비자보호법' 제31조 제1항의 규정에 따른 소비자보호원에 회사의 전자금융거래 서비스의 이용과 관련한 분쟁조정을 신청할 수 있습니다.<br><br>
                         <b>제18조 (회사의 안정성 확보 의무)</b><br>
                         회사는 전자금융거래의 안전성과 신뢰성을 확보할 수 있도록 전자금융거래의 종류별로 전자적 전송이나 처리를 위한 인력, 시설, 전자적 장치 등의 정보기술부문 및 전자금융업무에 관하여 금융감독위원회가 정하는 기준을 준수합니다. <br><br>
                         <b>제19조 (약관외 준칙 및 관할)</b><br>
                         ① 이 약관에서 정하지 아니한 사항에 대하여는 전자금융거래법, 전자상거래 등에서의 소비자 보호에 관한 법률, 통신판매에 관한 법률, 여신전문금융업법 등 소비자보호 관련 법령에서 정한 바에 따릅니다. <br>
                         ② 회사와 이용자간에 발생한 분쟁에 관한 관할은 민사소송법에서 정한 바에 따릅니다. <br>
                     </div>
                 </li>
                 <li class="tab_nth2">
                     <h2 class="tit"><a href="#none">개인정보 수집 및 이용동의</a></h2>
                     <div class="box_cont"><!-- 개인정보 --><!-- 개발시 인라인 스타일 지워주세요 -->
                         [개인정보의 수집 및 이용에 대한 동의] <br>"주식회사 한국사이버결제"(이하 "회사")는 이용자의 개인정보를 중요시하며, "정보통신망 이용촉진 및 정보보호에 관한 법률" 및 "개인정보보호법"과 "전자상거래 등에서의 소비자 보호에 관한 법률"을 준수하고 있습니다. 회사는 전자지급결제대행서비스 및 결제대금예치서비스(이하 "서비스") 이용자로부터 아래와 같이 개인정보를 수집 및 이용합니다.<br><br>
                         <b><u>1.&lt;개인정보의 수집 및 이용목적&gt;</u></b><br><br>
                         회사는 다음과 같은 목적 하에 "서비스"와 관련한 개인정보를 수집합니다.<br>-서비스 제공 계약의 성립, 유지, 종료를 위한 본인 식별 및 실명확인, 각종 회원관리<br>
                         -서비스 제공 과정 중 본인 식별, 인증, 실명확인 및 회원에 대한 각종 안내/고지<br>
                         -대금 환불, 상품배송 등 전자상거래 관련 서비스 제공 <br>
                         -서비스 제공 및 관련 업무처리에 필요한 동의 또는 철회 등 의사확인<br>
                         -이용 빈도 파악 및 인구통계학적 특성에 따른 서비스 제공 및 CRM<br>
                         -기타 회사가 제공하는이벤트 등 광고성 정보 전달, 통계학적 특성에 따른 서비스 제공 및 <b><u>광고 게재, 실제 마케팅 활동</u></b><br>
                         -현금영수증 발행 및 관리 등<br>
                         -본인명의로 발행된 결제수단 인증<br>
                         -서비스 제공(거래승인 등)및 관련 업무처리(민원, 개인정보 관리상태 점검 등)를 위해 이용자와 해당 결제수단에 관한 계약을 체결한 이용자의 해당 결제수단 발행자 (ex) 신용카드의 경우 해당 신용카드사)에게 이용자의 결제정보, 개인정보 보관내역 등 전송<br>
                         &nbsp;<br>
                         &nbsp;(결제수단 발행자에 대한 상세 내용은 아래 참조 )<br>
                         &nbsp;신용카드 : 국민, 비씨, 롯데, 삼성, NH농협, 현대, 신한, 하나 등 신용카드사<br>
                         &nbsp;계좌이체 : 신한/기업/국민/하나/농협/우리/SC제일/한국씨티/대구/부산/광주/제주/전북/경남/새마을금고/신협/우체국/산업 등 은행, 동양/현대/미래에셋/한국투자/우리투자/하이/HMC/SK/하나대투/신한금융/동부/유진/메리츠/신영/삼성/한화 등 증권, 금융결제원<br>
                         &nbsp;뱅크월렛카카오 : 금융결제원, ㈜다음카카오<br>
                         &nbsp;가상계좌 : 신한/기업/국민/하나/농협/우리/SC제일/한국씨티/대구/부산/광주/제주/전북/경남/새마을금고/신협/우체국/산업 등 은행, 동양/현대/미래에셋/한국투자/우리투자/하이/HMC/SK/하나대투/신한금융/동부/유진/메리츠/신영/삼성/한화 등 증권, 셔틀뱅크,KIB.Net<br>
                         &nbsp;포인트: SK마케팅앤컴퍼니 (OK캐쉬백, 복지포인트), BC카드 및 서울시(에코마일리지), ㈜케이티(올레클럽KT별포인트)<br>
                         상품권 : 해피머니아이엔씨(해피머니상품권), 북앤라이프(도서문화상품권), 컬쳐랜드(문화상품권, 게임문화상품권), 아이앤플레이(틴캐시), ㈜해피닷컴(에그머니), ㈜에듀박스(온캐시)<br>
                         휴대폰 : SKT, KT, LGU+ 등 이동통신사, 다날, 모빌리언, 다우기술<br>전화결제(ARS폰빌) : ㈜케이티, 다날<br>
                         ARS신용카드 : 국민, 비씨, 롯데, 삼성, NH농협, 현대, 신한, 하나 등 신용카드사, 온세통신<br>
                         모모캐쉬 : SKT, KT, LGU+ 등 이동통신사, 온세통신, KSkyB<br>현금영수증 : 국세청<br>&nbsp;<br>
                         <b><u>2.&lt;수집하는 개인정보 항목&gt;</u></b><br><br>
                         가.결제수단별 회사가 수집하는 개인정보의 항목은 다음과 같습니다<br><b>(신용카드)</b><br>
                         카드번호(3rd-마스킹), 승인시간, 승인번호, 승인금액등<br>
                         <b>(계좌이체)</b><br>
                         계좌번호, 비밀번호, 주민등록번호(외국인등록번호), 은행명, 보안카드 또는 OTP 등<br>
                         <b>(뱅크월렛카카오)</b><br>휴대폰번호 등<br>
                         <b>(가상계좌)</b>
                         <br>입금자명, 입금은행 등<br>
                         <b>(포인트) </b><br>
                         OK캐쉬백-OK캐쉬백 카드번호, 비밀번호 등<br>
                         복지포인트-복지포인트아이디(ID)/비밀번호(PW) 등<br>
                         에코 마일리지-카드번호, 카드사정보, 유효기간, 비밀번호등<br>
                         KT별포인트 – 올레클럽 KT별포인트 카드번호, 생년월일등<br>
                         <b>(상품권)</b><br>
                         해피머니상품권-해피머니 아이디(ID)/비밀번호(PW) 등<br>
                         도서문화상품권-북앤라이프 아이디(ID)/비밀번호(PW), 상품권번호(PIN) 등<br>
                         문화상품권-컬쳐랜드 아이디(ID)/비밀번호(PW) 등<br>
                         스마트문상-상품권번호(PIN) 등<br>
                         틴캐시-틴캐시 아이디(ID)/비밀번호(PW)<br>
                         에그머니-에그머니 아이디(ID)/비밀번호(PW), 상품권번호(PIN)등<br>
                         온캐시-온캐시 아이디(ID)/비밀번호(PW)<br>
                         <b>(휴대폰)</b><br>
                         휴대폰번호, 이동통신사정보, 생년월일, 성별 등<br>
                         <b>(전화결제_ARS폰빌)</b><br>
                         KT 전화번호, 생년월일, 성별 등<br>
                         <b>(정기과금_신용카드)</b><br>
                         리얼-카드번호, 카드사, 유효기간, 비밀번호등<br>
                         파일배치-카드번호, 카드사, 유효기간, 비밀번호등<br>
                         <b>(ARS신용카드_통신판매)</b><br>
                         카드번호, 카드사, 유효기간, 비밀번호 등<br><b>(통머니)</b><br>
                         미스터통아이디(ID)/비밀번호(PW) 등<br>
                         <b>(에스크로)</b><br>
                         주민등록번호(외국인등록번호), 휴대폰번호 등<br>
                         <b>(모모캐쉬)</b><br>
                         휴대폰번호, 이동통신사정보, 생년월일, 성별 등<br>
                         <b>(현금영수증)</b><br>
                         현금영수증 카드번호, 주민등록번호(외국인등록번호), 사업자등록번호, 휴대폰번호, 승인번호 등<br>
                         나.상기 명시된 개인정보 항목 이외의"서비스" 이용과정이나"서비스" 처리 과정에서 다음과 같은 추가 정보들이 자동 혹은 수동으로 생성되어 수집 될 수 있습니다.<br>
                         -이용자 IP/Mac Address, 쿠키, e-mail, 서비스 접속 일시, 서비스 이용기록, 불량 혹은 비정상 이용기록, 결제기록<br>
                         다.기타, 회사는 서비스 이용과 관련한 대금결제, 물품배송 및 환불 등에 필요한 정보를 추가로 수집할 수 있습니다.<br>&nbsp;<br>
                         <b><u>3.&lt;개인정보의 보유 및 이용기간&gt;</u></b><br><br>
                         이용자의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면지체 없이 파기 합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존 합니다.<br>
                         가.회사 내부 방침의 의한 정보보유<br>
                         -보존항목: 서비스 상담 수집 항목(회사명, 고객명, 전화번호, E-mail, 상담내용 등)<br>
                         -보존이유: 분쟁이 발생 할 경우 소명자료 활용 <br>
                         -보존기간: 상담 완료 후6개월<br>
                         나.관련법령에 의한 정보보유<br>
                         상법, 전자상거래 등에서의 소비자보호에 관한 법률, 전자금융거래법 등 관련법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 관련법령에서 정한 일정한 기간 동안 정보를 보관합니다. 이 경우 회사는 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 아래와 같습니다.<br>
                         -계약 또는 청약철회 등에 관한 기록<br>
                         보존기간: 5년 / 보존근거: 전자상거래 등에서의 소비자보호에 관한 법률 <br>
                         -대금결제 및 재화 등의 공급에 관한 기록<br>
                         보존기간: 5년 / 보존근거: 전자상거래 등에서의 소비자보호에 관한 법률<br>
                         (단, 건당 거래 금액이 1만원 이하의 경우에는 1년간 보존 합니다).<br>
                         -소비자의 불만 또는 분쟁처리에 관한 기록<br>보존기간: 3년 / 보존근거: 전자상거래 등에서의 소비자보호에 관한 법률<br>
                         -신용정보의 수집/처리 및 이용 등에 관한 기록<br>
                         보존기간: 3년 / 보존근거: 신용정보의 이용 및 보호에 관한 법률<br>
                         -본인확인에 관한 기록<br>
                         보존기간: 6개월 / 보존근거: 정보통신 이용촉진 및 정보보호 등에 관한 법률<br>
                         -방문에 관한 기록<br>
                         보존기간: 3개월 / 보존근거: 통신비밀보호법<br>
                         -현금영수증 결제내역에 관한 기록<br>
                         보존기간: 1년 / 보존근거: 조세특례제한법<br>
                         <br>
                         <b><u>4.&lt;이용자의 개인정보의 수집 및 이용 거부&gt;</u></b><br><br>
                         이용자는 회사의 개인정보 수집 및 이용 동의를 거부할 수 있습니다. 단, 동의를 거부 하는 경우 서비스 결제가 정상적으로 완료 될 수 없음을 알려 드립니다.<br>
                         &nbsp;<br>&nbsp;<br>
                         <b>※ 개인정보의 취급과 관련된 사항은 회사의 개인정보취급방침(통합결제창 하단에서 확인할 수 있습니다)에 따릅니다.</b><br>
                     </div>
                 </li>
             </ul>
             <script type="text/javascript">
                 tabSet(".tab_list", ".tab_list li .tit a");
             </script>
        </div>  
    </div>
</div>
<div class="la_footer">
    <div class="la_footer1"></div>
</div></div>	
<!-- 이용약관 2 -->
