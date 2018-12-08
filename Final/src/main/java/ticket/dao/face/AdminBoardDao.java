package ticket.dao.face;

import java.util.List;

import ticket.dto.Faq;
import ticket.dto.Notice;
import ticket.dto.NoticeFile;
import ticket.utils.Paging;

public interface AdminBoardDao {


	// 공지사항 전체 글 리스트
	public List selectNotiList(Paging paging);
	
	// 전체 게시글 조회
	public int selectCntAll();
	
	
	
	
	
	
	// 공지사항 상세보기
	public void viewNoti(Notice notice);

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 공지사항 글 쓰기
	public void insertNoti();
	
	// 공지사항 글 수정
	public void updateNoti();
	
	// 공지사항 글 삭제
	public void deleteNoti();	
	
	// 파일 업로드
	public void insertNotiFile(NoticeFile noticeFile);
	

	
	// FAQ 글 리스트
	public List selectFaqList(Faq faq);

	// FAQ 글 쓰기
	public void insertFaq();
	
	// FAQ 글 수정
	public void updateFaq();
	
	// FAQ 글 삭제
	public void deleteFaq();
	
	// FAQ 답변 쓰기
	public void insertFaqAnswer();

}
	
	

	
