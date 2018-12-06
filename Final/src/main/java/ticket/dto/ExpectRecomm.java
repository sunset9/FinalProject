package ticket.dto;

import oracle.sql.DATE;

// 기대평 대댓글
public class ExpectRecomm {
	private int eRecommIdx;
	private int expIdx;
	private int userIdx;
	private String contents;
	private DATE createDate;

	@Override
	public String toString() {
		return "ExpectRecomm [eRecommIdx=" + eRecommIdx + ", expIdx=" + expIdx + ", userIdx=" + userIdx + ", contents="
				+ contents + ", createDate=" + createDate + "]";
	}

	public int geteRecommIdx() {
		return eRecommIdx;
	}

	public void seteRecommIdx(int eRecommIdx) {
		this.eRecommIdx = eRecommIdx;
	}

	public int getExpIdx() {
		return expIdx;
	}

	public void setExpIdx(int expIdx) {
		this.expIdx = expIdx;
	}

	public int getUserIdx() {
		return userIdx;
	}

	public void setUserIdx(int userIdx) {
		this.userIdx = userIdx;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public DATE getCreateDate() {
		return createDate;
	}

	public void setCreateDate(DATE createDate) {
		this.createDate = createDate;
	}

}
