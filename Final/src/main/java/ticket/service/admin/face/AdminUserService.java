package ticket.service.admin.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import ticket.dto.User;

public interface AdminUserService {
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 검색어 얻기
	 * @작성자: 김지은
	 */
	public String getSearch(HttpServletRequest req);
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 전체 회원수 얻기
	 * @작성자: 김지은
	 */
	public int getTotalUser(String search);
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 회원등급 변경하기
	 * @작성자: 김지은
	 */
	public void changeUserGrade(User user);
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 특정 회원의 예약 현황 리스트 가져오기  
	 * @작성자: 김지은
	 */
	public List getBookDetail(User user);
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 현재 접속자수 구하기
	 * @작성자: 김지은
	 */
	public int getConnectUser();
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 1:1 문의 미답변수 가져오기
	 * @작성자: 김지은
	 */
	public int getUnanswered();
	
	/**
	 * @최종수정일: 2018.12.10
	 * @Method설명: 전체 회원 목록 가져오기
	 * @작성자: 김지은
	 */
	public List<User> getPagingList();
}
