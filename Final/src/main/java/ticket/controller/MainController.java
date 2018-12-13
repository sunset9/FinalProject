package ticket.controller;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ticket.dto.Poster;
import ticket.dto.Theme;
import ticket.service.admin.face.AdminPfmService;
import ticket.service.face.MainService;

@Controller
public class MainController {
	// 메인
	
	@Autowired MainService mainService;
	@Autowired AdminPfmService pService;
	
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
	 * 최종수정일: 2018.12.11
	 * @Method설명: 메인 상단에서 콘서트 탭 선택시 이동하는 페이지
	 * @작성자: 배수연
	 */
	@RequestMapping(value="/ticket/concert", method=RequestMethod.GET)
	public void concert(
			Model model
			, Theme theme
		) {
		logger.info("콘서트 FORM");
		
		// 관리자가 선택한 콘서트 상단 배너 15개`
		List<Poster> topBanList = mainService.adminChoiceBannerCon();
		model.addAttribute("topBanList", topBanList);
		
		// 전체 리스트
		List<Poster> posterList = mainService.getConPfmPoster();
		model.addAttribute("posterList", posterList);
		
		// 테마 리스트 뿌려주기
		List<Theme> themeList = mainService.getConThemeKind();
		model.addAttribute("themeList", themeList);
	}
	
	/**
	 * 최종수정일: 2018.12.13
	 * @Method설명: 선택한 테마에 대한 리스트 출력
	 * @작성자: 배수연
	 */
	@RequestMapping(value="/ticket/themelist", method=RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> themeList(
			String theme
		) {
		
		// 콘서트 - 테마 선택 후 리스트 출력
		List<Poster> posterList = mainService.getpfmThemeChoicePoster(theme);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("posterList", posterList);
		
		return map;
	}
	
	/**
	 * 최종수정일: 2018.12.11
	 * @Method설명: 메인 상단에서 뮤지컬&연극 탭 선택시 이동하는 페이지
	 * @작성자: 배수연
	 */
	@RequestMapping(value="/ticket/musicalplay", method=RequestMethod.GET)
	public void musicalandplay(
			Model model
		) {
		logger.info("뮤지컬&연극 FORM");
		
		// 관리자가 선택한 뮤지컬&연극 상단배너 출력
		List<Poster> topBanList = mainService.adminChoiceBannerMu();
		model.addAttribute("topBanList", topBanList);
		
		// 테마 리스트 뿌려주기
		List<Theme> themeList = mainService.getMuThemeKind();
		model.addAttribute("themeList", themeList);
		
		// 모든 포스터 리스트 뿌려주기
		List<Poster> posterList = mainService.getMuPfmPoster();
		model.addAttribute("posterList", posterList);
	}
	
	/**
	 * 최종수정일: 2018.12.04
	 * @Method설명: 메인 상단에서 가족&아동 탭 선택시 이동하는 페이지
	 * @작성자: 배수연
	 */
	@RequestMapping(value="/ticket/familychild", method=RequestMethod.GET)
	public void familyandchild(
			Model model
		) {
		logger.info("가족&아동 FORM");
		
		// 관리자가 선택한 뮤지컬&연극 상단배너 출력
		List<Poster> topBanList = mainService.adminChoiceBannerFam();
		model.addAttribute("topBanList", topBanList);
		
		// 테마 리스트 뿌려주기
		List<Theme> themeList = mainService.getFamThemeKind();
		model.addAttribute("themeList", themeList);
		
		List<Poster> posterList = mainService.getFamPfmPoster();
		model.addAttribute("posterList", posterList);
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
