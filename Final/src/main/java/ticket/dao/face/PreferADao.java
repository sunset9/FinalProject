package ticket.dao.face;

import java.util.List;
import java.util.Map;

import ticket.dto.Artist;

public interface PreferADao {
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 유저가 선택한 테마로 아티스트 조회
	 * @작성자:홍나영
	 */
	public List<Artist> selectArtistByTheme(Map themeMap);
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 유저idx로 선택된 아티스트 불러오기
	 * @작성자:홍나영
	 */
	public List<Artist> selectArtistByUserIdx(int userIdx);
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 검색어로 아티스트 조회
	 * @작성자:홍나영
	 */
	public List<Artist> selectArtistBySearch(String search);
}
