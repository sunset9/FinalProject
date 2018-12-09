package ticket.dto;

import java.util.Date;

public class Faq {

	private int faqIdx;
	private int FTypeIdx;
	private String faqQuestion;
	private String faqAnswer;
	private Date createDate;
	@Override
	public String toString() {
		return "Faq [faqIdx=" + faqIdx + ", FTypeIdx=" + FTypeIdx + ", faqQuestion=" + faqQuestion + ", faqAnswer="
				+ faqAnswer + ", createDate=" + createDate + "]";
	}
	public int getFaqIdx() {
		return faqIdx;
	}
	public void setFaqIdx(int faqIdx) {
		this.faqIdx = faqIdx;
	}
	public int getFTypeIdx() {
		return FTypeIdx;
	}
	public void setFTypeIdx(int fTypeIdx) {
		FTypeIdx = fTypeIdx;
	}
	public String getFaqQuestion() {
		return faqQuestion;
	}
	public void setFaqQuestion(String faqQuestion) {
		this.faqQuestion = faqQuestion;
	}
	public String getFaqAnswer() {
		return faqAnswer;
	}
	public void setFaqAnswer(String faqAnswer) {
		this.faqAnswer = faqAnswer;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}


}
