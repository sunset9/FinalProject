package ticket.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ticket.dto.Theme;
import ticket.service.face.PreferAService;
import ticket.service.face.PreferTService;


@Controller
public class PreferController {
	
	private static final Logger logger = LoggerFactory.getLogger(PreferController.class);
  
	@Autowired
	private PreferTService preferTService;
	@Autowired
	private PreferAService preferAService;
	
	@RequestMapping(value="/user/prefer", method=RequestMethod.GET)
	public void choice(HttpSession session) {
		logger.info("선호 선택 페이지 폼");
		
		// 세션에서 유저 idx 얻기
		int userIdx = 0;
		
		// 유저가 선택한 테마 리스트 얻어오기 
		preferTService.choiceList(userIdx);
		
		// 전체 테마 리스트 출력
		List<Theme> tList = preferTService.themeAllList();
		
		// 유저가 선택한 테마에 속하는 아티스트 불러오기
		preferAService.artistByTheme(tList);
		
		// 유저가 선택한 아티스트 리스트 얻기 
		preferAService.choiceList(userIdx);
		
		String search= null;
		// 검색 할 때 검색어로 리스트 얻기
		preferAService.search(search);
	}
	
	@RequestMapping(value="/user/prefer", method=RequestMethod.POST)
	public void choiceProc() {
		logger.info("선호 선택 처리");

		// 선택한거 취소하고 다 넣기..ㅎ
		
	}
	
}
