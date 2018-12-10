package ticket.dto;

import java.util.Date;

public class Notice {

	private int noticeIdx;
	private int userIdx;
	private int NTypeIdx;
	private String noticeTitle;
	private String noticeContent;
	private Date createDate;
	
	@Override
	public String toString() {
		return "Notice [noticeIdx=" + noticeIdx + ", userIdx=" + userIdx + ", NTypeIdx=" + NTypeIdx + ", noticeTitle="
				+ noticeTitle + ", noticeContent=" + noticeContent + ", createDate=" + createDate + "]";
	}
	public int getNoticeIdx() {
		return noticeIdx;
	}
	public void setNoticeIdx(int noticeIdx) {
		this.noticeIdx = noticeIdx;
	}
	public int getUserIdx() {
		return userIdx;
	}
	public void setUserIdx(int userIdx) {
		this.userIdx = userIdx;
	}
	public int getNTypeIdx() {
		return NTypeIdx;
	}
	public void setNTypeIdx(int nTypeIdx) {
		NTypeIdx = nTypeIdx;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	

}
