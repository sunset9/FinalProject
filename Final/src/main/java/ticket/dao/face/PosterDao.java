package ticket.dao.face;

import java.util.List;

import ticket.dto.Poster;

public interface PosterDao {

	public void insert(Poster info);

	
	/**
	 * @최종수정일: 2018.12.10
	 * @Method설명: 장르로 검색해서 가져옴 
	 * @작성자: 박주희
	 */
	public List<Poster>selectBygenreIdx(int genreIdx);
	
	/**
	 * @최종수정일: 2018.12.10
	 * @Method설명: 공연아이디로 전체 리스트를 불러옴
	 * @작성자: 박주희
	 */
	public List<Poster>selectBypfmIdx();
	
	/**
	 * @최종수정일: 2018.12.10
	 * @Method설명: 포스터를 이름으로 검색해서 리스트를 얻어옴
	 * @작성자:박주희
	 */
	public List<Poster>selectPosterByName(String name);
}
