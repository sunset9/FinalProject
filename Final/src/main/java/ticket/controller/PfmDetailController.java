package ticket.controller;

import java.io.IOException;
import java.io.Writer;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
import ticket.dto.User;
import ticket.service.face.PfmDetailService;

@Controller
public class PfmDetailController {
	@Autowired
	PfmDetailService detailService;

	private static final Logger logger = LoggerFactory.getLogger(PfmDetailController.class);

	/**
	 * 최종수정일: 2018.12.21
	 * 
	 * @Method설명: 공연 상세 클릭시 첫 페이지
	 * @작성자: 배수연
	 */
	@RequestMapping(value = "/ticket/pfmdetail", method = RequestMethod.GET)
	public void pfmdetail(Model model, Performance pfm) {
		// 선택한 이미지의 포스터 출력해주기
		Poster posterList = detailService.getChoicePfmDetail(pfm);
		model.addAttribute("posterList", posterList);

		// 공연 정보 불러오기
		Performance pfmInfoList = detailService.getPfmInfo(pfm);
		model.addAttribute("pfmInfoList", pfmInfoList);

		// 출연진 정보 불러오기
		List<Artist> castList = detailService.getCastInfo(pfm);
		model.addAttribute("castList", castList);

		// 상세 정보
		PfmDetail detailList = detailService.pfmDetailInfo(pfm);
		model.addAttribute("detailList", detailList);

		// 기대평 리스트 출력해주기
		List<Expectation> expecList = detailService.getExpectationList(pfm);
		model.addAttribute("expecList", expecList);

		// 기대평 대댓글 리스트 출력하기
		List<ExpectRecomm> expRecommList = detailService.getExpRecommList();
		model.addAttribute("expRecommList", expRecommList);

		// 관람후기 리스트 출력해주기
		List<Review> reviewList = detailService.getReviewList(pfm);
		model.addAttribute("reviewList", reviewList);

		// 해당 공연에 대한 공연장 정보 출력
		Hall hallInfoList = detailService.getHallInfoList(pfm);
		model.addAttribute("hallInfoList", hallInfoList);

		// 해당 공연장에 대한 이미지 출력해주기
		HallFile hallImg = detailService.getHallImg(pfm);
		model.addAttribute("hallImg", hallImg);
		
		// QNA 리스트
		List<QNA> qnaList = detailService.getQNAList(pfm);
		model.addAttribute("qnaList", qnaList);
		
		// QNA 대댓글 리스트
		List<QNARecomm> qnaRecommList = detailService.getQNARecommList(pfm);
		model.addAttribute("qnaRecommList", qnaRecommList);

	}

