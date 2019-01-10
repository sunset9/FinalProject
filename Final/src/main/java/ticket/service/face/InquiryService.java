package ticket.service.face;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import ticket.dto.Inquiry;
import ticket.dto.InquiryAnswer;
import ticket.utils.Paging;

public interface InquiryService {

	/**
	 * @최종수정일: 2019.01.02
	 * @Method설명: 1:1 문의 리스트  가져오기
	 * @작성자: 전해진
	 * @수정자: 홍나영->이름 변경
	 */
	public List<Inquiry> getInqList(int userIdx, Paging paging);

	
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
	 * @Method설명: 1:1 문의 글 작성 하기
	 * @작성자: 전해진
	 */
	public void writeInquiry(Inquiry inquiry);

	

	/**
	 * @최종수정일: 2019.01.02
	 * @Method설명: 1:1 답변 내용 가져오기
	 * @작성자: 전해진
	 */
	public InquiryAnswer getInquiryAnswer(Inquiry inqParam);


	/**
	 * @최종수정일: 2019.01.02
	 * @Method설명: 1:1 문의 삭제
	 * @작성자: 전해진
	 */
	public void deleteInquiry(Inquiry inquiry);
	
}
