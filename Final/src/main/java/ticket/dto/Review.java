package ticket.dto;

import oracle.sql.DATE;

// 관람 후기
public class Review {
	private int reviewIdx;
	private int pfmIdx;
	private int userIdx;
	private String reviewContent;
	private int reviewStar;
	private DATE createDate;

	@Override
	public String toString() {
		return "Review [reviewIdx=" + reviewIdx + ", pfmIdx=" + pfmIdx + ", userIdx=" + userIdx + ", reviewContent="
				+ reviewContent + ", reviewStar=" + reviewStar + ", createDate=" + createDate + "]";
	}

	public int getReviewIdx() {
		return reviewIdx;
	}

	public void setReviewIdx(int reviewIdx) {
		this.reviewIdx = reviewIdx;
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

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public int getReviewStar() {
		return reviewStar;
	}

	public void setReviewStar(int reviewStar) {
		this.reviewStar = reviewStar;
	}

	public DATE getCreateDate() {
		return createDate;
	}

	public void setCreateDate(DATE createDate) {
		this.createDate = createDate;
	}

}
