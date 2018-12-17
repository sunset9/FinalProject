package ticket.controller.admin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ticket.dto.PaymentInfo;
import ticket.dto.StateOfBook;
import ticket.dto.User;
import ticket.service.admin.face.AdminBoardService;
import ticket.service.admin.face.AdminUserService;
import ticket.utils.Paging;

@Controller
public class AdminUserController {
	@Autowired AdminUserService userService;
	@Autowired AdminBoardService bService;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminUserController.class);

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 전체 회원 리스트 또는 검색된 회원의 리스트 불러오기
	 * @작성자: 김지은
	 */
	@RequestMapping(value = "admin/userlist", method = RequestMethod.GET)
	public String getUserList(
			HttpServletRequest req, 
			Model model,
			@RequestParam(defaultValue="1") int curPage
			) {

		//현재 페이지 얻기
		logger.info("curPage : "+curPage);
		
		// 검색어 얻기 String search = userService.getSearch(req)
		// search 스트링 말고 dto로 바꾸기!! 
		String search = req.getParameter("userSearchData");
		//Paging paging = new Paging(search);
		logger.info("search값 : "+search);
		//----------- OK ------------
		
		
		// 전체 회원수 얻기 userService.getTotalUser(search)
		int totalUser = userService.getTotalUser(search);
		logger.info("totalUser : "+totalUser);
		
		// 페이징 객체 생성하기
		Paging paging = new Paging(totalUser, curPage);

		// 페이징 객체에 검색어 적용 paging.setSearch(search)
		paging.setSearch(search);
		logger.info("페이징 : "+paging);
		
		// 회원 목록을 뷰에 전달하기
		List<User> userList = userService.getPagingListByPaging(paging);
		logger.info("userList : "+userList);
		
		model.addAttribute("userList",userList);
		model.addAttribute("paging", paging);
		
		return "/admin/user/list";
	}
	
	

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 회원의 등급(일반회원, 관리자, 회원정지)을 변경하기
	 * @작성자: 김지은
	 */
	@RequestMapping(value = "admin/userlist", method = RequestMethod.POST)
	public String changeUserGrade(int currUser, int currUserGrade) {
		System.out.println("changeUserGrade UserIdx : "+currUser);
		System.out.println("changeUserGrade changed gradeIdx : "+currUserGrade);
		
//		변경된 grade값 받아서 회원 등급 변경해주기 userService.changeUserGrade(user)
		userService.changeUserGrade(currUser, currUserGrade);
		
		return "redirect:/admin/userlist";
	}

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 리스트에서 선택한 회원의 상세 정보와 예매 현황을 보여주기
	 * @작성자: 김지은
	 */
	@RequestMapping(value = "admin/userdetail", method=RequestMethod.GET)
	public String userDetail(int userIdx, Model model) {
		//회원 목록에서 선택한 회원 정보 가져오기
		User user = new User();
		user.setUserIdx(userIdx);
		user = userService.getUserByUserIdx(user);
		
		// 해당 회원의 예매 현황 목록 불러오기
		List<StateOfBook> sobList = userService.getBookDetail(user);
		System.out.println("예매현황 출력! : "+sobList);

		// 예매 목록을 뷰에 전달
		model.addAttribute("sobList", sobList);
		model.addAttribute("curUser",user);
		
		return "/admin/user/detail";
	}
	
	
	/**
	 * @최종수정일: 2018.12.17
	 * @Method설명: ajax 통신, bookGroup 중 예매상태가 취소중인 좌석의 impUid 가져오기
	 * @작성자: 김지은
	 */
	@RequestMapping(value="/admin/getImpUid", method=RequestMethod.POST)
	public @ResponseBody List<PaymentInfo> getImpUid(String bookGroup) {
		//bookGroup 중 '취소중'인 좌석의 impUid 가져오기
		List<PaymentInfo> impUidOfCancelSeat = userService.getImpUid(bookGroup);
		
		System.out.println("취소중인 좌석의 impUid"+impUidOfCancelSeat);
		
		return impUidOfCancelSeat;
	}
	
	/**
	 * @최종수정일: 2018.12.14
	 * @Method설명: 예매현황 리스트 가져오기(SOB = State Of Book)
	 * @작성자: 김지은
	 */
	@RequestMapping(value="admin/soblist", method=RequestMethod.GET)
	public String getSOB(
			HttpServletRequest req,
			Model model,
			@RequestParam(defaultValue="1") int curPage
			) {
		//현재 페이지 
		//logger.info("curPage : "+curPage);
		
		//검색어 얻기
		//String search = req.getParameter("sobSearch");
		//logger.info("search값 : "+search);
		
		//전체 예매수 얻기
		//int totalBook = userService.getTotalBook(search);
		//logger.info("totalBook : "+totalBook);
		
		//페이징 객체 생성
		//Paging paging = new Paging(totalBook, curPage);
		
		//페이징 객체에 검색어 적용 
		//paging.setSearch(search);
		//logger.info("페이징 : "+paging);
		
		//페이징한 예매현황 목록 얻기
		//List<StateOfBook> sobList = userService.getSobListByPaging(paging);
		
		return "/admin/user/soblist";
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
