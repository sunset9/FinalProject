package ticket.service.face;

import ticket.dto.Payment;

public interface PaymentService {
	/**
	 * @Method설명: 구매 (결제시) 사용되는 메소드
	 * @작성자: 박주희
	 */
	public void pay(Payment pay);

	/**
	 * @Method설명: 구매취소 (결제취소시) 사용되는 메소드
	 * @작성자: 박주희
	 */
	public void cancle(Payment pay);
}
