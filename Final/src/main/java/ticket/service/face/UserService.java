package ticket.service.face;

import java.util.List;

import javax.servlet.http.HttpSession;

import ticket.dto.MyChoice;
import ticket.dto.Performance;
import ticket.dto.PreferTheme;
import ticket.dto.User;

public interface UserService {

	/**
	 * @최종수정일: 18.12.10
	 * @Method설명: 아이디와 비밀번호 확인, 세션 처리 추가
	 * @작성자 : 홍나영
	 * @사용자 : 이상지
	 */
	public int loginCheck(User user, HttpSession session);
	
	
	/**
	 * @최종수정일: 2018.12.07
	 * @Method설명: 아이디 중복 체크
	 * @작성자:홍나영
	 */
	public int checkSignup(String email);
	
	/**
	 * @최종수정일: 2018.12.07
	 * @Method설명: 닉네임 중복 체크
	 * @작성자:홍나영
	 */
	public int checkNick(String nick);
	
	/**
	 * @Method설명: 회원 등록
	 * @작성자 : 홍나영
	 */
	public int join(User user);
	
	/**
	 * @Method설명: 정보 수정할 때 비밀벙호 체크
	 * @작성자 : 홍나영
	 */
	public boolean checkPw(User user);
	
	/**
	 * @Method설명: 유저 인덱스로 유저 전체 정보 가져오기
	 * @작성자 : 홍나영
	 */
	public User getUser(int userIdx);
	
	/**
	 * @Method설명: 유저 닉네임 정보 수정
	 * @작성자 : 홍나영
	 */
	public void updateNick(User user);
	
	
	/**
	 * @최종수정일: 2018.12.17
	 * @Method설명: 유저 비밀번호 정보 수정
	 * @작성자:홍나영
	 */
	public void updatePass(User user);
	
	/**
	 * @최종수정일: 2018.12.17
	 * @Method설명: 유저 비밀번호 정보 수정
	 * @작성자:홍나영
	 */
	public void updatePhone(User user);
	
	/**
	 * @최종수정일: 2018.12.17
	 * @Method설명: 유저 비밀번호 정보 수정
	 * @작성자:홍나영
	 */
	public void updateAddr (User user);
	
	/**
	 * @최종수정일: 2018.12.14
	 * @Method설명: 유저가 선택한 테마를 가지고 있는 공연 리스트 조회
	 * @작성자:홍나영
	 */
	public List<Performance> recommendPfm(List<PreferTheme> ptList);
	
	
	/**
	 * @최종수정일: 2018.12.18
	 * @Method설명: 이름이랑 연락처로 이메일 조회 하기 , 이메일만 String으로 받기
	 * @작성자:홍나영
	 */
	public String findEmail(User user);
}
