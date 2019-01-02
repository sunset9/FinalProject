package ticket.dto;

import java.util.Date;

public class Notice {

	private int noticeIdx;
	private int userIdx;
	private int NTypeIdx;
	private String noticeTitle;
	private String noticeContent;
	private Date createDate;
	private String prev;
	private String prevTitle;
	private String next;
	private String nextTitle;
	
	
	public String getPrev() {
		return prev;
	}
	public void setPrev(String prev) {
		this.prev = prev;
	}
	public String getPrevTitle() {
		return prevTitle;
	}
	public void setPrevTitle(String prevTitle) {
		this.prevTitle = prevTitle;
	}
	public String getNext() {
		return next;
	}
	public void setNext(String next) {
		this.next = next;
	}
	public String getNextTitle() {
		return nextTitle;
	}
	public void setNextTitle(String nextTitle) {
		this.nextTitle = nextTitle;
	}
	@Override
	public String toString() {
		return "Notice [noticeIdx=" + noticeIdx + ", userIdx=" + userIdx + ", NTypeIdx=" + NTypeIdx + ", noticeTitle="
				+ noticeTitle + ", noticeContent=" + noticeContent + ", createDate=" + createDate + ", prev=" + prev
				+ ", prevTitle=" + prevTitle + ", next=" + next + ", nextTitle=" + nextTitle + "]";
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
