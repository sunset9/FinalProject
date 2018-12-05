package ticket.dto;

import java.sql.Date;

public class PreferGenre {

	private int preGenreIdx;
	private int userIdx;
	private int genreIdx;
	private Date createDate;
	
	
	@Override
	public String toString() {
		return "PreferGenre [preGenreIdx=" + preGenreIdx + ", userIdx=" + userIdx + ", genreIdx=" + genreIdx
				+ ", createDate=" + createDate + "]";
	}
	public int getPreGenreIdx() {
		return preGenreIdx;
	}
	public void setPreGenreIdx(int preGenreIdx) {
		this.preGenreIdx = preGenreIdx;
	}
	public int getUserIdx() {
		return userIdx;
	}
	public void setUserIdx(int userIdx) {
		this.userIdx = userIdx;
	}
	public int getGenreIdx() {
		return genreIdx;
	}
	public void setGenreIdx(int genreIdx) {
		this.genreIdx = genreIdx;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	
}
