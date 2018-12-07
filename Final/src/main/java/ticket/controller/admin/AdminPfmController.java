package ticket.controller.admin;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import ticket.dto.AgeGrade;
import ticket.dto.Artist;
import ticket.dto.CastList;
import ticket.dto.Genre;
import ticket.dto.Performance;
import ticket.dto.PfmThemeList;
import ticket.dto.Theme;
import ticket.service.admin.face.AdminPfmService;

@Controller
public class AdminPfmController {

	private static final Logger logger = LoggerFactory.getLogger(AdminPfmController.class);
	@Autowired
	AdminPfmService pService;
	@Autowired
	ServletContext context;

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 새 공연 등록 폼 띄우기
	 * @작성자: 전해진
	 */
	@RequestMapping(value="/admin/registpfm", method=RequestMethod.GET)
	public String viewRistForm(Model model) {
		// 공연 분류(장르) 가져오기
		List<Genre> genreList = pService.getGenreList();
		model.addAttribute("genreList", genreList);

		// 관람 등급 가져오기
		List<AgeGrade> ageList = pService.getAgeGradeList();
		model.addAttribute("ageList", ageList);

		// 공연장 리스트 가져오기
//		List<Hall> hallList = pService.getHallList();
//		model.addAttribute("hallList", hallList);

		// 좌석정보 가져오기(ui 뿌리기 위해)

		return "admin/pfm/registPfm";
	}

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 특정 장르에 따른 모든 테마 리스트 정보 가져오기
	 * @작성자: 전해진
	 */
	@RequestMapping(value="/viewtheme", method=RequestMethod.GET)
	public @ResponseBody List<Theme> getThemeList(
			Genre genre
			, Model model) {
		return pService.getThemeList(genre);
	}

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 검색한 이름과 일치하는 아티스트 목록 리턴
	 * @작성자: 전해진
	 */
	@RequestMapping(value="/searchartist", method=RequestMethod.GET)
	public @ResponseBody List<Artist> getArtistList(Artist artist) {
		return pService.getArtistList(artist);
	}

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 새 공연 등록하기
	 * @작성자: 전해진
	 */
	@RequestMapping(value="/admin/registpfm", method=RequestMethod.POST)
	public String registPfm(
			Performance pfm // 공연 기본 정보 (공연명, 장르, 티켓일정, 런닝타임, 관람등급)
			, @RequestParam(name="poster") MultipartFile posterUpload // 포스터 업로드 파일
			, PfmThemeList themeList // 테마 리스트
			, CastList castList // 출연진 리스트
			) {
		
		// 공연 기본 정보
		logger.info(pfm.toString());

		// 테마 정보들 등록
		logger.info(themeList.toString());

		// 출연진 등록
		logger.info(castList.toString());
		
		// 좌석 정보 & 가격 등록
		// 공연 날짜 & 시간 등록
		// 공연 상세 정보 등록
		// 예매 상세 정보 등록

		// 새 공연 등록
		pService.registPfm(pfm, posterUpload, themeList, castList);
		
		return "redirect:/admin/registpfm";
	}

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 공연 정보 수정 폼 띄우기
	 * @작성자: 전해진
	 */
	@RequestMapping(value="/admin/pfm/editpfm", method=RequestMethod.GET)
	public void editForm(
			Performance pfm
			,Model model
			) {
	}

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 공연 정보 수정하기
	 * @작성자: 전해진
	 */
	@RequestMapping(value = "/admin/pfm/editpfm", method = RequestMethod.POST)
	public void editPfm() {

		//
	}

	/**
	 * 2018.12.05
	 * 
	 * @Method설명: 카테고리 배너 - 콘서트 부분 리스트 불러오기
	 * @작성자: 박주희
	 */
	@RequestMapping(value = "/admin/pfm/cateCon", method = RequestMethod.GET)
	public void viewCategoryCon() {
//		- 카테고리는 '콘서트', '뮤지컬&공연', '가족&아동' 이 있다.
//		- 각 카테고리 탭을 클릭하면 배너 목록을 확인할 수 있고, 등록된 공연이 15개 이하인 경우
//		  제일 마지막에 등록된 공연의 다음 칸에  '추가하기' 버튼을 띄워준다.

		logger.info("/admin/pfm/cateCon GET");

	}

	/**
	 * @최종수정일: 2018.12.07
	 * @Method설명:카테고리 배너 - 콘서트 배너 등록 하기
	 * @작성자:
	 */
	@RequestMapping(value = "/admin/registcateCon", method = RequestMethod.GET)
	public String registerCategoryCon(Model model) {

		// String path = context.getRealPath("upload")+"\\dddd.PNG";
		// logger.info(path+"\\공연포스터.PNG_7de7e959");
		List<String> test = new ArrayList<String>();
		test.add("포스터1");
		test.add("포스터2");
		test.add("포스터3");
		// model.addAttribute("path", path);
		model.addAttribute("test", test);

		return "admin/pfm/registcateCon";
	}

