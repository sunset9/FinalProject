package ticket.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ticket.service.admin.face.PfmService;

@Controller
public class PfmController {
	
	@Autowired PfmService pService;
	

	/**
	 * @Method설명: 새 공연 등록 폼 띄우기
	 * @작성자: 전해진
	 */
	@RequestMapping(value="/admin/pfm/registPfm", method=RequestMethod.GET)
	public void viewForm(Model model) {
		
	}
	

	/**
	 * @Method설명: 새 공연 등록하기
	 * @작성자: 전해진
	 */
	@RequestMapping(value="/admin/pfm/registPfm", method=RequestMethod.POST)
	public void registPfm(
			) {
		
	}
	
	
}

