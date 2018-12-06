package ticket.dto;

import oracle.sql.DATE;

// 관람 후기 대댓글
public class ReviewRecomm {
	private int rRecommIdx;
	private int reviewIdx;
	private int userIdx;
	private String contents;
	private DATE createDate;

	@Override
	public String toString() {
		return "ReviewRecomm [rRecommIdx=" + rRecommIdx + ", reviewIdx=" + reviewIdx + ", userIdx=" + userIdx
				+ ", contents=" + contents + ", createDate=" + createDate + "]";
	}

	public int getrRecommIdx() {
		return rRecommIdx;
	}

	public void setrRecommIdx(int rRecommIdx) {
		this.rRecommIdx = rRecommIdx;
	}

	public int getReviewIdx() {
		return reviewIdx;
	}

	public void setReviewIdx(int reviewIdx) {
		this.reviewIdx = reviewIdx;
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
