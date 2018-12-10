package ticket.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class PfmDateByTime {
	private int pfmDbtIdx;
	private int pfmIdx;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date pfmDate;
	private String pfmTime;
	private Date createDate;
	
	@Override
	public String toString() {
		return "PfmDateByTime [pfmDbtIdx=" + pfmDbtIdx + ", pfmIdx=" + pfmIdx + ", pfmDate=" + pfmDate + ", pfmTime="
				+ pfmTime + ", createDate=" + createDate + "]";
	}

	public int getPfmDbtIdx() {
		return pfmDbtIdx;
	}

	public void setPfmDbtIdx(int pfmDbtIdx) {
		this.pfmDbtIdx = pfmDbtIdx;
	}

	public int getPfmIdx() {
		return pfmIdx;
	}

	public void setPfmIdx(int pfmIdx) {
		this.pfmIdx = pfmIdx;
	}

	public Date getPfmDate() {
		return pfmDate;
	}

	public void setPfmDate(Date pfmDate) {
		this.pfmDate = pfmDate;
	}

	public String getPfmTime() {
		return pfmTime;
	}

	public void setPfmTime(String pfmTime) {
		this.pfmTime = pfmTime;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	
}
