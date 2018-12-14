package ticket.dao.face;

import java.util.List;

import ticket.dto.Genre;
import ticket.dto.Performance;
import ticket.dto.Poster;
import ticket.dto.Theme;

public interface MainDao {
	/**
	 * 최종수정일: 2018.12.06
	 * @Method설명: 관리자가 선택한 콘서트 상단 배너 15개
	 * @작성자: 배수연
	 */
	public List<Poster> selectAdminBanCon();
	
	/**
	 * 최종수정일: 2018.12.06
	 * @Method설명: 관리자가 선택한 뮤지컬&공연 상단 배너 15개
	 * @작성자: 배수연
	 */
	public List<Poster> selectAdminBanMu();
	
	/**
	 * 최종수정일: 2018.12.06
	 * @Method설명: 관리자가 선택한 가족&아동 상단 배너 15개
	 * @작성자: 배수연
	 */
	public List<Poster> selectAdminBanFam();

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
	
	/**
	 * 최종수정일: 2018.12.11
	 * @Method설명: 장르가 콘서트인 모든 포스터 출력
	 * @작성자: 배수연
	 */
	public List<Poster> selectConPfmPosterInfo();

	/**
	 * 최종수정일: 2018.12.11
	 * @Method설명: 장르가 뮤지컬&공연인 모든 포스터 출력
	 * @작성자: 배수연
	 */
	public List<Poster> selectMuPfmPosterInfo();

	/**
	 * 최종수정일: 2018.12.12
	 * @Method설명: 장르가 가족&아동인 모든 포스터 출력
	 * @작성자: 배수연
	 */
	public List<Poster> selectFamPfmPosterInfo();

	/**
	 * 최종수정일: 2018.12.11
	 * @Method설명: 장르가 콘서트이면서 원하는 테마 선택시 해당하는 포스터 이미지 출력
	 * @작성자: 배수연
	 */
	public List<Poster> ConThemeChoice(String theme);

	/**
	 * 최종수정일: 2018.12.14
	 * @Method설명: 콘서트 - 마감임박순 정렬 리스트 출력
	 * @작성자: 배수연
	 */
	public List<Poster> selectDeadlindListPfm();

	/**
	 * 최종수정일: 2018.12.14
	 * @Method설명: 콘서트 - 최신순 정렬 리스트 출력
	 * @작성자: 배수연
	 */
	public List<Poster> selectLatestListPfm();

	/**
	 * 최종수정일: 2018.12.14
	 * @Method설명: 콘서트 - 인기순 정렬 리스트 출력
	 * @작성자: 배수연
	 */
	public List<Poster> selectPopularityListPfm();

}
