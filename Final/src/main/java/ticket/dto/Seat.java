package ticket.dto;

public class Seat {
	
	private int seatIdx;
	private int seatRow;
	private int seatCol;
	private int oriSecIdx;
	private int hallIdx;
	private int seatFloor;
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Seat [seatIdx=" + seatIdx + ", seatRow=" + seatRow + ", seatCol=" + seatCol + ", oriSecIdx=" + oriSecIdx
				+ ", hallIdx=" + hallIdx + ", seatFloor=" + seatFloor + "]";
	}
	/**
	 * @return the seatIdx
	 */
	public int getSeatIdx() {
		return seatIdx;
	}
	/**
	 * @param seatIdx the seatIdx to set
	 */
	public void setSeatIdx(int seatIdx) {
		this.seatIdx = seatIdx;
	}
	/**
	 * @return the seatRow
	 */
	public int getSeatRow() {
		return seatRow;
	}
	/**
	 * @param seatRow the seatRow to set
	 */
	public void setSeatRow(int seatRow) {
		this.seatRow = seatRow;
	}
	/**
	 * @return the seatCol
	 */
	public int getSeatCol() {
		return seatCol;
	}
	/**
	 * @param seatCol the seatCol to set
	 */
	public void setSeatCol(int seatCol) {
		this.seatCol = seatCol;
	}
	/**
	 * @return the oriSecIdx
	 */
	public int getOriSecIdx() {
		return oriSecIdx;
	}
	/**
	 * @param oriSecIdx the oriSecIdx to set
	 */
	public void setOriSecIdx(int oriSecIdx) {
		this.oriSecIdx = oriSecIdx;
	}
	/**
	 * @return the hallIdx
	 */
	public int getHallIdx() {
		return hallIdx;
	}
	/**
	 * @param hallIdx the hallIdx to set
	 */
	public void setHallIdx(int hallIdx) {
		this.hallIdx = hallIdx;
	}
	/**
	 * @return the seatFloor
	 */
	public int getSeatFloor() {
		return seatFloor;
	}
	/**
	 * @param seatFloor the seatFloor to set
	 */
	public void setSeatFloor(int seatFloor) {
		this.seatFloor = seatFloor;
	}
	

}
