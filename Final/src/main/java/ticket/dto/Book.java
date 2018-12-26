package ticket.dto;

import java.util.Date;

public class Book {
	private int bookIdx;
	private String bookGroup;
	private int pfmIdx;
	private int userIdx;
	private int bookCateIdx;
	private int pfmDbtIdx;
	private int seatIdx;
	private int receiveIdx;
	private String impUid;
	private Date createDate;
	private Date cancelDate;
	
	
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Book [bookIdx=" + bookIdx + ", bookGroup=" + bookGroup + ", pfmIdx=" + pfmIdx + ", userIdx=" + userIdx
				+ ", bookCateIdx=" + bookCateIdx + ", pfmDbtIdx=" + pfmDbtIdx + ", seatIdx=" + seatIdx + ", receiveIdx="
				+ receiveIdx + ", impUid=" + impUid + ", createDate=" + createDate + ", cancelDate=" + cancelDate + "]";
	}
	/**
	 * @return the bookIdx
	 */
	public int getBookIdx() {
		return bookIdx;
	}
	/**
	 * @param bookIdx the bookIdx to set
	 */
	public void setBookIdx(int bookIdx) {
		this.bookIdx = bookIdx;
	}
	/**
	 * @return the bookGroup
	 */
	public String getBookGroup() {
		return bookGroup;
	}
	/**
	 * @param bookGroup the bookGroup to set
	 */
	public void setBookGroup(String bookGroup) {
		this.bookGroup = bookGroup;
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
	 * @return the userIdx
	 */
	public int getUserIdx() {
		return userIdx;
	}
	/**
	 * @param userIdx the userIdx to set
	 */
	public void setUserIdx(int userIdx) {
		this.userIdx = userIdx;
	}
	/**
	 * @return the bookCateIdx
	 */
	public int getBookCateIdx() {
		return bookCateIdx;
	}
	/**
	 * @param bookCateIdx the bookCateIdx to set
	 */
	public void setBookCateIdx(int bookCateIdx) {
		this.bookCateIdx = bookCateIdx;
	}
	/**
	 * @return the pfmDbtIdx
	 */
	public int getPfmDbtIdx() {
		return pfmDbtIdx;
	}
	/**
	 * @param pfmDbtIdx the pfmDbtIdx to set
	 */
	public void setPfmDbtIdx(int pfmDbtIdx) {
		this.pfmDbtIdx = pfmDbtIdx;
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
	 * @return the receiveIdx
	 */
	public int getReceiveIdx() {
		return receiveIdx;
	}
	/**
	 * @param receiveIdx the receiveIdx to set
	 */
	public void setReceiveIdx(int receiveIdx) {
		this.receiveIdx = receiveIdx;
	}
	/**
	 * @return the impUid
	 */
	public String getImpUid() {
		return impUid;
	}
	/**
	 * @param impUid the impUid to set
	 */
	public void setImpUid(String impUid) {
		this.impUid = impUid;
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
	/**
	 * @return the cancelDate
	 */
	public Date getCancelDate() {
		return cancelDate;
	}
	/**
	 * @param cancelDate the cancelDate to set
	 */
	public void setCancelDate(Date cancelDate) {
		this.cancelDate = cancelDate;
	}

	

}
