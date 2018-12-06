package ticket.dto;
import java.util.Date;


public class Performance {
	
	private int pfmIdx;
	private String name;
	private int genreIdx;
	private Date pfmStart;
	private Date pfmEnd;
	private Date ticketStart;
	private Date ticketEnd;
	private int hallIdx;
	private int ageGradeIdx;
	private int runningTime;
	private Date createDate;
	 
	@Override
	public String toString() {
		return "Performance [pfmIdx=" + pfmIdx + ", name=" + name + ", genreIdx=" + genreIdx + ", pfmStart=" + pfmStart
				+ ", pfmEnd=" + pfmEnd + ", ticketStart=" + ticketStart + ", ticketEnd=" + ticketEnd + ", hallIdx="
				+ hallIdx + ", ageGradeIdx=" + ageGradeIdx + ", runningTime=" + runningTime + ", createDate="
				+ createDate + "]";
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
	
	 

	 
}
