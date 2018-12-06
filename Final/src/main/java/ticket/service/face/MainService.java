package ticket.service.face;

import java.util.List;

import ticket.dto.Book;
import ticket.dto.CategoryCon;
import ticket.dto.CategoryFam;
import ticket.dto.CategoryMu;
import ticket.dto.Genre;
import ticket.dto.Performance;
import ticket.dto.Theme;

public interface MainService {

	/**
	 * 최종수정일: 2018.12.05
	 * @Method설명: 관리자가 선택한 콘서트, 뮤지컬&공연, 가족&아동 리스트 / 상단 배너 15개
	 * @작성자: 배수연
	 */
//	public List getAdminChoiceBanner(Performance pfm, Genre genre);
	
	/**
	 * 최종수정일: 2018.12.06
	 * @Method설명: 관리자가 선택한 콘서트 상단배너 15개
	 * @작성자: 배수연
	 */
	public List adminChoiceBannerCon();
	
	/**
	 * 최종수정일: 2018.12.06
	 * @Method설명: 관리자가 선택한 뮤지컬&공연 상단배너 15개
	 * @작성자: 배수연
	 */
	public List adminChoiceBannerMu();
	
	/**
	 * 최종수정일: 2018.12.06
	 * @Method설명: 관리자가 선택한 가족&아동 상단배너 15개
	 * @작성자: 배수연
	 */
	public List adminChoiceBannerFam();
	
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
	
}
