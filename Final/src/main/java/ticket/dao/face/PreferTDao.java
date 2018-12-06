package ticket.dao.face;

import java.util.List;

import ticket.dto.Theme;

public interface PreferTDao {

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 유저 idx로 선택된 테마 조회 
	 * @작성자:홍나영
	 */
	public List<Theme> selectThemeByUserIdx(int userIdx);
	
	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 모든 테마 조회
	 * @작성자:홍나영
	 */
	public List<Theme> selectAll();
}
