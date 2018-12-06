package ticket.dto;

import java.util.Date;

public class CategoryMu {
	private int cateMuIdx;
	private int pfmIdx;
	private DATE createDate;

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

	public DATE getCreateDate() {
		return createDate;
	}

	public void setCreateDate(DATE createDate) {
		this.createDate = createDate;
	}
}
