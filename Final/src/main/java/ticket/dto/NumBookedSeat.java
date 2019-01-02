package ticket.dto;

public class NumBookedSeat {

	//예매된 지정된 구역별 좌석 갯수 구하기 위한 dto	
	private String appSec;
	private int secPay;
	private int cnt;
	
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "NumBookedSeat [appSec=" + appSec + ", secPay=" + secPay + ", cnt=" + cnt + "]";
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
	 * @return the cnt
	 */
	public int getCnt() {
		return cnt;
	}
	/**
	 * @param cnt the cnt to set
	 */
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

}
