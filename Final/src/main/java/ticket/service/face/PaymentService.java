package ticket.service.face;

import ticket.dto.PaymentInfo;

public interface PaymentService {
	/**
	 * 2018.12.05
	 * @return 
	 * @Method설명: 구매 (결제시) 사용되는 메소드
	 * @작성자: 박주희
	 */
	public int pay(PaymentInfo pay);

	/**
	 * 2018.12.05
	 * @Method설명: 구매취소 (결제취소시) 사용되는 메소드
	 * @작성자: 박주희
	 */
	public void cancle(PaymentInfo pay);
	
	/**
	 * @최종수정일: 2018.12.13
	 * @Method설명: 결제 정보 검색 메소드 
	 * @작성자:박주희
	 */
	public PaymentInfo searchPay(PaymentInfo pay);
}
