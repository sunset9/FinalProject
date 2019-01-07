package ticket.dto;

import java.util.Date;

import oracle.sql.DATE;

// 관람 후기 대댓글
public class ReviewRecomm {
	private int rRecommIdx;
	private int reviewIdx;
	private int userIdx;
	private String contents;
	private Date createDate;
	private String nick; // 유저 닉네임

	@Override
	public String toString() {
		return "ReviewRecomm [rRecommIdx=" + rRecommIdx + ", reviewIdx=" + reviewIdx + ", userIdx=" + userIdx
				+ ", contents=" + contents + ", createDate=" + createDate + ", nick=" + nick + "]";
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
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

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

}
