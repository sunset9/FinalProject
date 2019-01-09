package ticket.dao.face;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import ticket.dto.AgeGrade;
import ticket.dto.Artist;
import ticket.dto.Cast;
import ticket.dto.Genre;
import ticket.dto.Hall;
import ticket.dto.MainBanner;
import ticket.dto.Performance;
import ticket.dto.PfmBookinfo;
import ticket.dto.PfmDateByTime;
import ticket.dto.PfmDetail;
import ticket.dto.PfmTheme;
import ticket.dto.Poster;
import ticket.dto.SeatSection;
import ticket.dto.TabBanner;
import ticket.dto.Theme;
import ticket.utils.Paging;

/**
 * @author hj
 *
 */
public interface PfmDao {

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 장르 전체 목록 가져오기
	 * @작성자: 전해진
	 */
	public List<Genre> selectAllGenre();

	/**
	 * @param genre 
	 * @최종수정일: 2018.12.05
	 * @Method설명: 테마 전체 목록 가져오기
	 * @작성자: 전해진
	 */
	public List<Theme> selectAllTheme(Genre genre);

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 모든 관람 등급 정보 가져오기
	 * @작성자: 전해진
	 */
	public List<AgeGrade> selectAllAgeGrade();

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 일치하는 이름의 아티스트 리스트 가져오기
	 * @작성자: 전해진
	 */
	public List<Artist> selectArtistByName(@Param(value = "artist") Artist artist
			, @Param(value = "paging") Paging paging);

	/**
	 * @최종수정일: 2018.12.06
	 * @Method설명:모든 공연장 정보 가져오기
	 * @작성자: 전해진
	 */
	public List<Hall> selectAllHall();
	
	/**
	 * @최종수정일: 2018.12.06
	 * @Method설명: 공연테이블 idx nextval 가져오는 메소드
	 * @작성자: 전해진
	 */
	public int selectNextPfmIdx();

	/**
	 * @최종수정일: 2018.12.06
	 * @Method설명: 공연 기본 정보 삽입
	 * @작성자: 전해진
	 */
	public void insertPfm(Performance pfm);
  
	/**
	 * @최종수정일: 2018.12.06
	 * @Method설명: 오늘의 예매수 가져오기
	 * @작성자: 김지은
	 */
	public int selectTodayBook();
	
	/**
	 * @최종수정일: 2018.12.06
	 * @Method설명: 오늘의 예매취소수 가져오기
	 * @작성자: 김지은
	 */
	public int selectTodayCancel();
	
	/**
	 * @최종수정일: 2018.12.07
	 * @Method설명: 오늘 등록된 모든 공연의 수 가져오기
	 * @작성자: 김지은
	 */
	public int selectTodayAllPfm();
	
	/**
	 * @최종수정일: 2018.12.06
	 * @Method설명: 오늘 등록된 콘서트/뮤지컬&연극/가족&아동 공연수 가져오기
	 * @작성자: 김지은
	 */
	public int selectTodayCon();
	public int selectTodayMu();
	public int selectTodayFam();

	/**
	 * @최종수정일: 2018.12.09
	 * @Method설명: 1:1 문의 미답변수 가져오기
	 * @작성자: 김지은
	 */
	public int selectUnanswered();
	
	/**
	 * @최종수정일: 2018.12.06
	 * @Method설명: 공연에 해당하는 테마 리스트들 등록하기
	 * @작성자: 전해진
	 */
	public void insertPfmTheme(PfmTheme thm);

	/**
	 * @최종수정일: 2018.12.07
	 * @Method설명: 포스터 정보 등록하기
	 * @작성자: 전해진
	 */
	public void insertPoster(Poster poster);

	/**
	 * @최종수정일: 2018.12.08
	 * @Method설명: 출연진 정보 등록하기
	 * @작성자: 전해진
	 */
	public void insertCast(Cast cast);

	/**
	 * @최종수정일: 2018.12.10
	 * @Method설명: 공연 일정 정보(날짜, 시간) 등록하기
	 * @작성자: 전해진
	 */
	public void insertPfmDbt(PfmDateByTime pfmDbt);

	/**
	 * @최종수정일: 2018.12.10
	 * @Method설명: 공연 상세정보 등록하기
	 * @작성자: 전해진
	 */
	public void insertPfmDetail(PfmDetail pfmDetail);

