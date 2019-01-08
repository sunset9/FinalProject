package ticket.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Performance {

	private int pfmIdx;
	private String name;
	private int genreIdx;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date pfmStart;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date pfmEnd;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date ticketStart;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date ticketEnd;
	private int hallIdx;
	private int ageGradeIdx;
	private int runningTime;
	private Date createDate;
	private String posterName; // 포스터 이름(서버에 저장된 이름)
	private float bookingRate; // 예매율
	private String hallName; // 공연장 이름
	private int no;
	private String storedName; // 저장이름
	private int dday; // 오픈티켓에서 표현한 d-day
	@Override
	public String toString() {
		return "Performance [pfmIdx=" + pfmIdx + ", name=" + name + ", genreIdx=" + genreIdx + ", pfmStart=" + pfmStart
				+ ", pfmEnd=" + pfmEnd + ", ticketStart=" + ticketStart + ", ticketEnd=" + ticketEnd + ", hallIdx="
				+ hallIdx + ", ageGradeIdx=" + ageGradeIdx + ", runningTime=" + runningTime + ", createDate="
				+ createDate + ", posterName=" + posterName + ", bookingRate=" + bookingRate + ", hallName=" + hallName
				+ ", no=" + no + ", storedName=" + storedName + ", dday=" + dday + "]";
	}

	public int getDday() {
		return dday;
	}

	public void setDday(int dday) {
		this.dday = dday;
	}


	public int getPfmIdx() {
		return pfmIdx;
	}

	public void setPfmIdx(int pfmIdx) {
		this.pfmIdx = pfmIdx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getGenreIdx() {
		return genreIdx;
	}

	public void setGenreIdx(int genreIdx) {
		this.genreIdx = genreIdx;
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

	public int getHallIdx() {
		return hallIdx;
	}

	public void setHallIdx(int hallIdx) {
		this.hallIdx = hallIdx;
	}

	public int getAgeGradeIdx() {
		return ageGradeIdx;
	}

	public void setAgeGradeIdx(int ageGradeIdx) {
		this.ageGradeIdx = ageGradeIdx;
	}

	public int getRunningTime() {
		return runningTime;
	}

	public void setRunningTime(int runningTime) {
		this.runningTime = runningTime;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getPosterName() {
		return posterName;
	}

	public void setPosterName(String posterName) {
		this.posterName = posterName;
	}

	public float getBookingRate() {
		return bookingRate;
	}

	public void setBookingRate(float bookingRate) {
		this.bookingRate = bookingRate;
	}

	public String getHallName() {
		return hallName;
	}

	public void setHallName(String hallName) {
		this.hallName = hallName;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getStoredName() {
		return storedName;
	}

	public void setStoredName(String storedName) {
		this.storedName = storedName;
	}

}
