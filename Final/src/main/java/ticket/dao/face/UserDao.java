package ticket.dao.face;

import java.util.List;

import org.apache.ibatis.annotations.Param;

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
	public int selectPwByUserIdx(User user);
	
	/**
	 * @Method설명: idx로 user 전체 정보 조회하기 
	 * @작성자 : 홍나영
	 */
	public User selectUser(User user);
	
	/**
	 * @Method설명: 유저 정보 수정하기
	 * @작성자 : 홍나영
	 */
	public void updateUser(User user);
	
	/**
	 * @최종수정일: 2018.12.10
	 * @Method설명: 회원가입 할 때 유저 정보 넣기
	 * 				들어갔는지 확인해서 useridx 값 받기
	 * @작성자 : 홍나영
	 */
	public int insert(User user);
	
	/**
	 * @최종수정일: 2018.12.07
	 * @Method설명: email로 등록된 user 조회하기
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
	 * @최종수정일: 2018.12.12
	 * @Method설명: 회원의 예매 현황 리스트 가져오기(메소드명에 SOB = State Of Book)
	 * @작성자: 김지은
	 */
	public List<StateOfBook> selectSOB(User user);

}
