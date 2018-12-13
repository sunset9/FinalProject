package ticket.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ticket.dto.Artist;
import ticket.dto.PreferTheme;
import ticket.dto.Theme;
import ticket.dto.User;
import ticket.service.face.PreferAService;
import ticket.service.face.PreferTService;


@Controller
public class PreferController {
	
	private static final Logger logger = LoggerFactory.getLogger(PreferController.class);
  
	@Autowired
	private PreferTService preferTService;
	@Autowired
	private PreferAService preferAService;
	
	

	
	
	
	@RequestMapping(value="/mypage/prefer", method=RequestMethod.GET)
	public void choice(HttpSession session
				,Model model
			) {
		logger.info("선호 선택 페이지 폼");
		
		// 세션에서 유저 idx 얻기
		User user= (User) session.getAttribute("loginUser");
		logger.info("세션에 저장된 "+user);
		int userIdx = user.getUserIdx();
		
		// 유저가 선택한 테마 리스트 얻어오기 
		List<PreferTheme> ptList = preferTService.choiceList(userIdx);
		
		logger.info("유저 선택"+ptList);
		// 전체 테마 리스트 출력
		List<Theme> tList = preferTService.themeAllList();
		logger.info("테마 전체"+tList);
		model.addAttribute("tList",tList);
		model.addAttribute("ptList",ptList);
		
		// 유저가 선택한 테마에 속하는 아티스트 불러오기
		List<Artist> aList = preferAService.artistByTheme(ptList);
		model.addAttribute("aList",aList);
		
		// 유저가 선택한 아티스트 리스트 얻기 
		List<Artist> paList = preferAService.choiceList(userIdx);
		model.addAttribute("paList", paList);
		
		String search= null;
		// 검색 할 때 검색어로 리스트 얻기
//		preferAService.search(search);
	}
	
	@RequestMapping(value="/user/prefer", method=RequestMethod.POST)
	public void choiceProc(
			@RequestParam(value="themeIdx[]") List<String> themeIdx
			, int userIdx
			) {
		
		logger.info("선호 선택 처리");
		logger.info(""+themeIdx);
		
		preferTService.choiceTheme(userIdx, themeIdx);
		// 선택한거 취소하고 다 넣기..ㅎ
		
	}
	
}
