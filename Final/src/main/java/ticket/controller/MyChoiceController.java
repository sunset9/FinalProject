package ticket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ticket.dto.MyChoice;
import ticket.service.face.MyChoiceService;
import ticket.service.face.PreferAService;
import ticket.service.face.PreferGService;

@Controller
public class MyChoiceController {

	@Autowired
	private MyChoiceService myChoiceService;
	
	@Autowired
	private PreferAService preferAService;
	
	@Autowired
	private PreferGService preferGService;
	
	@RequestMapping(value="/mychoice/main" , method = RequestMethod.GET)
	public void list(int userIdx) {
		
		myChoiceService.choiceList(userIdx);
		
//		preferAService.preferAList(userIdx);
		
//		preferGService.preferGList(userIdx);
		
		// 전체 공연에서 추천 공연 리스트 뽑기.....
		
	}
	

	@RequestMapping(value="/mychoice/choice" , method = RequestMethod.POST)
	public void choice(
//			공연
			) {
		
		myChoiceService.choice();
	}
	

	@RequestMapping(value="/mychoice/cancel", method = RequestMethod.GET)
	public void cancel (MyChoice myChoice) {
		myChoiceService.cancel( myChoice);
	}
}
