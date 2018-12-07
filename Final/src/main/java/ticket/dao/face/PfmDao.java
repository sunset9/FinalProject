package ticket.dao.face;

import java.util.List;

import ticket.dto.AgeGrade;
import ticket.dto.Artist;
import ticket.dto.Cast;
import ticket.dto.Genre;
import ticket.dto.Hall;
import ticket.dto.Performance;
import ticket.dto.PfmTheme;
import ticket.dto.Poster;
import ticket.dto.Theme;

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
	public List<Artist> selectArtistByName(Artist artist);

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
	 * @Method설명: 오늘 등록된 콘서트수 가져오기
	 * @작성자: 김지은
	 */
	public int selectTodayCon();

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
	
}
