package ticket.dao.face;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import ticket.dto.Artist;
import ticket.dto.Hall;
import ticket.dto.HallFile;
import ticket.dto.MainBanner;
import ticket.dto.Performance;
import ticket.dto.Poster;

/**
 * @author suyeo
 *
 */
/**
 * @author suyeo
 *
 */
/**
 * @author suyeo
 *
 */
public interface MainDao {
	/**
	 * 최종수정일: 2018.12.06
	 * @Method설명: 관리자가 선택한 콘서트 상단 배너 15개
	 * @작성자: 배수연
	 */
	public List<Performance> selectAdminBanCon();
	
	/**
	 * 최종수정일: 2018.12.06
	 * @Method설명: 관리자가 선택한 뮤지컬&공연 상단 배너 15개
	 * @작성자: 배수연
	 */
	public List<Performance> selectAdminBanMu();
	
	/**
	 * 최종수정일: 2018.12.06
	 * @Method설명: 관리자가 선택한 가족&아동 상단 배너 15개
	 * @작성자: 배수연
	 */
	public List<Performance> selectAdminBanFam();

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
	public List<Performance> selectConPfmPosterInfo();

	/**
	 * 최종수정일: 2018.12.11
	 * @Method설명: 장르가 뮤지컬&공연인 모든 포스터 출력
	 * @작성자: 배수연
	 */
	public List<Performance> selectMuPfmPosterInfo();

	/**
	 * 최종수정일: 2018.12.12
	 * @Method설명: 장르가 가족&아동인 모든 포스터 출력
	 * @작성자: 배수연
	 */
	public List<Performance> selectFamPfmPosterInfo();

	/**
	 * 최종수정일: 2018.12.11
	 * @Method설명: 장르가 콘서트이면서 원하는 테마 선택시 해당하는 포스터 이미지 출력
	 * @작성자: 배수연
	 */
	public List<Performance> ThemeChoice(String theme);

	/**
	 * 최종수정일: 2018.12.14
	 * @param genre 
	 * @Method설명: 콘서트 - 마감임박순 정렬 리스트 출력
	 * @작성자: 배수연
	 */
	public List<Performance> selectDeadlindListPfm(@Param(value="genreIdx") int genreIdx);

	/**
	 * 최종수정일: 2018.12.14
	 * @Method설명: 콘서트 - 최신순 정렬 리스트 출력
	 * @작성자: 배수연
	 */
	public List<Performance> selectLatestListPfm(@Param(value="genreIdx") int genreIdx);

	/**
	 * 최종수정일: 2018.12.14
	 * @Method설명: 콘서트 - 인기순 정렬 리스트 출력
	 * @작성자: 배수연
	 */
	public List<Performance> selectPopularityListPfm(@Param(value="genreIdx") int genreIdx);

	/**
	 * 최종수정일: 2018.12.15
	 * @Method설명: 메인 배너 리스트 가져오기
	 * @작성자: 배수연
	 */
	public List<MainBanner> selectMainbannerList();

	/**
	 * 최종수정일: 2018.12.16
	 * @Method설명: 탭 - new 공연 리스트 출력
	 * @작성자: 배수연
	 */
	public List<Poster> selectNewPfmList();

	/**
	 * 최종수정일: 2018.12.16
	 * @Method설명: 메인 - 콘서트 탭 공연 리스트 출력 : sql문 확인 후 고치기
	 * @작성자: 배수연
	 */
	public List<Poster> selectConTabList();

	/**
	 * 최종수정일: 2018.12.18
	 * @Method설명: 메인 - 뮤지컬&연극 탭 공연 리스트 출력
	 * @작성자: 배수연
	 */
	public List<Poster> selectMuTabList();

	/**
	 * 최종수정일: 2018.12.18
	 * @Method설명: 테스트 데이터
	 * @작성자: 배수연
	 */
	public List<Poster> selectTestList();

	/**
	 * 최종수정일: 2018.12.18
	 * @Method설명: 티켓오픈 상단 배너 5개 출력하기 - 최신순으로 5개 리스트 뽑음
	 * @작성자: 배수연
	 */
	public List<Performance> selectTicketOpenList();

	/**
	 * 최종수정일: 2018.12.18
	 * @Method설명: 티켓 오픈 등록순 리스트 출력
	 * @작성자: 배수연
	 */
	public List<Performance> selectTicketOpenPfmList();

	/**
	 * 최종수정일: 2018.12.18
	 * @Method설명: 티켓 오픈 최신순 리스트 출력
	 * @작성자: 배수연
	 */
	public List<Performance> selectOpenDayPfmList();

