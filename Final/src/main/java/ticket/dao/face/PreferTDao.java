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
	
	/**
	 * @최종수정일: 2018.12.10
	 * @Method설명: themeIdx와 userIdx로 유저가 선택한 테마 넣기!
	 * @작성자:홍나영
	 */
	public void insertTheme(int themeIdx);
}
