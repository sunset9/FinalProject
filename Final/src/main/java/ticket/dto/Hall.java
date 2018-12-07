package ticket.dto;

import java.util.Date;

public class Hall {
	private int hallIdx;
	private String hallName;
	private String hallLoc;
	private String hallPhone;
	private Date createDate;
	 
	@Override
	public String toString() {
		return "Hall [hallIdx=" + hallIdx + ", hallName=" + hallName + ", hallLoc=" + hallLoc + ", hallPhone="
				+ hallPhone + ", createDate=" + createDate + "]";
	}
	
	public int getHallIdx() {
		return hallIdx;
	}
	public void setHallIdx(int hallIdx) {
		this.hallIdx = hallIdx;
	}
	public String getHallName() {
		return hallName;
	}
	public void setHallName(String hallName) {
		this.hallName = hallName;
	}
	public String getHallLoc() {
		return hallLoc;
	}
	public void setHallLoc(String hallLoc) {
		this.hallLoc = hallLoc;
	}
	public String getHallPhone() {
		return hallPhone;
	}
	public void setHallPhone(String hallPhone) {
		this.hallPhone = hallPhone;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	 
	 
}
