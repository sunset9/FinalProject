package ticket.dto;

import java.util.Date;

public class PaymentInfo {
	private int payIdx;
	private String impUid;
	private String merchantUid;
	private String payMethod;
	private int pfmIdx;
	private int paidAmount;
	private String buyerName;
	private String buyerEmail;
	private int userIdx;
	private Date createDate;
	
	public String getBuyerEmail() {
		return buyerEmail;
	}
	public void setBuyerEmail(String buyerEmail) {
		this.buyerEmail = buyerEmail;
	}
	public int getPayIdx() {
		return payIdx;
	}
	public void setPayIdx(int payIdx) {
		this.payIdx = payIdx;
	}
	public String getImpUid() {
		return impUid;
	}
	public void setImpUid(String impUid) {
		this.impUid = impUid;
	}
	public String getMerchantUid() {
		return merchantUid;
	}
	public void setMerchantUid(String merchantUid) {
		this.merchantUid = merchantUid;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public int getPfmIdx() {
		return pfmIdx;
	}
	public void setPfmIdx(int pfmIdx) {
		this.pfmIdx = pfmIdx;
	}
	public int getPaidAmount() {
		return paidAmount;
	}
	public void setPaidAmount(int paidAmount) {
		this.paidAmount = paidAmount;
	}
	public String getBuyerName() {
		return buyerName;
	}
	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}
	public int getUserIdx() {
		return userIdx;
	}
	public void setUserIdx(int userIdx) {
		this.userIdx = userIdx;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	@Override
	public String toString() {
		return "Payment [payIdx=" + payIdx + ", impUid=" + impUid + ", merchantUid=" + merchantUid + ", payMethod="
				+ payMethod + ", pfmIdx=" + pfmIdx + ", paidAmount=" + paidAmount + ", buyerName=" + buyerName
				+ ", buyerEmail=" + buyerEmail + ", userIdx=" + userIdx + ", createDate=" + createDate + "]";
	}
	

}
