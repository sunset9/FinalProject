package ticket.dto;

import java.util.Date;

public class SeatSection {
	
	private int secIdx;
	private int hallIdx;
	private int pfmIdx;
	private int oriSecIdx;
	private String appSec;
	private int secPay;
	private String oriSecName; //원본 구역이름 
	
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "SeatSection [secIdx=" + secIdx + ", hallIdx=" + hallIdx + ", pfmIdx=" + pfmIdx + ", oriSecIdx="
				+ oriSecIdx + ", appSec=" + appSec + ", secPay=" + secPay + ", oriSecName=" + oriSecName
				+ ", createDate=" + createDate + "]";
	}
	private Date createDate;
	
	/**
	 * @return the oriSecName
	 */
	public String getOriSecName() {
		return oriSecName;
	}
	
	/**
	 * @param oriSecName the oriSecName to set
	 */
	public void setOriSecName(String oriSecName) {
		this.oriSecName = oriSecName;
	}
	

	/**
	 * @return the secIdx
	 */
	public int getSecIdx() {
		return secIdx;
	}
	/**
	 * @param secIdx the secIdx to set
	 */
	public void setSecIdx(int secIdx) {
		this.secIdx = secIdx;
	}
	/**
	 * @return the hallIdx
	 */
	public int getHallIdx() {
		return hallIdx;
	}
	/**
	 * @param hallIdx the hallIdx to set
	 */
	public void setHallIdx(int hallIdx) {
		this.hallIdx = hallIdx;
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
	 * @return the oriSecIdx
	 */
	public int getOriSecIdx() {
		return oriSecIdx;
	}
	/**
	 * @param oriSecIdx the oriSecIdx to set
	 */
	public void setOriSecIdx(int oriSecIdx) {
		this.oriSecIdx = oriSecIdx;
	}
	/**
	 * @return the appSec
	 */
	public String getAppSec() {
		return appSec;
	}
	/**
	 * @param appSec the appSec to set
	 */
	public void setAppSec(String appSec) {
		this.appSec = appSec;
	}
	/**
	 * @return the secPay
	 */
	public int getSecPay() {
		return secPay;
	}
	/**
	 * @param secPay the secPay to set
	 */
	public void setSecPay(int secPay) {
		this.secPay = secPay;
	}
	/**
	 * @return the createDate
	 */
	public Date getCreateDate() {
		return createDate;
	}
	/**
	 * @param createDate the createDate to set
	 */
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	

}
