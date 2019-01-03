package ticket.dto;

import java.util.Date;

public class QNA {
	private int qnaIdx;
	private int pfmIdx;
	private int userIdx;
	private String qnaContent;
	private Date createDate;

	@Override
	public String toString() {
		return "QNA [qnaIdx=" + qnaIdx + ", pfmIdx=" + pfmIdx + ", userIdx=" + userIdx + ", qnaContent=" + qnaContent
				+ ", createDate=" + createDate + "]";
	}

	public int getQnaIdx() {
		return qnaIdx;
	}

	public void setQnaIdx(int qnaIdx) {
		this.qnaIdx = qnaIdx;
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

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

}
