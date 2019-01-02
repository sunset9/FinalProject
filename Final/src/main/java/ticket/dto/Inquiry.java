package ticket.dto;

import java.util.Date;

public class Inquiry {
	private int inqIdx;
	private int userIdx;
	private String title;
	private String contents;
	private int replyStatus;
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
		return "Inquiry [inqIdx=" + inqIdx + ", userIdx=" + userIdx + ", title=" + title + ", contents=" + contents
				+ ", replyStatus=" + replyStatus + ", createDate=" + createDate + ", userName=" + userName + "]";
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
	public int getReplyStatus() {
		return replyStatus;
	}
	public void setReplyStatus(int replyStatus) {
		this.replyStatus = replyStatus;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
}
