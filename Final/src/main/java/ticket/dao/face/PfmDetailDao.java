package ticket.dao.face;

import java.util.List;

import ticket.dto.ExpectRecomm;
import ticket.dto.Expectation;
import ticket.dto.Performance;
import ticket.dto.Review;
import ticket.dto.ReviewRecomm;

public interface PfmDetailDao {

	/**
	 * 최종수정일: 2018.12.05
	 * @Method설명: 선택한 공연의 상세 정보 출력
	 * @작성자: 배수연
	 */
	public Performance selectChoiceDetail(Performance pfm);

	/**
	 * 최종수정일: 2018.12.05
	 * @Method설명: 기대평 목록
	 * @작성자: 배수연
	 */
	public List selectExpectationList(Performance pfm);

	/**
	 * 최종수정일: 2018.12.05
	 * @Method설명: 기대평 작성
	 * @작성자: 배수연
	 */
	public void insertExpectation(Expectation exp);

	/**
	 * 최종수정일: 2018.12.05
	 * @Method설명: 기대평 삭제
	 * @작성자: 배수연
	 */
	public boolean deleteExpectation(Expectation exp);

	/**
	 * 최종수정일: 2018.12.05
	 * @Method설명: 기대평 대댓글 작성
	 * @작성자: 배수연
	 */
	public void insertExpRecomm(ExpectRecomm expRecomm);

	/**
	 * 최종수정일: 2018.12.05
	 * @Method설명: 기대평 대댓글 삭제
	 * @작성자: 배수연
	 */
	public boolean deleteExpRecomm(ExpectRecomm expRecomm);

	/**
	 * 최종수정일: 2018.12.05
	 * @Method설명: 관람 후기 목록
	 * @작성자: 배수연
	 */
	public List selectReviewList(Performance pfm);

	/**
	 * 최종수정일: 2018.12.05
	 * @Method설명: 관람 후기 작성
	 * @작성자: 배수연
	 */
	public void insertReview(Review review);

	/**
	 * 최종수정일: 2018.12.05
	 * @Method설명: 관람 후기 삭제
	 * @작성자: 배수연
	 */
	public boolean deleteReview(Review review);

	/**
	 * 최종수정일: 2018.12.05
	 * @Method설명: 관람 후기 대댓글 작성
	 * @작성자: 배수연
	 */
	public void insertReviewRecomm(ReviewRecomm reRecomm);

	/**
	 * 최종수정일: 2018.12.05
	 * @Method설명: 관람 후기 대댓글 삭제
	 * @작성자: 배수연
	 */
	public boolean deleteReviewRecomm(ReviewRecomm reRecomm);
	
}
