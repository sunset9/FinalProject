package ticket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	@RequestMapping(value="/ticket/bookInfo")
	public void ticketpicker() {
		
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
