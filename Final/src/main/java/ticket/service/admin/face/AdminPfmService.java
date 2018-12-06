package ticket.service.admin.face;

import java.util.List;

import ticket.dto.AgeGrade;
import ticket.dto.Artist;
import ticket.dto.Genre;
import ticket.dto.Hall;
import ticket.dto.Performance;
import ticket.dto.Theme;
import ticket.dto.ThemeList;

public interface AdminPfmService {

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 모든 장르 리스트 가져오기
	 * @작성자: 전해진
	 */
	public List<Genre> getGenreList();

	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 특정 장르에 따른 모든 테마 리스트 가져오기
	 * @작성자: 전해진
	 */
	public List<Theme> getThemeList(Genre genre);

	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 모든 관람 등급 정보 가져오기
	 * @작성자: 전해진
	 */
	public List<AgeGrade> getAgeGradeList();

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 일치하는 이름의 아티스트 리스트 가져오기
	 * @작성자: 전해진
	 */
	public List<Artist> getArtistList(Artist artist);


	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 모든 공연장 정보 가져오기
	 * @작성자: 전해진
	 */
	public List<Hall> getHallList();


	/**
	 * @최종수정일: 2018.12.06
	 * @Method설명: 새 공연 등록하기
	 * @작성자: 전해진
	 */
	public void registPfm(Performance pfm, Genre genre, ThemeList themeList);

}
