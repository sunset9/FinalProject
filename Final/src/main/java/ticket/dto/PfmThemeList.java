package ticket.dto;

import java.util.List;

/**
 * @최종수정일: 2018.12.06
 * @class설명: 컨트롤러 단에서 테마들을 dto 리스트로 받기 위해 만든 클래스
 * @작성자: 전해진
 */
public class PfmThemeList {
	
	private List<PfmTheme> thmList;

	@Override
	public String toString() {
		return "PfmThemeList [thmList=" + thmList + "]";
	}

	public List<PfmTheme> getThmList() {
		return thmList;
	}

	public void setThmList(List<PfmTheme> thmList) {
		this.thmList = thmList;
	}

	
}