	/**
	 * @최종수정일: 2018.12.07
	 * @Method설명:카테고리 배너 - 콘서트 배너 등록 하기
	 * @작성자:
	 */
	@RequestMapping(value = "/admin/registcateCon", method = RequestMethod.POST)
	public String registerCategoryConProc(Model model) {

		logger.info("POST");

		return "admin/pfm/registcateCon";
	}

	/**
	 * 2018.12.05
	 * 
	 * @Method설명: 카테고리 배너 - 뮤지컬&공연 부분 리스트 불러오기
	 * @작성자: 박주희
	 */
	@RequestMapping(value = "/admin/pfm/cateMu", method = RequestMethod.GET)
	public void viewCategorymu() {
//		- 카테고리는 '콘서트', '뮤지컬&공연', '가족&아동' 이 있다.
//		- 각 카테고리 탭을 클릭하면 배너 목록을 확인할 수 있고, 등록된 공연이 15개 이하인 경우
//		  제일 마지막에 등록된 공연의 다음 칸에  '추가하기' 버튼을 띄워준다.

	}

	/**
	 * 2018.12.05
	 * 
	 * @Method설명: 카테고리 배너 - 뮤지컬&공연 배너 등록 하기
	 * @작성자: 박주희
	 */
	@RequestMapping(value = "/admin/pfm/cateMu", method = RequestMethod.POST)
	public void registerCategoryMu() {
//		- 배너는 각 분류별로 15개 까지만 등록이 가능하다.
//		- '추가하기' 버튼을 누르면 각 분류별로 필터링된 공연 목록들과 검색창이 있는 모달창을
//		  띄워준다.
//		- 배너를 추가한 후에 '최종 저장' 버튼을 클릭하면 최종적으로 사이트에 적용된다.
//		- '최종저장' 버튼은 수정 사항이 생겼을 경우에만 활성화된다.
//		- 15개 중 등록되지 않은 배너는 '기본 이미지'로 채워준다.
	}

	/**
	 * 2018.12.05
	 * 
	 * @Method설명: 카테고리 배너 - 가족&아동 부분 리스트 불러오기
	 * @작성자: 박주희
	 */
	@RequestMapping(value = "/admin/pfm/cateFam", method = RequestMethod.GET)
	public void viewCategoryFam() {
//		- 카테고리는 '콘서트', '뮤지컬&공연', '가족&아동' 이 있다.
//		- 각 카테고리 탭을 클릭하면 배너 목록을 확인할 수 있고, 등록된 공연이 15개 이하인 경우
//		  제일 마지막에 등록된 공연의 다음 칸에  '추가하기' 버튼을 띄워준다.

	}

	/**
	 * 2018.12.05
	 * 
	 * @Method설명: 카테고리 배너 - 가족&아동 배너 등록 하기
	 * @작성자: 박주희
	 */
	@RequestMapping(value = "/admin/pfm/registcateFam", method = RequestMethod.GET)
	public void registerCategoryFam() {
//		- 배너는 각 분류별로 15개 까지만 등록이 가능하다.
//		- '추가하기' 버튼을 누르면 각 분류별로 필터링된 공연 목록들과 검색창이 있는 모달창을
//		  띄워준다.
//		- 배너를 추가한 후에 '최종 저장' 버튼을 클릭하면 최종적으로 사이트에 적용된다.
//		- '최종저장' 버튼은 수정 사항이 생겼을 경우에만 활성화된다.
//		- 15개 중 등록되지 않은 배너는 '기본 이미지'로 채워준다.

	}

	@RequestMapping(value = "/admin/pfm/registcateFam", method = RequestMethod.POST)
	public void registerCategoryFam(@RequestParam(value = "title") String title,
			@RequestParam(value = "file") MultipartFile fileupload) {
//		- 배너는 각 분류별로 15개 까지만 등록이 가능하다.
//		- '추가하기' 버튼을 누르면 각 분류별로 필터링된 공연 목록들과 검색창이 있는 모달창을
//		  띄워준다.
//		- 배너를 추가한 후에 '최종 저장' 버튼을 클릭하면 최종적으로 사이트에 적용된다.
//		- '최종저장' 버튼은 수정 사항이 생겼을 경우에만 활성화된다.
//		- 15개 중 등록되지 않은 배너는 '기본 이미지'로 채워준다.
		logger.info(title + "GET");

		pService.addFamPoster(context, fileupload);
	}

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 공연 정보 삭제하기
	 * @작성자: 전해진
	 */
	@RequestMapping(value = "/admin/pfm/deletePfm", method = RequestMethod.GET)
	public String deletePfm(Performance pfm) {

		return "redirect:/";
	}

	/**
	 * @최종수정일: 2018.12.06
	 * @Method설명: 장르별로 공연 전체 목록 조회하기
	 * @작성자: 김지은
	 */
	@RequestMapping(value = "/admin/pfm/pfmList", method = RequestMethod.GET)
	public void allPfmList(
	// 검색어
	) {
		// 1.검색어가 없는 경우(처음에 목록 띄워줄때)
		// 장르별 공연 전체 목록 가져오기

		// 2.검색어가 있는 경우
		// 장르별 공연 목록에 검색어 적용해서 가져오기
	}

