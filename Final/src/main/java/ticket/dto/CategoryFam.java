package ticket.dto;

import java.util.Date;

public class CategoryFam {
	private int cateFamIdx;
	private int pfmIdx;
	private Date createDate;

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

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

}
