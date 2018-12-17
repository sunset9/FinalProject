package ticket.dto;

import java.sql.Date;

public class PreferTheme {

	private int preThemeIdx;
	private int userIdx;
	private int themeIdx;
	private Date createDate;
	private String themeName; // DB다르게 추가 !
	
	public String getThemeName() {
		return themeName;
	}
	public void setThemeName(String themeName) {
		this.themeName = themeName;
	}
	public int getPreThemeIdx() {
		return preThemeIdx;
	}
	public void setPreThemeIdx(int preThemeIdx) {
		this.preThemeIdx = preThemeIdx;
	}
	public int getUserIdx() {
		return userIdx;
	}
	public void setUserIdx(int userIdx) {
		this.userIdx = userIdx;
	}
	public int getThemeIdx() {
		return themeIdx;
	}
	public void setThemeIdx(int themeIdx) {
		this.themeIdx = themeIdx;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	@Override
	public String toString() {
		return "PreferTheme [preThemeIdx=" + preThemeIdx + ", userIdx=" + userIdx + ", themeIdx=" + themeIdx
				+ ", createDate=" + createDate + ", themeName=" + themeName + "]";
	}
	
	
}