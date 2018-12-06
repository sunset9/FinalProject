package ticket.controller.admin;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ticket.service.admin.face.AdminPfmService;

@Controller
public class AdminPfmController {

	private static final Logger logger = LoggerFactory.getLogger(AdminPfmController.class);
	@Autowired
	AdminPfmService pService;
	@Autowired
	ServletContext context;

	/**
	 * 2018.12AdminPfmControllerod설명: 새 공연 등록 폼 띄우기
	 * 
	 * @작성자: 전해진
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String viewRistForm(Model model) {
		// 공연 분류(장르) 가져오기
		// 테마 리스트 가져오기

		// 관람 등급 가져오기

		// 아티스트 가져오기

		// 좌석정보 가져오기(ui 뿌리기 위해)
		return "admin/pfm/registPfm";
	}

	/**
	 * 2018.12.05
	 * 
	 * @Method설명: 새 공연 등록하기
	 * @작성자: 전해진
	 */
	@RequestMapping(value = "/admin/pfm/registPfm", method = RequestMethod.POST)
	public void registPfm() {
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
	 * 
	 * @Method설명: 공연 정보 수정 폼 띄우기
	 * @작성자: 전해진
	 */
	@RequestMapping(value = "/admin/pfm/editPfm", method = RequestMethod.GET)
	public void editForm(Model model) {

	}

	/**
	 * 2018.12.05
	 * 
	 * @Method설명: 공연 정보 수정하기
	 * @작성자: 전해진
	 */
	@RequestMapping(value = "/admin/pfm/editPfm", method = RequestMethod.POST)
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
	 * @최종수정일: 2018.12.05
	 * @Method설명:카테고리 배너 - 콘서트 배너 등록 하기
	 * @작성자:
	 */
	@RequestMapping(value = "/admin/pfm/cateCon", method = RequestMethod.POST)
	public void registerCategoryCon() {
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
}
