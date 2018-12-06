package ticket.dto;

public class Artist {


	private int artistIdx;
	private String name;
	private String imgUri;
	private int themeIdx;

	
	public int getThemeIdx() {
		return themeIdx;
	}
	public void setThemeIdx(int themeIdx) {
		this.themeIdx = themeIdx;
	}
	@Override
	public String toString() {
		return "Artist [artistIdx=" + artistIdx + ", name=" + name + ", imgUri=" + imgUri + ", themeIdx=" + themeIdx
				+ "]";
	}
	public int getArtistIdx() {
		return artistIdx;
	}
	public void setArtistIdx(int artistIdx) {
		this.artistIdx = artistIdx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImgUri() {
		return imgUri;
	}
	public void setImgUri(String imgUri) {
		this.imgUri = imgUri;
	}
	
	

}
