package ticket.dto;

import java.util.Date;

public class NoticeFile {

	private int notiFileIdx;
	private String storedName;
	private String originName;
	private String fileType;
	private String filePath;
	private int fileSize;
	private int noticeIdx;
	private Date createDate;
	@Override
	public String toString() {
		return "NoticeFile [notiFileIdx=" + notiFileIdx + ", storedName=" + storedName + ", originName=" + originName
				+ ", fileType=" + fileType + ", filePath=" + filePath + ", fileSize=" + fileSize + ", noticeIdx="
				+ noticeIdx + ", createDate=" + createDate + "]";
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
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
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