	/**
	 * @최종수정일: 2018.12.06
	 * @Method설명: 공연 목록의 정렬 바꿔주기
	 * @작성자: 김지은
	 */
	@RequestMapping(value = "/admin/pfm/pfmList", method = RequestMethod.POST)
	public void setOrder() {
		// 정렬타입에 따라서 다시 정렬
	}

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 메인 배너 리스트 불러오기
	 * @작성자: 김지은
	 */
	@RequestMapping(value = "/admin/pfm/mBannerList", method = RequestMethod.GET)
	public void mBannerList() {
		// logger.info("PfmController의 mainBannerList() 호출됨");
		// List mBannerList = pService.getMBannerList
	}

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 메인 배너 등록/수정 폼 띄우기(배너 수정 또는 등록 클릭시 여기로)
	 * @작성자: 김지은
	 */
	@RequestMapping(value = "/admin/pfm/editMainBanner", method = RequestMethod.GET)
	public void editMBanner() {
		// 공연 정보 받기(null이면 빈칸표시, 등록된 값이 있으면 값 띄워주기)
		// null(배너 등록)일 경우 빈값 뷰에 전달, 값이 있을 경우(배너 수정)에는 그 값 뷰에 전달

		// 썸네일, 배너 정보 받기(null이면 빈칸표시, 등록된 값이 있으면 값 띄워주기)
		// null(배너 등록)일 경우 빈값 뷰에 전달, 값이 있을 경우(배너 수정)에는 그 값 뷰에 전달
	}

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 메인 배너 최종등록하기(최종저장 버튼 활성화는 jsp에서...??)
	 * @작성자: 김지은
	 */
	@RequestMapping(value = "/admin/pfm/registMBanner", method = RequestMethod.POST)
	public void registMBanner() {
		// 공연 정보 받기
		// Performance pfm = pService.getPfmInfo()

		// 썸네일, 배너 정보 받기
		// MainBanner mBanner = pService.getMBanner()

		// 배너 등록하기 pService.registMBanner(정보들)
	}

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 메인 배너 등록 페이지에서 공연 검색 결과 가져오기
	 * @작성자: 김지은
	 */
	@RequestMapping(value = "/admin/pfm/searchPfm")
	public void searchPfm(
	// 검색어
	) {
		// 검색어에 따른 결과 리스트 가져오기
		// 검색어 가져와서 null이면 전체 목록 최신순/가나다순 목록 가져오기
		// 검색어 값 있으면 검색어+최신순/가나다순 목록 가져오기
		// 최신순 리스트 가져오기
		// pService.getNewestSearchList(검색어)

		// 가나다순 리스트 가져오기
		// pService.getAlphaSearchList(검색어)
	}

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 탭 배너 목록 불러오기
	 * @작성자: 김지은
	 */
	@RequestMapping(value = "/admin/pfm/tBannerList", method = RequestMethod.GET)
	public void tBannerList() {

		// 장르가 New 인 탭 배너 리스트 불러오기
		// **그러면 장르에 New 넣어도 되는지??
		// List newTabBanner = pService.getNewTabBanner()

		// 장르가 콘서트인 탭 배너 리스트 불러오기
		// List conTabBanner = pService.getConTabBanner()

		// 장르가 뮤지컬인 탭 배너 리스트 불러오기
		// List muTabBanner = pService.getMuTabBanner()

		// 뷰에 전달
	}

	/**
	 * @최종수정일: 2018.12.06
	 * @Method설명: 탭배너 등록 모달창에서 공연 리스트 띄우기
	 * @작성자: 김지은
	 */
	@RequestMapping(value = "/admin/pfm/tBannerList", method = RequestMethod.POST)
	public void searchTBannerPfm(
	// 검색어
	) {
		// 검색어 받아오기

		// if(검색어 null 일때 == 처음 모달창 띄워줄때)
		// New, 콘서트, 뮤지컬 전체 목록 가져오기

		// else(검색어 있을때)
		// 검색어 적용된 New, 콘서트, 뮤지컬 목록 가져오기
	}

	/**
	 * @최종수정일: 2018.12.06
	 * @Method설명: 탭배너 등록 모달창에서 정렬(최신순/가나다순) 처리하기
	 * @작성자: 김지은
	 */
	@RequestMapping(value = "/admin/pfm/tBannerOrder")
	public void tBannerSearchOrder() {
		// 정렬 타입에 따라 다시 정렬해주기
	}

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 탭 배너 최종 저장하기(탭배너 페이지에서 최종저장버튼 활성화됐을때만 가능)
	 * @작성자: 김지은
	 */
	@RequestMapping(value = "/admin/pfm/registTBanner", method = RequestMethod.POST)
	public void registTBanner() {
		// 질문 : 탭배너에는 New/콘서트/뮤지컬 3분류가 있는데
		// 디비에 저장될때는 분류 상관없이 그냥 등록된 순서대로 저장되는 것인지

		// 뉴 탭 배너 리스트 가져오기
		// 콘서트 배너 리스트 가져오기
		// 뮤지컬 배너 리스트 가져오기

		// 디비에 인서트
	}
}
