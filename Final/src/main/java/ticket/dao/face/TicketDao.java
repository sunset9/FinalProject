package ticket.dao.face;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

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

public interface TicketDao {
	
	/**
	 * @최종수정일: 2018.12.12
	 * @Method설명: hall_idx로 원본 구역 조회
	 * @작성자:이상지
	 */
	public List<OriginSection> selectOriSecByHallIdx(Hall hall);
	
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
	public List<Seat> selectBookedseats(@Param(value="pfm")Performance pfm, @Param(value="secName")String secName);
	
	
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
//	public List<SeatSection> selectSection(Performance pfm);
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명:공연장의 좌석 정보불러오기
	 * @작성자:이상지
	 */
	public List<Seat> selectSeatsByHallIdx(Map sectionInfo);
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명:임시저장했던 좌석 삭제
	 * @작성자:이상지
	 */
	public void DeleteTempSeat(Seat seat);
	
	/**
	 * @최종수정일: 2018.12.12
	 * @Method설명: 공연 idx로 관리자가 지정한 섹션정보 불러오기
	 * @작성자:이상지
	 */
	public List<SeatSection> selectSeatSectionByPfmIdx(Performance pfm);
	
	/**
	 * @최종수정일: 2018.12.17
	 * @Method설명: 구역받아오기 
	 * @작성자:이상지
	 */
	public List<SeatSection> selectSection(Performance pfm);
	
	
	/**
	 * @최종수정일: 2018.12.12
	 * @Method설명: 관리자가 지정한 섹션 불러오기
	 * @작성자:이상지
	 */
	public List<String> selectCntSectionByPfmIdx(Performance pfm);
	
	/**
	 * @최종수정일: 2018.12.13
	 * @Method설명: 좌석행의 최대값 불러오기
	 * @작성자:이상지
	 */
	public int selectMaxRow(int oriSecIdx);
	/**
	 * @최종수정일: 2018.12.13
	 * @Method설명: 좌석열의 최대값 불러오기
	 * @작성자:이상지
	 */
	public int selectMaxCol(int oriSecIdx);
	
	/**
	 * @최종수정일: 2018.12.21
	 * @Method설명: 공연idx, 날짜, 시간으로 임의의 공연의 해당 날짜 DB의 idx가져오기
	 * @작성자:이상지
	 */
	public int selectDayByTimeIdx(@Param(value = "pfmIdx") int pfmIdx, @Param(value = "date") String date, @Param(value = "time") String time);
	
	/**
	 * @최종수정일: 2018.12.26
	 * @Method설명: 공연장 idx와 구역이름으로 구역번호 구하기
	 * @작성자:이상지
	 */
	public int selectOriSecIdx(@Param(value = "hallIdx") int hallIdx, @Param(value = "secName") String secName);
	
	/**
	 * @최종수정일: 2018.12.26
	 * @Method설명: seatIdx 구하기
	 * @작성자:이상지
	 */
	public int selectSeatIdx(@Param(value = "hallIdx") int hallIdx, @Param(value = "oriSecIdx") int oriSecIdx, @Param(value = "seatRow") int seatRow, @Param(value = "seatCol") int seatCol);
	
	
	/**
	 * @최종수정일: 2018.12.26
	 * @Method설명: 예매정보 저장
	 * @작성자:이상지
	 */
	public void insertBook(Book book);
	
	/**
	 * @최종수정일: 2018.12.26
	 * @Method설명: 배송지 정보저장
	 * @작성자:이상지
	 */
	public void insertShipment(Shipment shipment);
}
