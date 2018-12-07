package ticket.dto;

import java.util.List;

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
