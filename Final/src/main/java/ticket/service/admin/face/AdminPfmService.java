package ticket.service.admin.face;

import java.util.List;

import ticket.dto.MainBanner;
import ticket.dto.Performance;

public interface AdminPfmService {
	
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 메인 배너 리스트 불러오기 
	 * @작성자: 김지은
	 */
	public List getMBannerList();
	
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 메인 배너 등록/수정시, 공연 검색값 받아오기
	 * @작성자: 김지은 
	 */
	public Performance getPfmInfo();
	
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 메인 배너 등록/수정시, 배너랑 썸네일 정보 받아오기
	 * @작성자: 김지은 
	 */
	public MainBanner getMBanner();

	
	/**
	 * @최종수정일: 2018.12.05 
	 * @Method설명: 메인 배너 최종 등록하기
	 * @작성자: 김지은
	 */
	public void registMBanner();
	
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 새로 등록된(New) 탭 배너 리스트 가져오기
	 * @작성자: 김지은
	 */
	public List getNewTabBanner();
	
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 장르가 콘서트인 탭 배너 리스트 가져오기
	 * @작성자: 김지은
	 */
	public List getConTabBanner();
	
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 장르가 뮤지컬&연극인 탭 배너 리스트 가져오기
	 * @작성자: 김지은
	 */
	public List getMuTabBanner();
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 오늘의 총 예매수 불러오기
	 * @작성자: 김지은
	 */
	public int getTodayBook();
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 오늘의 예매취소수 불러오기
	 * @작성자: 김지은
	 */
	public int getTodayCancel();
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 오늘 등록된 콘서트 공연수 가져오기
	 * @작성자: 김지은
	 */
	public int getTodayCon();
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 오늘 등록된 뮤지컬&연극 공연수 가져오기
	 * @작성자: 김지은
	 */
	public int getTodayMu();
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 오늘 등록된 가족&아동 공연수 가져오기
	 * @작성자: 김지은
	 */
	public int getTodayFam();
	
}
