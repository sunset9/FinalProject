package ticket.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

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
	public ModelAndView payProc(PaymentInfo pay) {

		logger.info(""+pay.getUserIdx());
		logger.info(pay.toString());
		logger.info("POST");
		int r=paymentService.pay(pay);
		logger.info("무슨값?"+r);
	
//		Map map = new HashMap<>();
//		map.put("success", "success");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("jsonView");
		if(r==1)
			mv.addObject("success", "success");
		if(r==0)
			mv.addObject("fail","fail");
		return mv;
	}
	
	/**
	 * 2018.12.14
	 * @Method설명:결제 취소
	 * @작성자:박주희
	 */
	@RequestMapping(value = "/ticket/cancel", method = RequestMethod.POST,
			 produces = "application/json; charset=utf8")
	public @ResponseBody String cancel(PaymentInfo pay) {
		Gson jsonParser = new Gson();

	//	logger.info(pay.toString());
		PaymentInfo rp = paymentService.searchPay(pay);
		if(rp==null)
			return jsonParser.toJson("fail");
	//	logger.info(rp.toString());
		
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
				return jsonParser.toJson("인증에 실패하였습니다. API키와 secret을 확인하세요");
//				break;
			case 500 :
				return jsonParser.toJson("실패");
//				break;
			}
		} catch (IOException e) {
			//서버 연결 실패
			e.printStackTrace();
		}
		/////////////////////////
		
		String already_cancelled_imp_uid=rp.getImpUid();
		CancelData cancel_data = new CancelData(already_cancelled_imp_uid, true); //imp_uid를 통한 전액취소
		try {
			IamportResponse<Payment> payment_response = client.cancelPaymentByImpUid(cancel_data);
			
		} catch (IamportResponseException e) {
			System.out.println(e.getMessage());
			
			switch(e.getHttpStatusCode()) {
			case 401 :
				return jsonParser.toJson("Unauthorized");
//				break;
			case 500 :
				return jsonParser.toJson("실패");
//				break;
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		paymentService.cancle(rp);
		return jsonParser.toJson("결제가 취소 되었습니다.");
	}
	

}
