
package ticket.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ticket.dto.Artist;
import ticket.dto.Hall;
import ticket.dto.HallFile;
import ticket.dto.MainBanner;
import ticket.dto.Performance;
import ticket.dto.Poster;
import ticket.dto.User;
import ticket.dto.PreferTheme;
import ticket.service.face.MainService;
import ticket.service.face.PreferTService;
import ticket.service.face.UserService;

@Controller
public class MainController {
	// 메인
	
	@Autowired MainService mainService;
	@Autowired
	private UserService userService;
	@Autowired
	private PreferTService preferTService;
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	
	@RequestMapping(value="/bananaticket", method=RequestMethod.GET)
	public String main(Model model, HttpSession session) {
		
		return "/ticket/ticketmain";
	}

	@RequestMapping(value="/ticket/test")
	public void test(Model model) {
		logger.info("Test");
	}
	
	
	/**
	 * 최종수정일: 2019.01.14
	 * @Method설명: 홈페이지 접속시 첫 페이지
	 * @작성자: 배수연, 전해진, 홍나영
	 */
	@RequestMapping(value="/ticket/ticketmain", method=RequestMethod.GET)
	public void ticketmain(Model model, HttpSession session) {
		logger.info("MAIN");
		
		// 메인 top 배너
		List<MainBanner> bannerList = mainService.mainBannerList();
		model.addAttribute("bannerList", bannerList);
		
		// 탭 배너
		// tab-1 : NEW
		List<Performance> newList = mainService.getnewPoster();
		model.addAttribute("newList", newList);
		
		// tab-2 : 콘서트
		List<Performance> conList = mainService.getconPoster();
		model.addAttribute("conList", conList);
		
		// tab-3 : 뮤지컬&공연
		List<Performance> muList = mainService.getMuPoster();
		model.addAttribute("muList", muList);
		
		// 랭킹	
		String genre = "CON"; // 장르 기본값: 콘서트 기준
		List<Performance> rankList = mainService.getTopRankByGenre(genre);
		model.addAttribute("rankPfm", rankList);
		
		// 세션에서 유저 정보 얻기
		User user = (User) session.getAttribute("loginUser");
		
		if(user != null) {
			int userIdx = user.getUserIdx();
		
			// 유저가 선택한 테마 리스트 불러오기
			List<PreferTheme> ptList = preferTService.choiceList(userIdx);
			model.addAttribute("ptList", ptList);
	
			// 테마에 맞는 추천공연 리스트 불러오기
			List<Performance> recomList = userService.recommendPfm(userIdx,ptList);
			logger.info("선호 테마에 대한 공연추천" + recomList);
			
			model.addAttribute("recomList", recomList);
		}
	}
	
