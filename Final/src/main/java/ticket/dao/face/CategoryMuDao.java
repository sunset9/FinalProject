package ticket.dao.face;

import java.util.List;

import ticket.dto.CategoryCon;
import ticket.dto.PosterInfo;

public interface CategoryMuDao {
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 뮤지컬 리스트 불러옴
	 * @작성자: 박주희
	 */
	public List<PosterInfo> select();

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 하나의 뮤지컬공연 배너를 공연번호로 조회해서 가져옴
	 * @작성자:박주희
	 */
	public PosterInfo selectByPfmIdx(CategoryCon con);

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 카테고리배너(뮤지컬) 등록
	 * @작성자:박주희
	 */
	public void insert(CategoryCon con);

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 카테고리배너(뮤지컬) 삭제
	 * @작성자:박주희
	 */
	public void delete(CategoryCon con);

}
