package ticket.dao.face;

import ticket.dto.User;

public interface UserDao {
	
	/**
	 * @Method설명:로그인시 비밀번호와 아이디로 회원 조회
	 * @작성자 : 홍나영
	 */
	public int selectByIdByPw(User user);
	
	/**
	 * @Method설명: 세션에 저장할 user idx 얻어오기
	 * @작성자 : 홍나영
	 */
	public int selectIdxById(User user);
	
	/**
	 * @Method설명: 세션에 저장할 idx 얻기
	 * @작성자 : 홍나영
	 */
	public String selectNickByIdx(User user);
	
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
