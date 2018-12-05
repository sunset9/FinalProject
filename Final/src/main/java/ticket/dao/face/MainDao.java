package ticket.dao.face;

import java.util.List;

import ticket.dto.Genre;
import ticket.dto.Performance;
import ticket.dto.Theme;

public interface MainDao {

	/**
	 * 2018.12.05
	 * @Method설명: 관리자가 선택한 상단 배너 15개
	 * @작성자: 배수연
	 */
	public List selectAdminChoiceBanner(Genre genre);

	/**
	 * 2018.12.05
	 * @Method설명: 장르-테마 선택 후 조회 결과
	 * @작성자: 배수연
	 */
	public List selectGenreByTheme(Genre genre, Theme theme);

	/**
	 * 2018.12.05
	 * @Method설명: 선택한 공연이 상세 정보 출력
	 * @작성자: 배수연
	 */
	public Performance selectChoiceDetail(Performance pfm);

	/**
	 * 2018.12.05
	 * @Method설명: 공연 랭킹 출력 / 일간, 주간
	 * @작성자: 배수연
	 */
	public List selectPfmRanking();

	/**
	 * 2018.12.05
	 * @Method설명: 기대평 목록 출력
	 * @작성자: 배수연
	 */
	public List selectExpectationList();

	/**
	 * 2018.12.05
	 * @Method설명: 관람후기 목록 출력
	 * @작성자: 배수연
	 */
	public List seletReviewList();

}
