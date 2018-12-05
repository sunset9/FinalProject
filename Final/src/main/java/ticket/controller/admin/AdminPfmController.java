package ticket.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ticket.service.admin.face.AdminPfmService;

@Controller
public class AdminPfmController {
	
	@Autowired AdminPfmService pService;
	

	/**
	 * 2018.12AdminPfmControllerod설명: 새 공연 등록 폼 띄우기
	 * @작성자: 전해진
	 */
	@RequestMapping(value="/admin/pfm/registPfm", method=RequestMethod.GET)
	public void viewRistForm(Model model) {
		// 공연 분류(장르) 가져오기
		// 테마 리스트 가져오기
		
		// 관람 등급 가져오기
		
		// 아티스트 가져오기
		
		// 좌석정보 가져오기(ui 뿌리기 위해)
		
	}
	

	/**
	 * 2018.12.05
	 * @Method설명: 새 공연 등록하기
	 * @작성자: 전해진
	 */
	@RequestMapping(value="/admin/pfm/registPfm", method=RequestMethod.POST)
	public void registPfm(
			) {
		// 공연 기본 정보 등록
		// 포스터 정보 등록
		// 테마 정보 등록
		// 출연진 등록
		// 좌석 정보 & 가격 등록
		// 공연 날짜 & 시간 등록
		// 공연 상세 정보 등록
		// 예매 상세 정보 등록
		
	}
	
	
	/**
	 * 2018.12.05
	 * @Method설명: 공연 정보 수정 폼 띄우기
	 * @작성자: 전해진
	 */
	@RequestMapping(value="/admin/pfm/editPfm", method=RequestMethod.GET)
	public void editForm(Model model) {
		
	}
	
	
	/**
	 * 2018.12.05
	 * @Method설명: 공연 정보 수정하기
	 * @작성자: 전해진
	 */
	@RequestMapping(value="/admin/pfm/editPfm", method=RequestMethod.POST)
	public void editPfm(
			) {
		
		// 
	}
	
	
}
