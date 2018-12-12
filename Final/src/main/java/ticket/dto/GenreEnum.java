package ticket.dto;

public enum GenreEnum {
	CON(1), MU(2), FAM(3);
	
	private int genreIdx;
	
	private GenreEnum(int idx) {
		this.genreIdx = idx;
	}
	public int getIdx() {
		return genreIdx;
	}
}
