package ticket.controller;

import java.sql.Date;

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

import ticket.dto.User;
import ticket.service.face.UserService;
import ticket.utils.ChangeDate;

@Controller
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/user/join", method = RequestMethod.GET)
	public void join() {
		logger.info("회원 가입 폼");
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

	@RequestMapping(value = "/user/join", method = RequestMethod.POST)
	public void joinProc(
			User user
			, String email2
			, String year
			, String month
			, String day
			, @RequestParam(defaultValue="/upload/profile.png") String profile
			) {
		logger.info("회원 가입 처리");
		
		user.setEmail(user.getEmail()+"@"+email2);
		
		// String 타입 -> Date 타입으로 변경
		ChangeDate changeDate = new ChangeDate();
		Date birth = changeDate.changeformDate(year, month, day);
		logger.info(""+birth);

		user.setProfile(profile);
		user.setBirth(birth);
		logger.info(""+ user);
		
		
		// 회원 가입
		userService.join(user);
	}
	

	@RequestMapping(value = "/user/login", method = RequestMethod.GET)
	public void login() {
		logger.info("로그인 폼");
	}
	

	@RequestMapping(value = "/user/login", method = RequestMethod.POST)
	public String loginProc(User user, HttpSession session) {
		logger.info("로그인 처리");
	
		// 아이디와 비밀번호 확인
		if(userService.loginCheck(user) == 1) { 
			session.setAttribute("login", true);
			user = userService.getUser(user);
			session.setAttribute("loginUser", user);
			
		} else {
			session.setAttribute("login", false);
		}
		
		return null; //메인으로가게끔 처리해주세욤

	}


	@RequestMapping(value = "/user/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		logger.info("로그 아웃");
		
		session.invalidate();
		
		return null; //메인으로가게끔 처리
	}
	
	@RequestMapping(value="/user/update", method = RequestMethod.GET)
	public void update(User user) {
		logger.info("정보 수정 폼 ");
		
		// 비밀번호 체크
		userService.checkPw(user);
		
		// 기본 유저정보 얻어오기
		userService.getUser(user);
	}

	@RequestMapping(value="/user/update", method = RequestMethod.POST)
	public void updateProc(User user) {
		logger.info("정보 수정 처리 ");
		
		// 유저 정보 수정
		userService.update (user);
		
		// 유저 정보 얻어오기
		userService.getUser(user);
		
	}
}
