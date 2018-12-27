package ticket.dao.face;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import ticket.dto.PaymentInfo;
import ticket.dto.Seat;
import ticket.dto.SeatSection;
import ticket.dto.Shipment;
import ticket.dto.StateOfBook;
import ticket.dto.User;
import ticket.utils.Paging;

public interface UserDao {
	
	/**
	 * @최종수정일: 2018.12.06
	 * @Method설명:유저 email,pw로 유저 존재하는지 확인
	 * @작성자:이상지
	 */
	public int selectCntUser(User user);
	
	/**
	 * @Method설명: 정보 수정시 비밀번호 확인하기
	 * @작성자 : 홍나영
	 */
	public String selectPwByUserIdx(User user);
	
	/**
	 * @Method설명: idx로 user 전체 정보 조회하기 
	 * @작성자 : 홍나영
	 */
	public User selectUser(int userIdx);
	
	/**
	 * @Method설명: 유저 닉네임 수정하기
	 * @작성자 : 홍나영
	 */
	public void updateNick(User user);
	
	/**
	 * @최종수정일: 2018.12.17
	 * @Method설명: 유저 비밀번호 수정하기
	 * @작성자:홍나영
	 */
	public void updatePass(User user);
	
	/**
	 * @최종수정일: 2018.12.17
	 * @Method설명: 유저 전화번호 수정하기
	 * @작성자:홍나영
	 */
	public void updatePhone(User user);
	
	
	/**
	 * @최종수정일: 2018.12.17
	 * @Method설명: 유저 주소 수정하기
	 * @작성자:홍나영
	 */
	public void updateAddr(User user);
	
	/**
	 * @최종수정일: 2018.12.10
	 * @Method설명: 회원가입 할 때 유저 정보 넣기
	 * 				들어갔는지 확인해서 useridx 값 받기
	 * @작성자 : 홍나영
	 */
	public int insert(User user);
	
	/**
	 * @최종수정일: 2018.12.07
	 * @Method설명: email로 등록된 user 조회해서 useridx 받아오기
	 * @작성자:홍나영
	 */
	public int selectUserByEmail(String email);
	

	/**
	 * @최종수정일: 2018.12.09
	 * @Method설명: 전체 유저수 가져오기
	 * @작성자: 김지은
	 */
	public int selectCntUserBySearch(String search);
	
	/**
	 * @최종수정일: 2018.12.10
	 * @Method설명: 검색어 적용된 유저 목록 가져오기
	 * @작성자: 김지은
	 */
	public List<User> selectPagingUserListByPaging(Paging paging);

	
	/**
	 * @최종수정일: 2018.12.07
	 * @Method설명: nick으로 등록된 user 조회
	 * @작성자:홍나영
	 */
	public int selectUserByNick(String nick);
	
	/**
	 * @최종수정일: 2018.12.11
	 * @Method설명: user의 등급 변경(업데이트)
	 * @작성자: 김지은
	 */
	public void updateUserGrade(@Param("currUser") int currUser, @Param("currUserGrade") int currUserGrade);
	
	
	/**
	 * @최종수정일: 2018.12.24
	 * @Method설명: 회원의 예매 현황 리스트 가져오기(SOB = State Of Book)
	 *				수정 했어요 ! SELECT 해오는 컬럼에 pfm_idx 추가 했습니다.
	 * @작성자: 김지은
	 * @사용자: 홍나영
	 */
	public List<StateOfBook> selectSOB(User user);
	
	
	/**
	 * @최종수정일: 2018.12.13
	 * @Method설명: 회원등급 문자로 표시된 회원 조회하기
	 * @작성자: 김지은
	 */
	public User selectUserGrade(User user);
	
	/**
	 * @최종수정일: 2018.12.14
	 * @Method설명: 전체 예매수 가져오기 
	 * @작성자: 김지은
	 */
	public int selectCntSobBySearch(String search);
	
	/**
	 * @최종수정일: 2018.12.14
	 * @Method설명: 검색어 적용된 예매현황 목록 가져오기
	 * @작성자: 김지은
	 */
	public List<StateOfBook> selectSobListByPaging(Paging paging);
	
	/**
	 * @최종수정일: 2018.12.17
	 * @Method설명: bookGroup 중 예매상태가 '취소중'인 좌석의 impUid 가져오기
	 * @작성자: 김지은
	 */
	public List<PaymentInfo> selectImpUidByBookGroup(String bookGroup);

	
	/**
	 * @최종수정일: 2018.12.18
	 * @Method설명: 연락처와 이름으로 email 조회
	 * @작성자:홍나영
	 */
	public String selectEmailByNameAndPhone(User user);

	
	/**
	 * @최종수정일: 2018.12.19
	 * @Method설명: 프로필 사진 바꾸기
	 * @작성자:홍나영
	 */
	public void updateProfile(User user);
	
	/**
	 * @최종수정일: 2018.12.21
	 * @Method설명: 환불된 예매 취소하기
	 * @작성자: 김지은
	 */
	public void deleteBook(PaymentInfo pay);
	
	/**
	 * @최종수정일: 2018.12.21
	 * @Method설명: 취소된 좌석 삭제하기
	 * @작성자: 김지은
	 */
	public void deleteSeat(PaymentInfo seat);
	
	/**
	 * @최종수정일: 2018.12.23
	 * @Method설명: 예매현황 count 구하기
	 * @작성자: 김지은
	 */
	public int selectTotalSob(String search);

    /**
	 * @최종수정일: 2018.12.24
	 * @Method설명: 한 공연에 대한 예약 정보 얻어오기 userIdx, pfmIdx 매개변수로 사용
	 * @작성자:홍나영
	 */
	public StateOfBook selectBook(Map map);
	
	
	/**
	 * @최종수정일: 2018.12.24
	 * @Method설명: 티켓 수령방법 조회하기
	 * @작성자:홍나영
	 */
	public int selectReceive(String bookGroup);
	
	
	/**
	 * @최종수정일: 2018.12.24
	 * @Method설명: 배송지 조회하기
	 * @작성자:홍나영
	 */
	public Shipment selectShipmet(String bookGroup);
	
	
	/**
	 * @최종수정일: 2018.12.24
	 * @Method설명: 예매한 좌석 구역과 가격 불러오기
	 * @작성자:홍나영
	 */
	public SeatSection selectSeat(String bookGroup);
	
	
	/**
	 * @최종수정일: 2018.12.26
	 * @Method설명:마이페이지 공연 예매 상세에서 사용할 결제 정보 얻어오기 
	 * @작성자:홍나영
	 */
	public PaymentInfo selectPaymentByimpUid(String impUid);
	
	
	/**
	 * @최종수정일: 2018.12.27
	 * @Method설명: 예매 번호로 예매한 좌석 조회 
	 * @작성자:홍나영
	 */
	public List<Seat> selectSeatByBookGroup(String bookGroup);

}
