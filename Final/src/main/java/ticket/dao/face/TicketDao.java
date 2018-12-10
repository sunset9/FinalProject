package ticket.dao.face;

import java.util.List;

import ticket.dto.Hall;
import ticket.dto.Performance;
import ticket.dto.PfmDateByTime;
import ticket.dto.Seat;
import ticket.dto.SeatCurrent;
import ticket.dto.SeatSection;
import ticket.dto.User;

public interface TicketDao {
	

	
	/**
	 * @최종수정일: 2018.12.10
	 * @Method설명: 해당공연의 시간 데이터 불러오기
	 * @작성자:이상지
	 */
	public List<PfmDateByTime> selectDateTime(Performance pfm); 
	/**
	 * @최종수정일: 2018.12.10
	 * @Method설명: 해당공연의 데이트 데이터 불러오기 
	 * @작성자:이상지
	 */
	public List<PfmDateByTime> selectDates(Performance pfm);
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명:티켓예매하기
	 * @작성자:이상지
	 */
	public void insertTicket(User user, Seat seat, Performance pfm);
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 해당 공연의 예매한 좌석불러오기
	 * @작성자:이상지
	 */
	public List<Seat> selectBookedseats(Performance prm);
	
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명:좌석선택후 다음스탭 넘어갔을때 좌석 임시저장하기
	 * @작성자:이상지
	 */
	public void insertTempSeats(Seat seat, Performance pfm);
	
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명:공연의 좌석 섹션 불러오기
	 * @작성자:이상지
	 */
	public List<SeatSection> selectSection(Performance pfm);
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명:공연장의 좌석 정보불러오기
	 * @작성자:이상지
	 */
	public void selectSeatsByHallIdx(Hall hall);
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명:임시저장했던 좌석 삭제
	 * @작성자:이상지
	 */
	public void DeleteTempSeat(Seat seat);
	
}
