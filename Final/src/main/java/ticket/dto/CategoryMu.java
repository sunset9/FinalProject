package ticket.dto;

import java.util.Date;

public class CategoryMu {
	private int cateMuIdx;
	private int pfmIdx;
	private Date createDate;

	@Override
	public String toString() {
		return "CategoryMu [cateMuIdx=" + cateMuIdx + ", pfmIdx=" + pfmIdx + ", createDate=" + createDate + "]";
	}

	public int getCateMuIdx() {
		return cateMuIdx;
	}

	public void setCateMuIdx(int cateMuIdx) {
		this.cateMuIdx = cateMuIdx;
	}

	public int getPfmIdx() {
		return pfmIdx;
	}

	public void setPfmIdx(int pfmIdx) {
		this.pfmIdx = pfmIdx;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
}
