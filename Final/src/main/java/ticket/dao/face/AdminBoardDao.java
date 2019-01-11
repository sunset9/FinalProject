package ticket.dao.face;

import java.util.List;

import ticket.dto.Faq;
import ticket.dto.Inquiry;
import ticket.dto.InquiryAnswer;
import ticket.dto.Notice;
import ticket.dto.NoticeFile;
import ticket.utils.Paging;
import ticket.utils.PagingT;
import ticket.utils.SearchPagingT;

public interface AdminBoardDao {


	// 목록 + 페이징 (공지사항 전체 글 리스트)
	public List<Notice> selectNotiList(PagingT pagingt);
	
	// 전체 게시글 조회(개수)
	public int selectCntAll();
	 					
	// 목록+페이징+검색
	public List<Notice> noticeListSearch(SearchPagingT searchpagingt);
	
	// 검색 결과 개수
	public int noticeCountSearch(SearchPagingT searchpagingt);
	
	// 공지사항 상세보기
	public Notice selectNotiView(int noticeIdx);
	
	// 공지사항 글 쓰기
	public void insertNoti(Notice notice);
	
	// 글번호로 게시글 조회 (수정 get)
	public Notice selectNoticeBynoticeIdx(Notice notice);	
	// 공지사항 글 수정 (수정 post)
	public void updateNoti(Notice notice);
	
	// 공지사항 글 삭제
	public void deleteNoti(Notice deleteNotice);	
	
	// 이전글
	public Notice preNoti(int noticeIdx);
	
	// 다음글
	public Notice postNoti(int noticeIdx);
	
	
	// Faq 전체 글 리스트
	public List<Faq> selectFaqList(PagingT pagingt);
	
	// Faq 전체 글 조회(글 개수)
	public int selectCntAllFaq();
	
	// 목록+페이징+검색
	public List<Faq> faqListSearch(SearchPagingT searchpagingt);
	
	// 검색 결과 개수
	public int faqCountSearch(SearchPagingT searchpagingt);
	
	// FAQ 상세보기
	public Faq faqView(int faqIdx);

	// FAQ 글 쓰기
	public void insertFaq(Faq faq);
	
	// FAQ 글 수정
	public Faq selectFaqByfaqIdx(Faq faq);
	public void updateFaq(Faq faq);
	
	
	// FAQ 글 삭제
	public void deleteFaq(Faq faq);
	

	
	

	
	//==============================================
	// 파일 업로드
	public void insertNotiFile(NoticeFile noticeFile);
	
	// 파일 전체 조회 (임시)
	public List selectNotiFileAll();

	// notiFileIdx를 이용한 조회
	public NoticeFile selectByNotiFileIdx(int notiFileIdx);
	//==============================================
	
	/**
	 * @최종수정일: 2019.01.02
	 * @Method설명: 1:1 문의 총 개수 조회
	 * @작성자: 전해진
	 */
	public int selectCntAllInq();

	/**
	 * @최종수정일: 2019.01.02
	 * @Method설명: 1:1 문의 게시글 조회
	 * @작성자: 전해진
	 */
	public List<Inquiry> selectInquiryList(Paging paging);

	/**
	 * @최종수정일: 2019.01.02
	 * @Method설명: 인덱스와 일치하는 1:1 문의 상세정보 조회
	 * @작성자: 전해진
	 */
	public Inquiry selectInquiryByInqIdx(Inquiry inqParam);

	/**
	 * @최종수정일: 2019.01.02
	 * @Method설명: 1:1 문의 글쓰기
	 * @작성자: 전해진
	 */
	public void insertInquiry(Inquiry inquiry);

	/**
	 * @최종수정일: 2019.01.02
	 * @Method설명: 1:1 문의 답변 하기
	 * @작성자: 전해진
	 */
	public void insertReplyInquiry(InquiryAnswer inqAnswer);

	/**
	 * @최종수정일: 2019.01.02
	 * @Method설명: 1:1 문의 답변 상태 변경
	 * @작성자: 전해진
	 */
	public void updateInqReplyStatus(InquiryAnswer inqAnswer);

	/**
	 * @최종수정일: 2019.01.02
	 * @Method설명: 1:1 문의 답변 조회
	 * @작성자: 전해진
	 */
	public InquiryAnswer selectInquiryAnswer(Inquiry inqParam);

	/**
	 * @최종수정일: 2019.01.02
	 * @Method설명: 1:1 문의 답변 삭제
	 * @작성자: 전해진 
	 */
	public int deleteReplyInquiry(InquiryAnswer inqAnswer);

	/**
	 * @최종수정일: 2019.01.02
	 * @Method설명: 1:1 문의글 삭제
	 * @작성자: 전해진
	 */
	public void deleteInquiry(Inquiry inquiry);


}
	
	

	
