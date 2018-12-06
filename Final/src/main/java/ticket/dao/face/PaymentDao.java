package ticket.dao.face;

import ticket.dto.Payment;

public interface PaymentDao {

	/**
	 * @Method설명:결제데이터를 DB에 insert로 삽입한다.(결제)
	 * @작성자: 박주희
	 */
	public void insertPayment(Payment pay);

	/**
	 * @Method설명:결제데이터를 DB에 Delete로 삭제한다.(결제취소)
	 * @작성자: 박주희
	 */
	public void deletePayment(Payment pay);
}
