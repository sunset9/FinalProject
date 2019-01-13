package ticket.controller.admin;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		if(pfmParam.getPfmIdx() == 0) return "redirect:/admin/main";
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
	@RequestMapping(value = "/admin/deletecatecon", method = RequestMethod.GET)
	public String deletecateCon(int pfmIdx) {
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
	@RequestMapping(value = "/admin/setOrder", method = RequestMethod.GET)
	@ResponseBody
	public List<Performance> setOrder(
			@RequestParam int order,
			@RequestParam String mbPfmSearch,
			Model model
			) {
		System.out.println(order);
		System.out.println(mbPfmSearch);
		// 정렬타입에 따라서 다시 정렬
		// 0 : 최신순, 1 : 가나다순
		if(order == 0) {
			List<Performance> newPfmList = pService.getNewestPfmList(mbPfmSearch);
			System.out.println("최신순 리스트 확인 : "+newPfmList);
			return newPfmList;
		}else {
			List<Performance> alphaPfmList = pService.getAlphaPfmList();
			System.out.println("가나다순 리스트 확인 : "+alphaPfmList);
			return alphaPfmList;
		}
	}

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 메인 배너 리스트 불러오기
	 * @작성자: 김지은
	 */
	@RequestMapping(value = "/admin/mainbannerlist", method = RequestMethod.GET)
	public String mBannerList(
			Model model,
			HttpSession session
			) {
		List registList = (List) session.getAttribute("mbannerList");
		List updateList = (List) session.getAttribute("mbannerForUpdate");
		
		if(registList == null && updateList == null) {
			System.out.println("현재 저장할 메인배너 없음.");
		}else if(registList != null && updateList == null){
			System.out.println("저장할 메인 배너 있음");
			List appendList = new ArrayList();
			for(int i=0;i<registList.size(); i++) {
				Map<String, String> mbannermap = (Map<String, String>) registList.get(i);
				appendList.add(mbannermap.get("pfmIdx"));
			}
			System.out.println(appendList);
			model.addAttribute("appendList", appendList);
			model.addAttribute("appendSize", registList.size());
			model.addAttribute("existSession", "1");
		}else if(registList == null && updateList != null) {
			System.out.println("수정할 메인 배너 있음");
			model.addAttribute("existSession", "1");
		}else {
			System.out.println("저장&수정할 메인 배너 있음");
			
		}
		
		// List mBannerList = pService.getMBannerList
		List<MainBanner> mBannerList = pService.getMBannerList();
		model.addAttribute("mBannerListSize", mBannerList.size());
		model.addAttribute("mBannerList", mBannerList);
		
		
		return "admin/pfm/mainBannerList"; 
	}
	
	/**
	 * @최종수정일: 2018.12.31
	 * @Method설명: 메인 배너 등록 요청 파라미터 받기
	 * @작성자: 김지은
	 */
	@RequestMapping(value="/admin/mainbannerlist", method = RequestMethod.POST)
	public String mBannerList2(
			@RequestParam(value="pfmIdx") List<String> pfmIdx
			) {

		
		return "admin/pfm/mainBannerList"; 
	}
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 메인 배너 최종등록하기(최종저장 버튼 활성화는 jsp에서...??)
	 * @작성자: 김지은
	 */
	@RequestMapping(value = "/admin/mbfinalsave", method = RequestMethod.GET)
	public String mbFinalSave(
			HttpSession session
			) {
		//세션에 있는 메인배너리스트 디비에 인서트 & 서버에 사진 저장
		List list = (List) session.getAttribute("mbannerList");
		if(list != null) {
			for(int i = 0; i<list.size(); i++) {
				Map<Object, Object> map = (Map<Object, Object>) list.get(i);

				MainBanner mainbanner = new MainBanner();
				String pfmIdx = (String)map.get("pfmIdx");
				mainbanner.setPfmIdx(Integer.parseInt(pfmIdx));
				mainbanner.setThumbImgOri((String)map.get("thumbOrigin"));
				mainbanner.setThumbImgStr((String)map.get("thumbStored"));
				mainbanner.setBannerImgOri((String)map.get("bannerOrigin"));
				mainbanner.setBannerImgStr((String)map.get("bannerStored"));
				
				// 파일 서버에 업로드
				pService.mainbannerfileupload((MultipartFile)map.get("thumbFile"), (String)map.get("thumbStored"));
				pService.mainbannerfileupload((MultipartFile)map.get("bannerFile"),(String)map.get("bannerStored"));
				pService.saveMainbanner(mainbanner);
			}
		}
		
		
		//디비 업데이트
		List updateList = (List) session.getAttribute("mbannerForUpdate");
		if(updateList != null) {
			for(int i = 0; i<updateList.size(); i++) {
				Map<Object, Object> map = (Map<Object, Object>) updateList.get(i);
				
				MainBanner mainbanner = new MainBanner();
				String pfmIdx = (String)map.get("pfmIdx");
				mainbanner.setPfmIdx(Integer.parseInt(pfmIdx));
				mainbanner.setThumbImgOri((String)map.get("thumbOrigin"));
				mainbanner.setThumbImgStr((String)map.get("thumbStored"));
				mainbanner.setBannerImgOri((String)map.get("bannerOrigin"));
				mainbanner.setBannerImgStr((String)map.get("bannerStored"));
				
				// 파일 서버에 업로드
				pService.mainbannerfileupload((MultipartFile)map.get("thumbFile"), (String)map.get("thumbStored"));
				pService.mainbannerfileupload((MultipartFile)map.get("bannerFile"),(String)map.get("bannerStored"));
				pService.updateMainbanner(mainbanner);
			}
		}
		
		
		session.removeAttribute("mbannerList");
		session.removeAttribute("mbannerForUpdate");
		mbannerList.clear();
		mbannerForUpdate.clear();
		
		System.out.println("세션 최종 저장 후 삭제 "+mbannerList);
		System.out.println("세션 최종 수정 후 삭제 "+mbannerForUpdate);
		return "redirect:/admin/mainbannerlist";
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
	@RequestMapping(value="/admin/regMainbanner", method=RequestMethod.GET)
	public String registMBanner(
			HttpServletRequest req,
			Model model,
			@RequestParam(defaultValue="1") int curPage
//			@RequestParam(defaultValue="0") int lastMainbanIdx
			) {
//		String search = "";
//		if(lastMainbanIdx != 0) {
//			System.out.println("lastMainbanIdx 넘어왔니 : "+lastMainbanIdx);
//			search = req.getParameter("mainBanSearch");
//			logger.info("메인 배너 검색 결과 : "+search);
//		}
		
		String search = req.getParameter("mainBanSearch");
		
		//공연수 얻기
		int totalPfm = pService.getTotalPfm(search);
		System.out.println("공연수 확인 : "+totalPfm);
		
		//페이징 객체 생성
		Paging paging = new Paging(totalPfm, curPage, 9);
		
		//최신순 공연목록 가져오기
		List<Performance> NewPfmList = pService.getNeweastPfm(paging);
		logger.info("최신순 공연목록 : "+NewPfmList);
		
		model.addAttribute("orderList", NewPfmList);
		model.addAttribute("paging", paging);
		
		return "admin/pfm/registMBanner";
	}
	
	List mbannerList = new ArrayList<>();
	/**
	 * @최종수정일: 2018.12.27
	 * @Method설명: 메인배너등록 페이지에서 '등록'시 처리
	 * @작성자: 김지은
	 */
	@RequestMapping(value="/admin/registMainbanner", method=RequestMethod.POST)
	public String registMBannerProc(
			@RequestParam(value="pfmIdx") int pfmIdx, 
			@RequestParam(value="thumbFile") MultipartFile thumbFile,
			@RequestParam(value="bannerFile") MultipartFile bannerFile,
			HttpServletRequest req,
			HttpSession session,
			RedirectAttributes redirect
			) {
		// 파일 업로드
		//pService.fileUpload(pfmIdx, context, thumbFile, bannerFile);
		
		//UUID 고유식별자
		String uId = UUID.randomUUID().toString().split("-")[0];
		
		// file 오리진네임, 스토어드네임 구하기 
		String thumbOrigin = thumbFile.getOriginalFilename();
		String thumbStored = thumbOrigin + "_" + uId;
		
		String bannerOrigin = bannerFile.getOriginalFilename();
		String bannerStored = bannerOrigin + "_" + uId;
		
		// Map에 저장하기
		Map<Object, Object> mbannerInfo = new HashMap<>();
		mbannerInfo.put("pfmIdx", String.valueOf(pfmIdx));
		mbannerInfo.put("thumbFile", thumbFile);
		mbannerInfo.put("bannerFile", bannerFile);
		mbannerInfo.put("thumbOrigin", thumbOrigin);
		mbannerInfo.put("thumbStored", thumbStored);
		mbannerInfo.put("bannerOrigin", bannerOrigin);
		mbannerInfo.put("bannerStored", bannerStored);
		
		//리스트에 저장 + 세션에 저장
		mbannerList.add(mbannerInfo);
		session.setAttribute("mbannerList", mbannerList);
		
		
		return "redirect:/admin/mainbannerlist";
	}
	
	
	/**
	 * @최종수정일: 2018.12.28
	 * @Method설명: 메인배너 중복 등록 방지하기
	 * @작성자: 김지은
	 */
	@RequestMapping(value="/admin/checkpfmidxdup", method=RequestMethod.GET)
	public @ResponseBody int checkPfmIdxDup(
			@RequestParam int pfmIdx
			) {
		boolean isDupPfmIdx = pService.checkPfmIdxDup(pfmIdx);
		
		if(isDupPfmIdx == true) {
			// 중복x
			return 0;
		}else {
			// 중복o
			return 1;
		}
	}
	
	
	@RequestMapping(value="/admin/testJ", method=RequestMethod.GET)
	public String testJiEun() {
		
		return "admin/pfm/testModal_JiEun";
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
	public String tBannerList(
			HttpServletRequest req,
			Model model,
			@RequestParam(defaultValue="1") int curPage
			) {

		// 장르가 New 인 탭 배너 리스트 불러오기
		List<TabBanner> newTabBanner = pService.getNewTabBanner();
		// 장르가 콘서트인 탭 배너 리스트 불러오기
		List<TabBanner> conTabBanner = pService.getConTabBanner();
		// 장르가 뮤지컬인 탭 배너 리스트 불러오기
		List<TabBanner> muTabBanner = pService.getMuTabBanner();
		
		//----------------------------------------------------
		//--------------  new 모달 페이징... --------------  
		String newSearch = req.getParameter("newSearch");
		logger.info("new Search : " + newSearch);
		// 전체 공연갯수 얻기
		int totalPfm = pService.getPfmSearchCnt(newSearch);
		logger.info("totalPfm : " + totalPfm);
		// 페이징 객체 생성
		Paging paging = new Paging(totalPfm, curPage);
		// 페이징 객체에 검색어 적용
		paging.setSearch(newSearch);
		logger.info("New 모달 페이징 : " + paging);
		// 전체 공연 목록
		List<Performance> allPfmList = pService.getAllPfmList(paging);
		logger.info("allPfmList : " + allPfmList);
		
		model.addAttribute("allPfmList", allPfmList);
		//----------------------------------------------------
		
		//----------------------------------------------------
		// -------------- 콘서트 모달 페이징... --------------
		String conSearch = req.getParameter("conSearch");
		logger.info("new Search : " + conSearch);
		// 콘서트 공연갯수 얻기
		int totalConPfm = pService.getPfmSearchCnt(conSearch);
		logger.info("totalConPfm : " + totalConPfm);
		// 페이징 객체 생성
		Paging paging2 = new Paging(totalPfm, curPage);
		// 페이징 객체에 검색어 적용
		paging2.setSearch(conSearch);
		logger.info("콘서트 모달 페이징 : " + paging2);
		// 전체 공연 목록
		List<Performance> allConPfmList = pService.getAllConPfmList(paging2);
		logger.info("allConPfmList : " + allConPfmList);

		model.addAttribute("allConPfmList", allConPfmList);
		// ----------------------------------------------------
		
		//----------------------------------------------------
		// -------------- 뮤지컬 모달 페이징... --------------
		String muSearch = req.getParameter("muSearch");
		logger.info("new Search : " + muSearch);
		// 뮤지컬 공연갯수 얻기
		int totalMuPfm = pService.getPfmSearchCnt(muSearch);
		logger.info("totalMuPfm : " + totalMuPfm);
		// 페이징 객체 생성
		Paging paging3 = new Paging(totalMuPfm, curPage);
		// 페이징 객체에 검색어 적용
		paging3.setSearch(muSearch);
		logger.info("뮤지컬 모달 페이징 : " + paging3);
		// 전체 공연 목록
		List<Performance> allMuPfmList = pService.getAllMuPfmList(paging3);
		logger.info("allMuPfmList : " + allMuPfmList);

		model.addAttribute("allMuPfmList", allMuPfmList);
		// ----------------------------------------------------
		
		// 뷰에 전달
		model.addAttribute("newTabBanner", newTabBanner);
		model.addAttribute("conTabBanner", conTabBanner);
		model.addAttribute("muTabBanner", muTabBanner);
		
		return "admin/pfm/tabBannerList";
	}

	List tabbannerList = new ArrayList<>();
	@RequestMapping(value="/admin/setsession", method=RequestMethod.POST)
	@ResponseBody
	public void setSession(
			@RequestParam int pfmIdx,
			@RequestParam int tabGenre,
			@RequestParam String storedName,
			HttpSession session
			) {
		logger.info("셋 세션 값 확인 : "+pfmIdx);
		logger.info("셋 세션 값 확인 : "+tabGenre);
		logger.info("셋 세션 값 확인 : "+storedName);
	
		Map<String, String> tBannerInfo = new HashMap<>();
		tBannerInfo.put("pfmIdx", String.valueOf(pfmIdx));
		tBannerInfo.put("tabGenre", String.valueOf(tabGenre));
		tBannerInfo.put("bannerPath", storedName);
		
		tabbannerList.add(tBannerInfo);
		session.setAttribute("tabbannerList", tabbannerList);
	}
	
	@RequestMapping(value="/admin/tbfinalsave", method=RequestMethod.GET)
	public String tbFinalSave(HttpSession session) {
		List tbList = (List) session.getAttribute("tabbannerList");
		if(tbList != null) {
			for(int i = 0 ; i < tbList.size() ; i++) {
				Map<String, String> map = (Map<String, String>) tbList.get(i);
				
				TabBanner tabbanner = new TabBanner();
				tabbanner.setPfmIdx(Integer.parseInt(map.get("pfmIdx")));
				tabbanner.setTabGenre(Integer.parseInt(map.get("tabGenre")));
				tabbanner.setBannerPath(map.get("bannerPath"));

				pService.saveTabbanner(tabbanner);
			}
		}
		
		session.removeAttribute("tabbannerList");
		tabbannerList.clear();
		
		System.out.println("탭 배너 세션 최종 저장 후 삭제");
		return "redirect:/admin/tabBannerList";
	}
	
	/**
	 * @최종수정일: 2019.01.02
	 * @Method설명: 탭배너 정렬(최신순/ 가나다순)
	 * @작성자: 김지은
	 */
	@RequestMapping(value="/admin/tbSetOrder", method=RequestMethod.POST)
	@ResponseBody
	public List<Performance> tbSetOrder(
			@RequestParam int order,
			@RequestParam String search,
			@RequestParam int btnId
			) {
		List<Performance> reList = null;
		
		if(order == 0) {
			//최신순 정렬
			if(btnId == 1) {
				String newSearch = search;
				int totalPfm = pService.getPfmSearchCnt(newSearch);
				Paging paging = new Paging(totalPfm, 1);
				paging.setSearch(newSearch);
				reList = pService.getAllPfmList(paging);
			}else if(btnId == 2) {
				String conSearch = search;
				int totalConPfm = pService.getPfmSearchCnt(conSearch);
				Paging paging2 = new Paging(totalConPfm, 1);
				paging2.setSearch(conSearch);
				reList = pService.getAllConPfmList(paging2);
			}else {
				String muSearch = search;
				int totalMuPfm = pService.getPfmSearchCnt(muSearch);
				Paging paging3 = new Paging(totalMuPfm, 1);
				paging3.setSearch(muSearch);
				reList = pService.getAllMuPfmList(paging3);
			}	
			return reList;
		} else {
			//가나다순 정렬
			if(btnId == 1) {
				String newSearch = search;
				int totalPfm = pService.getPfmSearchCnt(newSearch);
				Paging paging = new Paging(totalPfm, 1);
				paging.setSearch(newSearch);
				reList = pService.getPfmListAlpha(paging);
			}else if(btnId == 2) {
				String conSearch = search;
				int totalConPfm = pService.getPfmSearchCnt(conSearch);
				Paging paging2 = new Paging(totalConPfm, 1);
				paging2.setSearch(conSearch);
				reList = pService.getConPfmListAlpha(paging2);
			}else {
				String muSearch = search;
				int totalMuPfm = pService.getPfmSearchCnt(muSearch);
				Paging paging3 = new Paging(totalMuPfm, 1);
				paging3.setSearch(muSearch);
				reList = pService.getMuPfmListAlpha(paging3);
			}
			return reList;
		}
	}
	
	/**
	 * @최종수정일: 2018.12.19
	 * @Method설명: 탭배너 삭제하기
	 * @작성자: 김지은
	 */
	@RequestMapping(value="/admin/tabbannerdelete", method=RequestMethod.GET)
	@ResponseBody
	public void tBannerDelete(int tabIdx) {
		
		System.out.println("tabIdx : "+tabIdx);
		
		//mainbanIdx를 이용해서 메인 배너 삭제하기
		pService.deleteTabBanner(tabIdx);
	}
	
	/**
	 * @최종수정일: 2018.12.06
	 * @Method설명: 탭배너 등록 모달창에서 공연 리스트 띄우기
	 * @작성자: 김지은
	 */
	@RequestMapping(value = "/admin/tbsearch", method = RequestMethod.GET)
	public void searchTBannerPfm(
			HttpServletRequest req,
			Model model,
			@RequestParam(defaultValue="1") int curPage
	) {
		//--------------  new 모달 페이징... --------------  
		String newSearch = req.getParameter("newSearch");
		logger.info("new Search : " + newSearch);
		// 전체 공연갯수 얻기
		int totalPfm = pService.getPfmSearchCnt(newSearch);
		logger.info("totalPfm : " + totalPfm);
		// 페이징 객체 생성
		Paging paging = new Paging(totalPfm, curPage);
		// 페이징 객체에 검색어 적용
		paging.setSearch(newSearch);
		logger.info("New 모달 페이징 : " + paging);
		// 전체 공연 목록
		List<Performance> allPfmList = pService.getPfmSearchList(newSearch, paging);
		logger.info("allPfmList : " + allPfmList);
	}

	/**
	 * @최종수정일: 2019.01.01
	 * @Method설명: 이미 등록된 탭배너인지 중복확인하기 
	 * @작성자: 김지은
	 */
	@RequestMapping(value="/admin/checktabbandup", method=RequestMethod.GET)
	@ResponseBody
	public int checkTabbanDup(
			@RequestParam int pfmIdx,
			@RequestParam int tabGenre
			) {
		
		Map<String, Integer> tabInfo = new HashMap<>();
		tabInfo.put("pfmIdx", pfmIdx);
		tabInfo.put("tabGenre", tabGenre);
		
		boolean isDupTabban = pService.checkTabbanDup(tabInfo);
		
		if(isDupTabban == true) {
			// 중복x
			return 0;
		}else {
			// 중복o
			return 1;
		}
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
	 * @최종수정일: 2019.01.01
	 * @Method설명: 탭 배너 등록하기
	 * @작성자: 김지은
	 */
	@RequestMapping(value="/admin/registtbanner", method=RequestMethod.POST)
	@ResponseBody
	public void registTBanner(@RequestParam int pfmIdx, @RequestParam int tabGenre, @RequestParam String storedName) {
		logger.info("탭 배너 등록 메소드 실행~~");
		
		Map<String, String> tabInfo = new HashMap<>();
		tabInfo.put("pfmIdx", String.valueOf(pfmIdx));
		tabInfo.put("tabGenre", String.valueOf(tabGenre));
		tabInfo.put("bannerPath", "/resources/image/"+storedName);
		
		pService.insertTBanner(tabInfo);
	}
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 탭 배너 최종 저장하기(탭배너 페이지에서 최종저장버튼 활성화됐을때만 가능)
	 * @작성자: 김지은
	 */
	@RequestMapping(value = "/admin/tBannerfinalSave", method = RequestMethod.POST)
	public void tBannerfinalSave() {
		   

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
		Paging paging = new Paging(totalCnt, 1, 12, 4);
		
		// 특정 장르에 해당하는 공연 리스트 가져오기
		List<Performance> pfmList = pService.getPfmListByGenreNOrder(genre, order, paging);
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
		List<Performance> pfmList = pService.getPfmListByGenreNOrder(genre, order, paging);
		
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
	
	@RequestMapping(value="/admin/getpfminfo", method=RequestMethod.GET)
	public void getPfmInfo(HttpServletRequest request, HttpServletResponse response) {
		logger.info("요청 파라미터 확인 : "+request.getParameter("pfmIdx"));
		
		
	}
	
	/**
	 * @최종수정일: 2018.12.31
	 * @Method설명: 메인 배너 추가 모달에서 공연 클릭했을 때 공연 정보 가져오기
	 * @작성자: 김지은
	 */
	@RequestMapping(value="/admin/getpfmbypfmidx", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, String> getPfmByPfmIdx(@RequestParam int pfmIdx) {
		logger.info("ajax 데이터 확인 : "+pfmIdx);
		
		Performance pfm = pService.getPfmByPfmIdx(pfmIdx);
		
		DateFormat sdFormat = new SimpleDateFormat("yyyy.MM.dd");
		String pfmStart = sdFormat.format(pfm.getPfmStart());
		String pfmEnd = sdFormat.format(pfm.getPfmEnd()); 
		
		Map<String, String> pfmInfo = new HashMap<>();
		pfmInfo.put("pfmIdx", String.valueOf(pfm.getPfmIdx()));
		pfmInfo.put("name", pfm.getName());
		pfmInfo.put("pfmStart", pfmStart);
		pfmInfo.put("pfmEnd", pfmEnd);
		pfmInfo.put("hallName", pfm.getHallName());
		pfmInfo.put("storedName", pfm.getStoredName());
		
		return pfmInfo;
	}
	
	/**
	 * @최종수정일: 2019.01.08
	 * @Method설명: 메인 배너 수정하기
	 * @작성자: 김지은
	 */
	@RequestMapping(value="/admin/updatemainbanner", method=RequestMethod.GET)
	public String updateMainbanner(
			@RequestParam(defaultValue="1") int curPage,
			@RequestParam int mainbanIdx, 
			Model model,
			HttpServletRequest req
			) {
		//검색어 얻기
		String search = req.getParameter("mainBanSearch");
		
		//공연수 얻기
		int totalPfm = pService.getTotalPfm(search);
		System.out.println("공연수 확인 : "+totalPfm);
		
		//페이징 객체
		Paging paging = new Paging(totalPfm, curPage, 9);
		
		//최신순 공연목록 가져오기
		List<Performance> NewPfmList = pService.getNeweastPfm(paging);
		logger.info("최신순 공연목록 : "+NewPfmList);
		
		model.addAttribute("NewPfmList", NewPfmList);
		model.addAttribute("paging", paging);
		
		//mainbanIdx로 메인 배너 정보 가져오기
		MainBanner mainbanner = pService.getMbBymainbanIdx(mainbanIdx);
		logger.info("수정할 mainbanner 정보 가져오기 : "+mainbanner);
		
		//addAttribute
		model.addAttribute("mainbanner", mainbanner);
		
		return "admin/pfm/updateMainBanner";
	}
	
	List mbannerForUpdate = new ArrayList<>();
	@RequestMapping(value="/admin/updatemainbanner", method=RequestMethod.POST)
	public String updateMBanner(
			@RequestParam(value="pfmIdx") int pfmIdx, 
			@RequestParam(value="thumbFile") MultipartFile thumbFile,
			@RequestParam(value="bannerFile") MultipartFile bannerFile,
			HttpServletRequest req,
			HttpSession session
			) {
		//UUID 고유식별자
		String uId = UUID.randomUUID().toString().split("-")[0];

		// file 오리진네임, 스토어드네임 구하기
		String thumbOrigin = thumbFile.getOriginalFilename();
		String thumbStored = thumbOrigin + "_" + uId;

		String bannerOrigin = bannerFile.getOriginalFilename();
		String bannerStored = bannerOrigin + "_" + uId;

		// Map에 저장하기
		Map<Object, Object> mbannerInfo = new HashMap<>();
		mbannerInfo.put("pfmIdx", String.valueOf(pfmIdx));
		mbannerInfo.put("thumbFile", thumbFile);
		mbannerInfo.put("bannerFile", bannerFile);
		mbannerInfo.put("thumbOrigin", thumbOrigin);
		mbannerInfo.put("thumbStored", thumbStored);
		mbannerInfo.put("bannerOrigin", bannerOrigin);
		mbannerInfo.put("bannerStored", bannerStored);

		// 리스트에 저장 + 세션에 저장
		mbannerForUpdate.add(mbannerInfo);
		session.setAttribute("mbannerForUpdate", mbannerForUpdate);
		
		
		return "redirect:/admin/mainbannerlist";
	}
	
	@RequestMapping(value="/admin/checkmainban", method=RequestMethod.POST)
	@ResponseBody
	public int checkmainban(
			@RequestParam int mainbanIdx,
			@RequestParam String thumbFile,
			@RequestParam String bannerFile
			) {
		
		MainBanner oriMainBanner = pService.getMbBymainbanIdx(mainbanIdx);
		String oriThumb = oriMainBanner.getThumbImgOri();
		String oriBanner = oriMainBanner.getBannerImgOri();
		
		if(thumbFile.equals(oriThumb) && bannerFile.equals(oriBanner)) {
			System.out.println("같은 파일");
			return 0;
		}else if(thumbFile.equals(oriThumb) || bannerFile.equals(oriBanner)) {
			System.out.println("하나라도 다른 파일 -> 수정처리");
			return 1;
		}else {
			System.out.println("둘다 다른 파일 -> 수정처리");
			return 1;
		}
	}
}
