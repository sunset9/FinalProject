package ticket.dto;

import java.util.Date;

public class PfmBookinfo {
	private int pfmBookinfoIdx;
	private int pfmIdx;
	private String contents;
	private Date createDate;
	
	@Override
	public String toString() {
		return "PfmBookinfo [pfmBookinfoIdx=" + pfmBookinfoIdx + ", pfmIdx=" + pfmIdx + ", contents=" + contents
				+ ", createDate=" + createDate + "]";
	}
	public int getPfmBookinfoIdx() {
		return pfmBookinfoIdx;
	}
	public void setPfmBookinfoIdx(int pfmBookinfoIdx) {
		this.pfmBookinfoIdx = pfmBookinfoIdx;
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
