package ticket.utils;

public class SearchPaging extends Paging{

	public SearchPaging(int totalCount) {
		super(totalCount);
		// TODO Auto-generated constructor stub
	}
	
	public String searchType;
	public String keyword;
	
	
	
	@Override
	public String toString() {
		return "SearchPaging [searchType=" + searchType + ", keyword=" + keyword + "]";
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
