package ticket.service.face;

import java.util.List;

import ticket.dto.Theme;

public interface PreferTService {


	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 유저idx로 선택한 테마 불러오기 
	 * @작성자:홍나영
	 */
	public List<Theme> choiceList(int userIdx);
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 테마 선택시 뿌려줄 리스트 
	 * @작성자:홍나영
	 */
	public List<Theme> themeAllList();
	
	/**
	 * @최종수정일: 2018.12.10
	 * @Method설명: 선택된 themeidx로 user가 선택한 테마 넣기
	 * @작성자:홍나영
	 */
	public void choiceTheme(List<String> themeIdx);
	

}
