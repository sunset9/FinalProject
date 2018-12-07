package ticket.dto;

import java.util.List;

/**
 * @최종수정일: 2018.12.08
 * @class설명: 컨트롤러 단에서 출연진 정보들을 dto 리스트로 받기 위해 만든 클래스
 * @작성자: 전해진
 */
public class CastList {
	private List<Cast> castList;

	@Override
	public String toString() {
		return "CastList [castList=" + castList + "]";
	}

	public List<Cast> getCastList() {
		return castList;
	}

	public void setCastList(List<Cast> castList) {
		this.castList = castList;
	}
	

}
