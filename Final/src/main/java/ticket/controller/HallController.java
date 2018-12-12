package ticket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ticket.dto.Performance;

@Controller
public class HallController {

	
	/**
	 * @최종수정일: 2018.12.12
	 * @Method설명: hallIdx에 따른 공연장 불러오기
	 * @작성자:이상지
	 */
	@RequestMapping(value="/ticket/seatSection", method=RequestMethod.GET)
	public String loadhallSection() {
		
		Performance pfm = new Performance();
		pfm.setHallIdx(2);
		
		
		String rtn = "hall/hall_"+pfm.getHallIdx();
		return rtn;
	}
	
}
