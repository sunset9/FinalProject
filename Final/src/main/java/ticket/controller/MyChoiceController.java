package ticket.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ticket.dto.MyChoice;
import ticket.service.face.MyChoiceService;
import ticket.service.face.PreferAService;
import ticket.service.face.PreferTService;

@Controller
public class MyChoiceController {

	@Autowired
	private MyChoiceService myChoiceService;
	
	@Autowired
	private PreferAService preferAService;
	
	@Autowired
	private PreferTService preferGService;

	private static final Logger logger = LoggerFactory.getLogger(MyChoiceController.class);

	@RequestMapping(value="/mychoice/cancel", method = RequestMethod.GET)
	public void cancel (MyChoice myChoice) {
		
		myChoiceService.cancel( myChoice);
	}
	
	/**
	 * @최종수정일: 2019.01.09
	 * @Method설명: 찜한거 취소하는 apthem
	 * @작성자:홍나영
	 */
	@ResponseBody
	@RequestMapping(value="/mychoice/cancel", method = RequestMethod.POST)
	public boolean cancelChoice (MyChoice myChoice) {
		logger.info("찜 취소");
		logger.info(""+myChoice);
		
		
		return myChoiceService.cancel( myChoice);
	}
	/**
	 * @최종수정일: 2019.01.09
	 * @Method설명: 해당 공연이 찜이 되어있는지 확인하는 메소드
	 * @작성자:홍나영
	 */
	@ResponseBody
	@RequestMapping(value="/mychoice/check", method=RequestMethod.POST)
	public int choiceCheck(
			@RequestParam(defaultValue="0") int userIdx, 
			int pfmIdx) {
		logger.info("찜 체크 페이지");
		
		return myChoiceService.check(userIdx, pfmIdx); 
	}
}
