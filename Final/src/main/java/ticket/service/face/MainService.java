package ticket.service.face;

import java.util.List;

import ticket.dto.Genre;
import ticket.dto.Theme;

public interface MainService {

	/**
	 * 2018.12.05
	 * @Method설명: 관리자가 선택한 콘서트, 뮤지컬&공연, 가족&아동 리스트 / 상단 배너 15개
	 * @작성자: 배수연
	 */
	public List getAdminChoiceBanner(Genre genre);
	
	/**
	 * 2018.12.05
	 * @Method설명: 장르-테마 선택 후 조회 결과
	 * @작성자: 배수연
	 */
	public List getGenreByTheme(Genre genre, Theme theme);
	
	/**
	 * 2018.12.05
	 * @Method설명: 공연 랭킹 출력 / 일간, 주간( ★  수정하기 )
	 * @작성자: 배수연
	 */
	public List getPfmRanking();
	
}
