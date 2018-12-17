package ticket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

	

	@RequestMapping(value="/mychoice/cancel", method = RequestMethod.GET)
	public void cancel (MyChoice myChoice) {
		myChoiceService.cancel( myChoice);
	}
}
