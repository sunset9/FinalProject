package ticket.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ticket.dao.face.PaymentDao;
import ticket.dto.Payment;
import ticket.service.face.PaymentService;

@Service
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	PaymentDao paymentDao;

	@Override
	public void pay(Payment pay) {
		paymentDao.insertPayment(pay);

	}

	@Override
	public void cancle(Payment pay) {
		paymentDao.deletePayment(pay);
	}

}
