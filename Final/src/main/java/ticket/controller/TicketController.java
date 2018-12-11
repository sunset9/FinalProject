package ticket.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ticket.dto.Performance;
import ticket.dto.PfmDateByTime;
import ticket.service.face.TicketService;


@Controller
public class TicketController {
	
	@Autowired
	TicketService ticketService;
	
	
	
	/**
	 * @최종수정일: 2018.12.10
	 * @Method설명: 테스트 메소드
	 * @작성자:이상지
	 */
	@RequestMapping(value="/ticket/bookInfo", method=RequestMethod.GET)
	public void ticketpicker(Model model) {
		
		Performance pfm = new Performance();
		pfm.setPfmIdx(1);
		
		
		// 해당공연의 공연날짜 불러오기
		List<PfmDateByTime> dates = new ArrayList<PfmDateByTime>();
		dates = ticketService.ticketDatePicker(pfm);
		
		
		List<String> dateStr = new ArrayList<String>();
		
		SimpleDateFormat trans = new SimpleDateFormat("yyyy-MM-dd");
		
		for(int i=0 ; i<dates.size();i++) {
			dateStr.add("'"+ trans.format(dates.get(i).getPfmDate()) + "'");
		}
		
		model.addAttribute("dates", dateStr);
		
		//-------------------
		
		
	}
	
	
	@RequestMapping(value= "/ticket/bookTimeInfo", method=RequestMethod.GET)
	public ModelAndView loadsTimes() {
		
		
		Performance pfm = new Performance();
		pfm.setPfmIdx(1);

		//해당 공연의 공연시간 불러오기 	
		List<PfmDateByTime> times = new ArrayList<PfmDateByTime>();
		
		times= ticketService.ticketTime(pfm);
		
		ModelAndView mav = new ModelAndView();
		
		//JSON 활용 키,값 형태면 JSON으로보내준다
		
		mav.setViewName("jsonView");
		
		Map timeMap = new HashMap();
		timeMap.put("timeslist", times);
		
		mav.addObject(timeMap);
		return mav;
		
		
	}
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 좌석예매
	 * @작성자:이상지
	 */

	public void ticketing() {
		
	}
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 예매한 좌석 불러오기
	 * @작성자:이상지
	 */
	public void loadReservedSeats() {
		
	}
	
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 좌석임시저장
	 * @작성자:이상지
	 */
	public void tempTicketing() {
		
	}
	
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 임시저장한 좌석 삭제
	 * @작성자:이상지
	 */
	public void tempTicketRemove() {
		
	}
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명:섹션 선택된거 불러오기
	 * @작성자:이상지
	 */
	public void loadSection() {
		
	}
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 빈좌석 불러오기
	 * @작성자:이상지
	 */
	public void loadSeats() {
		
	}

}
