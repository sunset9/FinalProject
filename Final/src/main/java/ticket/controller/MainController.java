package ticket.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ticket.dto.Poster;
import ticket.dto.Theme;
import ticket.service.face.MainService;

@Controller
public class MainController {
	// 메인
	
	@Autowired MainService mainService;
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	/**
	 * 최종수정일: 2018.12.04
	 * @Method설명: 홈페이지 접속시 첫 페이지
	 * @작성자: 배수연
	 */
	@RequestMapping(value="/ticket/ticketmain", method=RequestMethod.GET)
	public void ticketmain() {
		logger.info("MAIN");
	}
	
	/**
	 * 최종수정일: 2018.12.10
	 * @Method설명: 메인 상단에서 콘서트 탭 선택시 이동하는 페이지
	 * @작성자: 배수연
	 */
	@RequestMapping(value="/ticket/concert", method=RequestMethod.GET)
	public void concert(
			Model model
		) {
		logger.info("CONCERT FORM");
		
		// 전체 리스트 뽑아 테스트중
//		List<Poster> posterList = mainService.getPfmPoster();
//		model.addAttribute("posterList", posterList);
		
		// 테마 전체 뿌려주기
		List<Theme> themeList = mainService.getThemeKind();
		model.addAttribute("themeList", themeList);
		
		// 콘서트 - 테마 선택 후
		List<Poster> posterList = mainService.getpfmThemeChoicePoster();
	}
	
	/**
	 * 최종수정일: 2018.12.04
	 * @Method설명: 콘서트 관련 띄우기
	 * @작성자: 배수연
	 */
//	@RequestMapping(value="/ticket/concert", method=RequestMethod.POST)
//	public void concertProc() {
//		logger.info("CONCERT PROCESS");
//	}
	
	/**
	 * 최종수정일: 2018.12.04
	 * @Method설명: 메인 상단에서 뮤지컬&연극 탭 선택시 이동하는 페이지
	 * @작성자: 배수연
	 */
	@RequestMapping(value="/ticket/musicalplay", method=RequestMethod.GET)
	public void musicalandplay() {
		
	}
	
	/**
	 * 최종수정일: 2018.12.04
	 * @Method설명: 뮤지컬&콘서트 관련 띄우기
	 * @작성자: 배수연
	 */
	@RequestMapping(value="/ticket/musicalplay", method=RequestMethod.POST)
	public void musicalandplayProc() {
		
	}
	
	/**
	 * 최종수정일: 2018.12.04
	 * @Method설명: 메인 상단에서 가족&아동 탭 선택시 이동하는 페이지
	 * @작성자: 배수연
	 */
	@RequestMapping(value="/ticket/familychild", method=RequestMethod.GET)
	public void familyandchild() {
		
	}
	
	/**
	 * 최종수정일: 2018.12.04
	 * @Method설명: 가족&아동 관련 띄우기
	 * @작성자: 배수연
	 */
	@RequestMapping(value="/ticket/familychild", method=RequestMethod.POST)
	public void familyandchildProc() {
		
	}
	
	/**
	 * 최종수정일: 2018.12.04
	 * @Method설명: 메인 상단에서 티켓 오픈 탭 선택시 이동하는 페이지
	 * @작성자: 배수연
	 */
	@RequestMapping(value="/ticket/ticketopen", method=RequestMethod.GET)
	public void ticketopen() {
		
	}
	
	/**
	 * 최종수정일: 2018.12.04
	 * @Method설명: 티켓 오픈 관련 띄우기
	 * @작성자: 배수연
	 */
	@RequestMapping(value="/ticket/ticketopen", method=RequestMethod.POST)
	public void ticketopenProc() {
		
	}
	
	/**
	 * 최종수정일: 2018.12.04
	 * @Method설명: 메인 상단에서 예매 랭킹 탭 선택시 이동하는 페이지
	 * @작성자: 배수연
	 */
	@RequestMapping(value="/ticket/ranking", method=RequestMethod.GET)
	public void reservationranking() {
		
	}
	
	/**
	 * 최종수정일: 2018.12.04
	 * @Method설명: 예매 랭킹 관련 띄우기
	 * @작성자: 배수연
	 */
	@RequestMapping(value="/ticket/ranking", method=RequestMethod.POST)
	public void reservationrankingProc() {
		
	}
	
	/**
	 * 최종수정일: 2018.12.04
	 * @Method설명: 검색시 보여질 페이지
	 * @작성자: 배수연
	 */
	@RequestMapping(value="/ticket/search", method=RequestMethod.GET)
	public void search() {
		
	}
	
	/**
	 * 최종수정일: 2018.12.04
	 * @Method설명: 검색 결과 띄우기
	 * @작성자: 배수연
	 */
	@RequestMapping(value="/ticket/search", method=RequestMethod.POST)
	public void searchPorc() {
		
	}
	
}
