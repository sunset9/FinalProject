package ticket.dto;

import java.util.Date;

import oracle.sql.DATE;

// 기대평
public class Expectation {
	private int expIdx;
	private int pfmIdx;
	private int userIdx;
	private String expContent;
	private Date createDate;
	private String profile; // 유저 프로필
	private String nick; // 유저 닉네임

	@Override
	public String toString() {
		return "Expectation [expIdx=" + expIdx + ", pfmIdx=" + pfmIdx + ", userIdx=" + userIdx + ", expContent="
				+ expContent + ", createDate=" + createDate + ", profile=" + profile + ", nick=" + nick + "]";
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

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
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

}
