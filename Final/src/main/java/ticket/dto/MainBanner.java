package ticket.dto;

import java.util.Date;

public class MainBanner {
	private int mainbanIdx;
	private int pfmIdx;
	private String bannerImgOri; //메인배너 원본이름
	private String bannerImgStr; //메인배너 저장이름
	private String thumbImgOri; //썸네일 원본이름 
	private String thumbImgStr; //썸네일 저장이름
	private Date createDate;
	@Override
	public String toString() {
		return "MainBanner [mainbanIdx=" + mainbanIdx + ", pfmIdx=" + pfmIdx + ", bannerImgOri=" + bannerImgOri
				+ ", bannerImgStr=" + bannerImgStr + ", thumbImgOri=" + thumbImgOri + ", thumbImgStr=" + thumbImgStr
				+ ", createDate=" + createDate + "]";
	}
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
	
	
}
