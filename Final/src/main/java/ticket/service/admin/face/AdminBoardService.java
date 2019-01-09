package ticket.service.admin.face;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import ticket.dto.Faq;
import ticket.dto.Inquiry;
import ticket.dto.InquiryAnswer;
import ticket.dto.Notice;
import ticket.dto.NoticeFile;
import ticket.utils.Paging;
import ticket.utils.PagingT;

public interface AdminBoardService {

	// 공지사항 글 리스트 가져오기
	public List<Notice> getNotiList(PagingT pagingt);
		 
	// 게시글 전체 수
	public int selectCountAll();
	
	
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
	
	// FAQ 글 리스트 가져오기
	public List<Faq> getFaqList(Paging paging);
	
	// FAQ 게시글 전체 수
	public int selectCountAllFaq();
	
	//현재 페이지 얻기
	public int getCurPage(HttpServletRequest req);

	
	// FAQ 상세보기
	public Faq getViewFaq(int faqIdx);
	
	// FAQ 글 쓰기
	public void writeFaq(Faq faq);

	// FAQ 글 수정
	public Faq faqUpdateView(Faq faq);
	public Faq upFaq(Faq faq);

	// FAQ 글 삭제
	public void delFaq(Faq faq);

	
	/**
	 * @최종수정일: 2019.01.02
	 * @Method설명: 1:1 문의 리스트  가져오기
	 * @작성자: 전해진
	 */
	public List<Inquiry> getInquiryList(Paging paging);

	/**
	 * @최종수정일: 2019.01.02
	 * @Method설명: 1:1 문의 등록된 개수 가져오기
	 * @작성자: 전해진
	 */
	public int getCntInquiry();

	/**
	 * @최종수정일: 2019.01.02
	 * @Method설명: 1:1 문의 상세 정보 가져오기
	 * @작성자: 전해진
	 */
	public Inquiry getInquiry(Inquiry inqParam);

	/**
	 * @최종수정일: 2019.01.02
	 * @Method설명: 1:1 문의 답변 이미지 업로드 처리
	 * @작성자: 전해진
	 */
	public Map<Object, Object> uploadPfmImg(MultipartFile inqImgUpload);

	/**
	 * @최종수정일: 2019.01.02
	 * @Method설명: 1:1 문의 답변 이미지 삭제 처리
	 * @작성자: 전해진
	 */
	public void deletePfmImg(String src);

	/**
	 * @최종수정일: 2019.01.02
	 * @Method설명: 1:1 문의 글 작성 하기
	 * @작성자: 전해진
	 */
	public void writeInquiry(Inquiry inquiry);

	/**
	 * @최종수정일: 2019.01.02
	 * @Method설명: 1:1 문의 답변 하기
	 * @작성자: 전해진
	 */
	public void replyInquiry(InquiryAnswer inqAnswer);

	/**
	 * @최종수정일: 2019.01.02
	 * @Method설명: 1:1 답변 내용 가져오기
	 * @작성자: 전해진
	 */
	public InquiryAnswer getInquiryAnswer(Inquiry inqParam);

	/**
	 * @최종수정일: 2019.01.02
	 * @Method설명: 1:1 답변 수정하기
	 * @작성자: 전해진
	 */
	public void editReplyInquiry(InquiryAnswer inqAnswer);

	/**
	 * @최종수정일: 2019.01.02
	 * @Method설명: 1:1 문의 삭제
	 * @작성자: 전해진
	 */
	public void deleteInquiry(Inquiry inquiry);
	
	

	// 업로드된 파일 처리(안씀)
	public void filesave(ServletContext context, MultipartFile file);	
	// 업로드 파일 목록(안씀)
	public List fileList();	
	// notiFileIdx로 NoticeFile(notice_file) 조회(안씀)
	public NoticeFile getFile(int notiFileIdx);
	// 페이징 정보 (안씀)
	public Paging getPaging(int curPage, int listCount, int pageCount);
	
	
	
}
