package ticket.dto;

import java.util.Date;

public class InquiryAnswer {
	private int answerIdx;
	private int inqIdx;
	private int userIdx;
	private String title;
	private String contents;
	private Date createDate;
	private String userName;
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "InquiryAnswer [answerIdx=" + answerIdx + ", inqIdx=" + inqIdx + ", userIdx=" + userIdx + ", title="
				+ title + ", contents=" + contents + ", createDate=" + createDate + ", userName=" + userName + "]";
	}

	public int getAnswerIdx() {
		return answerIdx;
	}

	public void setAnswerIdx(int answerIdx) {
		this.answerIdx = answerIdx;
	}

	public int getInqIdx() {
		return inqIdx;
	}

	public void setInqIdx(int inqIdx) {
		this.inqIdx = inqIdx;
	}

	public int getUserIdx() {
		return userIdx;
	}

	public void setUserIdx(int userIdx) {
		this.userIdx = userIdx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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
