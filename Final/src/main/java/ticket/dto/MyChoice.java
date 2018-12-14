package ticket.dto;

import java.util.Date;

public class MyChoice {

	private int choiceIdx;
	private int userIdx;
	private int pfmIdx;
	private Date createDate;
	private String posterImg; // 포스터 이미지 보여주기 위해서 DB테이블이랑 다르게 추가 
	private String pfmName; // 공연 타이틀? 이름? 가져오려고 DB테이블이랑 다르게 추가
	private Date ticketStart;// 티켓 오픈일 DB에 없지요
	private Date ticketEnd; // 티켓 마감일 DB에 없지요

	public String getPfmName() {
		return pfmName;
	}
	public Date getTicketStart() {
		return ticketStart;
	}
	public void setTicketStart(Date ticketStart) {
		this.ticketStart = ticketStart;
	}
	public Date getTicketEnd() {
		return ticketEnd;
	}
	public void setTicketEnd(Date ticketEnd) {
		this.ticketEnd = ticketEnd;
	}
	public void setPfmName(String pfmName) {
		this.pfmName = pfmName;
	}
	@Override
	public String toString() {
		return "MyChoice [choiceIdx=" + choiceIdx + ", userIdx=" + userIdx + ", pfmIdx=" + pfmIdx + ", createDate="
				+ createDate + ", posterImg=" + posterImg + ", pfmName=" + pfmName + ", ticketStart=" + ticketStart
				+ ", ticketEnd=" + ticketEnd + "]";
	}
	public int getChoiceIdx() {
		return choiceIdx;
	}
	public void setChoiceIdx(int choiceIdx) {
		this.choiceIdx = choiceIdx;
	}
	public int getUserIdx() {
		return userIdx;
	}
	public void setUserIdx(int userIdx) {
		this.userIdx = userIdx;
	}
	public int getPfmIdx() {
		return pfmIdx;
	}
	public void setPfmIdx(int pfmIdx) {
		this.pfmIdx = pfmIdx;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getPosterImg() {
		return posterImg;
	}
	public void setPosterImg(String posterImg) {
		this.posterImg = posterImg;
	}
	
	
	
	
}
