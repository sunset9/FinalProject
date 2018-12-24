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
import ticket.dto.CategoryFam;
import ticket.dto.CategoryMu;
import ticket.dto.Genre;
import ticket.dto.Hall;
import ticket.dto.MainBanner;
import ticket.dto.Performance;
import ticket.dto.PfmBookinfo;
import ticket.dto.PfmDateByTime;
import ticket.dto.PfmDateByTimeList;
import ticket.dto.PfmDetail;
import ticket.dto.PfmThemeList;
import ticket.dto.Poster;
import ticket.dto.SeatSection;
import ticket.dto.SeatSectionList;
import ticket.dto.TabBanner;
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
	public @ResponseBody HashMap<String, Object> getArtistList(Artist artist,
			@RequestParam(defaultValue = "1") int curPage) {

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
	 * @최종수정일: 2018.12.17
	 * @Method설명: 새 공연 등록하기
	 * @작성자: 전해진
	 */
	@RequestMapping(value = "/admin/registpfm", method = RequestMethod.POST)
	public String registPfm(
			Performance pfm // 공연 기본 정보 (공연명, 장르, 티켓일정, 런닝타임, 관람등급, 공연장)
			, @RequestParam(name = "poster") MultipartFile posterUpload // 포스터 업로드 파일
			, PfmThemeList themeList // 테마 리스트
			, CastList castList // 출연진 리스트
			, SeatSectionList seatSecList // 좌석정보
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
		logger.info(seatSecList.toString());
		
		// 공연 날짜 & 시간 등록
		logger.info(pfmDbtList.toString());

		// 공연 상세 정보 등록
		logger.info(pfmDetailContents);

		// 예매 상세 정보 등록
		logger.info(pfmBookinfoContents);

		// 새 공연 등록
		pService.registPfm(pfm, posterUpload, themeList, castList, seatSecList, pfmDbtList, pfmDetailContents, pfmBookinfoContents);
		return "redirect:/admin/managerpfm";
	}

	/**
	 * @최종수정일: 2018.12.12
	 * @Method설명: 공연 정보 수정 폼 띄우기
	 * @작성자: 전해진
	 */
	@RequestMapping(value = "/admin/editpfm", method = RequestMethod.GET)
	public String editForm(Performance pfmParam, Model model) {
		// 공연 기본 정보 가져오기
		Performance pfm = pService.getPfm(pfmParam);
		model.addAttribute("pfm", pfm);
		logger.info(pfm.toString());
		
		// 포스터 정보 가져오기
		Poster poster = pService.getPoster(pfm);
		model.addAttribute("poster", poster);
		
		// 공연 분류(장르) 가져오기
		List<Genre> genreList = pService.getGenreList();
		model.addAttribute("genreList", genreList);
				
		// 테마 정보들 가져오기
		List<Theme> thmList = pService.getTheme(pfm);
		model.addAttribute("thmList", thmList);
		
		// 공연 분류에 따른 테마 정보들 가져오기
		Genre genre = new Genre();
		genre.setGenreIdx(pfm.getGenreIdx());
		List<Theme> thmAllList = pService.getThemeList(genre);
		model.addAttribute("thmAllList", thmAllList);
		
		// 모든 관람 등급 가져오기
		List<AgeGrade> ageList = pService.getAgeGradeList();
		model.addAttribute("ageList", ageList);
				
		// 출연진 목록 가져오기
		List<Artist> artistList = pService.getArtist(pfm);
		model.addAttribute("artistList", artistList);
		
		// 모든 공연장 목록 가져오기
		List<Hall> hallList = pService.getHallList();
		model.addAttribute("hallList", hallList);
		
		// 좌석& 가격 정보 가져오기
		List<SeatSection> seatSecList = pService.getSeatSectionList(pfm);
		model.addAttribute("seatSecList", new Gson().toJson(seatSecList));
		
		// 공연일정(날짜, 시간) 정보 가져오기
		List<PfmDateByTime> pfmdbtList = pService.getPfmdbt(pfm);
//		model.addAttribute("pfmdbtList", pfmdbtList);
		model.addAttribute("pfmdbtList", new Gson().toJson(pfmdbtList));
		
		// 공연 상세 정보 가져오기
		PfmDetail detail = pService.getPfmDetail(pfm);
		model.addAttribute("detail", detail);
		
		// 예매 상세 정보 가져오기
		PfmBookinfo bookinfo = pService.getPfmBookinfo(pfm);
		model.addAttribute("bookinfo", bookinfo);
		 
		return "admin/pfm/editPfm";
	}

	/**
	 * @최종수정일: 2018.12.17
	 * @Method설명: 공연 정보 수정하기
	 * @작성자: 전해진
	 */
	@RequestMapping(value = "/admin/editpfm", method = RequestMethod.POST)
	public String editPfm(
			Performance pfm // 공연 기본 정보 (공연명, 장르, 티켓일정, 런닝타임, 관람등급, 공연장)
			, @RequestParam(name = "poster") MultipartFile posterUpload // 포스터 업로드 파일
			, PfmThemeList themeList // 테마 리스트
			, CastList castList // 출연진 리스트
			, SeatSectionList seatSecList // 좌석정보
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
		logger.info(seatSecList.toString());
		
		// 공연 날짜 & 시간 등록
		logger.info(pfmDbtList.toString());

		// 공연 상세 정보 등록
		logger.info(pfmDetailContents);

		// 예매 상세 정보 등록
		logger.info(pfmBookinfoContents);
		
		// 공연 수정
		pService.editPfm(pfm, posterUpload, themeList, castList, seatSecList, pfmDbtList, pfmDetailContents, pfmBookinfoContents);
		
		return "redirect:/admin/managerpfm";
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
	public String registerCategoryCon(Model model, @RequestParam(defaultValue = "1") int curPage) {

		List<Poster> posterList = pService.getListCon();// selectBypfmIdx();
		int totalCnt = pService.getModalListConCnt();
		Paging paging = new Paging(totalCnt, curPage, 6, 5);
		List<Poster> modalList = pService.getModalListCon(paging);
		Gson jsonParser = new Gson();
		
		if (modalList != null)
			model.addAttribute("list", jsonParser.toJson(modalList));
		if (posterList != null)
			model.addAttribute("posterList", posterList);
		if (paging != null)
			model.addAttribute("paging", jsonParser.toJson(paging));
		int cnt = 0;
		cnt = pService.getListAllCntCon();
		model.addAttribute("cnt", cnt);
		return "admin/pfm/registcatecon";
	}

	/**
	 * @최종수정일: 2018.12.11
	 * @Method설명:ajax 통신용
	 * @작성자:박주희
	 */
	@RequestMapping(value = "/pagingcatecon", method = RequestMethod.GET)
	public @ResponseBody HashMap ajaxCategoryCon(@RequestParam(defaultValue = "1") int curPage) {
		logger.info(curPage + "");
		int totalCnt = pService.getModalListConCnt();
		Paging paging = new Paging(totalCnt, curPage, 6, 5);
		List<Poster> modalList = pService.getModalListCon(paging);
//		Gson jsonParser = new Gson();
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (modalList != null) {
			map.put("list", modalList);
			map.put("paging", paging);
		}
		return map;
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
		// pfmIdx 값을 파라미터로 넘겨 받아서 
		logger.info("delete category banner consert GET");
		logger.info(pfmIdx + "");
		CategoryCon con = new CategoryCon();
		con.setPfmIdx(pfmIdx); // categorycon 에 넣어서 
		pService.removeCon(con); //지워줌 
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
	 * @최종수정일:2018.12.10
	 * @Method설명: 카테고리 배너 - 뮤지컬&공연 배너 등록 하기
	 * @작성자: 박주희
	 */
	@RequestMapping(value = "/admin/registcatemu", method = RequestMethod.GET)
	public String registerCategoryMu(Model model, @RequestParam(defaultValue = "1") int curPage) {
		List<Poster> posterList = pService.getListMu();
		int totalCnt = pService.getModalListMuCnt();
		Paging paging = new Paging(totalCnt, curPage, 8, 5);
		List<Poster> modalList = pService.getModalListMu(paging);
		Gson jsonParser = new Gson();
		if (modalList != null)
			model.addAttribute("list", jsonParser.toJson(modalList));
		if (posterList != null)
			model.addAttribute("posterList", posterList);
		if (paging != null)
			model.addAttribute("paging", jsonParser.toJson(paging));
		int cnt = 0;
		cnt = pService.getListAllCntMu();
		model.addAttribute("cnt", cnt);
		return "admin/pfm/registcatemu";
	}

	/**
	 * @최종수정일: 2018.12.11
	 * @Method설명: ajax 통신용(페이징) 뮤지컬 배너 (카테고리)
	 * @작성자:박주희
	 */
	@RequestMapping(value = "/pagingcatemu", method = RequestMethod.GET)
	public @ResponseBody HashMap ajaxCategoryMu(@RequestParam(defaultValue = "1") int curPage) {
		logger.info(curPage + "");
		int totalCnt = pService.getModalListMuCnt();
		Paging paging = new Paging(totalCnt, curPage, 4, 5);
		List<Poster> modalList = pService.getModalListMu(paging);
//		Gson jsonParser = new Gson();
		HashMap<String, Object> map = new HashMap<String, Object>();

		if (modalList != null) {
			map.put("list", modalList);
			map.put("paging", paging);
		}
		return map;
	}

	/**
	 * 2018.12.10
	 * 
	 * @Method설명: 카테고리 배너 - 뮤지컬&공연 배너 등록 하기
	 * @작성자: 박주희
	 */
	@RequestMapping(value = "/admin/registcatemu", method = RequestMethod.POST)
	public String registerCategoryMuProc(@RequestParam(value = "pfmIdx") List<String> pfmIdx,
			Model model) {
		logger.info(pfmIdx.toString());
		logger.info("POST");
		for (int i = 0; i < pfmIdx.size(); i++) { // 받은 포스터 개수 만큼
			CategoryMu mu = new CategoryMu();
			mu.setPfmIdx(Integer.parseInt(pfmIdx.get(i)));
			pService.addMu(mu);// 개수만큼 insert
		}
		return "redirect:/admin/registcatemu";
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

	/**
	 * @최종수정일: 2018.12.17
	 * @Method설명:카테고리 배너중 뮤지컬 배너 검색
	 * @작성자:박주희
	 */
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
	@RequestMapping(value = "/admin/registcatefam", method = RequestMethod.GET)
	public String registerCategoryFam(Model model, @RequestParam(defaultValue = "1") int curPage) {
		List<Poster> posterList = pService.getListFam();// selectBypfmIdx();
		int totalCnt = pService.getModalListFamCnt();
		Paging paging = new Paging(totalCnt, curPage, 8, 5);
		List<Poster> modalList = pService.getModalListFam(paging);
		Gson jsonParser = new Gson();
		if (modalList != null)
			model.addAttribute("list", jsonParser.toJson(modalList));
		if (posterList != null)
			model.addAttribute("posterList", posterList);
		if (paging != null)
			model.addAttribute("paging", jsonParser.toJson(paging));

		int cnt = 0;
		cnt = pService.getListAllCntFam();
		model.addAttribute("cnt", cnt);
		return "admin/pfm/registcatefam";
	}

	/**
	 * @최종수정일: 2018.12.11
	 * @Method설명:Ajax 통신(페이징) 카테고리 가족
	 * @작성자:박주희
	 */
	@RequestMapping(value = "/pagingcatefam", method = RequestMethod.GET)
	public @ResponseBody HashMap ajaxCategoryFam(@RequestParam(defaultValue = "1") int curPage) {
		logger.info(curPage + "");
		int totalCnt = pService.getModalListFamCnt();
		Paging paging = new Paging(totalCnt, curPage, 8, 5);
		List<Poster> modalList = pService.getModalListFam(paging);
//		Gson jsonParser = new Gson();
		HashMap<String, Object> map = new HashMap<String, Object>();

		if (modalList != null) {
			map.put("list", modalList);
			map.put("paging", paging);
		}
		return map;
	}

	/**
	 * @최종수정일: 2018.12.17
	 * @Method설명:카테고리 배너 중 가족&아동 배너 등록
	 * @작성자:박주희
	 */
	@RequestMapping(value = "/admin/registcatefam", method = RequestMethod.POST)
	public String registerCategoryFam(@RequestParam(value = "pfmIdx") List<String> pfmIdx, Model model) {
		for (int i = 0; i < pfmIdx.size(); i++) { // 받은 포스터 개수 만큼
			CategoryFam fam = new CategoryFam();
			fam.setPfmIdx(Integer.parseInt(pfmIdx.get(i)));
			pService.addFam(fam);// 개수만큼 insert
		}
		return "redirect:/admin/registcatefam";
	}

	/**
	 * @최종수정일: 2018.12.17
	 * @Method설명:카테고리 배너 중 가족&아동 배너 삭제 
	 * @작성자:박주희
	 */
	@RequestMapping(value = "/admin/deletecatefam/{pfmIdx}", method = RequestMethod.GET)
	public String deletecateFam(@PathVariable int pfmIdx) {

		logger.info("delete category banner fam GET");
		logger.info(pfmIdx + "");
		CategoryFam fam = new CategoryFam();
		fam.setPfmIdx(pfmIdx);
		pService.removeFam(fam);
		return "redirect:/admin/registcatemu";
	}

	/**
	 * @최종수정일: 2018.12.17
	 * @Method설명: 카테고리 배너 중 가족&아동 배너 검색 결과 
	 * @작성자:박주희
	 */
	@RequestMapping(value = "/searchposterfam", method = RequestMethod.GET)
	public @ResponseBody List<Poster> searchPosterFam(@RequestParam String searchPoster) {
		return pService.getSearchListForFam(searchPoster);
	}

	/**
	 * @최종수정일: 2018.12.18
	 * @Method설명: 공연 정보 삭제하기
	 * @작성자: 전해진
	 */
	@RequestMapping(value = "/admin/deletePfm", method = RequestMethod.GET)
	public String deletePfm(Performance pfm) {
		pService.deletePfm(pfm);
		return "redirect:/admin/managerpfm";
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
	@RequestMapping(value = "/admin/mainbannerlist", method = RequestMethod.GET)
	public String mBannerList(Model model) {
		logger.info("PfmController의 mainBannerList() 호출됨");
		// List mBannerList = pService.getMBannerList
		List<MainBanner> mBannerList = pService.getMBannerList();
		logger.info("메인 배너 리스트 확인 : "+mBannerList.toString());
		
		model.addAttribute("mBannerList", mBannerList);
		
		return "admin/pfm/mainBannerList"; 
	}

	/**
	 * @최종수정일: 2018.12.19
	 * @Method설명: 메인 배너 삭제하기
	 * @작성자: 김지은
	 */
	@RequestMapping(value="/admin/mainbannerdelete", method=RequestMethod.GET)
	public String mBannerDelete(int mainbanIdx) {
		
		System.out.println("mainbanIdx : "+mainbanIdx);
		
		//mainbanIdx를 이용해서 메인 배너 삭제하기
		pService.deleteMainBanner(mainbanIdx);
		
		return "redirect:/admin/mainbannerlist";
	}
	
	/**
	 * @최종수정일: 2018.12.19
	 * @Method설명: 새 메인 배너 등록하기
	 * @작성자: 김지은
	 */
	@RequestMapping(value="/admin/registMainbanner", method=RequestMethod.GET)
	public String registMBanner() {
	
		return "admin/pfm/registMBanner";
	}
	
	@RequestMapping(value="/admin/registMainbanner", method=RequestMethod.POST)
	public String registMBannerProc() {
	
		return "admin/pfm/registMBanner";
	}
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 메인 배너 등록/수정 폼 띄우기(배너 수정 또는 등록 클릭시 여기로)
	 * @작성자: 김지은
	 */
	@RequestMapping(value = "/admin/editmainbanner", method = RequestMethod.GET)
	public String editMBanner(Model model) {
		// 공연 정보 받기(null이면 빈칸표시, 등록된 값이 있으면 값 띄워주기)
		// null(배너 등록)일 경우 빈값 뷰에 전달, 값이 있을 경우(배너 수정)에는 그 값 뷰에 전달

		// 썸네일, 배너 정보 받기(null이면 빈칸표시, 등록된 값이 있으면 값 띄워주기)
		// null(배너 등록)일 경우 빈값 뷰에 전달, 값이 있을 경우(배너 수정)에는 그 값 뷰에 전달
		
		return "admin/pfm/editMainBanner";
	}

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 메인 배너 최종등록하기(최종저장 버튼 활성화는 jsp에서...??)
	 * @작성자: 김지은
	 */
	@RequestMapping(value = "/admin/pfm/mainbannerfs", method = RequestMethod.POST)
	public void mbFinalSave() {
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
	@RequestMapping(value = "/admin/tabBannerList", method = RequestMethod.GET)
	public String tBannerList(Model model) {

		// 장르가 New 인 탭 배너 리스트 불러오기
		List<TabBanner> newTabBanner = pService.getNewTabBanner();

		// 장르가 콘서트인 탭 배너 리스트 불러오기
		List<TabBanner> conTabBanner = pService.getConTabBanner();
		
		// 장르가 뮤지컬인 탭 배너 리스트 불러오기
		List<TabBanner> muTabBanner = pService.getMuTabBanner();
		
		// 뷰에 전달
		model.addAttribute("newTabBanner", newTabBanner);
		model.addAttribute("conTabBanner", conTabBanner);
		model.addAttribute("muTabBanner", muTabBanner);
		
		return "admin/pfm/tabBannerList";
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
	public void uploadPfmInfoImg(@RequestParam(name = "file") MultipartFile pfmImgUpload,
			HttpServletResponse response) {
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
	public String viewPfmManager(Model model) {
		String genre = "CON"; //목록 불러오는 기본값: 콘서트 기준
		String order = "LATEST"; // 정렬기준 기본값: 등록순
				
		// 페이징 계산
		int totalCnt = pService.getPfmCntByGenre(genre);
		Paging paging = new Paging(totalCnt, 1, 8, 4);
		
		// 특정 장르에 해당하는 공연 리스트 가져오기
		List<Performance> pfmList = pService.getPfmListByGenre(genre, order, paging);
		model.addAttribute("pfmList",pfmList);
		
		return "admin/pfm/managerPfm";
	}
	
	/**
	 * @최종수정일: 2018.12.12
	 * @Method설명: 장르에 맞는 공연 리스트 반환(장르 분류 탭 클릭시)
	 * @작성자: 전해진
	 */
	@RequestMapping(value = "/admin/viewpfmlist", method = RequestMethod.GET)
	public @ResponseBody HashMap<String,Object> getPfmList(
			String genre
			, String order
			, @RequestParam(defaultValue="1") int curPage
			) {
		
		// 페이징 계산
		int totalCnt = pService.getPfmCntByGenre(genre);
		Paging paging = new Paging(totalCnt, curPage, 8, 4);
				
		// 장르가 일치하는 공연 리스트 가져오기
		List<Performance> pfmList = pService.getPfmListByGenre(genre, order, paging);
		
		// View 로 넘겨줄 값 
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pfmList", pfmList);
		map.put("paging", paging);
		
		return map;
	}
	
	/**
	 * @최종수정일: 2018.12.12
	 * @Method설명: 공연 검색 결과 반환
	 * @작성자: 전해진
	 */
	@RequestMapping(value = "/admin/searchpfm", method = RequestMethod.GET)
	public @ResponseBody HashMap<String,Object> searchPfm(
			String keyword
			,@RequestParam(defaultValue="1") int curPage
			){
		// 페이징 계산
		int totalCnt = pService.getPfmSearchCnt(keyword);
		Paging paging = new Paging(totalCnt, curPage, 8, 4);
				
		// 검색어 일치하는 공연 리스트 가져오기
		List<Performance> pfmList = pService.getPfmSearchList(keyword, paging);
		
		// View 로 넘겨줄 값 
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pfmList", pfmList);
		map.put("paging", paging);
		
		return map;
	}

	@RequestMapping(value = "/admin/registhall", method = RequestMethod.GET)
	public String registHall() {
		logger.info("GET registhall");
		return "admin/pfm/registhall";
	}
	@RequestMapping(value = "/admin/registhall", method = RequestMethod.POST)
	public String registHallProc(Hall hall,@RequestParam MultipartFile file) {
		logger.info("POST registhall");
		//logger.info(hall.toString());
		pService.registHall(hall, file);
		return "redirect:/admin/registhall";
	}
}
