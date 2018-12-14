package ticket.dto;

import java.sql.Date;

public class PreferArtist {

	private int preArtistIdx;
	private int userIdx;
	private int artistIdx;
	private String artistName;
	private Date createDate;


	public String getArtistName() {
		return artistName;
	}
	public void setArtistName(String artistName) {
		this.artistName = artistName;
	}
	@Override
	public String toString() {
		return "PreferArtist [preArtistIdx=" + preArtistIdx + ", userIdx=" + userIdx + ", artistIdx=" + artistIdx
				+ ", artistName=" + artistName + ", createDate=" + createDate + "]";
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
