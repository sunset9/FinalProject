package ticket.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class StateOfBook {
//	private int pfmIdx;
//	private String name;
//	private int genreIdx;
//	@DateTimeFormat(pattern = "yyyy-MM-dd")
//	private Date pfmStart;
//	@DateTimeFormat(pattern = "yyyy-MM-dd")
//	private Date pfmEnd;
//	@DateTimeFormat(pattern = "yyyy-MM-dd")
//	private Date ticketStart;
//	@DateTimeFormat(pattern = "yyyy-MM-dd")
//	private Date ticketEnd;
//	private int hallIdx;
//	private int ageGradeIdx;
//	private int runningTime;
//	private Date createDate;
//	private String posterName; // 포스터 이름(서버에 저장된 이름)
	
	private Date createDate; //예매일
	private String storedName; //포스터 이름
	private String name; //공연제목
	@DateTimeFormat(pattern = "yyyy-MM-dd(E)")
	private Date pfmStart; //공연시작일
	@DateTimeFormat(pattern = "yyyy-MM-dd(E)")
	private Date pfmEnd; //공연종료일
	private String hallName; //공연장이름
	private int bookIdx; //예매번호
	@DateTimeFormat(pattern = "yyyy-MM-dd(E)")
	private Date pfmDate; //공연날짜
	private String pfmTime;
	private int ea; //매수
	private Date cancelDate; //취소일
	private String state; //예매상태
	
	
	@Override
	public String toString() {
		return "StateOfBook [createDate=" + createDate + ", storedName=" + storedName
				+ ", name=" + name + ", pfmStart=" + pfmStart + ", pfmEnd=" + pfmEnd + ", hallName=" + hallName
				+ ", bookIdx=" + bookIdx + ", pfmDate=" + pfmDate + ", pfmTime=" + pfmTime + ", ea=" + ea
				+ ", cancelDate=" + cancelDate + ", state=" + state + "]";
	}
	

	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getStoredName() {
		return storedName;
	}
	public void setStoredName(String storedName) {
		this.storedName = storedName;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getPfmStart() {
		return pfmStart;
	}
	public void setPfmStart(Date pfmStart) {
		this.pfmStart = pfmStart;
	}
	public Date getPfmEnd() {
		return pfmEnd;
	}
	public void setPfmEnd(Date pfmEnd) {
		this.pfmEnd = pfmEnd;
	}
	public String getHallName() {
		return hallName;
	}
	public void setHallName(String hallName) {
		this.hallName = hallName;
	}
	public int getBookIdx() {
		return bookIdx;
	}
	public void setBookIdx(int bookIdx) {
		this.bookIdx = bookIdx;
	}
	public Date getPfmDate() {
		return pfmDate;
	}
	public void setPfmDate(Date pfmDate) {
		this.pfmDate = pfmDate;
	}
	public String getPfmTime() {
		return pfmTime;
	}
	public void setPfmTime(String pfmTime) {
		this.pfmTime = pfmTime;
	}
	public int getEa() {
		return ea;
	}
	public void setEa(int ea) {
		this.ea = ea;
	}
	public Date getCancelDate() {
		return cancelDate;
	}
	public void setCancelDate(Date cancelDate) {
		this.cancelDate = cancelDate;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}

	

}
