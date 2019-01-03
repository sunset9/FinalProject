package ticket.dto;

import java.util.Date;

import oracle.sql.DATE;

// 기대평 대댓글
public class ExpectRecomm {
	private int eRecommIdx;
	private int expIdx;
	private int userIdx;
	private String contents;
	private Date createDate;
	private String nick; // 유저 닉네임

	@Override
	public String toString() {
		return "ExpectRecomm [eRecommIdx=" + eRecommIdx + ", expIdx=" + expIdx + ", userIdx=" + userIdx + ", contents="
				+ contents + ", createDate=" + createDate + ", nick=" + nick + "]";
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

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

}
