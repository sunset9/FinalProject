package ticket.service.admin.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import ticket.dto.StateOfBook;
import ticket.dto.User;
import ticket.utils.Paging;

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
	public void changeUserGrade(int currUser, int currUserGrade);
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 특정 회원의 예약 현황 리스트 가져오기  
	 * @작성자: 김지은
	 */
	public List<StateOfBook> getBookDetail(User user);
	
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
	public List<User> getPagingListByPaging(Paging paging);
	
	/**
	 * @최종수정일: 2018.12.12
	 * @Method설명: user_idx로 회원 정보 가져오기
	 * @작성자: 김지은
	 */
	public User getUserByUserIdx(User user);
	
	/**
	 * @최종수정일: 2018.12.14
	 * @Method설명: 전체 예매수 가져오기
	 * @작성자: 김지은
	 */
	public int getTotalBook(String search);
	
	/**
	 * @최종수정일: 2018.12.14
	 * @Method설명: 페이징한 예매현황 목록 가져오기
	 * @작성자: 김지은
	 */
	public List<StateOfBook> getSobListByPaging(Paging paging);
}
