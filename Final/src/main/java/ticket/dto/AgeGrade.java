package ticket.dto;

public class AgeGrade {
	private int ageGradeIdx;
	private String ageLimit;
	
	@Override
	public String toString() {
		return "AgeGrade [ageGradeIdx=" + ageGradeIdx + ", ageLimit=" + ageLimit + "]";
	}
	
	public int getAgeGradeIdx() {
		return ageGradeIdx;
	}
	public void setAgeGradeIdx(int ageGradeIdx) {
		this.ageGradeIdx = ageGradeIdx;
	}
	public String getAgeLimit() {
		return ageLimit;
	}
	public void setAgeLimit(String ageLimit) {
		this.ageLimit = ageLimit;
	}
	
	
}
