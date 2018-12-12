package ticket.controller.admin;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ticket.service.admin.face.AdminPfmService;
import ticket.service.admin.face.AdminUserService;

@Controller
public class AdminHomeController {

	private static final Logger logger = LoggerFactory.getLogger(AdminHomeController.class);
	
	@Autowired AdminPfmService pService;
	@Autowired AdminUserService uService;
	
	/**
	 * @최종수정일: 2018.12.07
	 * @Method설명: 관리자 홈에 필요한 정보 불러오기 
	 * @작성자: 김지은
	 */
	@RequestMapping(value="/admin/main", method=RequestMethod.GET)
	public void adminMain(Model model) {
		//오늘의 예매수 불러오기
		int todayBook = pService.getTodayBook();
		logger.info("today book : "+ Integer.toString(todayBook));
		
		//오늘의 예매취소수 불러오기 pService.getTodayCancel()
		int todayCancel = pService.getTodayCancel();
		logger.info("today cancel : "+ Integer.toString(todayCancel));
		
		//오늘 등록된 모든 공연수 가져오기
		int todayAllPfm = pService.getTodayAllPfm();
		logger.info("오늘 등록된 공연의 수 : "+ Integer.toString(todayAllPfm));
		
		//오늘 등록된 콘서트수 pService.getTodayCon()
		int todayConcert = pService.getTodayCon();
		
		//오늘 등록된 뮤지컬&연극수 pService.getTodayMu()
		int todayMusical = pService.getTodayMu();
		
		//오늘 등록된 가족&아동수 pService.getTodayFam()
		int todayFamily = pService.getTodayFam();
		
		//현재 접속자수 불러오기 uService.getConnectUser()
		
		//1:1 문의 미답변수 불러오기 uService.getUnanswered()
		int unansweredInq = pService.getUnanswered();
		
		//뷰에전달
		model.addAttribute("todayBook", todayBook);
		model.addAttribute("todayCancel", todayCancel);
		model.addAttribute("todayAllPfm", todayAllPfm);
		model.addAttribute("todayConcert", todayConcert);
		model.addAttribute("todayMusical", todayMusical);
		model.addAttribute("todayFamily", todayFamily);
		model.addAttribute("unansweredInq", unansweredInq);
	}
	
	@RequestMapping(value="/admin/menu", method=RequestMethod.GET)
	public String menu() {
		
		return "/admin/layout/menu";
		
	}
}
