package ticket.service.face;

import java.util.List;

import ticket.dto.Artist;
import ticket.dto.PreferTheme;
import ticket.dto.Theme;

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
	public List<Artist> choiceList(int userIdx);
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 검색어로 아티스트 조회 
	 * @작성자:홍나영
	 */
	public List<Artist> search(String search);
	
}
