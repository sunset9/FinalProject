package ticket.utils;

public class SearchPagingT extends PagingT {

	private String searchType="";
	private String keyword="";		
	
	@Override
	public String toString() {
		return "SearchPagingT [searchType=" + searchType + ", keyword=" + keyword + "]";
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
	
	
}
