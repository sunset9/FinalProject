package ticket.dto;
import java.sql.Date;

public class User {

	private int userIdx;
	private String email;
	private String nick;
	private String password;
	private String name;
	private String sex;
	private Date birth;
	private String phone;
	private String addr;
	private String addrDetail;
	private String postcode;
	private int mGradeIdx;
	private Date createDate;
	
	@Override
	public String toString() {
		return "User [userIdx=" + userIdx + ", email=" + email + ", nick=" + nick + ", password=" + password + ", name="
				+ name + ", sex=" + sex + ", birth=" + birth + ", phone=" + phone + ", addr=" + addr + ", addrDetail="
				+ addrDetail + ", postcode=" + postcode + ", mGradeIdx=" + mGradeIdx + ", createDate=" + createDate
				+ "]";
	}
	public int getUserIdx() {
		return userIdx;
	}
	public void setUserIdx(int userIdx) {
		this.userIdx = userIdx;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
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
	public int getmGradeIdx() {
		return mGradeIdx;
	}
	public void setmGradeIdx(int mGradeIdx) {
		this.mGradeIdx = mGradeIdx;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	
}
