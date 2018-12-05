package ticket.dto;

public class Theme {
	private int themeIdx;
	private int genreIdx;
	private String themeName;

	@Override
	public String toString() {
		return "Theme [themeIdx=" + themeIdx + ", genreIdx=" + genreIdx + ", themeName=" + themeName + "]";
	}

	public int getThemeIdx() {
		return themeIdx;
	}

	public void setThemeIdx(int themeIdx) {
		this.themeIdx = themeIdx;
	}

	public int getGenreIdx() {
		return genreIdx;
	}

	public void setGenreIdx(int genreIdx) {
		this.genreIdx = genreIdx;
	}

	public String getThemeName() {
		return themeName;
	}

	public void setThemeName(String themeName) {
		this.themeName = themeName;
	}

}
