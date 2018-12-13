package ticket.controller;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ticket.dto.PaymentInfo;
import ticket.service.face.PaymentService;
import ticket.utils.com.siot.IamportRestClient.IamportClient;
import ticket.utils.com.siot.IamportRestClient.exception.IamportResponseException;
import ticket.utils.com.siot.IamportRestClient.request.CancelData;
import ticket.utils.com.siot.IamportRestClient.response.AccessToken;
import ticket.utils.com.siot.IamportRestClient.response.IamportResponse;
import ticket.utils.com.siot.IamportRestClient.response.Payment;

@Controller
public class PaymentController {
	@Autowired
	PaymentService paymentService;
	private static final Logger logger = LoggerFactory.getLogger(PaymentController.class);

	/**
	 * 2018.12.05
	 * @Method설명: 결제
	 * @작성자:박주희
	 */
	@RequestMapping(value = "/ticket/payment", method = RequestMethod.GET)
	public void pay() {

		logger.info("GET");
	}

	@RequestMapping(value = "/ticket/payment", method = RequestMethod.POST)
	public void payProc(PaymentInfo pay) {

		logger.info(pay.toString());
		logger.info("POST");
		paymentService.pay(pay);
	}
	
	/**
	 * 2018.12.05
	 * @Method설명:결제 취소
	 * @작성자:박주희
	 */
	@RequestMapping(value = "/ticket/cancel", method = RequestMethod.POST)
	public @ResponseBody String cancel(PaymentInfo pay) {
		PaymentInfo rp = paymentService.searchPay(pay);
		logger.info(rp.toString());
		IamportClient client;
		String api_key = "3927322193332266";
		String api_secret = "YprBYXKjT13iigqeCLCQ2hxxeTOqHY4Fnvgls0Em2IEkZ4yBPasSr0pFTe6AcafzGwV9xAvzi9ThesT3";
		client = new IamportClient(api_key, api_secret);
		try {
			IamportResponse<AccessToken> auth_response = client.getAuth();
			
			} catch (IamportResponseException e) {
			System.out.println(e.getMessage());
			
			switch(e.getHttpStatusCode()) {
			case 401 :
				return "401";
//				break;
			case 500 :
				return "500";
//				break;
			}
		} catch (IOException e) {
			//서버 연결 실패
			e.printStackTrace();
		}
		/////////////////////////
		
		String test_already_cancelled_imp_uid=rp.getImpUid();
		CancelData cancel_data = new CancelData(test_already_cancelled_imp_uid, true); //imp_uid를 통한 전액취소
		try {
			IamportResponse<Payment> payment_response = client.cancelPaymentByImpUid(cancel_data);
			
		} catch (IamportResponseException e) {
			System.out.println(e.getMessage());
			
			switch(e.getHttpStatusCode()) {
			case 401 :
				return "401";
//				break;
			case 500 :
				return "500";
//				break;
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "sucess";
	}
	

}
