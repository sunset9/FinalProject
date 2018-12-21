package ticket.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ticket.dao.face.PaymentDao;
import ticket.dto.PaymentInfo;
import ticket.service.face.PaymentService;

@Service
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	PaymentDao paymentDao;

	@Override
	public int pay(PaymentInfo pay) {
		paymentDao.insertPayment(pay);
		int r=pay.getPfmIdx();
		PaymentInfo rp= new PaymentInfo();
		rp.setPayIdx(r);
		rp=paymentDao.selectBypayIdx(rp);
		if(rp==null) {
			return 0;
		}
		return 1;
	}

	@Override
	public void cancle(PaymentInfo pay) {
		
		paymentDao.deletePayment(pay);
	}

	@Override
	public PaymentInfo searchPay(PaymentInfo pay) {
		return paymentDao.selectBypayIdx(pay);
	}

}
