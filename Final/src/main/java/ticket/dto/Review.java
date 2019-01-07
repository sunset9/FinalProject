package ticket.dto;

import java.util.Date;

import oracle.sql.DATE;

// 관람 후기
public class Review {
	private int reviewIdx;
	private int pfmIdx;
	private int userIdx;
	private String reviewContent;
	private Date createDate;
	private String profile; // 유저 프로필
	private String nick; // 유저 닉네임

	@Override
	public String toString() {
		return "Review [reviewIdx=" + reviewIdx + ", pfmIdx=" + pfmIdx + ", userIdx=" + userIdx + ", reviewContent="
				+ reviewContent + ", createDate=" + createDate + ", profile=" + profile + ", nick=" + nick + "]";
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
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

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

}
