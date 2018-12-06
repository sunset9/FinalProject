package ticket.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ticket.dto.User;
import ticket.service.admin.face.AdminUserService;

@Controller
public class AdminUserController {
	@Autowired AdminUserService userService;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminUserController.class);

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 전체 회원 리스트 또는 검색된 회원의 리스트 불러오기
	 * @작성자: 김지은
	 */
	@RequestMapping(value = "/admin/user/list", method = RequestMethod.GET)
	public void getUserList(HttpServletRequest req, @RequestParam(defaultValue = "1") int curPage, Model model) {

		// 검색어 얻기 String search = userService.getSearch(req)

		// 전체 회원수 얻기 userService.getTotalUser(search)

		// 페이징 객체 생성하기

		// 페이징 객체에 검색어 적용 paging.setSearch(search)

		// 회원 목록을 뷰에 전달하기

	}

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 회원의 등급(일반회원, 관리자, 회원정지)을 변경하기
	 * @작성자: 김지은
	 */
	@RequestMapping(value = "/admin/user/list", method = RequestMethod.POST)
	public void changeUserGrade() {
//		변경된 grade값 받아서 회원 등급 변경해주기 userService.changeUserGrade(user)

	}

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 리스트에서 선택한 회원의 상세 정보와 예매 현황을 보여주기
	 * @작성자: 김지은
	 */
	@RequestMapping(value = "/admin/user/detail", method=RequestMethod.GET)
	public void userDetail(User user) {
		// 해당 회원의 예매 현황 목록 불러오기
		// userService.getBookDetail(user)

		// 예매 목록을 뷰에 전달
	}

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명:- ( 회원+공연+예매+예매상태 ) 리스트 페이지
	 * @작성자:박주희
	 */
	@RequestMapping(value = "/admin/curpaypfm", method = RequestMethod.GET)
	public void getList() {
	}
}
