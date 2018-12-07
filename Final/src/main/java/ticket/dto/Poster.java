package ticket.dto;

import java.util.Date;

public class Poster {
	private int posterIdx;//포스터번호
	private int pfmIdx; //공연번호 
	private String orginName;//포스터 원본이름 
	private String storedName; //포스터 저장이름
	private Date createDate; //등록일 
	
	
	@Override
	public String toString() {
		return "Poster [posterIdx=" + posterIdx + ", pfmIdx=" + pfmIdx + ", orginName=" + orginName
				+ ", storedName=" + storedName + ", createDate=" + createDate + "]";
	}
	public int getPosterIdx() {
		return posterIdx;
	}
	public void setPosterIdx(int posterIdx) {
		this.posterIdx = posterIdx;
	}
	public int getPfmIdx() {
		return pfmIdx;
	}
	public void setPfmIdx(int pfmIdx) {
		this.pfmIdx = pfmIdx;
	}
	public String getOrginName() {
		return orginName;
	}
	public void setOrginName(String orginName) {
		this.orginName = orginName;
	}
	public String getStoredName() {
		return storedName;
	}
	public void setStoredName(String storedName) {
		this.storedName = storedName;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
}