	/**
	 * @최종수정일: 2018.12.21
	 * @Method설명: 주어진 날짜에 티켓을 판매하는 공연 리스트 조회 (좌석 수 오름차순으로 정렬)
	 * @작성자: 전해진
	 */
	public List<Performance> selectPfmListByOneDay(String targetDate);
	
	/**
	 * @최종수정일: 2018.12.19
	 * @Method설명: 주어진 구간 내에 티켓을 판매하는 공연 리스트 조회 (좌석 수 오름차순으로 정렬)
	 * @작성자: 전해진
	 */
	public List<Performance> selectPfmListByPeriod(@Param(value="start") String start
			, @Param(value="end") String end);

	/**
	 * @return 
	 * @최종수정일: 2018.12.19
	 * @Method설명: 해당 공연의 총 좌석 수 조회
	 * @작성자: 전해진
	 */
	public int selectCntAllSeatByHallIdx(Performance pfm);

	/**
	 * @최종수정일: 2018.12.19
	 * @Method설명: 예매 기간 내에 예매한 좌석 수 조회
	 * @작성자: 전해진
	 */
	public int selectCntBookSeatBypfmIdx(@Param(value="pfm") Performance pfm
			, @Param(value="startDate") Date startDate, @Param(value="endDate") Date endDate);

	/**
	 * 최종수정일: 2018.12.26
	 * @Method설명: 티켓오픈 - 이름 검색
	 * @작성자: 배수연
	 */
	public List<Performance> selectOpenSearchList(String opentext);

	/**
	 * 최종수정일: 2018.12.26
	 * @Method설명: 맞춤 공연 리스트 출력
	 * @작성자: 배수연
	 */
	public List<Poster> selectFitPfmList(String userIdx);

	/**
	 * 최종수정일: 2018.12.26
	 * @Method설명: 검색 - 공연 검색
	 * @작성자: 배수연
	 */
	public List<Poster> selectSearchPfmList(String searchKey);

	/**
	 * 최종수정일: 2018.12.27
	 * @Method설명: 검색 - 아티스트 검색
	 * @작성자: 배수연
	 */
	public List<Artist> selectSearchArtList(String top_searchh);

	/**
	 * 최종수정일: 2018.12.27
	 * @Method설명: 검색 - 공연장 검색
	 * @작성자: 배수연
	 */
	public List<HallFile> selectSearchHallList(String top_searchh);

	/**
	 * 최종수정일: 2018.12.27
	 * @Method설명: 검색 - 공연장 이름 출력
	 * @작성자: 배수연
	 */
	public List<Hall> selectSearchHallNameList(String top_searchh);

	/**
	 * 최종수정일: 2018.12.27
	 * @Method설명: 조회된 공연의 총 수
	 * @작성자: 배수연
	 */
	public int selectPfmCount(String top_searchh);

	/**
	 * 최종수정일: 2018.12.27
	 * @Method설명: 조회된 아티스트의 총 수
	 * @작성자: 배수연
	 */
	public int selectArtCount(String top_searchh);

	/**
	 * 최종수정일: 2018.12.27
	 * @Method설명: 조회된 공연장의 총 수
	 * @작성자: 배수연
	 */
	public int selectHallCount(String top_searchh);

	/**
	 * 최종수정일: 2018.12.27
	 * @Method설명: select 박스로 선택한 장르가 콘서트, 뮤지컬&연극, 가족&아동일 경우
	 * @작성자: 배수연
	 */
	public List<Performance> selectOpenSelectSearchList(
			@Param(value="genreIdx") String genreIdx
			, @Param(value="value") String opentext
		);

	/**
	 * @최종수정일: 2018.12.29
	 * @Method설명: 설정한 범위 내에 등록된 공연 일정 개수 구하기 
	 * @작성자: 전해진
	 */
	public int selectPfmDbtCntByPfmIdx(@Param(value="pfm") Performance pfm
			, @Param(value="startDate") Date startDate, @Param(value="endDate") Date endDate);

	/**
	 * @최종수정일: 2018.12.29
	 * @Method설명: 주어진 구간 내에 티켓을 판매하는 공연 리스트 조회 (좌석 수 오름차순으로 정렬)
	 * @작성자: 전해진
	 */
	public List<Performance> selectPfmListByPeriodNGenre(@Param(value="start") String start
			, @Param(value="end") String end, @Param(value="genreIdx") int genreIdx);

}