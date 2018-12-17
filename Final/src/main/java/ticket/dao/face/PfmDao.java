package ticket.dao.face;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import ticket.dto.AgeGrade;
import ticket.dto.Artist;
import ticket.dto.Cast;
import ticket.dto.Genre;
import ticket.dto.Hall;
import ticket.dto.Performance;
import ticket.dto.PfmBookinfo;
import ticket.dto.PfmDateByTime;
import ticket.dto.PfmDetail;
import ticket.dto.PfmTheme;
import ticket.dto.Poster;
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
	public List<Performance> selectPfmSearch(String keyword);

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
	
}
