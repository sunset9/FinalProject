package ticket.dto;

import java.util.Date;

public class Book {
	private int bookIdx;
	private int pfmIdx;
	private int userIdx;
	private int bookCateIdx;
	private int seatIdx;
	private Date createDate;

	@Override
	public String toString() {
		return "Book [bookIdx=" + bookIdx + ", pfmIdx=" + pfmIdx + ", userIdx=" + userIdx + ", bookCateIdx="
				+ bookCateIdx + ", seatIdx=" + seatIdx + ", createDate=" + createDate + "]";
	}

	public int getBookIdx() {
		return bookIdx;
	}

	public void setBookIdx(int bookIdx) {
		this.bookIdx = bookIdx;
	}

	public int getPfmIdx() {
		return pfmIdx;
	}

	public void setPfmIdx(int pfmIdx) {
		this.pfmIdx = pfmIdx;
	}

	public int getUserIdx() {
		return userIdx;
	}

	public void setUserIdx(int userIdx) {
		this.userIdx = userIdx;
	}

	public int getBookCateIdx() {
		return bookCateIdx;
	}

	public void setBookCateIdx(int bookCateIdx) {
		this.bookCateIdx = bookCateIdx;
	}

	public int getSeatIdx() {
		return seatIdx;
	}

	public void setSeatIdx(int seatIdx) {
		this.seatIdx = seatIdx;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

}
