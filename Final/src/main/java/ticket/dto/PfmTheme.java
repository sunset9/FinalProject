package ticket.dto;

import java.util.Date;

public class PfmTheme {
	private int pfmThemeIdx;
	private int pfmIdx;
	private int themeIdx;
	private Date createDate;
	
	@Override
	public String toString() {
		return "PfmTheme [pfmThemeIdx=" + pfmThemeIdx + ", pfmIdx=" + pfmIdx + ", themeIdx=" + themeIdx
				+ ", createDate=" + createDate + "]";
	}

	public int getPfmThemeIdx() {
		return pfmThemeIdx;
	}

	public void setPfmThemeIdx(int pfmThemeIdx) {
		this.pfmThemeIdx = pfmThemeIdx;
	}

	public int getPfmIdx() {
		return pfmIdx;
	}

	public void setPfmIdx(int pfmIdx) {
		this.pfmIdx = pfmIdx;
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
	
	
}
