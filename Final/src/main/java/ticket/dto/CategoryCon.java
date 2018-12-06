package ticket.dto;

import java.util.Date;

public class CategoryCon {
	private int cateConIdx;
	private int pfmIdx;
	private DATE createDate;

	@Override
	public String toString() {
		return "CategoryCon [cateConIdx=" + cateConIdx + ", pfmIdx=" + pfmIdx + ", createDate=" + createDate + "]";
	}

	public int getCateConIdx() {
		return cateConIdx;
	}

	public void setCateConIdx(int cateConIdx) {
		this.cateConIdx = cateConIdx;
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
