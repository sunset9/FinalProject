package ticket.service.admin.face;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import ticket.dto.Faq;
import ticket.dto.Notice;
import ticket.dto.NoticeFile;
import ticket.utils.Paging;

public interface AdminBoardService {

	// 공지사항 글 리스트 가져오기
	public List getNotiList(Paging paging);
		 
	// 게시글 전체 수
	public int selectCountAll();
	
	// 페이징 정보
	public Paging getPaging(int curPage, int listCount, int pageCount);
	
	
	// 공지사항 상세보기
	public Notice getViewNoti(int noticeIdx);

	
	// 공지사항 글 쓰기
	public void writeNoti(Notice notice);

	// 수정 get
	public Notice noticeUpdateView(Notice notice);
	
	// 공지사항 글 수정 post
	public Notice upNoti(Notice notice);

	// 공지사항 글 삭제
	public void delNoti(Notice deleteNotice);

	// 이전글
	public Notice preNotiSer(int noticeIdx);
	
	// 다음글
	public Notice postNotiSer(int noticeIdx);
	
	
	
	
	
	//현재 페이지 얻기
	public int getCurPage(HttpServletRequest req);

	
	// FAQ 글 리스트
	public List getFaqList(Faq faq);
	
	// FAQ 글 쓰기
	public void writeFaq();

	// FAQ 글 수정
	public void upFaq();

	// FAQ 글 삭제
	public void delFaq();
	
	// FAQ 답변 쓰기
	public void writeFaqAnswer();
	
	

	// 업로드된 파일 처리
	public void filesave(ServletContext context, MultipartFile file);
	
	// 업로드 파일 목록
	public List fileList();
	
	// notiFileIdx로 NoticeFile(notice_file) 조회
	public NoticeFile getFile(int notiFileIdx);
	
	
	
}
