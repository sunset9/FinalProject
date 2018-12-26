package ticket.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ticket.dto.Hall;
import ticket.dto.MainBanner;
import ticket.dto.Performance;
import ticket.dto.Poster;
import ticket.service.face.MainService;

@Controller
public class MainController {
	// 메인
	
	@Autowired MainService mainService;
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@RequestMapping(value="/ticket/test")
	public void test(Model model) {
		logger.info("Test");
		List<Poster> topBanList = mainService.adminChoiceBannerCon();
		model.addAttribute("topBanList", topBanList);
	}
	
	/**
	 * 최종수정일: 2018.12.04
	 * @Method설명: 홈페이지 접속시 첫 페이지
	 * @작성자: 배수연
	 */
	@RequestMapping(value="/ticket/ticketmain", method=RequestMethod.GET)
	public void ticketmain(Model model) {
		logger.info("MAIN");
		
		// 메인 top 배너
		List<MainBanner> bannerList = mainService.mainBannerList();
		model.addAttribute("bannerList", bannerList);
		
		// 탭 배너
		// tab-1 : NEW
		List<Poster> newList = mainService.getnewPoster();
		model.addAttribute("newList", newList);
		
		// tab-2 : 콘서트
		List<Poster> conList = mainService.getconPoster();
		model.addAttribute("conList", conList);
		
		// tab-3 : 뮤지컬&공연
		List<Poster> muList = mainService.getMuPoster();
		model.addAttribute("muList", muList);
		
		// 랭킹 - sql문 작성해야함, 테스트리스트로 출력만 해둔 상태임
		List<Poster> testList = mainService.getTestList();
		model.addAttribute("testList", testList);
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
		logger.info("콘서트 FORM");
		
		// 관리자가 선택한 콘서트 상단 배너 15개`
		List<Poster> topBanList = mainService.adminChoiceBannerCon();
		model.addAttribute("topBanList", topBanList);
		
		// 전체 리스트
		List<Poster> posterList = mainService.getConPfmPoster();
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
		) {
		
		HashMap<String, Object> map = new HashMap<>();
		
		// 콘서트 - 테마 선택 후 리스트 출력
		if( theme.equals("conall") ) {
			List<Poster> posterList = mainService.getConPfmPoster();
			
			map.put("posterList", posterList);
			
		} else if( theme.equals("muall")) {
			List<Poster> posterList = mainService.getMuPfmPoster();
			
			map.put("posterList", posterList);
		} else if( theme.equals("famall") ) {
			List<Poster> posterList = mainService.getFamPfmPoster();
			
			map.put("posterList", posterList);
		} else {
			List<Poster> posterList = mainService.getpfmThemeChoicePoster(theme);
			
			map.put("posterList", posterList);
		}
		
		return map;
	}
	
	@RequestMapping(value="/ticket/arraylist", method=RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> arrayList(
			String array
		) {
		
		HashMap<String, Object> map = new HashMap<>();
		
		logger.info("선택값 : " + array);
		
		if(array.equals("popularity")) {
			// 인기순
			List<Poster> posterList = mainService.getPopularityList();
			map.put("posterList", posterList);
			
		} else if(array.equals("Deadline")) {
			// 마감 임박순
			// 오늘 날짜 - 티켓마감일 순
			List<Poster> posterList = mainService.getDeadlineList();
			map.put("posterList", posterList);
			
		} else if (array.equals("Latest")) {
			// 최신순
			List<Poster> posterList = mainService.getLatestList();
			map.put("posterList", posterList);
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
		List<Poster> topBanList = mainService.adminChoiceBannerMu();
		model.addAttribute("topBanList", topBanList);
		
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
		
		List<Poster> posterList = mainService.getFamPfmPoster();
		model.addAttribute("posterList", posterList);
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
	
	@RequestMapping(value="/ticket/opensearch", method=RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> openSearch(
			String opentext
			, String searchKind
		) {
		// 티켓 오픈에서 등록순, 오픈일순 정렬해주기
		HashMap<String, Object> map = new HashMap<>();
		
		if(searchKind.equals("all")) {
			// 전체 선택할 경우
			
		} else {
			// 콘서트, 뮤지컬&연극, 가족&아동 선택할 경우 / 숫자 선택할 경우
			
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
	 * 최종수정일: 2018.12.19
	 * @Method설명: 예매순 랭킹 반환(ajax 통신 용)
	 * @작성자: 전해진
	 */
	@RequestMapping(value="/ticket/getrank", method=RequestMethod.GET)
	public @ResponseBody List<Performance> getRank(String type, Date today) {
		return mainService.getTopRank(type, today);
	}
	
	/**
	 * 최종수정일: 2018.12.25
	 * @Method설명: 검색시 보여질 페이지
	 * @작성자: 배수연
	 */
	@RequestMapping(value="/ticket/ticketsearch", method=RequestMethod.GET)
	public void search(
			String top_searchh
			, HttpServletRequest req
			, Model model
		) {
		top_searchh = req.getParameter("top_searchh");
		logger.info("top_searchh : " + top_searchh);
		
		// 통합검색
		//	name 검색만 일단 가능함 / 아티스트, 공연장으로 검색가능하게 변경하기
		List<Poster> allList = mainService.getSearchAllList(top_searchh);
		model.addAttribute("allList", allList);
		
	}
	
}
