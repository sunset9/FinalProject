package ticket.dao.face;

import java.util.List;

import ticket.dto.Genre;
import ticket.dto.Performance;
import ticket.dto.Theme;

public interface MainDao {

	/**
	 * 최종수정일: 2018.12.05
	 * @Method설명: 관리자가 선택한 상단 배너 15개
	 * @작성자: 배수연
	 */
//	public List selectAdminChoiceBanner(Performance pfm, Genre genre);
	
	/**
	 * 최종수정일: 2018.12.06
	 * @Method설명: 관리자가 선택한 콘서트 상단 배너 15개
	 * @작성자: 배수연
	 */
	public List selectAdminBanCon();
	
	/**
	 * 최종수정일: 2018.12.06
	 * @Method설명: 관리자가 선택한 뮤지컬&공연 상단 배너 15개
	 * @작성자: 배수연
	 */
	public List selectAdminBanMu();
	
	/**
	 * 최종수정일: 2018.12.06
	 * @Method설명: 관리자가 선택한 가족&아동 상단 배너 15개
	 * @작성자: 배수연
	 */
	public List selectAdminBanFam();

	/**
	 * 최종수정일: 2018.12.05
	 * @Method설명: 장르-테마 선택 후 조회 결과
	 * @작성자: 배수연
	 */
	public List selectGenreByTheme(Genre genre, Theme theme);

	/**
	 * 최종수정일: 2018.12.05
	 * @Method설명: 선택한 공연이 상세 정보 출력
	 * @작성자: 배수연
	 */
	public Performance selectChoiceDetail(Performance pfm);

	/**
	 * 최종수정일: 2018.12.06
	 * @Method설명: 공연 랭킹 출력 / 일간, 주간
	 * 		전체 좌석에서 해당 공연의 좌석 수와 예매 수를 이용하여 백분율 구하기
	 * @작성자: 배수연
	 */
	public List selectPfmRanking(Performance pfm);

}