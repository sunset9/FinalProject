package ticket.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CurrentPayPfmController {
	/**
	 * @Method설명:- ( 회원+공연+예매+예매상태 ) 리스트 페이지
	 * @작성자:박주희
	 */
	@RequestMapping(value = "/admin/curpaypfm", method = RequestMethod.GET)
	public void getList() {

	}
	
}
