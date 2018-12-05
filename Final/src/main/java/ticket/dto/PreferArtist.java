package ticket.dto;

import java.sql.Date;

public class PreferArtist {

	private int preArtistIdx;
	private int userIdx;
	private int artistIdx;
	private Date createDate;

	@Override
	public String toString() {
		return "PreferArtist [preArtistIdx=" + preArtistIdx + ", userIdx=" + userIdx + ", artistIdx=" + artistIdx
				+ ", createDate=" + createDate + "]";
	}
	public int getPreArtistIdx() {
		return preArtistIdx;
	}
	public void setPreArtistIdx(int preArtistIdx) {
		this.preArtistIdx = preArtistIdx;
	}
	public int getUserIdx() {
		return userIdx;
	}
	public void setUserIdx(int userIdx) {
		this.userIdx = userIdx;
	}
	public int getArtistIdx() {
		return artistIdx;
	}
	public void setArtistIdx(int artistIdx) {
		this.artistIdx = artistIdx;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

}