	/**
	 * @최종수정일: 2018.12.10
	 * @Method설명: 공연 예약정보 등록하기
	 * @작성자: 전해진
	 */
	public void insertPfmBookinfo(PfmBookinfo pfmBookinfo);

	/**
	 * @최종수정일: 2018.12.10
	 * @Method설명: 검색결과와 일치하는 아티스트 수 조회
	 * @작성자: 전해진
	 */
	public int selectCntArtist(Artist artist);

	/**
	 * @최종수정일: 2018.12.11
	 * @Method설명: 총 콘서트 공연 개수 가져오기 
	 * @작성자: 전해진
	 */
	public int selectAllCntPfmByGenre(int genreIdx);

	/**
	 * @최종수정일: 2018.12.12
	 * @Method설명: 장르로 맞는 공연 목록 가져오기
	 * @작성자: 전해진
	 */
	public List<Performance> selectPfmByGenre(
			@Param(value="genreIdx") int genreIdx, @Param(value="paging") Paging paging);

	/**
	 * @최종수정일: 2018.12.12
	 * @Method설명: 검색어와 일치하는 공연의 총 개수 가져오기
	 * @작성자: 전해진
	 */
	public int selectCntPfmSearch(String keyword);

	/**
	 * @최종수정일: 2018.12.12
	 * @Method설명: 검색어와 일치하는 공연 리스트 가져오기
	 * @작성자: 전해진
	 */
	public List<Performance> selectPfmSearch(@Param(value="keyword") String keyword
			, @Param(value = "paging") Paging paging);

	/**
	 * @최종수정일: 2018.12.12
	 * @Method설명: 인덱스와 일치하는 공연 정보 가져오기
	 * @작성자: 전해진
	 */
	public Performance selectPfmByIdx(Performance pfm);

	/**
	 * @최종수정일: 2018.12.13
	 * @Method설명: 특정 공연의 인덱스와 일치하는 테마들 가져오기
	 * @작성자: 전해진
	 */
	public List<Theme> selectThemeByPfmIdx(Performance pfm);

	/**
	 * @최종수정일: 2018.12.13
	 * @Method설명:특정 공연의 인덱스와 일치하는 아티스트 목록 가져오기
	 * @작성자: 전해진
	 */
	public List<Artist> selectArtistByPfmIdx(Performance pfm);

	/**
	 * @최종수정일: 2018.12.13
	 * @Method설명:특정 공연의 인덱스와 일치하는 일정 정보 가져오기
	 * @작성자: 전해진
	 */
	public List<PfmDateByTime> selectPfmdbtByPfmIdx(Performance pfm);

	/**
	 * @최종수정일: 2018.12.13
	 * @Method설명: 특정 공연의 인덱스와 일치하는 공연 상세 정보 가져오기
	 * @작성자: 전해진
	 */
	public PfmDetail selectPfmDetailByPfmIdx(Performance pfm);

	/**
	 * @최종수정일: 2018.12.13
	 * @Method설명: 특정 공연의 인덱스와 일치하는 예매 상세 정보 가져오기
	 * @작성자: 전해진
	 */
	public PfmBookinfo selectPfmBookinfoByPfmIdx(Performance pfm);

	/**
	 * @최종수정일: 2018.12.13
	 * @Method설명:특정 공연의 인덱스와 일치하는 포스터 정보 가져오기
	 * @작성자: 전해진
	 */
	public Poster selectPosterByPfmIdx(Performance pfm);

	/**
	 * @최종수정일: 2018.12.14
	 * @Method설명: 공연 기본 정보 수정하기
	 * @작성자: 전해진
	 */
	public void updatePfm(Performance pfm);

	/**
	 * @최종수정일: 2018.12.14
	 * @Method설명: 포스터 정보 수정하기
	 * @작성자: 전해진
	 */
	public void updatePoster(Poster poster);
	
	/**
	 * @최종수정일: 2018.12.14
	 * @Method설명: 테마 idx로 공연 조회하기
	 * @작성자:홍나영
	 */
	public List<Performance> selectPfmByPreferTheme(Map map);

	/**
	 * @최종수정일: 2018.12.15
	 * @Method설명: 특정 공연에 포함되어있는 모든 테마 정보들 삭제
	 * @작성자: 전해진
	 */
	public void deletePfmTheme(int pfmIdx);

	/**
	 * @최종수정일: 2018.12.15
	 * @Method설명: 특정 공연의 출연진 정보 모두 삭제
	 * @작성자: 전해진
	 */
	public void deleteCast(int pfmIdx);