	/**
	 * 최종수정일: 2018.12.20
	 * 
	 * @Method설명: 기대평 작성, 삭제
	 * @작성자: 배수연
	 */
	@RequestMapping(value = "/pfmdetail/expectation", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> expectation(
			String expContent
			, String pfmIdx
			, String userIdx
			, Performance pfm
			, String expIdx
			, String updel
		) {

		HashMap<String, Object> map = new HashMap<>();

		logger.info(expContent);
		logger.info(pfmIdx);
		logger.info(userIdx);
		logger.info(expIdx);
		logger.info(updel);

		if (updel.equals("expecBtn")) {
			// 기대평 작성
			detailService.getExpectationInsert(expContent, pfmIdx, userIdx);

		} else if (updel.equals("expDeleteBtn")) {
			// 기대평 삭제
			detailService.getDelExpectation(expIdx);
			
			// 기대평에 달려있던 대댓글도 삭제해준다.
			detailService.getDelExpRecomm(expIdx);

		}

		// 기대평 리스트 출력해주기
		List<Expectation> expecList = detailService.getExpectationList(pfm);
		map.put("expecList", expecList);
		
		// 기대평 대댓글 리스트 출력하기
		List<ExpectRecomm> expRecommList = detailService.getExpRecommList();
		map.put("expRecommList", expRecommList);

		return map;
	}
	
	/**
	 * 최종수정일: 2019.01.03
	 * @Method설명: 기대평 대댓글 리스트 출력
	 * @작성자: 배수연
	 */
	@RequestMapping(value = "/pfmdetail/expectRecomm", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> expectRecomm(
			String expIdx
			, String contents
			, Performance pfm
			, String userIdx
		) {

		HashMap<String, Object> map = new HashMap<>();
		
		detailService.getInExpectRecomm(userIdx, expIdx, contents);
		
		List<ExpectRecomm> expRecommList = detailService.getExpRecommList();
		map.put("expRecommList", expRecommList);
		
		return map;
	}

	/**
	 * 최종수정일: 2019.01.03
	 * @Method설명: 관람후기 작성, 삭제
	 * @작성자: 배수연
	 */
	@RequestMapping(value = "/pfmdetail/review", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> review(String reviewContent, String pfmIdx, String userIdx,
			Performance pfm, String reviewIdx, String updel) {

		HashMap<String, Object> map = new HashMap<>();

		logger.info(updel);
		logger.info(reviewContent);
		logger.info(pfmIdx);
		logger.info(userIdx);

		if (updel.equals("revBtn")) {
			// 관람후기 작성
			detailService.getInReview(reviewContent, pfmIdx, userIdx);

		} else if (updel.equals("revDeleteBtn")) {
			// 관람후기 삭제
			detailService.getDelReview(reviewIdx);

		}

		// 관람후기 리스트 출력해주기
		List<Review> reviewList = detailService.getReviewList(pfm);
		map.put("reviewList", reviewList);

		// 관람후기 작성자 리스트 출력
		List<User> reviewUserList = detailService.getReviwUserList(pfm);
		map.put("reviewUserList", reviewUserList);

		return map;
	}

	/**
	 * 최종수정일: 2019.01.06
	 * @Method설명: QNA 전체 리스트 출력
	 * @작성자: 배수연
	 */
	@RequestMapping(value = "/pfmdetail/qna", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> qna(
			String qnaContent
			, String pfmIdx
			, String userIdx
			, String qnaIdx
			, Performance pfm
		) {

		HashMap<String, Object> map = new HashMap<>();

		logger.info(qnaContent);
		logger.info(pfmIdx);
		logger.info(userIdx);
		
		// 관람후기 작성
		detailService.getInQna(qnaContent, pfmIdx, userIdx);

		// 관람후기 리스트 출력해주기
		List<QNA> qnaList = detailService.getQNAList(pfm);
		map.put("qnaList", qnaList);

		return map;
	}
	
	/**
	 * 최종수정일: 2019.01.06
	 * @Method설명: QNA 댓글 삭제
	 * @작성자: 배수연
	 */
	@RequestMapping(value = "/pfmdetail/qnadelete", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> qnadelete(
			String qnaIdx
			, Performance pfm
		) {

		HashMap<String, Object> map = new HashMap<>();

		logger.info(qnaIdx);
		
		// 관람후기 작성
		detailService.getDelQna(qnaIdx);

		// 관람후기 리스트 출력해주기
		List<QNA> qnaList = detailService.getQNAList(pfm);
		map.put("qnaList", qnaList);
		
		return map;
	}
	
	/**
	 * 최종수정일: 2019.01.06
	 * @Method설명: QNA 대댓글 작성
	 * @작성자: 배수연
	 */
	@RequestMapping(value = "/pfmdetail/qnarecomm", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> qnarecomm(
			String qnaIdx
			, String contents
			, Performance pfm
		) {

		HashMap<String, Object> map = new HashMap<>();

		logger.info("qnaIdx : " + qnaIdx);
		logger.info("contents : " + contents);
		
		// QNA 대댓글 작성
		if(contents != null)
			detailService.getInQnaRecomm(qnaIdx, contents);

		// QNA 리스트 출력해주기
		List<QNA> qnaList = detailService.getQNAList(pfm);
		map.put("qnaList", qnaList);
		
		List<QNARecomm> qnaRecommList = detailService.getQNARecommList(pfm);
		map.put("qnaRecommList", qnaRecommList);
		
		return map;
	}
	
	/**
	 * 최종수정일: 2018.12.28
	 * 
	 * @Method설명: 오픈소식 상세페이지
	 * @작성자: 배수연
	 */
	@RequestMapping(value = "/ticket/opendetail", method = RequestMethod.GET)
	public void opendetail(
			Model model
			, Performance pfm
		) {
		// 선택한 이미지의 포스터 출력해주기
		Poster posterList = detailService.getChoicePfmDetail(pfm);
		model.addAttribute("posterList", posterList);

		// 공연 정보 불러오기
		Performance pfmInfoList = detailService.getPfmInfo(pfm);
		model.addAttribute("pfmInfoList", pfmInfoList);

		// 출연진 정보 불러오기
		List<Artist> castList = detailService.getCastInfo(pfm);
		model.addAttribute("castList", castList);

		// 상세 정보
		PfmDetail detailList = detailService.pfmDetailInfo(pfm);
		model.addAttribute("detailList", detailList);
	}

	/**
	 * 최종수정일: 2018.12.28
	 * 
	 * @Method설명: 오픈 상세 - 공연플래너 담기
	 * @작성자: 배수연
	 */
	@RequestMapping(value = "/ticket/opendetail", method = RequestMethod.POST)
	public void openMyChoice(
			String userIdx
			, String pfmIdx
			, Writer out
		) {
		
		logger.info("+ + + 공연플래너 담기 버튼 클릭 + + +");
		logger.info("userIdx : " + userIdx);
		logger.info("pfmIdx : " + pfmIdx);
		
		// my_choice에 추가해주기
		boolean choice = detailService.mychoiceInsert(userIdx, pfmIdx);
		
		// 추가되었을 경우 boolean 타입으로 data 넘겨주기
		try {
			out.write("" + choice);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
