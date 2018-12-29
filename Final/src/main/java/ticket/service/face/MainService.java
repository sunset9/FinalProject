package ticket.service.face;

import java.util.Date;
import java.util.List;

import ticket.dto.Artist;
import ticket.dto.Hall;
import ticket.dto.HallFile;
import ticket.dto.MainBanner;
import ticket.dto.Performance;
import ticket.dto.Poster;

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
	public List<Performance> getConPfmPoster();

	/**
	 * 최종수정일: 2018.12.11
	 * @Method설명: 장르가 뮤지컬&공연인 모든 포스터 이미지 출력
	 * @작성자: 배수연
	 */
	public List<Poster> getMuPfmPoster();

	/**
	 * 최종수정일: 2018.12.12
	 * @Method설명: 장르가 가족&아동인 모든 포스터 이미지 출력
	 * @작성자: 배수연
	 */
	public List<Poster> getFamPfmPoster();
	/**
	 * 최종수정일: 2018.12.11
	 * @Method설명: 원하는 테마 선택 후 리스트 출력하기
	 * @작성자: 배수연
	 */
	public List<Poster> getpfmThemeChoicePoster(String theme);

	/**
	 * 최종수정일: 2018.12.14
	 * @param genre 
	 * @Method설명: 콘서트 - 마감임박순 정렬
	 * @작성자: 배수연
	 */
	public List<Poster> getDeadlineList(int genreIdx);

	/**
	 * 최종수정일: 2018.12.14
	 * @Method설명: 콘서트 - 최신순 정렬
	 * @작성자: 배수연
	 */
	public List<Poster> getLatestList(int genreIdx);

	/**
	 * 최종수정일: 2018.12.29
	 * @Method설명: 콘서트 - 인기순
	 * @작성자: 전해진
	 */
	public List<Performance> getPopularityList(int genreIdx);

	/**
	 * 최종수정일: 2018.12.15
	 * @Method설명: 메인배너 리스트 가져오기
	 * @작성자: 배수연
	 */
	public List<MainBanner> mainBannerList();

	/**
	 * 최종수정일: 2018.12.16
	 * @Method설명: 메인 - new 탭 공연  리스트
	 * @작성자: 배수연
	 */
	public List<Poster> getnewPoster();

	/**
	 * 최종수정일: 2018.12.16
	 * @Method설명: 메인 - 콘서트 탭 공연 리스트
	 * @작성자: 배수연
	 */
	public List<Poster> getconPoster();

	/**
	 * 최종수정일: 2018.12.16
	 * @Method설명: 메인 - 뮤지컬&공연 탭 공연 리스트
	 * @작성자: 배수연
	 */
	public List<Poster> getMuPoster();

	/**
	 * 최종수정일: 2018.12.16
	 * @Method설명: 오픈 티켓 배너 리스트 5개
	 * @작성자: 배수연
	 */
	public List<Performance> ticketOpenList();

	/**
	 * 최종수정일: 2018.12.17
	 * @Method설명: 오픈 티켓 등록순
	 * @작성자: 배수연
	 */
	public List<Performance> ticketOpenPfmList();

	/**
	 * 최종수정일: 2018.12.17
	 * @Method설명: 오픈 티켓 오픈일순
	 * @작성자: 배수연
	 */
	public List<Performance> ticketOpenDayList();

	/**
	 * @return 
	 * @최종수정일: 2018.12.20
	 * @Method설명: 공연 예매율 구하기
	 * @작성자: 전해진
	 */
	public List<Performance> getTopRank(String type);

	/**
	 * 최종수정일: 2018.12.26
	 * @Method설명: 맞춤 공연 리스트 출력
	 * @작성자: 배수연
	 */
	public List<Poster> getFitPfmList(String userIdx);

	/**
	 * 최종수정일: 2018.12.26
	 * @Method설명: 오픈티켓 - 이름 검색
	 * @작성자: 배수연
	 */
	public List<Performance> getOpenSerchList(String opentext);

	/**
	 * 최종수정일: 2018.12.26
	 * @Method설명: 검색 - 공연 검색
	 * @작성자: 배수연
	 */
	public List<Poster> getSearchPfmList(String top_searchh);

	/**
	 * 최종수정일: 2018.12.27
	 * @Method설명: 검색 - 아티스트 검색
	 * @작성자: 배수연
	 */
	public List<Artist> getSearchArtList(String top_searchh);

	/**
	 * 최종수정일: 2018.12.27
	 * @Method설명: 검색 - 공연장 검색
	 * @작성자: 배수연
	 */
	public List<HallFile> getSearchHallList(String top_searchh);

	/**
	 * 최종수정일: 2018.12.27
	 * @Method설명: 검색 - 공연장 이름 출력
	 * @작성자: 배수연
	 */
	public List<Hall> getSearchHallNameList(String top_searchh);

	/**
	 * 최종수정일: 2018.12.27
	 * @Method설명: 조회된 총 공연 수 출력
	 * @작성자: 배수연
	 */
	public int getPfmCount(String top_searchh);

	/**
	 * 최종수정일: 2018.12.27
	 * @Method설명: 조회된 총 아티스트 수 출력
	 * @작성자: 배수연
	 */
	public int getArtCount(String top_searchh);
	
	/**
	 * 최종수정일: 2018.12.27
	 * @Method설명: 조회된 총 공연장 수 출력
	 * @작성자: 배수연
	 */
	public int getHallCount(String top_searchh);

	/**
	 * 최종수정일: 2018.12.27
	 * @Method설명: select 박스로 선택한 장르가 콘서트, 뮤지컬&연극, 가족&아동일 경우
	 * @작성자: 배수연
	 */
	public List<Performance> getOpenSelectSearchList(String genreIdx, String opentext);

	/**
	 * @최종수정일: 2018.12.29
	 * @Method설명: 장르별 랭킹 가져오기(top5)
	 * @작성자: 전해진
	 */
	public List<Performance> getTopRankByGenre(String genre);

}