	/**
	 * @최종수정일: 2018.12.15
	 * @Method설명: 특정 공연의 공연 일정 모두 삭제
	 * @작성자: 전해진
	 */
	public void deletePfmDbt(int pfmIdx);

	/**
	 * @최종수정일: 2018.12.15
	 * @Method설명: 공연 상세정보 수정
	 * @작성자: 전해진
	 */
	public void updatePfmDetail(PfmDetail pfmDetail);

	/**
	 * @최종수정일: 2018.12.15
	 * @Method설명: 공연 예약정보 수정
	 * @작성자: 전해진
	 */
	public void updatePfmBookinfo(PfmBookinfo pfmBookinfo);

	/**
	 * @최종수정일: 2018.12.17
	 * @Method설명: 구역(구역명, 가격)정보 삽입
	 * @작성자: 전해진
	 */
	public void insertSeatSection(SeatSection seatSec);

	/**
	 * @최종수정일: 2018.12.17
	 * @Method설명: 특정 공연 idx 에 해당하는 구역 정보 조회
	 * @작성자: 전해진
	 */
	public List<SeatSection> selectSeatSectionByPfmIdx(Performance pfm);

	/**
	 * @최종수정일: 2018.12.17
	 * @Method설명: 특정 공연 idx에 해당하는 모든 구역정보 삭제
	 * @작성자: 전해진
	 */
	public void deleteSeatSec(int pfmIdx);

	/**
	 * @최종수정일: 2018.12.18
	 * @Method설명: 특정 공연 idx에 해당하는 포스터 정보 삭제
	 * @작성자: 전해진
	 */
	public void deletePoster(int pfmIdx);

	/**
	 * @최종수정일: 2018.12.18
	 * @Method설명: 공연 예약정보 삭제
	 * @작성자: 전해진
	 */
	public void deletePfmBookinfo(int pfmIdx);

	/**
	 * @최종수정일: 2018.12.18
	 * @Method설명: 공연 상제정보 삭제
	 * @작성자: 전해진
	 */
	public void deletePfmDetail(int pfmIdx);

	/**
	 * @최종수정일: 2018.12.18
	 * @Method설명: 공연 기본 정보 삭제
	 * @작성자: 전해진
	 */
	public void deletePfm(int pfmIdx);
	
	/**
	 * @최종수정일: 2018.12.18
	 * @Method설명: 등록된 메인배너 리스트 가져오기
	 * @작성자: 김지은
	 */
	public List<MainBanner> selectMainBanner();
	
	/**
	 * @최종수정일: 2018.12.19
	 * @Method설명: mainban_idx를 이용해서 메인 배너 삭제하기
	 * @작성자: 김지은
	 */
	public void deleteMainBanner(int mainbanIdx);
	
	/**
	 * @최종수정일: 2019.01.01
	 * @Method설명: tabIdx를 이용해서 탭 배너 삭제하기 
	 * @작성자: 김지은
	 */
	public void deleteTabBanner(int tabIdx);
	
	/**
	 * @최종수정일: 2018.12.20
	 * @Method설명: New 탭배너 목록 가져오기
	 * @작성자: 김지은
	 */
	public List<TabBanner> selectNewTabBanner();
	
	/**
	 * @최종수정일: 2018.12.20
	 * @Method설명: 콘서트 탭배너 목록 가져오기
	 * @작성자: 김지은
	 */
	public List<TabBanner> selectConTabBanner();
	
	/**
	 * @최종수정일: 2018.12.20
	 * @Method설명: 뮤지컬&연극 탭배너 목록 가져오기
	 * @작성자: 김지은
	 */
	public List<TabBanner> selectMuTabBanner();

	/**
	 * @최종수정일: 2018.12.24
	 * @Method설명: 주어진 구간 내에 티켓을 판매하는 공연 리스트 조회, 장르 구분 (좌석 수 오름차순으로 정렬)
	 * @작성자: 전해진
	 */
	public List<Performance> selectPfmListByPeriod(@Param(value="start") String start
			, @Param(value="end") String end
			, @Param(value="genreIdx") int genreIdx);

	/**
	 * @최종수정일: 2018.12.24
	 * @Method설명: 해당 공연의 총 좌석 수 조회
	 * @작성자: 전해진
	 */
	public int selectCntAllSeatByHallIdx(Performance pfm);

