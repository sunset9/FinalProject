package ticket.dao.face;

import java.util.List;
import java.util.Map;

import ticket.dto.Inquiry;
import ticket.dto.InquiryAnswer;

public interface InquiryDao {

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
	public List<Inquiry> selectInquiryList(Map map);

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
