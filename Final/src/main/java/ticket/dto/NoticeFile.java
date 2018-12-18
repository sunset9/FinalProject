package ticket.dto;

import java.util.Date;

public class NoticeFile {

	private int notiFileIdx;
	private String storedName;
	private String originName;
	private int noticeIdx;
	private Date createDate;
	@Override
	public String toString() {
		return "NoticeFile [notiFileIdx=" + notiFileIdx + ", storedName=" + storedName + ", originName=" + originName
				+ ", noticeIdx=" + noticeIdx + ", createDate=" + createDate + "]";
	}
	public int getNotiFileIdx() {
		return notiFileIdx;
	}
	public void setNotiFileIdx(int notiFileIdx) {
		this.notiFileIdx = notiFileIdx;
	}
	public String getStoredName() {
		return storedName;
	}
	public void setStoredName(String storedName) {
		this.storedName = storedName;
	}
	public String getOriginName() {
		return originName;
	}
	public void setOriginName(String originName) {
		this.originName = originName;
	}
	public int getNoticeIdx() {
		return noticeIdx;
	}
	public void setNoticeIdx(int noticeIdx) {
		this.noticeIdx = noticeIdx;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
}
