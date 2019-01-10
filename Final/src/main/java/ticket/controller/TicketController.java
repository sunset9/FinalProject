
package ticket.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.common.collect.Sets.SetView;
import com.google.gson.Gson;

import ticket.dto.Book;
import ticket.dto.Hall;
import ticket.dto.OriginSection;
import ticket.dto.Performance;
import ticket.dto.PfmDateByTime;
import ticket.dto.Seat;
import ticket.dto.SeatCurrent;
import ticket.dto.SeatSection;
import ticket.dto.SectionInfo;
import ticket.dto.Shipment;
import ticket.dto.User;
import ticket.dto.NumBookedSeat;
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
		
		model.addAttribute("pfm",pfm);
		model.addAttribute("dates", dateStr);
		
		//-------------------
		
		
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
	 * @최종수정일: 2019.01.02
	 * @Method설명: 좌석별 예매한 갯수 구하기
	 * @작성자:이상지
	 */
	@RequestMapping(value="ticket/cntBookedSeats", method=RequestMethod.POST)
	public ModelAndView numOfReservedSeats(Performance pfm,String time, String date) {

		//전체 좌석 갯수
		List<NumBookedSeat> allSeats = new ArrayList<>();
		allSeats = ticketService.countAllSeats(pfm);
		
//		System.out.println("allSeats : " + allSeats);
		
		//날짜,시간,공연번호로 pfmDbtIdx 구하기
		int pfmDbtIdx = ticketService.loadDayByTimeIdx(pfm.getPfmIdx(), date, time);
		
		//예매한 좌석갯수
		List<NumBookedSeat> BookedSeats = new ArrayList<>();
		BookedSeats =  ticketService.countBookedSeats(pfm,2,pfmDbtIdx);
		
//		System.out.println("BookedSeats : " + BookedSeats);
	
		
		
		//ModelAndView으로 데이터 보내기
		ModelAndView mav = new ModelAndView();
		
		//JSON 활용 키,값 형태면 JSON으로보내준다
		mav.setViewName("jsonView");
		
		Map seatCntMap = new HashMap();
		seatCntMap.put("allSeats", allSeats);
		seatCntMap.put("BookedSeats", BookedSeats);
		mav.addObject(seatCntMap);
		return mav;
	}
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 좌석예매
	 * @작성자:이상지
	 */

	@RequestMapping(value="/ticket/ticketing", method=RequestMethod.POST)
	public ModelAndView ticketing(
			String time, //시간
			String date, //날짜
			int pfmIdx, //공연idx
			String[] seatInfo, //좌석정보
			int receiveIdx, //수령idx
			int hallIdx, //공연장idx
			String impUid, //결제고유ID
			HttpSession session, //세션
			String phone, //배송연락처
			String addrDetail, //자세한주소
			String addr, //주소
			String name, //이름
			String postCode //우편번호
			) {
		
		int pfmDbtIdx = 0;
		System.out.println("receiveIdx: "+receiveIdx);
		//날짜 인덱스 구하기(공연번호, 시간,날짜를 조건으로)
		pfmDbtIdx = ticketService.loadDayByTimeIdx(pfmIdx,date,time);
		
		//좌석idx들와 구역인덱스들을 담을 리스트변수
		List<Integer> seatIdx = new ArrayList<Integer>();
		List<Integer> oriSecIdx = new ArrayList<Integer>();
		
		//uuid로 예매번호 생성
		UUID uuid = UUID.randomUUID();
		String bookGroup = uuid.toString().split("-")[4];
		
		//좌석 인덱스 구하기(seatInfo정보로 공연장번호,구역,좌석행렬,공연번호로 구하기)
		for(int i = 0;i<seatInfo.length;i++) {
			String[] seatInfoStr; 
			seatInfoStr = seatInfo[i].split(" ");
			
//			System.out.println(seatInfoStr[0]); //석
//			System.out.println(seatInfoStr[1]); //구역
//			System.out.println(seatInfoStr[2]); //빈값
//			System.out.println(seatInfoStr[3]); //행
//			System.out.println(seatInfoStr[4]); //열
//			System.out.println(seatInfoStr[5]); // :
//			System.out.println(seatInfoStr[6]); // 가격
			
			//공연장 Idx와 구역이름으로 구역 idx 조회
			oriSecIdx.add(ticketService.loadOriginSecIdx(hallIdx,seatInfoStr[1].substring(0, 1)));
			int seatRow = 0;
			int seatCol = 0;
			//좌석 행, 열 값 구하기
			
			if(seatInfoStr[3].length() == 2) {
				seatRow = Integer.parseInt(seatInfoStr[3].substring(0, 1)); 
			}else if(seatInfoStr[3].length() == 3) {
				seatRow = Integer.parseInt(seatInfoStr[3].substring(0, 2)); 
			}
			if(seatInfoStr[4].length() == 2) {
				seatCol = Integer.parseInt(seatInfoStr[4].substring(0, 1)); 
				
			}else if(seatInfoStr[4].length() == 3) {
				seatCol = Integer.parseInt(seatInfoStr[4].substring(0, 2)); 
			}
			
			
//			//공연장Idx, 구역idx, 좌석 행렬로 좌석 idx조회
			seatIdx.add(ticketService.loadSeatIdx(hallIdx,oriSecIdx.get(i),seatRow, seatCol));
		
			//세션에서 유저정보 받아오기
			User loginUser = (User) session.getAttribute("loginUser");
			
			Book book = new Book();
			book.setBookGroup(bookGroup);
			book.setPfmIdx(pfmIdx);
			book.setUserIdx(loginUser.getUserIdx());
			book.setBookCateIdx(1);
			book.setPfmDbtIdx(pfmDbtIdx);
			book.setSeatIdx(seatIdx.get(i));
			book.setImpUid(impUid);
			book.setReceiveIdx(receiveIdx);
			
			//예매정보 저장하기
			ticketService.storedBook(book);
			
			//임시티켓 삭제하기
			SeatCurrent seatCurr = new SeatCurrent();
			
			seatCurr.setPfmIdx(pfmIdx);
			seatCurr.setSeatIdx(seatIdx.get(i));
			
			ticketService.deleteSeatCurr(seatCurr);
		}
		
		
		if(receiveIdx == 2) { //배송 수령일경우
		
			Shipment shipment = new Shipment();
			
			shipment.setAddr(addr);
			shipment.setAddrDetail(addrDetail);
			shipment.setBookGroup(bookGroup);
			shipment.setName(name);
			shipment.setPhone(phone);
			shipment.setPostcode(postCode);
			
			ticketService.storedShipment(shipment);
			
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		mav.addObject("bookGroup", bookGroup);
		return mav;
		
	}
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 좌석임시저장된 좌석있는지 확인
	 * @작성자:이상지
	 */
	@RequestMapping(value="ticket/tempTicketing", method=RequestMethod.GET)
	public ModelAndView cntTempTicketing(int pfmIdx, int hallIdx, String secName, int seatRow, int seatCol) {
		
		int oriSecIdx = ticketService.loadOriginSecIdx(hallIdx, secName);
		
		int seatIdx = ticketService.loadSeatIdx(hallIdx, oriSecIdx, seatRow, seatCol);
		
		int cnt = ticketService.countTemp(pfmIdx, seatIdx);
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("jsonView");
		
		if (cnt > 0) {
			logger.info("cnt:"+cnt);
			mav.addObject("isTempSeat", true);
		}
		
		return mav;
	}
	
	/**
	 * @최종수정일: 2019.01.10
	 * @Method설명: 좌석임시저장
	 * @작성자:이상지
	 */
	@RequestMapping(value="ticket/tempTicketing", method=RequestMethod.POST)
	public ModelAndView tempTicketing(int pfmIdx, int hallIdx, String secName, int seatRow, int seatCol) {
		int oriSecIdx = ticketService.loadOriginSecIdx(hallIdx, secName);
		int seatIdx = ticketService.loadSeatIdx(hallIdx, oriSecIdx, seatRow, seatCol);
		
		SeatCurrent seatCurr = new SeatCurrent();
		
		
		seatCurr.setPfmIdx(pfmIdx);
		seatCurr.setSeatIdx(seatIdx);
		seatCurr.setStatus(1);
		
		ticketService.tempTicketing(seatCurr);
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("jsonView");
		return mav;
		
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
	 * @Method설명: DB에서 좌석 그려줄 좌석정보 가져오기
	 * @작성자:이상지
	 */
	
	@RequestMapping(value="/hall/hall_2_seats/seat", method=RequestMethod.GET)
	public ModelAndView loadSeats(
				ModelAndView mav
				,String color
				, String secName
				, String pay
				, String appName
				, Hall hall
				, int oriSecIdx
				, int pfmIdx
				, String date
				, String time
				) 
	{
		
		//최대 행값과 열값 구하기
		int maxRow = ticketService.maxRow(oriSecIdx);
		int maxCol = ticketService.maxCol(oriSecIdx);
		
		//DB에 저장된 좌석모양 그대로 그려줄 좌석 리스트
		String[][] seats = new String[maxRow+1][maxCol+1];
		
		List<Seat> seatList = new ArrayList<Seat>();
		Map SectionInfo = new HashMap();
		
		SectionInfo.put("hall", hall);
		SectionInfo.put("oriSecIdx", oriSecIdx);
		
		//좌석 조회
		seatList = ticketService.loadSeatsByHallIdx(SectionInfo);
		
		//좌석 모양 초기화
		for(int i =1;i<=maxRow;i++) {
			for(int j=1;j<=maxCol;j++) {
				seats[i][j] = "_";
			}
		}
		
		//읽어온 그대로 좌석 모양 그려주기
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

		//예매된 좌석 담을 list
		List<Seat> bookedSeat = new ArrayList<Seat>();
		
		Performance pfm = new Performance();
		pfm.setPfmIdx(pfmIdx);
		
		//pfm_dbt_idx 구하기
		int dateByTimeIdx = ticketService.loadDayByTimeIdx(pfmIdx, date, time); 

		//예약된 좌석 불러오기
		bookedSeat = ticketService.loadBookedSeats(pfm, secName, dateByTimeIdx); //예약된좌석 불러오기
		
		//seatMap에 뿌려줄 형태로 바꿈 ['구역_행_열','구역_행_열'...]
		String bookedSeatArr[] = new String[bookedSeat.size()];
		String bookedstr = null;
		
		if(bookedSeat.size() != 0) {
			for(int i=0;i<bookedSeat.size();i++) {
				
				bookedSeatArr[i] = secName+"_"+bookedSeat.get(i).getSeatRow() + "_"+ bookedSeat.get(i).getSeatCol();
				
				if(i == 0) {
					bookedstr = "['"+bookedSeatArr[i]+"'"+","; 
				}
				else if(i != bookedSeat.size()-1) {
					bookedstr += "'"+bookedSeatArr[i]+"'"+","; 
					
				}else {
					bookedstr += "'"+bookedSeatArr[i]+"']"; 
				}
			}
		}else {
			bookedstr = "['f_f_f']";
		}
		
		//------------------------------------------------
	
		
		seatMap.put("bookedSeats", bookedstr); //-> 예약된 좌석 
		seatMap.put("seats", seatStr);
		seatMap.put("color", color);
		seatMap.put("secName", secName);
		seatMap.put("pay", pay);
		seatMap.put("appName", appName);
		seatMap.put("maxRow",maxRow);
		seatMap.put("maxCol",maxCol);
		mav.addObject("seatMap",seatMap);
		
		return mav;
		
		
	}
	
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
	
	/**
	 * @최종수정일: 2019.01.07
	 * @Method설명: 예매하기 버튼눌렀을때, 예매하기 새창 띄워주기
	 * @작성자:이상지
	 */
	@RequestMapping(value="/ticket/book", method=RequestMethod.GET)
	public void book (String Date, String time, String name) {
		
		
	}
	
	/**
	 * @최종수정일: 2019.01.07
	 * @Method설명: 세션별 가격정보
	 * @작성자:이상지
	 */
	@RequestMapping(value="/ticket/sectionPay", method=RequestMethod.POST)
	public ModelAndView sectionPay(int pfmIdx) {
		
		List<SeatSection> seatSec = new ArrayList<>();
		
		seatSec = ticketService.loadSecPay(pfmIdx);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		mav.addObject("seatSecPay", seatSec);
		return mav;
		
	}
	
	
	/**
	 * @최종수정일: 2019.01.07
	 * @Method설명: 공연별 세션이름, 가격 정보 받아오기
	 * @작성자:이상지
	 */
	@RequestMapping(value="/ticket/secInfo", method=RequestMethod.GET)
	public ModelAndView sectionInfo(int pfmIdx) { 
		List<SectionInfo> secInfo = new ArrayList<>();
		
		secInfo = ticketService.loadsecInfo(pfmIdx);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		mav.addObject("secInfo", secInfo);
		
		return mav;
	}
	
	/**
	 * @최종수정일: 2019.01.10
	 * @Method설명: 임시좌석저장 삭제
	 * @작성자:이상지
	 */
	@RequestMapping(value="/ticket/deleteTemp", method=RequestMethod.POST)
	public ModelAndView deleteTemp(int pfmIdx, int hallIdx, String secName, int seatRow, int seatCol) {
		int oriSecIdx = ticketService.loadOriginSecIdx(hallIdx, secName);
		int seatIdx = ticketService.loadSeatIdx(hallIdx, oriSecIdx, seatRow, seatCol);
		SeatCurrent seatCurr = new SeatCurrent();
		
		seatCurr.setPfmIdx(pfmIdx);
		seatCurr.setSeatIdx(seatIdx);
		
		ticketService.deleteSeatCurr(seatCurr);
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	
	/**
	 * @최종수정일: 2019.01.10
	 * @Method설명: 티켓오픈이 되었는지 확인
	 * @작성자:이상지
	 */
	@RequestMapping(value="/ticket/openTicket", method=RequestMethod.POST)
	public ModelAndView isOpenTicket(int pfmIdx) {
		
		Performance pfm = new Performance();
		pfm = ticketService.loadPfmInfo(pfmIdx);
		
		Date today = new Date();
		
		Date start = pfm.getPfmStart();
		
		Date end = pfm.getPfmEnd();
		
		Boolean ticketOpen;
		
		Boolean ticketEnd;
		
		if (start.compareTo(today) > 0) {
			//날짜가 느리다 (아직오픈되지 않았음)
			ticketOpen = false;
		}else {
			ticketOpen = true;
		}
		
		if (end.compareTo(today) >= 0) {
			//날짜가 느리다 (오픈 중)
			ticketEnd = true;
		}else {
			ticketEnd = false;
		}
		
		SimpleDateFormat trans = new SimpleDateFormat("yyyy-MM-dd");
		
		String openDate = trans.format(pfm.getTicketStart()); 
		
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("jsonView");
		
		mav.addObject("openDate", openDate);
		mav.addObject("ticketOpen",ticketOpen);
		mav.addObject("ticketEnd",ticketEnd);
		
		return mav;
	}

}

