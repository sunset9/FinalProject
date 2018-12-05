package ticket.dto;

public class Genre {
	private int genreIdx;
	private String genre;

	@Override
	public String toString() {
		return "Genre [genreIdx=" + genreIdx + ", genre=" + genre + "]";
	}

	public int getGenreIdx() {
		return genreIdx;
	}

	public void setGenreIdx(int genreIdx) {
		this.genreIdx = genreIdx;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

}
