package ticket.dao.face;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ticket.dto.Artist;
import ticket.dto.ExpectRecomm;
import ticket.dto.Expectation;
import ticket.dto.Performance;
import ticket.dto.PfmDetail;
import ticket.dto.Poster;
import ticket.dto.Review;
import ticket.dto.ReviewRecomm;
import ticket.dto.User;

/**
 * @author suyeo
 *
 */
public interface PfmDetailDao {

	/**
	 * 최종수정일: 2018.12.05
	 * @Method설명: 선택한 공연의 상세 정보 출력
	 * @작성자: 배수연
	 */
	public Poster selectChoiceDetail(Performance pfm);

	/**
	 * 최종수정일: 2018.12.05
	 * @Method설명: 기대평 목록
	 * @작성자: 배수연
	 */
	public List<Expectation> selectExpectationList(Performance pfm);

	/**
	 * 최종수정일: 2018.12.19
	 * @Method설명: 기대평 작성자 목록
	 * @작성자: 배수연
	 */
	public List<User> selectExpecUserList(Performance pfm);

	/**
	 * 최종수정일: 2018.12.18
	 * @Method설명: 출연진 리스트 출력
	 * @작성자: 배수연
	 */
	public List<Artist> selectCastInfo(Performance pfm);

	/**
	 * 최종수정일: 2018.12.05
	 * @Method설명: 기대평 작성
	 * @작성자: 배수연
	 */
	public void insertExpectation(
			@Param(value="expContent") String expContent
			, @Param(value="pfmIdx") String pfmIdx
			, @Param(value="userIdx") String userIdx
		);

	/**
	 * 최종수정일: 2018.12.20
	 * @Method설명: 기대평 삭제
	 * @작성자: 배수연
	 */
	public boolean deleteExpectation(String expIdx);

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

	public Performance selectPfmInfo(Performance pfm);

	/**
	 * 최종수정일: 2018.12.18
	 * @Method설명: 하단 상세내용 출력
	 * @작성자: 배수연
	 */
	public PfmDetail selectPfmDetailInfo(Performance pfm);
	
}