	@RequestMapping(value="/ticket/fit", method=RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> fitPfm(
			String userIdx
			
		) {
		HashMap<String, Object> map = new HashMap<>();
		
		logger.info("맞춤 공연");
		logger.info(userIdx);
		
		// 로그인 정보 없는 경우 null 반환
		if("".equals(userIdx)) return null;
		
		int idx = Integer.parseInt(userIdx);
		
//		List<Poster> fitPfmList = mainService.getFitPfmList(userIdx);
//		map.put("fitPfmList", fitPfmList);
		
		// 유저가 선택한 테마 리스트 불러오기
		List<PreferTheme> ptList = preferTService.choiceList(idx);

		// 테마에 맞는 추천공연 리스트 불러오기
		List<Performance> recomList = userService.recommendPfm(idx,ptList);
		logger.info("선호 테마에 대한 공연추천" + recomList);
		map.put("fitPfmList", recomList);
		
		return map;
	}
	
	/**
	 * 최종수정일: 2018.12.11
	 * @Method설명: 메인 상단에서 콘서트 탭 선택시 이동하는 페이지
	 * @작성자: 배수연
	 */
	@RequestMapping(value="/ticket/concert", method=RequestMethod.GET)
	public void concert(
			Model model
		) {
		logger.info("+ + + 콘서트 FORM + + +");
		
		// 관리자가 선택한 콘서트 상단 배너 15개
		List<Performance> topBanList = mainService.adminChoiceBannerCon();
		model.addAttribute("topBanList", topBanList);
		
		// 전체 리스트
		List<Performance> posterList = mainService.getConPfmPoster();
		// 전체리스트 - 최근 30일간 인기순
//		int genreIdx = 1;
//		List<Performance> posterList = mainService.getPopularityList(genreIdx);
		model.addAttribute("posterList", posterList);
	}
	
	/**
	 * 최종수정일: 2018.12.13
	 * @Method설명: 선택한 테마에 대한 리스트 출력
	 * @작성자: 배수연
	 */
	@RequestMapping(value="/ticket/themelist", method=RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> themeList(
			String theme
			, String genreIdx
		) {
		logger.info("테마에 맞는공연리스트 조회");
		HashMap<String, Object> map = new HashMap<>();
		
		logger.info(genreIdx);
		
		// 콘서트 - 테마 선택 후 리스트 출력
		if( theme.equals("conall") ) {
			// 콘서트 전체
			List<Performance> pfmList = mainService.getConPfmPoster();
			
			map.put("pfmList", pfmList);
			
		} else if( theme.equals("muall")) {
			// 뮤지컬&연극 전체
			List<Performance> pfmList = mainService.getMuPfmPoster();
			
			map.put("pfmList", pfmList);
		} else if( theme.equals("famall") ) {
			// 가족&아동 전체
			List<Performance> pfmList = mainService.getFamPfmPoster();
			
			map.put("pfmList", pfmList);
		} else {
			// 테마 idx 선택 시
			List<Performance> pfmList = mainService.getpfmThemeChoicePoster(theme, genreIdx);
			
			map.put("pfmList", pfmList);
		}
		
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
		List<Performance> topBanList = mainService.adminChoiceBannerMu();
		model.addAttribute("topBanList", topBanList);
		
		// 모든 포스터 리스트 뿌려주기
		List<Performance> posterList = mainService.getMuPfmPoster();
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
		
		// 관리자가 선택한 가족&아동 상단배너 출력
		List<Performance> topBanList = mainService.adminChoiceBannerFam();
		model.addAttribute("topBanList", topBanList);
		
		// 모든 포스터 리스트 뿌려주기
		List<Performance> posterList = mainService.getFamPfmPoster();
		model.addAttribute("posterList", posterList);
	}
	
	@RequestMapping(value="/ticket/arraylist", method=RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> arrayList(
			String array
			, int genreIdx
		) {
		
		HashMap<String, Object> map = new HashMap<>();
		
		logger.info("선택값 : " + array);
		logger.info("genreIdx : " + genreIdx);
		
		if(array.equals("popularity")) {
			// 인기순
			List<Performance> posterList = mainService.getPopularityList(genreIdx);
			map.put("pfmList", posterList);
			
		} else if(array.equals("Deadline")) {
			// 공연 임박순
			// 오늘 날짜 - 티켓마감일 순  -->>> 공연 시작일 순으로 변경 했어요 
			List<Performance> posterList = mainService.getDeadlineList(genreIdx);
			map.put("pfmList", posterList);
			
		} else if (array.equals("Latest")) {
			// 최신순
			List<Performance> posterList = mainService.getLatestList(genreIdx);
			map.put("pfmList", posterList);

		}
		
		return map;
	}
	
	/**
	 * 최종수정일: 2018.12.04
	 * @Method설명: 메인 상단에서 티켓 오픈 탭 선택시 이동하는 페이지
	 * @작성자: 배수연
	 */
	@RequestMapping(value="/ticket/ticketopen", method=RequestMethod.GET)
	public void ticketopen(Model model) {
		// 상단의 이미지 및 기본 정보들 출력
		List<Performance> openList = mainService.ticketOpenList();
		model.addAttribute("openList", openList);
		
		// 하단 오픈 리스트 출력
		//	기본 : 등록일 순
		List<Performance> openPfmList = mainService.ticketOpenPfmList();
		model.addAttribute("openPfmList", openPfmList);
	}
	
	@RequestMapping(value="/ticket/openarray", method=RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> openarray(
			String array
		) {
		// 티켓 오픈에서 등록순, 오픈일순 정렬해주기
		HashMap<String, Object> map = new HashMap<>();
		
		if(array.equals("registration")) {
			// 등록순
			List<Performance> openPfmList = mainService.ticketOpenPfmList();
			map.put("openPfmList", openPfmList);
			
		} else if(array.equals("openday")) {
			List<Performance> openPfmList = mainService.ticketOpenDayList();
			map.put("openPfmList", openPfmList);
		}
		
		return map;
	}
	
	/**
	 * 최종수정일: 2018.12.26
	 * @Method설명: 티켓 오픈 검색 기능, 포스터 이름으로 검색 가능
	 * @작성자: 배수연
	 */
	@RequestMapping(value="/ticket/opensearch", method=RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> openSearch(
			String opentext
			, String genreIdx
			, HttpServletRequest req
		) {
		opentext = req.getParameter("opentext");
		
		logger.info("opentext : " + opentext);
		logger.info("genreIdx : " + genreIdx);

		HashMap<String, Object> map = new HashMap<>();
		
		if( genreIdx.equals("all") ) {
			List<Performance> openPfmList = mainService.getOpenSerchList(opentext);
			map.put("openPfmList", openPfmList);
			
		} else {
			List<Performance> openPfmList = mainService.getOpenSelectSearchList(genreIdx, opentext);
			map.put("openPfmList", openPfmList);
		}
		
		return map;
	}
	
	/**
	 * 최종수정일: 2018.12.19
	 * @Method설명: 메인 상단에서 예매 랭킹 탭 선택시 이동하는 페이지
	 * @작성자: 전해진
	 */
	@RequestMapping(value="/ticket/ranking", method=RequestMethod.GET)
	public void viewranking() {
		
	}
	
	/**
	 * 최종수정일: 2019.01.01
	 * @Method설명: 랭킹 페이지 랭킹 반환(ajax 통신 용)
	 * @작성자: 전해진
	 */
	@RequestMapping(value="/ticket/getrank", method=RequestMethod.GET)
	public @ResponseBody List<Performance> getRank(String type) {
		return mainService.getTopRankByPeriod(type);
	}
	
	/**
	 * 최종수정일: 2018.12.25
	 * @Method설명: 검색시 보여질 페이지
	 * @작성자: 배수연
	 */
	@RequestMapping(value="/ticket/ticketsearch", method=RequestMethod.GET)
	public void search(
			HttpServletRequest req
			, Model model
		) {
		String top_search = req.getParameter("top_search");
		logger.info("top_search : " + top_search);
		
		// 검색한 단어를 넘겨줌, 확인용
		model.addAttribute("top_search", top_search);
		
		// 공연 검색
		List<Poster> pfmSearchList = mainService.getSearchPfmList(top_search);
		model.addAttribute("pfmSearchList", pfmSearchList);
		
		int pfmCount = mainService.getPfmCount(top_search);
		model.addAttribute("pfmCount", pfmCount);
		
		// 아티스트 검색
		List<Artist> artSearchList = mainService.getSearchArtList(top_search);
		model.addAttribute("artSearchList", artSearchList);
		
		int artCount = mainService.getArtCount(top_search);
		model.addAttribute("artCount", artCount);
		
		// 공연장 검색
		List<HallFile> hallSearchList = mainService.getSearchHallList(top_search);
		model.addAttribute("hallSearchList", hallSearchList);
		
		List<Hall> hallNameList = mainService.getSearchHallNameList(top_search);
		model.addAttribute("hallNameList", hallNameList);
		
		int hallCount = mainService.getHallCount(top_search);
		model.addAttribute("hallCount", hallCount);
		
	}
	/**
	 * @최종수정일: 2018.12.28
	 * @Method설명:footer 부분 전자금융약관
	 * @작성자:박주희
	 */
	@RequestMapping(value="/ticket/billing", method=RequestMethod.GET)
	public void footerBilling() {
		logger.info("billing-GET");
	}
	
	/**
	 * @최종수정일: 2018.12.28
	 * @Method설명:footer 부분 바나나티켓 이용약관
	 * @작성자:박주희
	 */
	@RequestMapping(value="/ticket/agreement", method=RequestMethod.GET)
	public void footerAgreementPop() {
		logger.info("AgreementPop-GET");
	}
	
	/**
	 * @최종수정일: 2018.12.29
	 * @Method설명: 메인화면에서 장르에 따른 랭킹 가져오기(ajax통신용)
	 * @작성자: 전해진
	 */
	@RequestMapping(value="/ticket/mainrank", method=RequestMethod.GET)
	public @ResponseBody List<Performance> getMainRank(String genre) {
		return mainService.getTopRankByGenre(genre);
	}
}