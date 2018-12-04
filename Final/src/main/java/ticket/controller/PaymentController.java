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

	@RequestMapping(value = "/payment/pay", method = RequestMethod.GET)
	public void pay() {

	}

	@RequestMapping(value = "/payment/cancel", method = RequestMethod.POST)
	public void cancel() {

	}

}
