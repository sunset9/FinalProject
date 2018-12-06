package ticket.dao.face;

import ticket.dto.User;

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
	 * @Method설명: 회원가입 할 때 유저 정보 넣기
	 * @작성자 : 홍나영
	 */
	public void insert(User user);
}
