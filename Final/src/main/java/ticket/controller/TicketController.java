package ticket.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.common.collect.Sets.SetView;
import com.google.gson.Gson;

import ticket.dto.Hall;
import ticket.dto.OriginSection;
import ticket.dto.Performance;
import ticket.dto.PfmDateByTime;
import ticket.dto.Seat;
import ticket.dto.SeatSection;
import ticket.service.face.TicketService;


@Controller
public class TicketController {
	
	@Autowired
	TicketService ticketService;
	
	private static final Logger logger = LoggerFactory.getLogger(TicketController.class);

	
	/**
	 * @최종수정일: 2018.12.10
	 * @Method설명: 공연의 날짜정보 불러와 bookInfo.jsp 띄워주기
	 * @작성자:이상지
	 */
	@RequestMapping(value="/ticket/bookInfo", method=RequestMethod.GET)
	public void ticketpicker(Model model, Performance pfm) {
		
		// 해당공연의 공연날짜 불러오기
		logger.info(""+pfm.toString());
		List<PfmDateByTime> dates = new ArrayList<PfmDateByTime>();
		dates = ticketService.ticketDatePicker(pfm);
		
//		System.out.println(dates);
		
		List<String> dateStr = new ArrayList<String>();
		
		SimpleDateFormat trans = new SimpleDateFormat("yyyy-MM-dd");
		
		for(int i=0 ; i<dates.size();i++) {
			dateStr.add("'"+ trans.format(dates.get(i).getPfmDate()) + "'");
		}
		
		System.out.println(""+pfm);
		model.addAttribute("pfm",pfm);
		model.addAttribute("dates", dateStr);
		
		//-------------------
		
		
	}
	
	
	@RequestMapping(value="/ticket/book", method=RequestMethod.GET)
	public void book (String Date, String time, String name) {
		
		
	}
	
	
	/**
	 * @최종수정일: 2018.12.12
	 * @Method설명: 해당공연의 공연시작시간 정보 불러오기
	 * @작성자:이상지
	 */
	@RequestMapping(value= "/ticket/bookTimeInfo", method=RequestMethod.GET)
	public ModelAndView loadsTimes(Performance pfm) {
		
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

	@RequestMapping(value="/ticket/ticketing", method=RequestMethod.POST)
	public ModelAndView ticketing(String time, String date, int pfmIdx, String[] seatInfo, int receiveIdx) {
//		logger.info("date:"+date);
//		logger.info("time:"+time);
//		logger.info("pfmIdx:"+pfmIdx);
//		logger.info("receiveIdx"+receiveIdx);
		
		
		for(int i =0;i<seatInfo.length;i++) {
			logger.info(seatInfo[i]);
		}
		
		int pfmDbtIdx = 0;
		
		List<Integer> seatIdx = new ArrayList<Integer>();
		
		//날짜 인덱스 구하기(공연번호, 시간,날짜를 조건으로)
		pfmDbtIdx = ticketService.loadDayByTimeIdx(pfmIdx,date,time);
		
	
		//좌석 인덱스 구하기(seatInfo정보로 구역,좌석행렬,공연번호로 구하기)
//		seatIdx = ticketService.loadSeatIdx();
		//예매정보 DB저장
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/ticket/ticketingComplete");
		return mav;
		
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
	 * @Method설명: DB에서 좌석 그려줄 좌석정보 가져오기
	 * @작성자:이상지
	 */
	
	@RequestMapping(value="/hall/hall_2_seats/seat", method=RequestMethod.GET)
	public ModelAndView loadSeats(ModelAndView mav,String color, String secName, String pay, String appName, Hall hall, int oriSecIdx) {
		
		int maxRow = ticketService.maxRow(oriSecIdx);
		int maxCol = ticketService.maxCol(oriSecIdx);
		
		String[][] seats = new String[maxRow+1][maxCol+1];
		
		List<Seat> seatList = new ArrayList<Seat>();
		Map SectionInfo = new HashMap();
		
		SectionInfo.put("hall", hall);
		SectionInfo.put("oriSecIdx", oriSecIdx);
		
		seatList = ticketService.loadSeatsByHallIdx(SectionInfo);
		
		for(int i =1;i<=maxRow;i++) {
			for(int j=1;j<=maxCol;j++) {
				seats[i][j] = "_";
			}
		}
	
		
		System.out.println(seatList.size());
		
		for(int i =0;i<seatList.size();i++) {
			int row = seatList.get(i).getSeatRow();
			int col = seatList.get(i).getSeatCol();
			seats[row][col] = "s";
		}
		
		//JSON 활용 키,값 형태면 JSON으로보내준다
		mav.setViewName("hall/hall_2_seats/seat");
		
		Map seatMap = new HashMap();
		
		
		String seatStr = "";
		
		for(int i =1;i<=maxRow;i++) {
			seatStr += "'";
			for(int j=1;j<=maxCol;j++) {
				seatStr += seats[i][j];
			}
			
			if(i == maxRow) {
				seatStr += "'";
			}else {
				seatStr += "',";
			}
		}
		
		logger.info(seatStr);
		
		seatMap.put("seats", seatStr);
		seatMap.put("color", color);
		seatMap.put("secName", secName);
		seatMap.put("pay", pay);
		seatMap.put("appName", appName);
		
		mav.addObject("seatMap",seatMap);
		
		return mav;
		
		
	}
	
	/**
	 * @최종수정일: 2018.12.13
	 * @Method설명: 빈좌석 불러오기
	 * @작성자:이상지
	 */
//	@RequestMapping(value="/hall/hall_2_seats/seat", method=RequestMethod.GET)
//	public void loadSeatView() {
//		
//	}
	
	/**
	 * @최종수정일: 2018.12.12
	 * @Method설명: DB에 등록된 오리진 섹션정보 불러오기
	 * @작성자:이상지
	 */
	@RequestMapping(value="/ticket/oriSec", method=RequestMethod.GET)
	public ModelAndView loadOriginSection() {

		Hall hall = new Hall();
		
		hall.setHallIdx(2);
		
		
		List<OriginSection> oriSecList = new ArrayList<OriginSection>();
		
		oriSecList= ticketService.loadOriginSection(hall);
		
		ModelAndView mav = new ModelAndView();
		
		//JSON 활용 키,값 형태면 JSON으로보내준다
		
		mav.setViewName("jsonView");
		
		Map oriSecMap = new HashMap();
		oriSecMap.put("oriSecMap", oriSecList);
		
		mav.addObject(oriSecMap);
		
		return mav;
		
	}
	
	/**
	 * @최종수정일: 2018.12.12
	 * @Method설명: 관리자가 지정해준 섹션 불러오기
	 * @작성자:이상지
	 */
	@RequestMapping(value="/ticket/seatSection", method=RequestMethod.POST)
	public ModelAndView loadSectionData(Performance pfm) {
		
		List<SeatSection> seatSection = new ArrayList<SeatSection>();
		
		//공연별 구역받아오기(GroupBY한값들)
		List<SeatSection> pfmSeatSection = new ArrayList<SeatSection>();
		
		List<String> secName = new ArrayList<String>();
		
		seatSection = ticketService.loadSection(pfm);
		
		secName = ticketService.countSection(pfm);
		
		pfmSeatSection = ticketService.loadPfmSection(pfm);
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("jsonView");
		
		Map secMap = new HashMap();
		secMap.put("secMap", seatSection);
		secMap.put("secName", secName);
		secMap.put("pfmSeatSection",pfmSeatSection);
		
		mav.addObject(secMap);
		
		return mav;
		
	}

}
