package ticket.dto;

public class NoticeType {

	private int NTypeIdx;
	private String NType;
	@Override
	public String toString() {
		return "NoticeType [NTypeIdx=" + NTypeIdx + ", NType=" + NType + "]";
	}
	public int getNTypeIdx() {
		return NTypeIdx;
	}
	public void setNTypeIdx(int nTypeIdx) {
		NTypeIdx = nTypeIdx;
	}
	public String getNType() {
		return NType;
	}
	public void setNType(String nType) {
		NType = nType;
	}
	
}
