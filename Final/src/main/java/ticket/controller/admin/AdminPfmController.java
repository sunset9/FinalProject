package ticket.controller.admin;

import java.io.IOException;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import ticket.dto.AgeGrade;
import ticket.dto.Artist;
import ticket.dto.CastList;
import ticket.dto.CategoryCon;
import ticket.dto.CategoryMu;
import ticket.dto.Genre;
import ticket.dto.Hall;
import ticket.dto.Performance;
import ticket.dto.PfmDateByTimeList;
import ticket.dto.PfmThemeList;
import ticket.dto.Poster;
import ticket.dto.Theme;
import ticket.service.admin.face.AdminPfmService;
import ticket.utils.Paging;

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
	@RequestMapping(value = "/admin/registpfm", method = RequestMethod.GET)
	public String viewRistForm(Model model) {
		// 공연 분류(장르) 가져오기
		List<Genre> genreList = pService.getGenreList();
		model.addAttribute("genreList", genreList);

		// 관람 등급 가져오기
		List<AgeGrade> ageList = pService.getAgeGradeList();
		model.addAttribute("ageList", ageList);

		// 공연장 리스트 가져오기
		List<Hall> hallList = pService.getHallList();
		model.addAttribute("hallList", hallList);

		// 좌석정보 가져오기(ui 뿌리기 위해)

		return "admin/pfm/registPfm";
	}

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 특정 장르에 따른 모든 테마 리스트 정보 가져오기
	 * @작성자: 전해진
	 */
	@RequestMapping(value = "/viewtheme", method = RequestMethod.GET)
	public @ResponseBody List<Theme> getThemeList(Genre genre, Model model) {
		return pService.getThemeList(genre);
	}

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 검색한 이름과 일치하는 아티스트 목록 리턴(페이징)
	 * @작성자: 전해진
	 */
	@RequestMapping(value = "/searchartist", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> getArtistList(
			Artist artist
			,@RequestParam(defaultValue="1") int curPage
			, Model model
		) {
		// 페이징 계산
		int totalCnt = pService.getArtistSearchCnt(artist);
		Paging paging = new Paging(totalCnt, curPage, 8, 4);
		
		// HashMap 을 통해 결과값 넘기기
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<Artist> artists = pService.getArtistList(artist, paging);
		map.put("artists", artists);
		map.put("paging", paging);
		
		return map;
	}

	/**
	 * @최종수정일: 2018.12.09
	 * @Method설명: 새 공연 등록하기
	 * @작성자: 전해진
	 */
	@RequestMapping(value = "/admin/registpfm", method = RequestMethod.POST)
	public String registPfm(Performance pfm // 공연 기본 정보 (공연명, 장르, 티켓일정, 런닝타임, 관람등급, 공연장)
			, @RequestParam(name = "poster") MultipartFile posterUpload // 포스터 업로드 파일
			, PfmThemeList themeList // 테마 리스트
			, CastList castList // 출연진 리스트
			, PfmDateByTimeList pfmDbtList // 공연 일정 리스트
			, String pfmDetailContents // 예매상세 내용
			, String pfmBookinfoContents // 예약 상태 내용
			) {
		// 공연 기본 정보
		logger.info(pfm.toString());

		// 테마 정보들 등록
		logger.info(themeList.toString());

		// 출연진 등록
		logger.info(castList.toString());

		// 좌석 정보 & 가격 등록
		
		// 공연 날짜 & 시간 등록
		logger.info(pfmDbtList.toString());

		// 공연 상세 정보 등록
		logger.info(pfmDetailContents);

		// 예매 상세 정보 등록
		logger.info(pfmBookinfoContents);

		// 새 공연 등록
		pService.registPfm(pfm, posterUpload, themeList, castList, pfmDbtList
				,pfmDetailContents, pfmBookinfoContents);
		return "redirect:/admin/registpfm";
	}

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 공연 정보 수정 폼 띄우기
	 * @작성자: 전해진
	 */
	@RequestMapping(value = "/admin/pfm/editpfm", method = RequestMethod.GET)
	public void editForm(Performance pfm, Model model) {
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
//18.12.10 현재 안쓰이는 함수 
	}

	/**
	 * @최종수정일: 2018.12.07
	 * @Method설명:카테고리 배너 - 콘서트 배너 등록 하기
	 * @작성자:
	 */
	@RequestMapping(value = "/admin/registcatecon", method = RequestMethod.GET)
	public String registerCategoryCon(Model model) {

		List<Poster> posterList = pService.getListCon();
		List<Poster> modalList = pService.getModalListCon();
		if (modalList != null)
			model.addAttribute("list", modalList);
		if (posterList != null)
			model.addAttribute("posterList", posterList);

		return "admin/pfm/registcatecon";
	}

	/**
	 * @최종수정일: 2018.12.07
	 * @Method설명:카테고리 배너 - 콘서트 배너 등록 하기
	 * @작성자:
	 */
	@RequestMapping(value = "/admin/registcatecon", method = RequestMethod.POST)
	public String registerCategoryConProc(@RequestParam(value = "pfmIdx") List<String> pfmIdx, Model model) {

		logger.info(pfmIdx.toString());
		logger.info("POST");
		for (int i = 0; i < pfmIdx.size(); i++) { // 받은 포스터 개수 만큼
			CategoryCon con = new CategoryCon();
			con.setPfmIdx(Integer.parseInt(pfmIdx.get(i)));
			pService.addCon(con);// 개수만큼 insert
		}

		return "redirect:/admin/registcatecon";
	}

	/**
	 * @최종수정일: 2018.12.09
	 * @Method설명: 카테고리 콘서트 배너 정보 삭제하기
	 * @작성자: 박주희
	 */
	@RequestMapping(value = "/admin/deletecatecon/{pfmIdx}", method = RequestMethod.GET)
	public String deletecateCon(@PathVariable int pfmIdx) {

		logger.info("delete category banner consert GET");
		logger.info(pfmIdx + "");
		CategoryCon con = new CategoryCon();
		con.setPfmIdx(pfmIdx);
		pService.removeCon(con);
		return "redirect:/admin/registcatecon";
	}

	@RequestMapping(value = "/searchposter", method = RequestMethod.GET)
	public @ResponseBody List<Poster> searchPoster(@RequestParam String searchPoster) {
		return pService.getSearchListForCon(searchPoster);
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
//안쓰임 메소드 18.12.10
	}

	/**
	 * 2018.12.10
	 * 
	 * @Method설명: 카테고리 배너 - 뮤지컬&공연 배너 등록 하기
	 * @작성자: 박주희
	 */
	@RequestMapping(value = "/admin/registcatemu", method = RequestMethod.GET)
	public String registerCategoryMu(Model model) {
		List<Poster> posterList = pService.getListMu();
		List<Poster> modalList = pService.getModalListMu();
		if (modalList != null)
			model.addAttribute("list", modalList);
		if (posterList != null)
			model.addAttribute("posterList", posterList);
		return "admin/pfm/registcatemu";
	}

	/**
	 * 2018.12.10
	 * 
	 * @Method설명: 카테고리 배너 - 뮤지컬&공연 배너 등록 하기
	 * @작성자: 박주희
	 */
	@RequestMapping(value = "/admin/registcatemu", method = RequestMethod.POST)
	public @ResponseBody String registerCategoryMuProc(@RequestParam(value = "pfmIdx") List<String> pfmIdx, Model model) {
		logger.info(pfmIdx.toString());
		logger.info("POST");

		if (pfmIdx.size() == 0) {
			return "0";
		}
		for (int i = 0; i < pfmIdx.size(); i++) { // 받은 포스터 개수 만큼
			CategoryMu mu = new CategoryMu();
			mu.setPfmIdx(Integer.parseInt(pfmIdx.get(i)));
			pService.addMu(mu);// 개수만큼 insert
		}

		return "1";

	}
	/**
	 * @최종수정일: 2018.12.09
	 * @Method설명: 카테고리 뮤지컬&공연 배너 정보 삭제하기
	 * @작성자: 박주희
	 */
	@RequestMapping(value = "/admin/deletecatemu/{pfmIdx}", method = RequestMethod.GET)
	public String deletecateMu(@PathVariable int pfmIdx) {

		logger.info("delete category banner mu GET");
		logger.info(pfmIdx + "");
		CategoryMu con = new CategoryMu();
		con.setPfmIdx(pfmIdx);
		pService.removeMu(con);
		return "redirect:/admin/registcatemu";
	}

	@RequestMapping(value = "/searchpostermu", method = RequestMethod.GET)
	public @ResponseBody List<Poster> searchPosterMu(@RequestParam String searchPoster) {
		return pService.getSearchListForMu(searchPoster);
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

	/**
	 * @최종수정일: 2018.12.10
	 * @Method설명: 공연 등록 부분 - 이미지 업로드 처리(상세정보, 예매정보)
	 * @작성자: 전해진
	 */
	@RequestMapping(value = "/admin/uploadpfmimg", method = RequestMethod.POST)
	public void uploadPfmInfoImg(
			@RequestParam(name = "file") MultipartFile pfmImgUpload
			, HttpServletResponse response) {
		Map<Object, Object> responseData = pService.uploadPfmImg(pfmImgUpload);

		String jsonResponseData = new Gson().toJson(responseData);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(jsonResponseData);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}	
	
	/**
	 * @최종수정일: 2018.12.10
	 * @Method설명:공연 등록 부분 - 이미지 삭제 처리
	 * @작성자: 전해진
	 */
	@RequestMapping(value = "/admin/deletepfmimg", method = RequestMethod.POST)
	public @ResponseBody void deletePfmInfoImg(String src) {
		pService.deletePfmImg(src);
	}	
	
	/**
	 * @최종수정일: 2018.12.11
	 * @Method설명: 공연 관리 페이지 띄워주기
	 * @작성자: 전해진
	 */
	@RequestMapping(value = "/admin/managerpfm", method = RequestMethod.GET)
	public String viewPfmManager() {
		
		return "admin/pfm/managerPfm";
	}
}
