package ticket.dto;

import java.util.List;

public class SeatSectionList {
	private List<SeatSection> seatSecList;

	@Override
	public String toString() {
		return "SeatSectionList [seatSecList=" + seatSecList + "]";
	}

	public List<SeatSection> getSeatSecList() {
		return seatSecList;
	}

	public void setSeatSecList(List<SeatSection> seatSecList) {
		this.seatSecList = seatSecList;
	}
	
	
}
