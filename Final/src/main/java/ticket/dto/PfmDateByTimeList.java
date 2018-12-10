package ticket.dto;

import java.util.List;

public class PfmDateByTimeList {
	private List<PfmDateByTime> pfmDbtList;

	@Override
	public String toString() {
		return "PfmDateByTimeList [pfmDbtList=" + pfmDbtList + "]";
	}

	public List<PfmDateByTime> getPfmDbtList() {
		return pfmDbtList;
	}

	public void setPfmDbtList(List<PfmDateByTime> pfmDbtList) {
		this.pfmDbtList = pfmDbtList;
	}
	
	
}
