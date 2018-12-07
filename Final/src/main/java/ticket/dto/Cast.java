package ticket.dto;

import java.util.Date;

public class Cast {
	private int castIdx;
	private int pfmIdx;
	private int artistIdx;
	private Date createDate;
	
	@Override
	public String toString() {
		return "Cast [castIdx=" + castIdx + ", pfmIdx=" + pfmIdx + ", artistIdx=" + artistIdx + ", createDate="
				+ createDate + "]";
	}
	
	public int getCastIdx() {
		return castIdx;
	}
	public void setCastIdx(int castIdx) {
		this.castIdx = castIdx;
	}
	public int getPfmIdx() {
		return pfmIdx;
	}
	public void setPfmIdx(int pfmIdx) {
		this.pfmIdx = pfmIdx;
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
