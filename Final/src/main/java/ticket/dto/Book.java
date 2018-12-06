package ticket.dto;

import oracle.sql.DATE;

public class Book {
	private int bookIdx;
	private int pfmIdx;
	private int userIdx;
	private int bookCateIdx;
	private int seatIdx;
	private DATE createDate;

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

	public DATE getCreateDate() {
		return createDate;
	}

	public void setCreateDate(DATE createDate) {
		this.createDate = createDate;
	}

}
