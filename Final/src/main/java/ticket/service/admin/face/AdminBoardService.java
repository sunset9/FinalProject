package ticket.service.admin.face;

import java.util.List;

import ticket.dto.Faq;
import ticket.dto.Notice;
import ticket.dto.NoticeFile;

public interface AdminBoardService {

	// 공지사항 글 리스트 가져오기
	public List getNotiList(Notice notice);
		
	// 공지사항 상세보기
	public void getViewNoti(Notice notice);

	// 공지사항 글 쓰기
	public void writeNoti();

	// 공지사항 글 수정
	public void updaNoti();

	// 공지사항 글 삭제
	public void deleNoti();

	// 파일 업로드
	public void inseNotiFile(NoticeFile noticeFile);

	
	// FAQ 글 리스트
	public List getFaqList(Faq faq);
	
	// FAQ 글 쓰기
	public void writeFaq();

	// FAQ 글 수정
	public void updaFaq();

	// FAQ 글 삭제
	public void deleFaq();
	
	// FAQ 답변 쓰기
	public void writeFaqAnswer();
	
	
}
