package ticket.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class MainBanner {
	private int mainbanIdx;
	private int pfmIdx;
	private String bannerImgOri; //메인배너 원본이름
	private String bannerImgStr; //메인배너 저장이름
	private String thumbImgOri; //썸네일 원본이름 
	private String thumbImgStr; //썸네일 저장이름
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createDate;
	private String name; //공연이름
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date pfmStart; //공연시작일
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date pfmEnd; //공연종료일
	private String storedName; //메인포스터 저장이름
	private String hallName; //공연장 이름
	public int getMainbanIdx() {
		return mainbanIdx;
	}
	public void setMainbanIdx(int mainbanIdx) {
		this.mainbanIdx = mainbanIdx;
	}
	public int getPfmIdx() {
		return pfmIdx;
	}
	public void setPfmIdx(int pfmIdx) {
		this.pfmIdx = pfmIdx;
	}
	public String getBannerImgOri() {
		return bannerImgOri;
	}
	public void setBannerImgOri(String bannerImgOri) {
		this.bannerImgOri = bannerImgOri;
	}
	public String getBannerImgStr() {
		return bannerImgStr;
	}
	public void setBannerImgStr(String bannerImgStr) {
		this.bannerImgStr = bannerImgStr;
	}
	public String getThumbImgOri() {
		return thumbImgOri;
	}
	public void setThumbImgOri(String thumbImgOri) {
		this.thumbImgOri = thumbImgOri;
	}
	public String getThumbImgStr() {
		return thumbImgStr;
	}
	public void setThumbImgStr(String thumbImgStr) {
		this.thumbImgStr = thumbImgStr;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
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
	public String getStoredName() {
		return storedName;
	}
	public void setStoredName(String storedName) {
		this.storedName = storedName;
	}
	public String getHallName() {
		return hallName;
	}
	public void setHallName(String hallName) {
		this.hallName = hallName;
	}
	@Override
	public String toString() {
		return "MainBanner [mainbanIdx=" + mainbanIdx + ", pfmIdx=" + pfmIdx + ", bannerImgOri=" + bannerImgOri
				+ ", bannerImgStr=" + bannerImgStr + ", thumbImgOri=" + thumbImgOri + ", thumbImgStr=" + thumbImgStr
				+ ", createDate=" + createDate + ", name=" + name + ", pfmStart=" + pfmStart + ", pfmEnd=" + pfmEnd
				+ ", storedName=" + storedName + ", hallName=" + hallName + "]";
	}
}
