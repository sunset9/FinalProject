package ticket.service.face;

import java.util.List;

import ticket.dto.ExpectRecomm;
import ticket.dto.Expectation;
import ticket.dto.Performance;
import ticket.dto.Poster;
import ticket.dto.Review;
import ticket.dto.ReviewRecomm;

public interface PfmDetailService {

	/**
	 * 최종수정일: 2018.12.05
	 * @Method설명: 선택한 공연의 상세 정보 출력
	 * @작성자: 배수연
	 */
	public Poster getChoicePfmDetail(Performance pfm);
	
	
	/**0
	 * 최종수정일: 2018.12.05
	 * @Method설명: 기대평 목록
	 * @작성자: 배수연
	 */
	public List getExpectationList(Performance pfm);
	
	/**
	 * 최종수정일: 2018.12.05
	 * @Method설명: 기대평 작성
	 * @작성자: 배수연
	 */
	public void getInExpectation(Expectation exp);
	
	/**
	 * 최종수정일: 2018.12.05
	 * @Method설명: 기대평 삭제
	 * @작성자: 배수연
	 */
	public boolean getDelExpectation(Expectation exp);
	
	/**
	 * 최종수정일: 2018.12.05
	 * @Method설명: 기대평 대댓글 작성
	 * @작성자: 배수연
	 */
	public void getInExpRecomm(ExpectRecomm expRecomm);
	
	/**
	 * 최종수정일: 2018.12.05
	 * @Method설명: 기대평 대댓글 삭제
	 * @작성자: 배수연
	 */
	public boolean getDelExpRecomm(ExpectRecomm expRecomm);
	
	/**
	 * 최종수정일: 2018.12.05
	 * @Method설명: 관람후기 목록
	 * @작성자: 배수연
	 */
	public List getReviewList(Performance pfm);
	
	/**
	 * 최종수정일: 2018.12.05
	 * @Method설명: 관람후기 작성
	 * @작성자: 배수연
	 */
	public void getInReview(Review review);
	
	/**
	 * 최종수정일: 2018.12.05
	 * @Method설명: 관람후기 삭제
	 * @작성자: 배수연
	 */
	public boolean getDelReview(Review review);
	
	/**
	 * 최종수정일: 2018.12.05
	 * @Method설명: 관람후기 대댓글 작성
	 * @작성자: 배수연
	 */
	public void getInReviewRecomm(ReviewRecomm reRecomm);
	
	/**
	 * 최종수정일: 2018.12.05
	 * @Method설명: 관람후기 대댓글 삭제
	 * @작성자: 배수연
	 */
	public boolean getDelReviewRecomm(ReviewRecomm reRecom);


	public Performance getPfmInfo(Performance pfm);
	
}