	/**
	 * @최종수정일: 2018.12.24
	 * @Method설명: 예매 기간 내에 예매한 좌석 수 조회
	 * @작성자: 전해진
	 */
	public int selectCntBookSeatBypfmIdx(@Param(value="pfm") Performance pfm
			, @Param(value="startDate") Date startDate, @Param(value="endDate") Date endDate);
	
	/**
	 * @최종수정일: 2018.12.24
	 * @Method설명: 최신순 공연목록 가져오기
	 * @작성자: 김지은
	 */
	public List<Performance> selectNeweastPfm(Paging paging);
	
	/**
	 * @최종수정일: 2018.12.24
	 * @Method설명: 전체 공연수 가져오기
	 * @작성자: 김지은
	 */
	public int selectTotalPfm(String search);
	
	/**
	 * @최종수정일: 2018.12.28
	 * @Method설명: 메인배너 파일 저장하기
	 * @작성자: 김지은
	 */
	public void insertMainBanner(MainBanner mainBanner);
	
	/**
	 * @최종수정일: 2019.01.01
	 * @Method설명: 탭배너 등록하기
	 * @작성자: 김지은
	 */
	public void insertTBanner(Map<String, String> tabInfo);
	
	/**
	 * @최종수정일: 2018.12.28
	 * @Method설명: pfmIdx로 메인 배너 중복 확인하기 
	 * @작성자: 김지은
	 */
	public int selectPfmIdxDup(int pfmIdx);
	
	/**
	 * @최종수정일: 2019.01.01
	 * @Method설명: pfmIdx로 탭배너 중복 확인하기
	 * @작성자: 김지은
	 */
	public int selectTabbanDup(Map<String, Integer> tabInfo);
	
	/**
	 * @최종수정일: 2018.12.28
	 * @Method설명: 페이징된 전체 목록 가져오기
	 * @작성자: 김지은
	 */
	public List<Performance> selectAllPfmList(Paging paging);
	public List<Performance> selectPfmListAlpha(Paging paging);
	
	/**
	 * @최종수정일: 2018.12.28
	 * @Method설명: 페이징된 콘서트 목록 가져오기
	 * @작성자: 김지은
	 */
	public List<Performance> selectAllConPfm(Paging paging);
	public List<Performance> selectConPfmListAlpha(Paging paging);
	
	/**
	 * @최종수정일: 2018.12.28
	 * @Method설명: 페이징된 뮤지컬 목록 가져오기
	 * @작성자: 김지은
	 */
	public List<Performance> selectAllMuPfm(Paging paging);
	public List<Performance> selectMuPfmListAlpha(Paging paging);
	
	/**
	 * @최종수정일: 2018.12.29
	 * @Method설명: pfmIdx로 검색해서 pfm 정보 가져오기
	 * @작성자: 김지은
	 */
	public Performance selectPfmByPfmIdx(int pfmIdx);

	/**
	 * @최종수정일: 2018.12.29
	 * @Method설명: 설정한 범위 내에 등록된 공연 일정 개수 구하기
	 * @작성자: 전해진
	 */
	public int selectPfmDbtCntByPfmIdx(@Param(value="pfm") Performance pfm
			, @Param(value="startDate") Date startDate, @Param(value="endDate") Date endDate);

	
	
	/**
	 * @최종수정일: 2018.12.31
	 * @Method설명: 정렬 종류별 공연 목록 가져오기
	 * @작성자: 김지은
	 */
	public List<Performance> selectNewestPfmList(String mbPfmSearch);
	public List<Performance> selectAlpahPfmList();
	
	/**
	 * @최종수정일: 2019.01.02
	 * @Method설명: 가장 마지막 mainban_idx 가져오기 
	 * @작성자: 김지은
	 */
	public int selectLastMainbanIdx();
	
	/**
	 * @최종수정일: 2019.01.07
	 * @Method설명: 총 누적공연수 가져오기 
	 * @작성자: 김지은
	 */
	public int selectTotalPfmCnt();

	/**
	 * @최종수정일: 2019.01.08
	 * @Method설명: 조회 범위에 따른 랭킹 목록 가져오기
	 * @작성자: 전해진
	 */
	public List<Performance> selectAllRankByGenre(
			@Param(value="start") Date start, @Param(value="end") Date end
			, @Param(value="genreIdx") int genreIdx);
	
	/**
	 * @최종수정일: 2019.01.08
	 * @Method설명: mainbanIdx로 mainbanner 정보가져오기
	 * @작성자: 김지은
	 */
	public MainBanner selectMbBymainbanIdx(int mainbanIdx);
	
}
