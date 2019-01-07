package ticket.service.face;

import java.util.List;

import ticket.dto.Artist;
import ticket.dto.PreferArtist;
import ticket.dto.PreferTheme;
import ticket.utils.Paging;

public interface PreferAService {

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 테마에 관련된 아티스트 리스트 조회
	 * @작성자:홍나영
	 */
	public List<Artist> artistByTheme(List<PreferTheme> tList);
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 유저idx로 선택한 아티스트 조회
	 * @작성자:홍나영
	 */
	public List<PreferArtist> choiceList(int userIdx);
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 검색어로 아티스트 조회 
	 * @작성자:홍나영
	 */
	public List<Artist> search(String search);
	
	/**
	 * @최종수정일: 2018.12.13
	 * @Method설명: 유저가 선택한 아티스트 idx로 선호 아티스트 삽입
	 * @작성자:홍나영
	 */
	public void choiceArtist(int userIdx,List<String> artistIdx);

	
	/**
	 * @최종수정일: 2019.01.07
	 * @Method설명: 유저가 선택한 아티스트 리스트 조회(페이징 포함)
	 * 				사진을 가져오려고 반환타입 다르게 만들었음 !
	 * @작성자:홍나영
	 */
	public List<Artist> choiceArtistList(int userIdx, Paging paging);
}
