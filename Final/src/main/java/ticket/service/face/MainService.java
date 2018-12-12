package ticket.service.face;

import java.util.List;

import ticket.dto.Genre;
import ticket.dto.Performance;
import ticket.dto.Poster;
import ticket.dto.Theme;

public interface MainService {
	/**
	 * 최종수정일: 2018.12.06
	 * @Method설명: 관리자가 선택한 콘서트 상단배너 15개
	 * @작성자: 배수연
	 */
	public List<Poster> adminChoiceBannerCon();
	
	/**
	 * 최종수정일: 2018.12.06
	 * @Method설명: 관리자가 선택한 뮤지컬&공연 상단배너 15개
	 * @작성자: 배수연
	 */
	public List<Poster> adminChoiceBannerMu();
	
	/**
	 * 최종수정일: 2018.12.06
	 * @Method설명: 관리자가 선택한 가족&아동 상단배너 15개
	 * @작성자: 배수연
	 */
	public List<Poster> adminChoiceBannerFam();
	
	
	/**
	 * 최종수정일: 2018.12.05
	 * @Method설명: 장르-테마 선택 후 조회 결과
	 * @작성자: 배수연
	 */
	public List getGenreByTheme(Genre genre, Theme theme);
	
	/**
	 * 최종수정일: 2018.12.06
	 * @Method설명: 공연 랭킹 출력 / 일간, 주간 / 예매율이 높은 TOP10
	 * @작성자: 배수연
	 */
	public List getPfmRanking(Performance pfm);

	/**
	 * 최종수정일: 2018.12.11
	 * @Method설명: 장르가 콘서트인 모든 포스터 이미지 출력
	 * @작성자: 배수연
	 */
	public List<Poster> getConPfmPoster();

	/**
	 * 최종수정일: 2018.12.11
	 * @Method설명: 장르가 뮤지컬&공연인 모든 포스터 이미지 출력
	 * @작성자: 배수연
	 */
	public List<Poster> getMuPfmPoster();
	
	/**
	 * 최종수정일: 2018.12.11
	 * @Method설명: 콘서트 테마 종류(GENRE) 가져오기
	 * @작성자: 배수연
	 */
	public List<Theme> getConThemeKind();

	/**
	 * 최종수정일: 2018.12.11
	 * @Method설명: 뮤지컬&연극 테마 종류(GENRE) 가져오기
	 * @작성자: 배수연
	 */
	public List<Theme> getMuThemeKind();
	
	/**
	 * 최종수정일: 2018.12.11
	 * @Method설명: 가족&아동 테마 종류(GENRE) 가져오기
	 * @작성자: 배수연
	 */
	public List<Theme> getFamThemeKind();

	/**
	 * 최종수정일: 2018.12.11
	 * @Method설명: 원하는 테마 선택 후 리스트 출력하기( 테스트중 )
	 * @작성자: 배수연
	 */
	public List<Poster> getpfmThemeChoicePoster(Theme theme);
	
}
