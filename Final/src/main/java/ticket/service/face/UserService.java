package ticket.service.face;

import ticket.dto.User;

public interface UserService {

	/**
	 * @Method설명: 아이디와 비밀번호 확인
	 * @작성자 : 홍나영
	 */
	public boolean loginCheck(User user);
	
	/**
	 * @Method설명: 닉네임 얻기
	 * @작성자 : 홍나영
	 */
	public String getNick(User user);
	
	/**
	 * @Method설명: 유저 인덱스 얻기 
	 * @작성자 : 홍나영
	 */
	public int getUserIdx(User user);
	
	/**
	 * @Method설명: 회원 등록
	 * @작성자 : 홍나영
	 */
	public void join(User user);
	
	/**
	 * @Method설명: 정보 수정할 때 비밀벙호 체크
	 * @작성자 : 홍나영
	 */
	public boolean checkPw(User user);
	
	/**
	 * @Method설명: 닉네임으로 유저 전체 정보 가져오기
	 * @작성자 : 홍나영
	 */
	public User getUser(User user);
	
	/**
	 * @Method설명: 유저 정보 수정
	 * @작성자 : 홍나영
	 */
	public void update(User user);
}
