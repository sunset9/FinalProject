package ticket.dto;

public class Shipment {


	private int shipIdx;
	private String bookGroup;
	private String name;
	private String phone;
	private String addr;
	private String addrDetail;
	private String postcode;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getShipIdx() {
		return shipIdx;
	}
	public void setShipIdx(int shipIdx) {
		this.shipIdx = shipIdx;
	}
	public String getBookGroup() {
		return bookGroup;
	}
	public void setBookGroup(String bookGroup) {
		this.bookGroup = bookGroup;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddrDetail() {
		return addrDetail;
	}
	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	@Override
	public String toString() {
		return "Shipment [shipIdx=" + shipIdx + ", bookGroup=" + bookGroup + ", name=" + name + ", phone=" + phone
				+ ", addr=" + addr + ", addrDetail=" + addrDetail + ", postcode=" + postcode + "]";
	}
	
	}
