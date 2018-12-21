package ticket.dao.face;

import ticket.dto.PaymentInfo;

public interface PaymentDao {

	/**
	 * @Method설명:결제데이터를 DB에 insert로 삽입한다.(결제)
	 * @작성자: 박주희
	 */
	public int insertPayment(PaymentInfo pay);

	/**
	 * @Method설명:결제데이터를 DB에 Delete로 삭제한다.(결제취소)
	 * @작성자: 박주희
	 */
	public void deletePayment(PaymentInfo pay);
	
	/**
	 * @최종수정일: 2018.12.21
	 * @Method설명: 부분취소한 금액 payment table에서 빼주기(부분취소)
	 * @작성자: 김지은
	 */
	public void updatePayment(PaymentInfo pay);
	
	/**
	 * @최종수정일: 2018.12.13
	 * @Method설명: payIdx로 결제 정보를 조회한다.
	 * @작성자:박주희
	 */
	public PaymentInfo selectBypayIdx(PaymentInfo pay);
}
