package ticket.service.face;

import java.util.Date;
import java.util.List;
import java.util.Map;

import ticket.dto.Book;
import ticket.dto.Hall;
import ticket.dto.OriginSection;
import ticket.dto.Performance;
import ticket.dto.PfmDateByTime;
import ticket.dto.Seat;
import ticket.dto.SeatCurrent;
import ticket.dto.SeatSection;
import ticket.dto.Shipment;
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
	public List<Seat> loadBookedSeats(Performance prm, String secName);

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
	public List<Seat> loadSeatsByHallIdx(Map SectionInfo);
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명:임시저장했던 좌석 삭제
	 * @작성자:이상지
	 */
	public void removeTempSeat(Seat seat);
	
	/**
	 * @최종수정일: 2018.12.12
	 * @Method설명: 원본구역 불러오기
	 * @작성자:이상지
	 */
	public List<OriginSection> loadOriginSection(Hall hall);
	
	/**
	 * @최종수정일: 2018.12.12
	 * @Method설명: 관리자가 지정해준 자리등급섹션? 불러오기 
	 * @작성자:이상지
	 */
	public List<SeatSection> loadSection(Performance pfm);
	
	/**
	 * @최종수정일: 2018.12.12
	 * @Method설명: 공연 idx로 관리자가 지정한 섹션불러오기
	 * @작성자:이상지
	 */
	public List<String> countSection(Performance pfm);
	
	/**
	 * @최종수정일: 2018.12.13
	 * @Method설명: 좌석행의 최대값 불러오기
	 * @작성자:이상지
	 */
	public int maxRow(int oriSecIdx);
	/**
	 * @최종수정일: 2018.12.13
	 * @Method설명: 좌석열의 최대값 불러오기
	 * @작성자:이상지
	 */
	public int maxCol(int oriSecIdx);
	
	/**
	 * @최종수정일: 2018.12.21
	 * @Method설명: 공연 섹션 불러오기 
	 * @작성자:이상지
	 */
	public List<SeatSection> loadPfmSection(Performance pfm);

	/**
	 * @최종수정일: 2018.12.21
	 * @Method설명: 공연idx, 날짜, 시간으로 임의의 공연의 해당 날짜 DB의 idx가져오기
	 * @작성자:이상지
	 */
	public int loadDayByTimeIdx(int pfmIdx, String date, String time);
	
	/**
	 * @최종수정일: 2018.12.26
	 * @Method설명: 홀인덱스, 섹션이름으로 해당 섹션의 idx가져오기
	 * @작성자:이상지
	 */
	public int loadOriginSecIdx(int hallIdx, String secName);
	
	/**
	 * @최종수정일: 2018.12.26
	 * @Method설명: 공연장Idx, 구역idx, 좌석 행렬로 좌석 idx조회
	 * @작성자:이상지
	 */
	public int loadSeatIdx(int hallIdx, int oriSecIdx, int seatRow, int seatCol);
	
	/**
	 * @최종수정일: 2018.12.26
	 * @Method설명: 결제완료시 book에 예매정보 저장
	 * @작성자:이상지
	 */
	public void storedBook(Book book);
	
	/**
	 * @최종수정일: 2018.12.26
	 * @Method설명: 배송 수령시 배송지 정보 저장
	 * @작성자:이상지
	 */
	public void storedShipment(Shipment shipment);
}

