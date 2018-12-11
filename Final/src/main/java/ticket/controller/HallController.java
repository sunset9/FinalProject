package ticket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ticket.dto.Performance;

@Controller
public class HallController {

	
	@RequestMapping(value="/ticket/seatSection", method=RequestMethod.GET)
	public String loadhallSection() {
		
		Performance pfm = new Performance();
		pfm.setHallIdx(2);
		
		
		String rtn = "hall/hall_"+pfm.getHallIdx();
		return rtn;
	}
	
}
