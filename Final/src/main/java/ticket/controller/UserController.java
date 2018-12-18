package ticket.controller;

import java.sql.Date;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ticket.dto.Artist;
import ticket.dto.MyChoice;
import ticket.dto.Performance;
import ticket.dto.PreferTheme;
import ticket.dto.Theme;
import ticket.dto.User;
import ticket.service.face.MyChoiceService;
import ticket.service.face.PreferAService;
import ticket.service.face.PreferTService;
import ticket.service.face.UserService;
import ticket.utils.ChangeDate;

@Controller
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserService userService;
	@Autowired
	private PreferTService preferTService;
	@Autowired
	private PreferAService preferAService;
	@Autowired
	private MyChoiceService myChoiceService;
	
	 
	@RequestMapping(value = "/user/join", method = RequestMethod.GET)
	public void join(Model model) {
		logger.info("회원 가입 폼");
		
		List<Theme> tList = preferTService.themeAllList();
		
		model.addAttribute("tList", tList);
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/user/emailcheck", method = RequestMethod.POST)
	public String emailCheck( 
			HttpServletRequest req
			, Model mode) {
		
		logger.info("아이디 중복 체크");
		String email = req.getParameter("email");
		int cnt = userService.checkSignup(email);
		
		return String.valueOf(cnt);
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/user/nickcheck", method = RequestMethod.POST)
	public String nickCheck( 
			HttpServletRequest req
			, Model mode) {
		
		logger.info("닉네임 중복 체크");
		String nick = req.getParameter("nick");
		int cnt = userService.checkNick(nick);
		
		return String.valueOf(cnt);
		
	}

	@ResponseBody
	@RequestMapping(value = "/user/join", method = RequestMethod.POST)
	public String joinProc(
			User user
			,@RequestParam(value="themeIdx[]") List<String> themeIdx
			, HttpSession session
			, String year
			, String month
			, String day
			, @RequestParam(defaultValue="/upload/profile.png") String profile
			) {
		logger.info("회원 가입 처리");
		
		
		
		// String 타입 -> Date 타입으로 변경
		ChangeDate changeDate = new ChangeDate();
		Date birth = changeDate.changeformDate(year, month, day);
		logger.info(""+birth);

		user.setProfile(profile);
		user.setBirth(birth);
		logger.info(""+ user);
		
		// 회원 가입
		userService.join(user);
		int userIdx = user.getUserIdx();
		
		logger.info("가입한 user idx = "+userIdx);
		
		// 결과 담을 변수
		int res =1;
			
		logger.info("선호 선택 처리");
		logger.info(""+themeIdx);
		
		preferTService.choiceTheme(userIdx, themeIdx);
		
		return String.valueOf(res);
	}
	

	@RequestMapping(value = "/user/login", method = RequestMethod.GET)
	public void login() {
		logger.info("로그인 폼");
	}
	

	@RequestMapping(value = "/user/login", method = RequestMethod.POST)
	public String loginProc(User user, HttpSession session) {
		logger.info("로그인 처리");
	
		// 아이디와 비밀번호 확인, 세션 처리
		userService.loginCheck(user, session) ;
		
		return "redirect:/ticket/ticketmain";
	}


	@RequestMapping(value = "/user/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		logger.info("로그 아웃");
		
		session.invalidate();
		
		return "redirect:/ticket/ticketmain";
	}
	
	@RequestMapping(value = "/user/findinfo", method = RequestMethod.GET)
	public void findEmail(HttpSession session) {
		logger.info("이메일 , 비밀번호 찾기 폼");
		
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/user/findemail", method = RequestMethod.POST)
	public String findEmailProc(User user) {
		logger.info("이메일 찾기 처리");
		logger.info(""+user);
		
		String email = userService.findEmail(user);
		
		logger.info(email);
		
		return email;
		
	}
	
	
	@RequestMapping(value = "/user/findpass", method = RequestMethod.POST)
	public void findPassProc(HttpSession session) {
		logger.info("비밀번호 찾기 처리");
		
	}
	
	
	
	@RequestMapping(value ="/user/pwcheck", method= RequestMethod.GET)
	public void pwCheck() {
		logger.info("정보수정시 비밀번호 체크 폼");
		
	}
	
	@ResponseBody
	@RequestMapping(value ="/user/pwcheck", method= RequestMethod.POST)
	public boolean pwCheckProc(
			User user
			, HttpSession session
			, String password
			) {
		logger.info("정보수정시 비밀번호 체크 처리");
		
		user = (User)session.getAttribute("loginUser");
		logger.info(password);
		user.setPassword(password);
		logger.info("비밀번호 들어갔는지 체크? : "+ user);

		
		// 비밀번호 체크
		boolean check = userService.checkPw(user);
		logger.info(""+check);
		
		return check;
		
	}
	
	
	
	
	@RequestMapping(value="/user/update", method = RequestMethod.GET)
	public void update(User user
				, HttpSession session
				, Model model) {
		logger.info("정보 수정 폼 ");
		user = (User)session.getAttribute("loginUser");
		int userIdx = user.getUserIdx();
		
		// 유저 인덱스로 유저 정보 얻어오기 
		user = userService.getUser(userIdx);
		model.addAttribute("user", user);
	
		
	
	}
	@ResponseBody
	@RequestMapping(value="/user/updatenick", method = RequestMethod.POST)
	public void updateNickProc(String nick
				, HttpSession session) {
		logger.info("닉네임 수정 처리 ");
		
		User user = (User)session.getAttribute("loginUser");
		user.setNick(nick);
		
		// 유저 정보 수정
		userService.updateNick (user);
		
		
	}
	
	@ResponseBody
	@RequestMapping(value="/user/updatepass", method = RequestMethod.POST)
	public void updatePassProc(String password
				, HttpSession session) {
		logger.info("비밀번호 수정 처리 ");
		
		User user = (User)session.getAttribute("loginUser");
		user.setPassword(password);
		
		// 유저 정보 수정
		userService.updatePass (user);
		
		
	}
	
	@ResponseBody
	@RequestMapping(value="/user/updatephone", method = RequestMethod.POST)
	public void updatePhoneProc(String phone
				, HttpSession session) {
		logger.info("전화번호 수정 처리 ");
		
		User user = (User)session.getAttribute("loginUser");
		user.setPhone(phone);
		logger.info(phone);
		// 유저 정보 수정
		userService.updatePhone (user);
		
		
	}
	@ResponseBody
	@RequestMapping(value="/user/updateaddr", method = RequestMethod.POST)
	public void updateAddrProc(String addr
				,String postcode
				,String addrDetail
				, HttpSession session) {
		logger.info("주소 수정 처리 ");
		
		User user = (User)session.getAttribute("loginUser");
		user.setAddr(addr);
		user.setPostcode(postcode);
		user.setAddrDetail(addrDetail);
		
		// 유저 정보 수정
		userService.updateAddr(user);
		
		
	}
	
	
	@RequestMapping(value="/mypage/myticket", method= RequestMethod.GET)
	public String mypageBook(Model model
				,User user
				,HttpSession session
			) {
		logger.info("마이페이지 메인");
		user =(User)session.getAttribute("loginUser");
		logger.info(""+user);

		// 세션 존재 확인
		if(user.getEmail() ==null) {
			// 세션 없으면 로그인 페이지로 보내기
			return "redirect:/user/login";
		}
		return null;
		
	}
	
	@RequestMapping(value="/mypage/mychoice", method=RequestMethod.GET)
	public String mychoice(
			Model model, 
			HttpSession session ) {
		User user = (User)session.getAttribute("loginUser");
		int userIdx = user.getUserIdx();
		
		// 세션 존재 확인
		if(user.getEmail() ==null) {
			// 세션 없으면 로그인 페이지로 보내기
			return "redirect:/user/login";
		}
		
		// 유저가 선택한 아티스트 불러오기 
		List<Artist> aList = preferAService.choiceArtistList(userIdx);
		model.addAttribute("aList",aList);
		logger.info("유저가 선택한 아티스트"+aList);
		
		// 유저가 찜해논 공연 불러오기
		List<MyChoice> pfmList = myChoiceService.choicePfmList(userIdx);
		logger.info("유저가 찜 해놓은 공연 : " +pfmList );
		model.addAttribute("pfmList",pfmList);
		
		// 유저가 선택한 테마 리스트 불러오기
		List<PreferTheme> ptList = preferTService.choiceList(userIdx);
		model.addAttribute("ptList", ptList);
		
		
		// 테마에 맞는 추천공연 리스트 불러오기
		List<Performance> recomList = userService.recommendPfm(ptList);
		logger.info("선호 테마에 대한 공연추천"+recomList);
		model.addAttribute("recomList", recomList);
		
		return null;
		
	}
	
	@RequestMapping(value ="/mypage/pfmchoice", method=RequestMethod.POST)
	public String pfmchoice(
			int pfmIdx 
			, HttpSession session 
			) {
		User user = (User)session.getAttribute("loginUser");
		int userIdx = user.getUserIdx();
		
		myChoiceService.choice(userIdx, pfmIdx);
		return "redirect:/mypage/mychoice";
		
	}
	@RequestMapping(value="/mypage/myinq", method= RequestMethod.GET)
	public void mypageInq(Model model
				,User user
			) {
		
	}
}
