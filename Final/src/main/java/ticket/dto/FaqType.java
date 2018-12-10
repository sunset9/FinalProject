package ticket.dto;

public class FaqType {

	private int FTypeIdx;
	private String FType;
	@Override
	public String toString() {
		return "FaqType [FTypeIdx=" + FTypeIdx + ", FType=" + FType + "]";
	}
	public int getFTypeIdx() {
		return FTypeIdx;
	}
	public void setFTypeIdx(int fTypeIdx) {
		FTypeIdx = fTypeIdx;
	}
	public String getFType() {
		return FType;
	}
	public void setFType(String fType) {
		FType = fType;
	}
	
}
