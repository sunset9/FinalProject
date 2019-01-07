package ticket.dto;

public class SectionInfo {
	private String secName;
	private String appSec;
	private int secPay;
	
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "SectionInfo [secName=" + secName + ", appSec=" + appSec + ", secPay=" + secPay + "]";
	}
	/**
	 * @return the secName
	 */
	public String getSecName() {
		return secName;
	}
	/**
	 * @param secName the secName to set
	 */
	public void setSecName(String secName) {
		this.secName = secName;
	}
	/**
	 * @return the appSec
	 */
	public String getAppSec() {
		return appSec;
	}
	/**
	 * @param appSec the appSec to set
	 */
	public void setAppSec(String appSec) {
		this.appSec = appSec;
	}
	/**
	 * @return the secPay
	 */
	public int getSecPay() {
		return secPay;
	}
	/**
	 * @param secPay the secPay to set
	 */
	public void setSecPay(int secPay) {
		this.secPay = secPay;
	}
	
	

}
