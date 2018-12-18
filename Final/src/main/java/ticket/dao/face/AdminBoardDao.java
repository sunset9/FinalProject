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
	public Notice selectNotiView(int noticeIdx);


	// 조회수 (향후 추가? (멜론, 카카오 오븐엔 없음)
//	public Notice hit(int noticeIdx);
	
	
	// 공지사항 글 쓰기
	public void insertNoti(Notice notice);
	
	// 글번호로 게시글 조회 (수정 get)
	public Notice selectNoticeBynoticeIdx(Notice notice);
	
	// 공지사항 글 수정 (수정 post)
	public void updateNoti(Notice notice);
	
	// 공지사항 글 삭제
	public void deleteNoti(Notice deleteNotice);	
	
	
	
	// 파일 업로드
	public void insertNotiFile(NoticeFile noticeFile);
	
	// 파일 전체 조회 (임시)
	public List selectNotiFileAll();

	// notiFileIdx를 이용한 조회
	public NoticeFile selectByNotiFileIdx(int notiFileIdx);
	
	
	
	
	
	
	
	
	
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
	
	

	
