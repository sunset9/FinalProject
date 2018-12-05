package ticket.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PreferController {
	
	private static final Logger logger = LoggerFactory.getLogger(PreferController.class);
	
	@RequestMapping(value="/user/prefer", method=RequestMethod.GET)
	public void choice() {
		logger.info("선호 선택 페이지 폼");
		
	}
	
	@RequestMapping(value="/user/prefer", method=RequestMethod.POST)
	public void choiceProc() {
		logger.info("선호 선택 처리");
	}

}
