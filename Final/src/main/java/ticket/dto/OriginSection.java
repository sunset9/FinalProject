package ticket.dto;

public class OriginSection {
	
	private int oriSecIdx;
	private int hallIdx;
	private String secName;
	/**
	 * @return the oriSecIdx
	 */
	public int getOriSecIdx() {
		return oriSecIdx;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "OriginSection [oriSecIdx=" + oriSecIdx + ", hallIdx=" + hallIdx + ", secName=" + secName + "]";
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
	 * @return the secName
	 */
	public String getSecName() {
		return secName;
	}
	/**
	 * @param secName the secName to set
	 */
	public void setSecName(String secName) {
		this.secName = secName;
	}

}
