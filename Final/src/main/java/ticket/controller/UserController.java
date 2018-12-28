package ticket.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import ticket.dto.Artist;
import ticket.dto.MyChoice;
import ticket.dto.PaymentInfo;
import ticket.dto.Performance;
import ticket.dto.PreferTheme;
import ticket.dto.Seat;
import ticket.dto.SeatSection;
import ticket.dto.Shipment;
import ticket.dto.StateOfBook;
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
	// 메일 보내는 객체
	@Autowired
	private JavaMailSender mailSender;

	// 파일 업로드
	@Autowired
	private ServletContext context;

	private String from = "1133acacac@gmail.com"; // 보내는 사람
	private String subject = "비밀번호 찾기 안내 메일"; // 메일제목

	@RequestMapping(value = "/user/join", method = RequestMethod.GET)
	public void join(Model model) {
		logger.info("회원 가입 폼");

		List<Theme> tList = preferTService.themeAllList();

		model.addAttribute("tList", tList);

	}

	@ResponseBody
	@RequestMapping(value = "/user/emailcheck", method = RequestMethod.POST)
	public String emailCheck(HttpServletRequest req, Model mode) {

		logger.info("아이디 중복 체크");
		String email = req.getParameter("email");
		int cnt = userService.checkSignup(email);

		return String.valueOf(cnt);

	}

	@ResponseBody
	@RequestMapping(value = "/user/nickcheck", method = RequestMethod.POST)
	public String nickCheck(HttpServletRequest req, Model mode) {

		logger.info("닉네임 중복 체크");
		String nick = req.getParameter("nick");
		int cnt = userService.checkNick(nick);

		return String.valueOf(cnt);

	}

	@ResponseBody
	@RequestMapping(value = "/user/join", method = RequestMethod.POST)
	public String joinProc(User user, @RequestParam(value = "themeIdx[]") List<String> themeIdx, HttpSession session,
			String year, String month, String day, @RequestParam(defaultValue = "/upload/profile.png") String profile) {
		logger.info("회원 가입 처리");

		// String 타입 -> Date 타입으로 변경
		ChangeDate changeDate = new ChangeDate();
		Date birth = changeDate.changeformDate(year, month, day);
		logger.info("" + birth);

		user.setProfile(profile);
		user.setBirth(birth);
		logger.info("" + user);

		// 회원 가입
		userService.join(user);
		int userIdx = user.getUserIdx();

		logger.info("가입한 user idx = " + userIdx);

		// 결과 담을 변수
		int res = 1;

		logger.info("선호 선택 처리");
		logger.info("" + themeIdx);

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
		userService.loginCheck(user, session);

		return "redirect:/ticket/ticketmain";
	}

	@RequestMapping(value = "/user/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		logger.info("로그 아웃");

		session.invalidate();

		return "redirect:/ticket/ticketmain";
	}

	@RequestMapping(value = "/user/findinfo", method = RequestMethod.GET)
	public void findEmail(String step, Model model) {
		logger.info("이메일 , 비밀번호 찾기 폼");
		logger.info("파라미터 :" + step);

		model.addAttribute("step", step);

	}

	@ResponseBody
	@RequestMapping(value = "/user/findemail", method = RequestMethod.POST)
	public String findEmailProc(User user) {
		logger.info("이메일 찾기 처리");
		logger.info("" + user);

		String email = userService.findEmail(user);

		logger.info(email);

		return email;

	}

	@ResponseBody
	@RequestMapping(value = "/user/findpass", method = RequestMethod.POST)
	public String findPassProc(User user) {
		logger.info("비밀번호 찾기 처리");

		logger.info("" + user);
		MimeMessage message = mailSender.createMimeMessage();

		// 임시 비밀번호 생성할 때 필요한 애들
		Random random = new Random();
		String chars[] = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,0,1,2,3,4,5,6,7,8,9"
				.split(",");

		// 임시 비밀번호 저장할 변수
		String temp = "TICKET";

		// 메일 본문
		String pretext = "변경된 비밀번호는 ";

		String subtext = " 입니다.";

		for (int i = 0; i < 5; i++) {
			temp += chars[random.nextInt(chars.length)];
		}

		logger.info("임시비밀번호 :" + temp);

		user.setPassword(temp);

		userService.changePw(user);

		// 메일 보내기 처리
		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setTo(user.getEmail());// 메일 받는 사람

			messageHelper.setText(pretext + temp + subtext); // 메일 본문

			messageHelper.setFrom(from); // 메일 보내는 사람
			messageHelper.setSubject(subject); // 메일 제목

			mailSender.send(message);

		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return temp;
	}

	@RequestMapping(value = "/user/pwcheck", method = RequestMethod.GET)
	public void pwCheck() {
		logger.info("정보수정시 비밀번호 체크 폼");

	}

	@ResponseBody
	@RequestMapping(value = "/user/pwcheck", method = RequestMethod.POST)
	public boolean pwCheckProc(User user, HttpSession session, String password) {
		logger.info("정보수정시 비밀번호 체크 처리");

		user = (User) session.getAttribute("loginUser");
		logger.info(password);
		user.setPassword(password);
		logger.info("비밀번호 들어갔는지 체크? : " + user);

		// 비밀번호 체크
		boolean check = userService.checkPw(user);
		logger.info("" + check);

		return check;

	}

	@RequestMapping(value = "/user/update", method = RequestMethod.GET)
	public void update(User user, HttpSession session, Model model) {
		logger.info("정보 수정 폼 ");
		user = (User) session.getAttribute("loginUser");
		int userIdx = user.getUserIdx();

		// 유저 인덱스로 유저 정보 얻어오기
		user = userService.getUser(userIdx);
		model.addAttribute("user", user);

	}

	@ResponseBody
	@RequestMapping(value = "/user/updatenick", method = RequestMethod.POST)
	public void updateNickProc(String nick, HttpSession session) {
		logger.info("닉네임 수정 처리 ");

		User user = (User) session.getAttribute("loginUser");
		user.setNick(nick);

		// 유저 정보 수정
		userService.updateNick(user);

	}

	@ResponseBody
	@RequestMapping(value = "/user/updatepass", method = RequestMethod.POST)
	public void updatePassProc(String password, HttpSession session) {
		logger.info("비밀번호 수정 처리 ");

		User user = (User) session.getAttribute("loginUser");
		user.setPassword(password);

		// 유저 정보 수정
		userService.updatePass(user);

	}

	@ResponseBody
	@RequestMapping(value = "/user/updatephone", method = RequestMethod.POST)
	public void updatePhoneProc(String phone, HttpSession session) {
		logger.info("전화번호 수정 처리 ");

		User user = (User) session.getAttribute("loginUser");
		user.setPhone(phone);
		logger.info(phone);
		// 유저 정보 수정
		userService.updatePhone(user);

	}

	@ResponseBody
	@RequestMapping(value = "/user/updateaddr", method = RequestMethod.POST)
	public void updateAddrProc(String addr, String postcode, String addrDetail, HttpSession session) {
		logger.info("주소 수정 처리 ");

		User user = (User) session.getAttribute("loginUser");
		user.setAddr(addr);
		user.setPostcode(postcode);
		user.setAddrDetail(addrDetail);

		// 유저 정보 수정
		userService.updateAddr(user);

	}

	@RequestMapping("/user/profile")
	public @ResponseBody User profileChange(MultipartFile profileFile, HttpSession session) {

		logger.info("프로필 사진 변경 처리");
		logger.info(profileFile.getOriginalFilename());
		User user = new User();

		user = (User) session.getAttribute("loginUser");

		// context, file 전달해 줘야함
		// context -> servlet conext path 업로드 파일 정보 저장
		userService.updateProfile(context, profileFile, user);
		
		return user;
		

	}

	@RequestMapping(value = "/mypage/myticket", method = RequestMethod.GET)
	public String mypageBook(Model model, User user, HttpSession session) {
		logger.info("마이페이지 메인");
		user = (User) session.getAttribute("loginUser");
		logger.info("" + user);

		// 세션 존재 확인
		if (user.getEmail() == null) {
			// 세션 없으면 로그인 페이지로 보내기
			return "redirect:/user/login";
		}

		// 회원 번호로 예약한 것들 불러오기
		List<StateOfBook> sob = new ArrayList<>();

		sob = userService.userTicket(user);

		logger.info("" + sob);
		
		model.addAttribute("sob", sob);
		
		return "/mypage/myticket";
	}
	
	@RequestMapping(value = "/mypage/detailicket", method = RequestMethod.GET)
	public void myticket(Model model
			, User user
			, HttpSession session
			, int pfmIdx
			 ) {
		logger.info("티켓 상세");
		logger.info("공연IDX" +pfmIdx);
		user = (User) session.getAttribute("loginUser");
		logger.info("" + user);
		
		// 예매한 공연 상세 정보 가져오기
		StateOfBook sob = userService.getDetailBook(user, pfmIdx);
		logger.info("sob"+sob);
		model.addAttribute("sob", sob);
		
		// 티켓수령 정보 가져오기(수령 방법, 배송지 정보)
		String bookGroup = sob.getBookGroup();
		// 수령 방법 먼저 조회 
		// 1 : 직접 수령   2 : 택배 배송
		int receive = userService.getReceive(bookGroup);
		logger.info("배송 방법 : "+receive);
		model.addAttribute("receive", receive);
		
		// 택배 배송일 때만 배송지 정보 조회해오기 
		if(receive == 2) {
			Shipment sm = new Shipment();  // 배송지 정보 저장할 객체 
			sm = userService.getShipment(bookGroup); // 예매번호로 배송지 조회
			logger.info("배송지"+sm);
			model.addAttribute("shipment", sm);
		}
		
		// 구매 내역 가져오기 (티켓 가격, 배송비, 수수료)
		SeatSection ss = userService.selectSeatSection(bookGroup);
		logger.info("좌석 구역과 가격"+ss);
		model.addAttribute("ss", ss);
		
		// 결제 내역 (결제 방법, 결제 날짜, 거래자, 금액) 
		PaymentInfo payment = new PaymentInfo();
		logger.info("impuid : "+sob.getImpUid());
		payment = userService.getPayment(sob.getImpUid());
		logger.info("결제정보:"+payment);
		model.addAttribute("payment", payment);
		
		// 좌석 정보 
		// 1. 좌석 등급 -- 구매 내역(ss)에서 보낸값 사용
		// 2. 좌석 번호 
		List<Seat> seatList = userService.getSeat(bookGroup);
		logger.info("좌석정보:" +seatList);
		model.addAttribute("seatList", seatList);
		// 3. 좌석 구매 가격 -- 구매 내역(ss)에서 보낸값 사용
		// 4. 취소버튼 예매 상태 -- 예매한 공연 상세(sob)에서 보낸값 사용
		
	}
	
	@RequestMapping(value ="mypage/bookcancel", method=RequestMethod.POST)
	public void bookCancel( String names) {
		logger.info("예매 삭제");
		logger.info(names);
	}
	
	

	@RequestMapping(value = "/mypage/mychoice", method = RequestMethod.GET)
	public String mychoice(Model model, HttpSession session) {
		User user = (User) session.getAttribute("loginUser");
		int userIdx = user.getUserIdx();

		// 세션 존재 확인
		if (user.getEmail() == null) {
			// 세션 없으면 로그인 페이지로 보내기
			return "redirect:/user/login";
		}

		// 유저가 선택한 아티스트 불러오기
		List<Artist> aList = preferAService.choiceArtistList(userIdx);
		model.addAttribute("aList", aList);
		logger.info("유저가 선택한 아티스트" + aList);

		// 유저가 찜해논 공연 불러오기
		List<MyChoice> pfmList = myChoiceService.choicePfmList(userIdx);
		logger.info("유저가 찜 해놓은 공연 : " + pfmList);
		model.addAttribute("pfmList", pfmList);

		// 유저가 선택한 테마 리스트 불러오기
		List<PreferTheme> ptList = preferTService.choiceList(userIdx);
		model.addAttribute("ptList", ptList);

		// 테마에 맞는 추천공연 리스트 불러오기
		List<Performance> recomList = userService.recommendPfm(ptList);
		logger.info("선호 테마에 대한 공연추천" + recomList);
		model.addAttribute("recomList", recomList);

		return null;

	}

	@RequestMapping(value = "/mypage/pfmchoice", method = RequestMethod.POST)
	public String pfmchoice(int pfmIdx, HttpSession session) {
		User user = (User) session.getAttribute("loginUser");
		int userIdx = user.getUserIdx();

		myChoiceService.choice(userIdx, pfmIdx);
		return "redirect:/mypage/mychoice";

	}

	@RequestMapping(value = "/mypage/myinq", method = RequestMethod.GET)
	public void mypageInq(Model model, User user) {

	}
}
