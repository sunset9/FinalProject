package ticket.dto;

import java.util.Date;

public class TabBanner {

	private int tabIdx; 
	private int pfmIdx;
	private int tabGenre; //장르구분번호
	private String bannerPath;
	private Date createDate;
	private int genreIdx; //장르 번호
	private String name; //공연 이름
	private Date pfmStart; //공연 시작일
	private Date pfmEnd; //공연 종료일
	private String hallName; //공연장 이름
	@Override
	public String toString() {
		return "TabBanner [tabIdx=" + tabIdx + ", pfmIdx=" + pfmIdx + ", tabGenre=" + tabGenre + ", bannerPath="
				+ bannerPath + ", createDate=" + createDate + ", genreIdx=" + genreIdx + ", name=" + name
				+ ", pfmStart=" + pfmStart + ", pfmEnd=" + pfmEnd + ", hallName=" + hallName + "]";
	}
	public int getTabIdx() {
		return tabIdx;
	}
	public void setTabIdx(int tabIdx) {
		this.tabIdx = tabIdx;
	}
	public int getPfmIdx() {
		return pfmIdx;
	}
	public void setPfmIdx(int pfmIdx) {
		this.pfmIdx = pfmIdx;
	}
	public int getTabGenre() {
		return tabGenre;
	}
	public void setTabGenre(int tabGenre) {
		this.tabGenre = tabGenre;
	}
	public String getBannerPath() {
		return bannerPath;
	}
	public void setBannerPath(String bannerPath) {
		this.bannerPath = bannerPath;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public int getGenreIdx() {
		return genreIdx;
	}
	public void setGenreIdx(int genreIdx) {
		this.genreIdx = genreIdx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getPfmStart() {
		return pfmStart;
	}
	public void setPfmStart(Date pfmStart) {
		this.pfmStart = pfmStart;
	}
	public Date getPfmEnd() {
		return pfmEnd;
	}
	public void setPfmEnd(Date pfmEnd) {
		this.pfmEnd = pfmEnd;
	}
	public String getHallName() {
		return hallName;
	}
	public void setHallName(String hallName) {
		this.hallName = hallName;
	}
	
}
