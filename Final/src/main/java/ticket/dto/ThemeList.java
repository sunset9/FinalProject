package ticket.dto;

import java.util.List;

public class ThemeList {
	private List<Theme> thmList;

	@Override
	public String toString() {
		return "ThemeList [thmList=" + thmList + "]";
	}

	public List<Theme> getThmList() {
		return thmList;
	}

	public void setThmList(List<Theme> thmList) {
		this.thmList = thmList;
	}
	
	
}
