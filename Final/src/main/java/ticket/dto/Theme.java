package ticket.dto;

public class Theme {
	private int themeIdx;
	private String themeName;
	private int genreIdx;
	
	@Override
	public String toString() {
		return "Theme [themeIdx=" + themeIdx + ", themeName=" + themeName + ", genreIdx=" + genreIdx + "]";
	}

	public int getThemeIdx() {
		return themeIdx;
	}

	public void setThemeIdx(int themeIdx) {
		this.themeIdx = themeIdx;
	}

	public String getThemeName() {
		return themeName;
	}

	public void setThemeName(String themeName) {
		this.themeName = themeName;
	}

	public int getGenreIdx() {
		return genreIdx;
	}

	public void setGenreIdx(int genreIdx) {
		this.genreIdx = genreIdx;
	}
	
	
}
