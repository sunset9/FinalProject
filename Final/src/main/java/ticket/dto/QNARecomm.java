package ticket.dto;

import java.util.Date;

public class QNARecomm {
	private int qRecommIdx;
	private int qnaIdx;
	private int uesrIdx;
	private String contents;
	private Date createDate;

	@Override
	public String toString() {
		return "QNARecomm [qRecommIdx=" + qRecommIdx + ", qnaIdx=" + qnaIdx + ", uesrIdx=" + uesrIdx + ", contents="
				+ contents + ", createDate=" + createDate + "]";
	}

	public int getqRecommIdx() {
		return qRecommIdx;
	}

	public void setqRecommIdx(int qRecommIdx) {
		this.qRecommIdx = qRecommIdx;
	}

	public int getQnaIdx() {
		return qnaIdx;
	}

	public void setQnaIdx(int qnaIdx) {
		this.qnaIdx = qnaIdx;
	}

	public int getUesrIdx() {
		return uesrIdx;
	}

	public void setUesrIdx(int uesrIdx) {
		this.uesrIdx = uesrIdx;
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
