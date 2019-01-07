package ticket.service.face;

import java.util.List;

import ticket.dto.Artist;
import ticket.dto.ExpectRecomm;
import ticket.dto.Expectation;
import ticket.dto.Hall;
import ticket.dto.HallFile;
import ticket.dto.Performance;
import ticket.dto.PfmDetail;
import ticket.dto.Poster;
import ticket.dto.QNA;
import ticket.dto.QNARecomm;
import ticket.dto.Review;
import ticket.dto.ReviewRecomm;
import ticket.dto.User;

public interface PfmDetailService {

	/**
	 * 최종수정일: 2018.12.05
	 * @Method설명: 선택한 공연의 상세 정보 출력
	 * @작성자: 배수연
	 */
	public Poster getChoicePfmDetail(Performance pfm);

	/**
	 * 최종수정일: 2018.12.17
	 * @Method설명: 하단의 상세 정보 출력
	 * @작성자: 배수연
	 */
	public PfmDetail pfmDetailInfo(Performance pfm);
	
	/**
	 * 최종수정일: 2018.12.20
	 * @Method설명: 기대평 목록
	 * @작성자: 배수연
	 */
	public List<Expectation> getExpectationList(Performance pfm);

	/**
	 * 최종수정일: 2018.12.19
	 * @Method설명: 기대평 작성자 목록
	 * @작성자: 배수연
	 */
	public List<User> getExpectationUserList(Performance pfm);
	
	/**
	 * 최종수정일: 2018.12.20
	 * @Method설명: 기대평 작성
	 * @작성자: 배수연
	 */
	public void getExpectationInsert(String expContent, String pfmIdx, String userIdx);
	
	/**
	 * 최종수정일: 2018.12.20
	 * @Method설명: 기대평 삭제
	 * @작성자: 배수연
	 */
	public boolean getDelExpectation(String expIdx);
	
	/**
	 * 최종수정일: 2018.12.20
	 * @Method설명: 기대평 대댓글 리스트
	 * @작성자: 배수연
	 */
	public List<ExpectRecomm> getExpRecommList();
	
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
	public void getDelExpRecomm(String expIdx);
	
	/**
	 * 최종수정일: 2018.12.21
	 * @Method설명: 관람후기 목록
	 * @작성자: 배수연
	 */
	public List<Review> getReviewList(Performance pfm);

	/**
	 * 최종수정일: 2018.12.21
	 * @Method설명: 관람후기  작성자 리스트 출력
	 * @작성자: 배수연
	 */
	public List<User> getReviwUserList(Performance pfm);
	
	/**
	 * 최종수정일: 2018.12.05
	 * @Method설명: 관람후기 작성
	 * @작성자: 배수연
	 */
	public void getInReview(String reviewContent, String pfmIdx, String userIdx);
	
	/**
	 * 최종수정일: 2018.12.05
	 * @Method설명: 관람후기 삭제
	 * @작성자: 배수연
	 */
	public boolean getDelReview(String reviewIdx);
	
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

	/**
	 * 최종수정일: 2018.12.18
	 * @Method설명: 상세 정보 출력
	 * @작성자: 배수연
	 */
	public Performance getPfmInfo(Performance pfm);
	
	/**
	 * 최종수정일: 2018.12.18
	 * @Method설명: 출연진 리스트 출력
	 * @작성자: 배수연
	 */
	public List<Artist> getCastInfo(Performance pfm);

	/**
	 * 최종수정일: 2018.12.26
	 * @Method설명: 공연장 정보 출력
	 * @작성자: 배수연
	 */
	public Hall getHallInfoList(Performance pfm);

	/**
	 * 최종수정일: 2018.12.26
	 * @Method설명: 해당 공연에 대한 공연장 이미지 출력
	 * @작성자: 배수연
	 */
	public HallFile getHallImg(Performance pfm);

	/**
	 * 최종수정일: 2018.12.28
	 * @Method설명: 공연플래너 담기 버튼 클릭 시 my_choice 추가해주기
	 * @작성자: 배수연
	 */
	public boolean mychoiceInsert(String userIdx, String pfmIdx);

	/**
	 * 최종수정일: 2019.01.02
	 * @Method설명: 기대평 대댓글 리스트 출력
	 * @작성자: 배수연
	 */
	public void getInExpectRecomm(String userIdx, String expIdx, String contents);

	/**
	 * 최종수정일: 2019.01.02
	 * @Method설명: QNA 리스트 출력
	 * @작성자: 배수연 
	 */
	public List<QNA> getQNAList(Performance pfm);

	/**
	 * 최종수정일: 2019.01.06
	 * @Method설명: QNA 작성자 리스트
	 * @작성자: 배수연
	 */
	public List<User> getQNAUserList(Performance pfm);

	/**
	 * 최종수정일: 2019.01.06
	 * @Method설명: QNA 대댓글 리스트
	 * @작성자: 배수연
	 */
	public List<QNARecomm> getQNARecommList(Performance pfm);

	/**
	 * 최종수정일: 2019.01.06
	 * @Method설명: QNA 작성
	 * @작성자: 배수연
	 */
	public void getInQna(String qnaContent, String pfmIdx, String userIdx);

	/**
	 * 최종수정일: 2019.01.06
	 * @Method설명: QNA 삭제
	 * @작성자: 배수연
	 */
	public void getDelQna(String qnaIdx);

	/**
	 * 최종수정일: 2019.01.07
	 * @Method설명: QNA 대댓글 작성
	 * @작성자: 배수연
	 */
	public void getInQnaRecomm(String qnaIdx, String contents);

}
