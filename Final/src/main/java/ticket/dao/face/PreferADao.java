package ticket.dao.face;

import java.util.List;
import java.util.Map;

import ticket.dto.Artist;
import ticket.dto.PreferArtist;

public interface PreferADao {
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 유저가 선택한 테마로 아티스트 조회
	 * @작성자:홍나영
	 */
	public List<Artist> selectArtistByTheme(Map map);
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 유저idx로 선택된 아티스트 불러오기
	 * @작성자:홍나영
	 */
	public List<PreferArtist> selectPreferArtistByUserIdx(int userIdx);
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 검색어로 아티스트 조회
	 * @작성자:홍나영
	 */
	public List<Artist> selectArtistBySearch(String name);
	
	/**
	 * @최종수정일: 2018.12.13
	 * @Method설명: userIdx로 저장되어있는 선호하는 아티스트 삭제하기
	 * @작성자:홍나영
	 */
	public void deleteByUserIdx(int userIdx);
	
	/**
	 * @최종수정일: 2018.12.13
	 * @Method설명: user가 선택한 아티스트 삽입
	 * @작성자:홍나영
	 */
	public void insertPreferArtist(PreferArtist preferArtist);
	
	/**
	 * @최종수정일: 2018.12.14
	 * @Method설명: 유저가 선택한 아티스트 정보 Artist DTO로 조회하기 !
	 * 				selectPreferArtistByUserIdx 이 아이 안쓰는 이유 !
	 * 				아티스트 이미지 가져오고 싶어서
	 * @작성자:홍나영
	 */
	public List<Artist> selectArtistByUserIdx(int userIdx);
}
