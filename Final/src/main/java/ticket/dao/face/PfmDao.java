package ticket.dao.face;

import java.util.List;

import ticket.dto.AgeGrade;
import ticket.dto.Artist;
import ticket.dto.Genre;
import ticket.dto.Hall;
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
}
