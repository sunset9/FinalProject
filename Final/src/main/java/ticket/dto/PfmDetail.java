package ticket.dto;

import java.util.Date;

public class PfmDetail {
	private int pfmDetailIdx;
	private int pfmIdx;
	private String contents;
	private Date createDate;
	
	@Override
	public String toString() {
		return "PfmDetail [pfmDetailIdx=" + pfmDetailIdx + ", pfmIdx=" + pfmIdx + ", contents=" + contents
				+ ", createDate=" + createDate + "]";
	}

	public int getPfmDetailIdx() {
		return pfmDetailIdx;
	}

	public void setPfmDetailIdx(int pfmDetailIdx) {
		this.pfmDetailIdx = pfmDetailIdx;
	}

	public int getPfmIdx() {
		return pfmIdx;
	}

	public void setPfmIdx(int pfmIdx) {
		this.pfmIdx = pfmIdx;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}	
	
	
}
