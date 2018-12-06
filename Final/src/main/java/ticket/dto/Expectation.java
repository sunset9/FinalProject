package ticket.dto;

import oracle.sql.DATE;

// 기대평
public class Expectation {
	private int expIdx;
	private int pfmIdx;
	private int userIdx;
	private String expContent;
	private DATE createDate;

	@Override
	public String toString() {
		return "Expectation [expIdx=" + expIdx + ", pfmIdx=" + pfmIdx + ", userIdx=" + userIdx + ", expContent="
				+ expContent + ", createDate=" + createDate + "]";
	}

	public int getExpIdx() {
		return expIdx;
	}

	public void setExpIdx(int expIdx) {
		this.expIdx = expIdx;
	}

	public int getPfmIdx() {
		return pfmIdx;
	}

	public void setPfmIdx(int pfmIdx) {
		this.pfmIdx = pfmIdx;
	}

	public int getUserIdx() {
		return userIdx;
	}

	public void setUserIdx(int userIdx) {
		this.userIdx = userIdx;
	}

	public String getExpContent() {
		return expContent;
	}

	public void setExpContent(String expContent) {
		this.expContent = expContent;
	}

	public DATE getCreateDate() {
		return createDate;
	}

	public void setCreateDate(DATE createDate) {
		this.createDate = createDate;
	}

}
