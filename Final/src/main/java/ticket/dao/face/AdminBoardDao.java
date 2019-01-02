package ticket.dao.face;

import java.util.List;

import ticket.dto.Faq;
import ticket.dto.Inquiry;
import ticket.dto.InquiryAnswer;
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
	
	

	
