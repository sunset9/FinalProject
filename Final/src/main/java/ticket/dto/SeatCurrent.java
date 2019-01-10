package ticket.dto;

import java.util.Date;

public class SeatCurrent {
	
	private int seatCurrentIdx;
	private int pfmIdx;
	private int status;
	private int seatIdx;
	private Date creatDate;
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "SeatCurrent [seatCurrentIdx=" + seatCurrentIdx + ", pfmIdx=" + pfmIdx + ", status=" + status
				+ ", seatIdx=" + seatIdx + ", creatDate=" + creatDate + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	/**
	 * @return the seatCurrentIdx
	 */
	public int getSeatCurrentIdx() {
		return seatCurrentIdx;
	}
	/**
	 * @param seatCurrentIdx the seatCurrentIdx to set
	 */
	public void setSeatCurrentIdx(int seatCurrentIdx) {
		this.seatCurrentIdx = seatCurrentIdx;
	}
	/**
	 * @return the pfmIdx
	 */
	public int getPfmIdx() {
		return pfmIdx;
	}
	/**
	 * @param pfmIdx the pfmIdx to set
	 */
	public void setPfmIdx(int pfmIdx) {
		this.pfmIdx = pfmIdx;
	}
	/**
	 * @return the status
	 */
	public int getStatus() {
		return status;
	}
	/**
	 * @param status the status to set
	 */
	public void setStatus(int status) {
		this.status = status;
	}
	/**
	 * @return the seatIdx
	 */
	public int getSeatIdx() {
		return seatIdx;
	}
	/**
	 * @param seatIdx the seatIdx to set
	 */
	public void setSeatIdx(int seatIdx) {
		this.seatIdx = seatIdx;
	}
	/**
	 * @return the creatDate
	 */
	public Date getCreatDate() {
		return creatDate;
	}
	/**
	 * @param creatDate the creatDate to set
	 */
	public void setCreatDate(Date creatDate) {
		this.creatDate = creatDate;
	}
	

}
