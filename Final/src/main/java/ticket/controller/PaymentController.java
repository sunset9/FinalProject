package ticket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ticket.service.face.PaymentService;

@Controller
public class PaymentController {
	@Autowired
	PaymentService paymentService;

	/**
	 * 2018.12.05
	 * @Method설명: 결제
	 * @작성자:박주희
	 */
	@RequestMapping(value = "/payment/pay", method = RequestMethod.GET)
	public void pay() {

	}

	/**
	 * 2018.12.05
	 * @Method설명:결제 취소
	 * @작성자:박주희
	 */
	@RequestMapping(value = "/payment/cancel", method = RequestMethod.POST)
	public void cancel() {

	}

}
