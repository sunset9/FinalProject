package ticket.dto;

import java.util.Date;

public class CategoryFam {
	private int cateFamIdx;
	private int pfmIdx;
	private DATE createDate;

	@Override
	public String toString() {
		return "CategoryFam [cateFamIdx=" + cateFamIdx + ", pfmIdx=" + pfmIdx + ", createDate=" + createDate + "]";
	}

	public int getCateFamIdx() {
		return cateFamIdx;
	}

	public void setCateFamIdx(int cateFamIdx) {
		this.cateFamIdx = cateFamIdx;
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
