package ticket.dto;

import java.util.Date;

public class HallFile {
private int hallFileIdx;
private String storedName;
private String originName;
private int hallIdx;
private Date createDate;
public int getHallFileIdx() {
	return hallFileIdx;
}
public void setHallFileIdx(int hallFileIdx) {
	this.hallFileIdx = hallFileIdx;
}
public String getStoredName() {
	return storedName;
}
public void setStoredName(String storedName) {
	this.storedName = storedName;
}
public String getOriginName() {
	return originName;
}
public void setOriginName(String originName) {
	this.originName = originName;
}
public int getHallIdx() {
	return hallIdx;
}
public void setHallIdx(int hallIdx) {
	this.hallIdx = hallIdx;
}
public Date getCreateDate() {
	return createDate;
}
public void setCreateDate(Date createDate) {
	this.createDate = createDate;
}
@Override
public String toString() {
	return "HallFile [hallFileIdx=" + hallFileIdx + ", storedName=" + storedName + ", originName=" + originName
			+ ", hallIdx=" + hallIdx + ", createDate=" + createDate + "]";
}

}
