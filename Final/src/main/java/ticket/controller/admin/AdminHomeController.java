package ticket.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ticket.service.admin.face.AdminPfmService;
import ticket.service.admin.face.AdminUserService;

@Controller
public class AdminHomeController {

	@Autowired AdminPfmService pService;
	@Autowired AdminUserService uService;
	
	@RequestMapping(value="/admin/main", method=RequestMethod.GET)
	public void adminMain() {
		//오늘의 예매수 불러오기 pService.getTodayBook() 
		//오늘의 예매취소수 불러오기 pService.getTodayCancel()
		
		//오늘 등록된 콘서트수 pService.getTodayCon()
		//오늘 등록된 뮤지컬&연극수 pService.getTodayMu()
		//오늘 등록된 가족&아동수 pService.getTodayFam()
		
		//현재 접속자수 불러오기 uService.getConnectUser()
		
		//1:1 문의 미답변수 불러오기 uService.getUnanswered()
		
		//뷰에전달
	}
}
