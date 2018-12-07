package ticket.dto;

public class AgeGrade {
	private int ageGradeIdx;
	private int ageLimit;
	
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

	public int getAgeLimit() {
		return ageLimit;
	}

	public void setAgeLimit(int ageLimit) {
		this.ageLimit = ageLimit;
	}
	
}
