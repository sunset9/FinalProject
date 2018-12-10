package ticket.service.face;

import java.util.List;

import ticket.dto.Hall;
import ticket.dto.Performance;
import ticket.dto.PfmDateByTime;
import ticket.dto.Seat;
import ticket.dto.SeatCurrent;
import ticket.dto.User;

public interface TicketService {
	
	
	/**
	 * @최종수정일: 2018.12.10
	 * @Method설명: 해당공연의 공연시간들 불러오기
	 * @작성자:이상지
	 */
	public List<PfmDateByTime> ticketTime(Performance pfm);
	
	/**
	 * @최종수정일: 2018.12.10
	 * @Method설명: 예매 데이트피커 데이터불러오기
	 * @작성자:이상지
	 */
	public List<PfmDateByTime> ticketDatePicker(Performance pfm);
	
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 예매하기
	 * @작성자:이상지
	 */
	public void ticketing(User user, Seat seat, Performance pfm);

	
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명:해당 공연의 예매한 좌석불러오기
	 * @작성자:이상지
	 */
	public List<Seat> loadBookedSeats(Performance prm);

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명:좌석선택후 다음스탭 넘어갔을때 좌석 임시저장
	 * @작성자:이상지
	 */
	public void tempSeats(Seat seat, Performance pfm);
	
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명:공연장의 좌석정보불러오기
	 * @작성자:이상지
	 */
	public void loadSeatsByHallIdx(Hall hall);
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명:임시저장했던 좌석 삭제
	 * @작성자:이상지
	 */
	public void removeTempSeat(Seat seat);
}

