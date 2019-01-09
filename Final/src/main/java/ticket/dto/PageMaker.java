package ticket.dto;

import ticket.utils.PagingT;

//totalCount : 게시물의 총 갯수
//startPage : 현제 페이지의 시작 번호 (1, 11, 21 등등)
//endPage : 현제 페이지의 끝 번호 (10, 20, 30 등등)
//prev : 이전 페이지로 이동하는 링크의 존재 여부
//next : 다음 페이지로 이동하는 링크의 존재 여부

public class PageMaker {

	 private int totalCount;
	 private int startPage;
	 private int endPage;
	 private boolean prev;
	 private boolean next;

	 private int displayPageNum = 10;

	 private PagingT pagingt;
	 
	 public void setPagingt(PagingT pagingt) {
	  this.pagingt = pagingt;
	 }

	 public void setTotalCount(int totalCount) {
	  this.totalCount = totalCount;
	  calcData();
	 }

	 public int getTotalCount() {
	  return totalCount;
	 }

	 public int getStartPage() {
	  return startPage;
	 }

	 public int getEndPage() {
	  return endPage;
	 }

	 public boolean isPrev() {
	  return prev;
	 }

	 public boolean isNext() {
	  return next;
	 }

	 public int getDisplayPageNum() {
	  return displayPageNum;
	 }

	 public PagingT getPagingt() {
	  return pagingt;
	 }
	 
	 private void calcData() {
	  endPage = (int) (Math.ceil(pagingt.getPage() / (double)displayPageNum) * displayPageNum);
	  startPage = (endPage - displayPageNum) + 1;
	  
	  int tempEndPage = (int) (Math.ceil(totalCount / (double)pagingt.getPerPageNum()));
	  if (endPage > tempEndPage)
	  {
	   endPage = tempEndPage;
	  }
	  prev = startPage == 1 ? false : true;
	  next = endPage * pagingt.getPerPageNum() >= totalCount ? false : true;
	 }
}
